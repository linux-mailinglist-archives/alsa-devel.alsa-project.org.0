Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F07941327D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 13:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77A8847;
	Tue, 21 Sep 2021 13:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77A8847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632223671;
	bh=swyY2nk0e86n9Yuu+CYQc5pq/gOwwWYJQvqQ++ltVAc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AHQOOI6aCBS1SRs20ADUZwOTl0Tzysm1HbgNNBNjuj3KMgKP5aHLtKyh41GCj+NHC
	 FnErUVVanXNWP203Abgf994LpQX3LgGlJwofdvgQ5faKp+YE6fIVwhylBWRvjGpxKu
	 VVBOSp8bHkf+odxLFVbBg2COYxqUUvzB7UI3MZgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A81F8026A;
	Tue, 21 Sep 2021 13:26:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD43F80268; Tue, 21 Sep 2021 13:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10531F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 13:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10531F8016E
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221446362"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="221446362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="484148610"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2021 04:26:14 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, jani.nikula@intel.com,
 Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, gregkh@linuxfoundation.org
Subject: [RFC PATCH] component: do not leave master devres group open after
 bind
Date: Tue, 21 Sep 2021 14:18:10 +0300
Message-Id: <20210921111810.2766726-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: intel-gfx@lists.freedesktop.org, kai.vehmanen@linux.intel.com,
 "Rafael J . Wysocki" <rafael@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In current code, the devres group for aggregate master is left open
after call to component_master_add_*(). This leads to problems when the
master does further managed allocations on its own. When any
participating driver calls component_del(), this leads to immediate
release of resources.

This came up when investigating a page fault occurring with i915 DRM
driver unbind with 5.15-rc1 kernel. The following sequence occurs:

 i915_pci_remove()
   -> intel_display_driver_unregister()
     -> i915_audio_component_cleanup()
       -> component_del()
         -> component.c:take_down_master()
           -> hdac_component_master_unbind() [via master->ops->unbind()]
           -> devres_release_group(master->parent, NULL)

With older kernels this has not caused issues, but with audio driver
moving to use managed interfaces for more of its allocations, this no
longer works. Devres log shows following to occur:

component_master_add_with_match()
[  126.886032] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000323ccdc5 devm_component_match_release (24 bytes)
[  126.886045] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000865cdb29 grp< (0 bytes)
[  126.886049] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 grp< (0 bytes)

audio driver completes its PCI probe()
[  126.892238] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 pcim_iomap_release (48 bytes)

component_del() called() at DRM/i915 unbind()
[  137.579422] i915 0000:00:02.0: DEVRES REL 00000000ef44c293 grp< (0 bytes)
[  137.579445] snd_hda_intel 0000:00:1f.3: DEVRES REL 00000000865cdb29 grp< (0 bytes)
[  137.579458] snd_hda_intel 0000:00:1f.3: DEVRES REL 000000001b480725 pcim_iomap_release (48 bytes)

So the "devres_release_group(master->parent, NULL)" ends up freeing the
pcim_iomap allocation. Upon next runtime resume, the audio driver will
cause a page fault as the iomap alloc was released without the driver
knowing about it.

Fix this issue by using the "struct master" pointer as identifier for
the devres group, and by closing the devres group after the master->ops->bind()
call is done. This allows devres allocations done by the driver acting as
master to be isolated from the binding state of the aggregate driver. This
modifies the logic originally introduced in commit 9e1ccb4a7700
("drivers/base: fix devres handling for master device").

BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 drivers/base/component.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Hi,
I'm sending this as RFC as I'm not sure of the implications of
not leaving the devres group open might have to other users
of the component framework.

For audio, the current behaviour seems very problematic. The display
codec is usually just one of many audio codecs attached to the controller,
and unbind of the display codec (and the aggregate driver created with
DRM), should not bring down the whole audio card.

However, now all allocations audio driver does after call to
component_master_add_with_match(), will be freed when display
driver calls component_del().

Closing the devres group at end of component_master_add_*() would
seem the cleanest option. Looking for feedback whether this approach
is feasible. One alternative would be for the audio driver to
close the "last opened" group after its call to component_master_add(),
but this seems messy (audio would make assumptions on component.c
internals).

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5e79299f6c3f..870485cbbb87 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -246,7 +246,7 @@ static int try_to_bring_up_master(struct master *master,
 		return 0;
 	}
 
-	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(master->parent, master, GFP_KERNEL))
 		return -ENOMEM;
 
 	/* Found all components */
@@ -258,6 +258,7 @@ static int try_to_bring_up_master(struct master *master,
 		return ret;
 	}
 
+	devres_close_group(master->parent, NULL);
 	master->bound = true;
 	return 1;
 }
@@ -282,7 +283,7 @@ static void take_down_master(struct master *master)
 {
 	if (master->bound) {
 		master->ops->unbind(master->parent);
-		devres_release_group(master->parent, NULL);
+		devres_release_group(master->parent, master);
 		master->bound = false;
 	}
 }

base-commit: 930e99a51fcc8b1254e0a45fbe0cd5a5b8a704a5
-- 
2.32.0


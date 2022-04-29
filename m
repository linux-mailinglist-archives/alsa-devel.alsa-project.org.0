Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E3514263
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 08:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665BD9F6;
	Fri, 29 Apr 2022 08:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665BD9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651213955;
	bh=gGK7/gBcj48QlxuUQ6aLxtWNQgyWkYr7fybLKh0KD5c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6FWwCmx5ZmNsHQDx4hsuTrCHKsYAu9blU6Q2QB9uKCGmVn4j1wIChwIAEtyrSBbz
	 yAK4fvqVmvszMJCiICFyngSyWGIZowm3c6+dktH2GbexGIKb0jQu3u+FyMNslGfui4
	 RWZ0yebf+6MfaBiolanh+bktS4ZN8xb119H5JFl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA75F8007E;
	Fri, 29 Apr 2022 08:31:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC038F8007E; Fri, 29 Apr 2022 08:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5342BF8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 08:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5342BF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MbmY5wfp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1CBF61D94;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21056C385AF;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651213887;
 bh=gGK7/gBcj48QlxuUQ6aLxtWNQgyWkYr7fybLKh0KD5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbmY5wfpkIXYzVOY7GrWXGECIEPh4shZM0RuPaXg/0Pj3b62Ok4OxUHJfO1disdc6
 v/aNccc7zhdMTWUjzv5GKqeWAEITIiynZ6Aq6cIGLE+EBCAx5+L476WZThSPpLXa6t
 93I/1eyw5mATjnSM7HXiPsJTeYs7BRTIDy+YKdEK0lfz70yTYjYuZudGITkfd12rPj
 4lgICGJ6SnFQQabh9SmD4Y5XX1+q+ES4gWn9BshAcmn1NlMVOiDEhdEBaY1ksWxClF
 c+WWMHte6ENzDZX0deLkyoqvooI1c0bqPgRHYQWbVS/NqRZTJerGzZEl3CfpyzrvSW
 g26ODSGzqn1EA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkK9z-001Qml-NN; Fri, 29 Apr 2022 07:31:23 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 2/2] ALSA: hda - identify when audio is provided by a video
 driver
Date: Fri, 29 Apr 2022 07:31:16 +0100
Message-Id: <5c3a968858a05c27e299eadf2a925d4aa91ac17a.1651212016.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651212016.git.mchehab@kernel.org>
References: <cover.1651212016.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 mauro.chehab@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On some devices, the hda driver needs to hook into a video driver,
in order to be able to properly access the audio hardware and/or
the power management function.

That's the case of several snd_hda_intel devices that depends on
i915 driver.

Currently, this dependency is hidden from /proc/modules and
from lsmod, making harder to identify the need to unbind the
audio driver before being able to unbind the i915 driver.

Add a reference for it at the module dependency, in order to
allow userspace to identify it, and print a message on such
cases.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 0/2] at: https://lore.kernel.org/all/cover.1651212016.git.mchehab@kernel.org/

 sound/hda/hdac_component.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..103c6be8be1e 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -211,6 +211,14 @@ static int hdac_component_master_bind(struct device *dev)
 	}
 
 	complete_all(&acomp->master_bind_complete);
+
+	if (acomp->ops->owner && acomp->ops->owner->name) {
+		dev_info(dev, "audio component provided by %s driver\n",
+			 acomp->ops->owner->name);
+		module_add_named_dependency(acomp->ops->owner->name,
+					    dev->driver->owner);
+	}
+
 	return 0;
 
  module_put:
-- 
2.35.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D931439D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3C341696;
	Tue,  9 Feb 2021 00:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3C341696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612826449;
	bh=dsrH+EhbZzuRAL0+go5EFpwERGNjF69OXYc6C/sWS4k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XPtMyGKLsOygTqAMs2U7Z8FUwTNMIPlu9FXopNB/rWepCV5hKjQFTFT+yfOemG9cn
	 pR/mkfkjUruUbrDQ6VQbIuNdshgu5USmfWGOZVEMMqP3Y3fSXxubmCKsw2GIdc4fwp
	 w8ZTTrM/DxQWEiQcun+MHHzJ41bDV1bi/lWISQ5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 438C6F80169;
	Tue,  9 Feb 2021 00:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B05AF8022B; Tue,  9 Feb 2021 00:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4459F80165
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4459F80165
IronPort-SDR: LoqTFKWWnaLNmmwYktlJBHQ8Y7IAHYzpERc8kzbcDjRoF8xK3yN3cMxNSFsbnOzcJtVN6Cj8ZM
 y9zO4qs3XX0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="179236860"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="179236860"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:19:05 -0800
IronPort-SDR: 5AVlbVMJvuulIATWUJ2Zn58W7bIfiabcPQOJht6jQnFXfey4qV3sy1ruJ4/N6KC2g1MX4Axh/k
 zcCSVGO+swew==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="395776279"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:19:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: sof-pci-dev: add missing Up-Extreme quirk
Date: Mon,  8 Feb 2021 17:18:53 -0600
Message-Id: <20210208231853.58761-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The UpExtreme board supports the community key and was missed in
previous contributions. Add it to make sure the open firmware is
picked by default without needing a symlink on the target.

Fixes: 46207ca24545 ('ASoC: SOF: pci: change the default firmware path when the community key is used')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 84990cc8aa7d..fd1f0d8c2853 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -65,6 +65,13 @@ static const struct dmi_system_id community_key_platforms[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
 		}
 	},
+	{
+		.ident = "Up Extreme",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_MATCH(DMI_BOARD_NAME, "UP-WHL01"),
+		}
+	},
 	{
 		.ident = "Google Chromebooks",
 		.matches = {
-- 
2.25.1


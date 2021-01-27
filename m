Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03751305B82
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 13:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D41A1710;
	Wed, 27 Jan 2021 13:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D41A1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611750540;
	bh=J9aLjfHt44ruscp9q6ImqURXWAAlQNxso9PqwdOytzk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VEnfsPFGtM6zmrMUHJAGu3/0QF56ExhAgzbC0EmZgkrkzBcurd54NbGEzg1f7+Ky+
	 1dbMhfLzVdA8EyrDCOiVeRj10Hso8m37gQBPf2/xMtnssTm+sMVcFocMf3E7JMYPOX
	 4vYU42Phh2R3cKcBP4sGWIHZ4COiagox2HIVPvR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73519F8025F;
	Wed, 27 Jan 2021 13:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB68AF80259; Wed, 27 Jan 2021 13:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FA49F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 13:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FA49F800E9
IronPort-SDR: 0A53xzH3r/xTqebnEc3BZ9W3WrrIyd+oMnZ+P52OinZZKb+lgLh15LXR/+YDjNQ9noO8vz2QGf
 OKEtGSxDjRow==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="177493943"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="177493943"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 04:27:14 -0800
IronPort-SDR: DVQdC5PBuOajYMcly7z2fEXZjxg/mcfFhxfKBbenhS9R1hQ8pkdzSSNZAiJJKUx/543KtGujl4
 ihctUin4pu3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="353794577"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 27 Jan 2021 04:27:12 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: add a pointer to download repo in case FW request
 fails
Date: Wed, 27 Jan 2021 14:23:58 +0200
Message-Id: <20210127122358.1014458-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, Marc Herbert <marc.herbert@intel.com>,
 Bruce Perens <bruce@perens.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>
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

The SOF firmware and topology files are not distributed via
linux-firmware. To help debugging cases where correct firmware is
not installed, print a pointer to the official upstream repository
for Sound Open Firmware releases.

BugLink: https://github.com/thesofproject/sof/issues/3665
Reported-by: Bruce Perens <bruce@perens.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Marc Herbert <marc.herbert@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/loader.c   | 2 ++
 sound/soc/sof/topology.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 08a17abb63ff..eabeaf7b260e 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -731,6 +731,8 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: request firmware %s failed err: %d\n",
 			fw_filename, ret);
+		dev_err(sdev->dev,
+			"you may need to download the firmware from https://github.com/thesofproject/sof-bin/\n");
 		goto err;
 	} else {
 		dev_dbg(sdev->dev, "request_firmware %s successful\n",
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b6b32a7a91f8..59f89f3d61a2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3740,6 +3740,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: tplg request firmware %s failed err: %d\n",
 			file, ret);
+		dev_err(scomp->dev,
+			"you may need to download the firmware from https://github.com/thesofproject/sof-bin/\n");
 		return ret;
 	}
 
-- 
2.29.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCD2179FE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E62D16A2;
	Tue,  7 Jul 2020 23:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E62D16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594156110;
	bh=7Lx2bsmGXELWiOGNuipaK6yJC+UxFN6t5oDWJAgwgME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgKz+WIJ0yOfafuFe2tGnazIuWB0wEYBKIDSWXJLXvyTcEVKeT+Cer0bRR8BO0Ef1
	 DfB0MPYaxRIRvdFLC4+dRdqROfribm7Fqi4x28Efy1HmjJ4/rzjPWGR+ttOW153TLb
	 l70MDIuNsMkjwQSL8SE96dPmVxiE5oSCIv5yVhoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E957F802C4;
	Tue,  7 Jul 2020 23:05:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA3E9F8025A; Tue,  7 Jul 2020 23:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF232F80257
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 23:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF232F80257
IronPort-SDR: XuQfOLMXuzQjlz1nA3TKm3JCVyr42PlZP6s99SCHvrhwWQ4NLHxOvhYdhVKHeTB+Kv3ENJ+jcE
 E/biQR1Sd4xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="127777255"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="127777255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:04:59 -0700
IronPort-SDR: OflwPwWAO1ALtCRlfGzCGwrn3Tdxc+qTYrFLJGrIzduf5IGSKTp0tfoJdpO1xSnPossIuDRMCj
 fwlwHH41YNEA==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483648074"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:04:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: imx: add min/max channels for SAI/ESAI on
 i.MX8/i.MX8M
Date: Tue,  7 Jul 2020 16:04:39 -0500
Message-Id: <20200707210439.115300-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
References: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
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

From: Daniel Baluta <daniel.baluta@nxp.com>

This is identical with change for Intel platforms done with
commit 8c05246c0b58 ("ASoC: SOF: Intel: add min/max channels for SSP on Baytrail/Broadwell")
and fixes a regression on i.MX8/i.MX8M:

[   25.705750]  esai-Codec: ASoC: no backend playback stream
[   27.923378]  esai-Codec: ASoC: no users playback at close - state

This is root-caused to the introduction of the DAI capability checks
with snd_soc_dai_stream_valid(). Its use in soc-pcm.c makes it a
requirement for all DAIs to report at least a non-zero min_channels
field.

Fixes: 9b5db059366ae2 ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 8 ++++++++
 sound/soc/sof/imx/imx8m.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 63f9c20a1bac..a4fa8451d8cb 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -375,6 +375,14 @@ static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
 static struct snd_soc_dai_driver imx8_dai[] = {
 {
 	.name = "esai-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 };
 
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index fa86a9e2990f..287114a37688 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -240,6 +240,14 @@ static int imx8m_ipc_pcm_params(struct snd_sof_dev *sdev,
 static struct snd_soc_dai_driver imx8m_dai[] = {
 {
 	.name = "sai-port",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
 },
 };
 
-- 
2.25.1


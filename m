Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE856C12E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4613683B;
	Fri,  8 Jul 2022 22:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4613683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657310915;
	bh=1VfiF1gLLOti7rYhBYWJDLJmkeNLCu3cvB+7jMdQpys=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i+UIE48lT7F6Z5wBsDOH4HKICdj2Dt7LnhKpep8339Hs02lQhTwmOGoZEad8I5vJy
	 QjRo3i6oqkJ7uh/GPxYToxbfBhS6Bom1x8Kefo/ymx8glbfVs3HSFEkEYobHhzKUdd
	 qrpP1ClSKnG4BNRDVaM6Ad2sNiNT90LcC8Sjf2xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E560CF8053A;
	Fri,  8 Jul 2022 22:07:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F22E8F8053B; Fri,  8 Jul 2022 22:07:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E14DF8028B
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E14DF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BalONQVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657310854; x=1688846854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1VfiF1gLLOti7rYhBYWJDLJmkeNLCu3cvB+7jMdQpys=;
 b=BalONQVUXlt8jOxp4dVdQR2Wtl3IOwkqqLVEcJC8d7OYSgp48y45crwU
 /SmGr3vH6uNHbiOr2/AOg+piSD38o/U6532b+soYvPGbcUlLCbrca+EQs
 zmh9FYlN7a5A1XwpjVV8X4IZz0ZcgJOGbyRhM64Iviw4WjiwlQkrRTDhn
 5yyvq2wlCbbUU5jBXIQWJNdXU3WyaYoD0evGaAHfhEx5CTC3QcGDmu06d
 1bljeoNRiuENGd1aM2SVwr0vkzs0n2O2KFyAxMq7doEjWY+N6F3yTvWq0
 JS4nZs5rBMvN0cB7WtAzA3jMrBeG/v9HmyAlIkPmaoDC9PH0Uy906KXhO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="281909602"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="281909602"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:07:29 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="720985747"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.87.49])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:07:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: remove warning on ABI checks
Date: Fri,  8 Jul 2022 15:07:19 -0500
Message-Id: <20220708200719.26961-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

We should only have an error when enforcing strict mapping between
kernel and firmware versions. In all other cases, there is no reason
to throw a warning.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 13 ++++---------
 sound/soc/sof/ipc3.c          | 11 ++++-------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 99b62fe7a95c..9448d5338423 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2348,15 +2348,10 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	if (SOF_ABI_VERSION_MINOR(abi_version) > SOF_ABI_MINOR) {
-		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
-			dev_warn(scomp->dev, "%s: Topology ABI is more recent than kernel\n",
-				 __func__);
-		} else {
-			dev_err(scomp->dev, "%s: Topology ABI is more recent than kernel\n",
-				__func__);
-			return -EINVAL;
-		}
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS) &&
+	    SOF_ABI_VERSION_MINOR(abi_version) > SOF_ABI_MINOR) {
+		dev_err(scomp->dev, "%s: Topology ABI is more recent than kernel\n", __func__);
+		return -EINVAL;
 	}
 
 	return 0;
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 1fb132b477bf..82fa320253be 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -758,13 +758,10 @@ int sof_ipc3_validate_fw_version(struct snd_sof_dev *sdev)
 		return -EINVAL;
 	}
 
-	if (SOF_ABI_VERSION_MINOR(v->abi_version) > SOF_ABI_MINOR) {
-		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
-			dev_warn(sdev->dev, "FW ABI is more recent than kernel\n");
-		} else {
-			dev_err(sdev->dev, "FW ABI is more recent than kernel\n");
-			return -EINVAL;
-		}
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS) &&
+	    SOF_ABI_VERSION_MINOR(v->abi_version) > SOF_ABI_MINOR) {
+		dev_err(sdev->dev, "FW ABI is more recent than kernel\n");
+		return -EINVAL;
 	}
 
 	if (ready->flags & SOF_IPC_INFO_BUILD) {
-- 
2.34.1


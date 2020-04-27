Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81D1BAA33
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 18:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 525DB1686;
	Mon, 27 Apr 2020 18:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 525DB1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588005740;
	bh=82LS3uQ80bLWFzMThB/kFJeeDSeqqZjKPsgPND1iB7Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vQGuu+YP9Jx67HEfVU5pk00GMrfcnEAPJF0SPWocur5r39+nNtq7wHiTDzyfDwT5B
	 2fuMcYR7i1OtazftLGAND+qwLhKxZJkKSycvifeOwwNW9gxyDu9W98IATMiWHt05K+
	 Myu/Gj4pmxKXLUar1AyrdhpptgW1LvYTmfWXenxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B23F8010A;
	Mon, 27 Apr 2020 18:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DABB7F8022B; Mon, 27 Apr 2020 18:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B447F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 18:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B447F80112
IronPort-SDR: YktHWdn7hPhAusXseuhSMee443EeJ/huorPwAv+11Ceq6Ajh5oUlOO84AvRRVDbh09nu7Q8FxN
 xSbPD3eRL09A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 09:29:56 -0700
IronPort-SDR: XITj6Few2fS+otiLZqw8YlknOnSZZQn5UjF7fWd4UB/BS93slIX2AQfLH0nnQnNmszRtqbgLwZ
 fTd0kmKW77dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="246197097"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2020 09:29:55 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: broadwell: Fix oops during module removal
Date: Mon, 27 Apr 2020 09:29:53 -0700
Message-Id: <20200427162953.21107-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
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

When removing the SOF module, the RT286 jack detect
handler will oops if jack detection is not disabled.
Disable the jack in the machine driver remove callback
to prevent this. This fix is only for SOF support and is
not needed for earlier versions.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/broadwell.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index f9a8336a0541..86deea6f136a 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -230,7 +230,8 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 	},
 };
 
-static int broadwell_suspend(struct snd_soc_card *card){
+static int broadwell_disable_jack(struct snd_soc_card *card)
+{
 	struct snd_soc_component *component;
 
 	for_each_card_components(card, component) {
@@ -241,9 +242,15 @@ static int broadwell_suspend(struct snd_soc_card *card){
 			break;
 		}
 	}
+
 	return 0;
 }
 
+static int broadwell_suspend(struct snd_soc_card *card)
+{
+	return broadwell_disable_jack(card);
+}
+
 static int broadwell_resume(struct snd_soc_card *card){
 	struct snd_soc_component *component;
 
@@ -292,8 +299,16 @@ static int broadwell_audio_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(&pdev->dev, &broadwell_rt286);
 }
 
+static int broadwell_audio_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+
+	return broadwell_disable_jack(card);
+}
+
 static struct platform_driver broadwell_audio = {
 	.probe = broadwell_audio_probe,
+	.remove = broadwell_audio_remove,
 	.driver = {
 		.name = "broadwell-audio",
 	},
-- 
2.17.1


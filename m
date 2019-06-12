Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D971B42C83
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:41:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667CE179A;
	Wed, 12 Jun 2019 18:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667CE179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560357702;
	bh=4mJvdfS6/fYOeSTsEuvFvjl6c5Jhmv+JeRjwX7jp5YA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y+zLt4G1qc6GsKhSj8IkV+c19ueeV4iUOuvNFko60pbUOpr1O2sVwtTBZGc8XleRL
	 a+0vQn/e2/YkmiV/4ZexyAGOteLIGfIEJXLxTJ+JEGksMcY+F0SZNL/ExFxBmJwrnL
	 ZBddmoayJahlffYOe8NZuKX6cb5ghO0XbF6Z/blM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC34F896E3;
	Wed, 12 Jun 2019 18:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42656F896CE; Wed, 12 Jun 2019 18:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 506BAF896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 506BAF896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:40:15 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2019 09:40:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:39:58 -0500
Message-Id: <20190612163958.17068-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: bxt-da7219-max98357a: add BE
	dailink for dmic16k
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

We need dmic16k BE(and FE, in tplg file) dailink for keyword detection
feature on bxt-da7219-max98357a machine, here add it in driver side.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index ab867252af20..c0d865a940dc 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -404,6 +404,10 @@ SND_SOC_DAILINK_DEF(ssp1_codec,
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+
+SND_SOC_DAILINK_DEF(dmic16k_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
 SND_SOC_DAILINK_DEF(dmic_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
 
@@ -578,6 +582,14 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
+	{
+		.name = "dmic16k",
+		.id = 6,
+		.be_hw_params_fixup = broxton_dmic_fixup,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	},
 };
 
 #define NAME_SIZE	32
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

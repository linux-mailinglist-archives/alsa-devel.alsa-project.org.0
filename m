Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5A1A3A1E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 21:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90CC1685;
	Thu,  9 Apr 2020 21:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90CC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458886;
	bh=mYYK+ureK4KxVHh8r28oOZIuLgelWl0mIezQcSWZvv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s7M6qhY6aJJQC0M3aHxSnTyMyxfb9QfVatOoy27WqiYarHsQ/wfRvfVPBqPWsqxCN
	 lRnFWMyZgNpf4j20nwDXeIxMYRi45EzjAKcrpKlbxnrF5/cF+fNe10gkp2WjpUaYSE
	 JK/bRpPlXDdDRON7MG54/QhOYIwMJUbD42pUK0b8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1239BF801D8;
	Thu,  9 Apr 2020 20:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78346F80218; Thu,  9 Apr 2020 20:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374B0F801D8
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374B0F801D8
IronPort-SDR: nU/Le+bJV/1Pic9IgZRxm8m6LEQCDGE3a+ZRQtjnsf9U8XpJ1m9qXnqjuL+QO1fFHA31NPpkf6
 qhlje4gpRLcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:58:34 -0700
IronPort-SDR: ukT7bA2ZhQk2Gl2yXE7zHrR3skbe/h8UrH3SuuBifrKEkXzi8yKayj521tKkWY3jQyq5BoudzS
 KIXvqgT7Y9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="255248812"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 11:58:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/13] ASoC: intel/skl/hda - set autosuspend timeout for hda
 codecs
Date: Thu,  9 Apr 2020 13:58:16 -0500
Message-Id: <20200409185827.16255-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
References: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Clarex Zhou <clarex.zhou@intel.com>,
 broonie@kernel.org, Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

From: Hui Wang <hui.wang@canonical.com>

On some Lenovo and HP laptops, if both codec driver and SOF driver
are in runtime suspend mode, we plug a headset to the audio jack,
the headphone could be detected but Mic couldn't.

That is because when plugging, the headphone triggers a unsol event
first, and about 0.7s later (on the Lenovo X1 Carbon 7th), the Mic
triggers a unsol event. But if the codec driver enters runtime suspend
within 0.7s, the Mic can't trigger the unsol event.

If we don't set autosuspend_delay to a non-zero value for the hda codec
driver, it will enter runtime suspend immediately after the headphone
triggers the unsol event.

Follow the sequence of legacy hda driver and set a autosuspend delay
of 1sec after card registration (refer to pci/hda/hda_intel.c and
pci/hda/hda_codec.c).

Signed-off-by: Hui Wang <hui.wang@canonical.com>
Co-developed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Co-developed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Clarex Zhou <clarex.zhou@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 29 +++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 3be764299ab0..64197b010e7d 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -113,6 +113,8 @@ static char hda_soc_components[30];
 #define IDISP_ROUTE_COUNT	(IDISP_DAI_COUNT * 2)
 #define IDISP_CODEC_MASK	0x4
 
+#define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
+
 static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 {
 	struct snd_soc_card *card = &hda_soc_card;
@@ -168,6 +170,27 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 	return 0;
 }
 
+static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd =
+		list_first_entry(&card->rtd_list,
+				 struct snd_soc_pcm_runtime, list);
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct hdac_hda_priv *hda_pvt;
+
+	if (!codec_dai)
+		return;
+
+	/*
+	 * all codecs are on the same bus, so it's sufficient
+	 * to lookup the first runtime and its codec, and set
+	 * power save defaults for all codecs on the bus
+	 */
+	hda_pvt = snd_soc_component_get_drvdata(codec_dai->component);
+	snd_hda_set_power_save(hda_pvt->codec.bus,
+			       HDA_CODEC_AUTOSUSPEND_DELAY_MS);
+}
+
 static int skl_hda_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
@@ -206,7 +229,11 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 		hda_soc_card.components = hda_soc_components;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
+	if (!ret)
+		skl_set_hda_codec_autosuspend_delay(&hda_soc_card);
+
+	return ret;
 }
 
 static struct platform_driver skl_hda_audio = {
-- 
2.20.1


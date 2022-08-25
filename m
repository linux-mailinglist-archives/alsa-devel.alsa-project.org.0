Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F5C5A12F3
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 270541634;
	Thu, 25 Aug 2022 16:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 270541634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661436291;
	bh=/6pwMJxl4kz3mtesV4CUmCFqTAB1jZKIxRXUvAmZQdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KhAy0daBqcRSVTuRW6Xb/BXZJLUCjetOq9KSpkMA/l7+G679ciwkT6/lF+8bK78r1
	 NOVtWs2Bfp3xhkOTF9ZYLEKSOL4byZQI9lFqhuED3oQZC66I+KbASH1o0860ga7BBd
	 tvEj8ssO5e7MA12n2UzHTQGRYkWdnKC8OV0hZFn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7245F8053B;
	Thu, 25 Aug 2022 16:03:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F39C6F80245; Thu, 25 Aug 2022 16:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6ED0F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6ED0F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="DGrIQhoR"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661436172; bh=l8JOb0hAWhVJH3nSwe474gz70FVSVhQNrSMoKlGL5NE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DGrIQhoRsIrW6NeEmOuD5vnKGvGau5m3L5zCZyZQoUzJ4++Obr6tjp31EDTIDVBEH
 TlSSOvrhZl0DB/Axv0/GvdZDBh9Z+vK0WGxvVs4nksjHbQPrAjpbMQS+HQiCbKubhC
 CC/7BN32D69v6dlKIeo2vKWi0fDQ1ZfQzTxJrWmQ=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: tas2764: Export highpass filter setting
Date: Thu, 25 Aug 2022 16:02:41 +0200
Message-Id: <20220825140241.53963-6-povik+lin@cutebit.org>
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 navada@ti.com, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asyrus@ti.com, shenghao-ding@ti.com, raphael-xu@ti.com,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Stephen Kitt <steve@sk2.org>, Dan Murphy <dmurphy@ti.com>
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

Expose a control for the setting of 'DC blocker' highpass filter in the
playback path of TAS2764.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 10 ++++++++++
 sound/soc/codecs/tas2764.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index e99a46fb503f..51b87a936179 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -593,11 +593,21 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
 static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10050, 50, 1);
 
+static const char * const tas2764_hpf_texts[] = {
+	"Disabled", "2 Hz", "50 Hz", "100 Hz", "200 Hz",
+	"400 Hz", "800 Hz"
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	tas2764_hpf_enum, TAS2764_DC_BLK0,
+	TAS2764_DC_BLK0_HPF_FREQ_PB_SHIFT, tas2764_hpf_texts);
+
 static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
 		       TAS2764_DVC_MAX, 1, tas2764_playback_volume),
 	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 1, 0x14, 0,
 		       tas2764_digital_tlv),
+	SOC_ENUM("HPF Corner Frequency", tas2764_hpf_enum),
 };
 
 static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 960b337ed0fc..168af772a898 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -33,6 +33,10 @@
 #define TAS2764_VSENSE_POWER_EN		3
 #define TAS2764_ISENSE_POWER_EN		4
 
+/* DC Blocker Control */
+#define TAS2764_DC_BLK0			TAS2764_REG(0x0, 0x04)
+#define TAS2764_DC_BLK0_HPF_FREQ_PB_SHIFT  0
+
 /* Digital Volume Control */
 #define TAS2764_DVC	TAS2764_REG(0X0, 0x1a)
 #define TAS2764_DVC_MAX	0xc9
-- 
2.33.0


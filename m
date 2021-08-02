Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1C3DDAF8
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A47816FC;
	Mon,  2 Aug 2021 16:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A47816FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627914476;
	bh=7lLgyqk5PcDhB//baCq8HQwgev+xome27yNg3JnbOmM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=riTas126tAFQeTOKEu30DPAyo2qUqcDis/qzvSuqUeO4I4MHHcWvFsm3EJgUKKkCM
	 6oMJ4QYH7MAMWLvxOHV9ZebP1oPZVZP6YMWn7s/vM84kkaJYYhe9qYKON8j6R0jBO1
	 2uzTVDFiOFtnvw/TdCwZDF/f/2JawGFR8uJP6MIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6291F804F3;
	Mon,  2 Aug 2021 16:25:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90A6CF804F1; Mon,  2 Aug 2021 16:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3735BF804E6
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3735BF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EI5fVoee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627914323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0r6SCp8CsZUuBY99CO+1REbxwfgmG4PaJMvPCvF7t4=;
 b=EI5fVoeeX8sxGmHHNEFQ2ngITEFxg1EyFt81azh1vxn8Ot9bNgTFOiGc80EapetY/XVel4
 9lU1B7SknCcgmPcXummM4MBmkK5Y6/QMJcEBOp+qNm117CdV++1ex69fnL5XOx0xz3zK1w
 ERm74WKIDy5rGzBhjWzb3rGU9a25At8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-u4EYWciPPMWXEP0vyLwpWw-1; Mon, 02 Aug 2021 10:25:22 -0400
X-MC-Unique: u4EYWciPPMWXEP0vyLwpWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AF0D1934100;
 Mon,  2 Aug 2021 14:25:20 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D807760C82;
 Mon,  2 Aug 2021 14:25:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/6] ASoC: Intel: bytcr_rt5640: Add a
 byt_rt5640_get_codec_dai() helper
Date: Mon,  2 Aug 2021 16:24:58 +0200
Message-Id: <20210802142501.991985-4-hdegoede@redhat.com>
In-Reply-To: <20210802142501.991985-1-hdegoede@redhat.com>
References: <20210802142501.991985-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

Add a byt_rt5640_get_codec_dai() helper, which gets the codec_dai
from a dapm_context.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index e8a8f6b5ef96..70faba13450c 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -227,6 +227,20 @@ static int byt_rt5640_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai,
 #define BYT_CODEC_DAI1	"rt5640-aif1"
 #define BYT_CODEC_DAI2	"rt5640-aif2"
 
+static struct snd_soc_dai *byt_rt5640_get_codec_dai(struct snd_soc_dapm_context *dapm)
+{
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *codec_dai;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, BYT_CODEC_DAI1);
+	if (!codec_dai)
+		codec_dai = snd_soc_card_get_codec_dai(card, BYT_CODEC_DAI2);
+	if (!codec_dai)
+		dev_err(card->dev, "Error codec dai not found\n");
+
+	return codec_dai;
+}
+
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int  event)
 {
@@ -236,15 +250,9 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 	int ret;
 
-	codec_dai = snd_soc_card_get_codec_dai(card, BYT_CODEC_DAI1);
+	codec_dai = byt_rt5640_get_codec_dai(dapm);
 	if (!codec_dai)
-		codec_dai = snd_soc_card_get_codec_dai(card, BYT_CODEC_DAI2);
-
-	if (!codec_dai) {
-		dev_err(card->dev,
-			"Codec dai not found; Unable to set platform clock\n");
 		return -EIO;
-	}
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
-- 
2.31.1


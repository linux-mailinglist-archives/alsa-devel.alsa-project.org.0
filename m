Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E4938F9E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:03:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E32B14DF;
	Mon, 22 Jul 2024 15:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E32B14DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653439;
	bh=ElxwyvAYRep8iP0erjBmNwM65GYITd2Altmm3t3OTiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F07mwvSLcFsMTb/wrsJ1Gc+T2A+iMtpeKvuIRo9cs2bBug1BJzHC9T18e3DdKrgZH
	 ld+RB/sXuSbRZdDt1HHPPAALLLPA3E+1hllby8h3VjWuRgraezZh+dRDpFQ3yTJCWX
	 BIY2P1jD5ZJcNqVskrfIO8vgNy4qqaUxui07d9gs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 617A8F80768; Mon, 22 Jul 2024 15:01:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC53F80730;
	Mon, 22 Jul 2024 15:01:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D885FF8019B; Mon, 22 Jul 2024 11:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93920F8019B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93920F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Wlsnz2v/
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efe4c7c16so1752239e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2024 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641936; x=1722246736;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4l/632voSz6mCh2TqLV6xqS8GDhLDgECY3Nfdz+lQQ=;
        b=Wlsnz2v/zdywbJIDBzRMsVGr5sEN+fxUQnh5xHuDgXSzF+tI3opE+Gsv45v2MREPaW
         DOYCn6KKTOUimbnrmfPbJhotp9L0z4Gqrs5qqwYJbMjckrC0IYiFiJSrjGts7D3LmNCp
         BK2PgLUPGWDN2guu2Mkw1HgxFCUIIi8V/DYbxvOEAyrhN707a9pbPyEaOJQPRwhZXt/e
         vYg34tmDFJzRNfpYbg+13yxU/vnXp4VEkSV4EmevGJcXcz1m7tM0Xvv2QGjKRpEGmpaZ
         ztZTl7WVkFJTlGUYx1yk0x6JAFezNBuKZbZrmzFQjQwGrRzyPgSPd06pA40YKOJxLusl
         F43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641936; x=1722246736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4l/632voSz6mCh2TqLV6xqS8GDhLDgECY3Nfdz+lQQ=;
        b=ROwMthqL4HIQSxHBSvf96Q7IWk474KeBg3g8r6noD21bSZGclq4B9L7XvwWRaHL+ll
         eNO8A9ReU9tH+lbapRYsVcoXymzEX3yVSAUoGbqHnmHxSnCJkiBVZ2AP/D+IMkdg17dV
         FLd772dMTMHLl7r4ryYxe8+0je8DhuqkludkmwE6Z+u0I5P55Z4bmXGn/Jf+79KpZsKj
         tYaO2eQpkzdNBelFHZv9idO2l9U04KSfQhq//0FtM0/DQP94XaAiLE2zYel9kNcdB/0V
         x/p+7jhV9PyyfByLkKkMlX1RjjhxNSpflkcr1hLqLAuZp7baNW/TsNGslHTHMsdfCmhn
         umSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR7Dc+nmvQrxGKgWXW3n1TNsZZr9HIJc3hXZNjTRu22OMQl5IWvhc3dYqosiRlaFug4kKFXaX29WSN8jT/aPwPxKsfIOlPUz/iIQ0=
X-Gm-Message-State: AOJu0Yzu7rK5xCz7tADfFwxLAcebFNCHhof9c09dXiYbHAIroLu2T5EW
	NVr//TDTR8tZ9enyZ383hHC4cvw+SfR4GQb9pvQpTxauQ0lER62R
X-Google-Smtp-Source: 
 AGHT+IEkUCQN4xvNexHQBngyKo1Jr+lRR08xYuntYXjmUoolBteeZ3Gzo1t7dPmmD02D9Nfl7fIeHw==
X-Received: by 2002:a05:6512:1289:b0:52c:80f6:d384 with SMTP id
 2adb3069b0e04-52ef8d85836mr4304130e87.3.1721641935595;
        Mon, 22 Jul 2024 02:52:15 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl.
 [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:15 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Date: Mon, 22 Jul 2024 11:51:05 +0200
Message-ID: <20240722095147.3372-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095147.3372-1-a39.skl@gmail.com>
References: <20240722095147.3372-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MBD3PFZMHYSLYIE3TI7QTLTHC6ZEU7UL
X-Message-ID-Hash: MBD3PFZMHYSLYIE3TI7QTLTHC6ZEU7UL
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBD3PFZMHYSLYIE3TI7QTLTHC6ZEU7UL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for configuring Quinary Mi2S interface
it will be used on MSM8953 and MSM8976 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Split from MSM8953 support patch,add msg]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..8971f4f5d339 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -20,12 +20,13 @@
 #include "common.h"
 #include "qdsp6/q6afe.h"
 
-#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
+#define MI2S_COUNT  (MI2S_QUINARY + 1)
 
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
 	void __iomem *spkr_iomux;
+	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	int mi2s_clk_count[MI2S_COUNT];
@@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
 			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
 		break;
+	case MI2S_QUINARY:
+		/* Configure Quinary MI2S */
+		if (!pdata->quin_iomux)
+			return -ENOENT;
+		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
@@ -177,6 +184,9 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	case QUATERNARY_MI2S_RX:
 	case QUATERNARY_MI2S_TX:
 		return MI2S_QUATERNARY;
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return MI2S_QUINARY;
 	default:
 		return -EINVAL;
 	}
@@ -320,6 +330,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	data->quin_iomux = devm_platform_ioremap_resource_byname(pdev, "quin-iomux");
+	if (IS_ERR(data->quin_iomux))
+		return PTR_ERR(data->quin_iomux);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);
-- 
2.45.2


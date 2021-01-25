Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E78B302216
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 07:22:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21104186A;
	Mon, 25 Jan 2021 07:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21104186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611555725;
	bh=/CjGTujXibCK/ajlKG8q0Pxae3UQeMRj7KlvcBroUj8=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RFYypHR9Sd3JnarJ5iWZ8WH0PGJ4II382yKUwt8e0Y2OpdE3VAL2WcXaxaTscAuGH
	 cuD4f1jPFAOHlXqKGCq8904okU1iniPSt6NP3CDDKELBB76UElffYheMT/oQS82WRU
	 B5a5brjDQXcaheneeUWAKzRfrmDSyw8WCx6CnZdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46052F80130;
	Mon, 25 Jan 2021 07:20:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621A4F80278; Mon, 25 Jan 2021 07:20:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E9BF80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 07:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E9BF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qenXZMIi"
Received: by mail-pg1-x54a.google.com with SMTP id 139so7399856pgd.11
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Ft+RTc9XrDHI7UBxU6EIvS5RRmiSWKiJe9+aA1ZHsS0=;
 b=qenXZMIiZ5C80BGOOzLbZiqr0Ss4lTUDTzrAfOghwOIo3KL1MAx3PptJ+JoNmQ75G7
 D3L17GOzMGitVzjD7Nn4mQP2Nr7m2r2blJ17k3PSZt5UStdQnts24RwORNPNNyfPGroV
 WE4eF0jPonDdIbcsre8o83Je5msVgMPPzF/iY0ETKfi9TJumeqLPd7hmF4WadZKZLEoC
 0/94yXOHIOHwbuzjSAYLt6BMVD+Vn87Mnl0fO8/xDAqGXUYnpdoU7bhujc6IEkSrYTZZ
 e39CZlV7Pzf7OEialsai7vyZOKRVPFFDrsQ8IMJwqpsDfT218Cu9JJaBnkNjZt7c1TQv
 Dtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Ft+RTc9XrDHI7UBxU6EIvS5RRmiSWKiJe9+aA1ZHsS0=;
 b=C9UIzXz3tt2jORnC23uqoCFPCtpDcEPk6SnShuhUmZ0OECrNVVkii4LTPm1w+2/DrU
 Z82t4W2dwS0k6hq8ReIXYaYDriVH+nJn6F1aP6loIKbLNx86rsNC/xiHgjbJqtMMo5ab
 owbjeISET7fygQQdRNNi+kVcZX070DKVJ2t0WkJUA2ofGaKTgw0+gzpu9YDYRgAZJPOS
 x6CdA5IHNTyQo7071lI/5CKQtl1oit/5FLbEZQdiF39une3blyqrRdO5LHPeSJPtQ7YW
 CLB0mbm5ANzcQEvxQKTJIoHk6X0/Yf1+UQxcaPO45iyFoV3wXzAu4J3ljYk7DWllN6E7
 fc/Q==
X-Gm-Message-State: AOAM531UmL+RTQEQCVAkYbs789fXxUtnF7RvR4H+s2WlizIWbcFbLD3o
 YLRmDXll0PgMlOrDzPit9HuejGtrCDjG
X-Google-Smtp-Source: ABdhPJzEFrGqcrcK4wJQwaBQAoVEugPTnlqW2YIp3BUccvGgljpUbb6tLnzT5eUu5zkVb6OTrGOygNYRnqgc
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:b870:8946:4704:f6a0])
 (user=tzungbi job=sendgmr) by 2002:aa7:99db:0:b029:1ba:5263:63c4 with SMTP id
 v27-20020aa799db0000b02901ba526363c4mr16252724pfi.53.1611555616472; Sun, 24
 Jan 2021 22:20:16 -0800 (PST)
Date: Mon, 25 Jan 2021 14:20:01 +0800
In-Reply-To: <20210125062003.1221810-1-tzungbi@google.com>
Message-Id: <20210125062003.1221810-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210125062003.1221810-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v2 1/3] ASoC: mediatek: mt8192-mt6359: use
 asoc_substream_to_rtd()
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Uses asoc_substream_to_rtd() helper.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index c368236d8a3a..d2ebf3b6e359 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -39,7 +39,7 @@ struct mt8192_mt6359_priv {
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
@@ -74,7 +74,7 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
@@ -362,7 +362,7 @@ static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int
 mt8192_mt6359_rt1015_rt5682_cap1_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-- 
2.30.0.280.ga3ce27912f-goog


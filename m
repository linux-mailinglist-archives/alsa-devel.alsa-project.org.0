Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759297917A0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5F7DF6;
	Mon,  4 Sep 2023 14:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5F7DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693832103;
	bh=zAqEsTfqOhPR49zm8qfjUkaSV3k1Mta3Op5XpWzQZH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XA5bpU/C7kRLK+XYRGUreaPHIwl3qqzmxiI7B15/xruWuDQV8eTTIvXN7h7JcoozG
	 Jg1P9CQSE/0xRKPcTCMWaR/kEusmS++Zsv/319AMEx+G9VQyrsu+TfHamng8Jp4J0f
	 VfKpr3QLK5rl2IAKSwWgQUortGab0W04PVbMJtR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F80BF80564; Mon,  4 Sep 2023 14:53:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CDBF80558;
	Mon,  4 Sep 2023 14:53:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D2F4F8047D; Mon,  4 Sep 2023 14:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBC04F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 14:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC04F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ekFLm+wh
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52a06f5f556so1874307a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693831994; x=1694436794;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nT/Nsm0+xhrnJ3oLep6HRqQXVpm9RtDxMX2PP4BVgnA=;
        b=ekFLm+whDUyeIEbB70KUQXfJ3Ym17uutXO+D0IgsJYwo6ZbHq2TZcrA8iTkDXJqMqf
         Zr9eUspXqGgEH2fV8a7uDQPogmnBwwjqBgHsm8na66a5mFSHnbFlYbR7tu8kdecZPjI7
         Py3bAaNfonSEiK3nlo7G7Dt/sraOg3FlcqYaPC+ungJXBDD/MWuIgy2WvMxwu4zmuh4J
         ZlCIG/3FFMSfMfYaZlC9oiamweqxafruy1515G508/uTOi6QMt1oyAh9c9+B+0pONHfC
         mWzts+72O8qCgdLfCEl1WiUS2fWcPD7XECGk20UROE4tFXRwpihSWhQxSgqSlOva4b71
         u9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693831994; x=1694436794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nT/Nsm0+xhrnJ3oLep6HRqQXVpm9RtDxMX2PP4BVgnA=;
        b=kXF1PuDcIcF9NFfuoGKPPQ50OV/xWkrfR+RBiVZzCrixOek+lzZcbsj1+5FVasL0Oh
         V9y99l4gdPI+XVz6AQbbwN5+jfNE7zJrW2p3d2ghLvFtEjV2Itthfker7ZAUnthAnK6d
         I652uuoUfK8EgqpwTy3knxMRJmL0MOVRDh3G5Sdd4EiNSbn44kCE8lhx2cwUlmw1RbQL
         HDGIteCUNMeX980Ew+ybYdht0rwSJE4mY4T5Lc92IzIWW2Oj35tt0TA5oOzKLN5/lued
         Xn01W5XXx+p14bGn/dSxqooRL4IptvEFMfjKMdXrijtLV400AXjKB7mpj82rCraJxjkJ
         ZPtQ==
X-Gm-Message-State: AOJu0YwCB4K1Q2RfgmoorN/dAeoS2x+4+/NiIWJmCbS6Y0Dna+dNpjcY
	WrUa/boyusARvj6qdJ/p6jBoFQ==
X-Google-Smtp-Source: 
 AGHT+IHnB7mmvYoAltpY3Nq7Rp02IggESKr6lMKP3eXswf6fDDpABlrG61QCjRJqkfOiUEboGtGyMA==
X-Received: by 2002:a50:fb19:0:b0:523:41e1:705e with SMTP id
 d25-20020a50fb19000000b0052341e1705emr6472621edq.21.1693831993961;
        Mon, 04 Sep 2023 05:53:13 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a056402034e00b00523d2a1626esm5836842edw.6.2023.09.04.05.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:53:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: wangweidong.a@awinic.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ASoC: aw88395: drop undocumented,
 fake fade-enable property
Date: Mon,  4 Sep 2023 14:53:08 +0200
Message-Id: <20230904125309.43350-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230904125309.43350-1-krzysztof.kozlowski@linaro.org>
References: <20230904125309.43350-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3CQMGO4VMVRRAGXSHSA3GEBRYDMD33L2
X-Message-ID-Hash: 3CQMGO4VMVRRAGXSHSA3GEBRYDMD33L2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CQMGO4VMVRRAGXSHSA3GEBRYDMD33L2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Devicetree fade-enable property was never accepted and is not
allowed by bindings.  It is not used by any upstream user, thus
considering that it was never documented, should be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/aw88395/aw88395_device.c | 44 -----------------------
 1 file changed, 44 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 33eda3741464..19422fc9017d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -290,30 +290,6 @@ void aw88395_dev_set_volume(struct aw_device *aw_dev, unsigned short set_vol)
 }
 EXPORT_SYMBOL_GPL(aw88395_dev_set_volume);
 
-static void aw_dev_fade_in(struct aw_device *aw_dev)
-{
-	struct aw_volume_desc *desc = &aw_dev->volume_desc;
-	u16 fade_in_vol = desc->ctl_volume;
-	int fade_step = aw_dev->fade_step;
-	int i;
-
-	if (!aw_dev->fade_en)
-		return;
-
-	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
-		aw_dev_set_volume(aw_dev, fade_in_vol);
-		return;
-	}
-
-	for (i = AW88395_MUTE_VOL; i >= fade_in_vol; i -= fade_step) {
-		aw_dev_set_volume(aw_dev, i);
-		usleep_range(aw_dev->fade_in_time, aw_dev->fade_in_time + 10);
-	}
-
-	if (i != fade_in_vol)
-		aw_dev_set_volume(aw_dev, fade_in_vol);
-}
-
 static void aw_dev_fade_out(struct aw_device *aw_dev)
 {
 	struct aw_volume_desc *desc = &aw_dev->volume_desc;
@@ -567,7 +543,6 @@ void aw88395_dev_mute(struct aw_device *aw_dev, bool is_mute)
 	} else {
 		ret = regmap_update_bits(aw_dev->regmap, AW88395_SYSCTRL_REG,
 				~AW88395_HMUTE_MASK, AW88395_HMUTE_DISABLE_VALUE);
-		aw_dev_fade_in(aw_dev);
 	}
 
 	if (ret)
@@ -1607,24 +1582,6 @@ static void aw88395_parse_channel_dt(struct aw_device *aw_dev)
 	aw_dev->channel = channel_value;
 }
 
-static void aw88395_parse_fade_enable_dt(struct aw_device *aw_dev)
-{
-	struct device_node *np = aw_dev->dev->of_node;
-	u32 fade_en;
-	int ret;
-
-	ret = of_property_read_u32(np, "fade-enable", &fade_en);
-	if (ret) {
-		dev_dbg(aw_dev->dev,
-			"read fade-enable failed, close fade_in_out");
-		fade_en = AW88395_FADE_IN_OUT_DEFAULT;
-	}
-
-	dev_dbg(aw_dev->dev, "read fade-enable value is: %d", fade_en);
-
-	aw_dev->fade_en = fade_en;
-}
-
 static int aw_dev_init(struct aw_device *aw_dev)
 {
 	aw_dev->chip_id = AW88395_CHIP_ID;
@@ -1639,7 +1596,6 @@ static int aw_dev_init(struct aw_device *aw_dev)
 	aw_dev->fade_step = AW88395_VOLUME_STEP_DB;
 	aw_dev->volume_desc.ctl_volume = AW88395_VOL_DEFAULT_VALUE;
 	aw88395_parse_channel_dt(aw_dev);
-	aw88395_parse_fade_enable_dt(aw_dev);
 
 	return 0;
 }
-- 
2.34.1


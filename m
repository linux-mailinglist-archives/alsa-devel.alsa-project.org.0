Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 247BD887C22
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Mar 2024 10:47:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 711711060;
	Sun, 24 Mar 2024 10:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 711711060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711273629;
	bh=LHwss1UfxUBEAp3CFFExtt9wMa+r76biYoHKBFUaqZY=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nBusSXr5eWB1ZbXcTsGjOR0uLqCOhWOqfkLOepX3ElYu/GVhea/iUMzwUD3hja8lp
	 NLajQa6pfpKrzAZoGFxfP8bRRMgqQ6tWs6jxGpudnYnPO6mikXZ6bS8IhavvBZRIHI
	 ORrhl9OvxveQkKnnZhM40/dUoWbHxoZZuq7Onbkk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECC83F805BF; Sun, 24 Mar 2024 10:46:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BE4F805A8;
	Sun, 24 Mar 2024 10:46:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00770F804E7; Wed, 20 Mar 2024 21:56:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51888F80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 21:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51888F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HkTm3MbW
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-430c41f3f89so3405771cf.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Mar 2024 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710968171; x=1711572971;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4ueY9XbTZPj7om76ZgH1Y67AlyzZ/RM7Zo4J78p4PI=;
        b=HkTm3MbWbk7fVJ5GrbHiy914SmrGgNIEhhMX9rA8svk/Yv9DUAV9Bzm819SleE9kmO
         zdxQlos8WWLS9Pp/G30h2Bb0BC6Xw9onw/RXbNa1lhILbh4yzzAA9kq7zjtj3WXAHwCM
         QJn4wvB3RQR1YjwKql7CciqGCI0e/jMoZDjbYq0Y0/AV2hC0wPpTj+/PuD2nU5bOtPWY
         +GHGtbHUYM/P1V8A7Nd8LZ1YDsl90cgkfSLnVpTFrOrUj1XvBKYwuwSP6Xrq/UGMBFtJ
         dejCVvFqaqo/C8Md5m7ii7zffu+DLVxrQqVMwm/F87EqoDhUdk5+tWTgWbP/a1YuEoAb
         fYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710968171; x=1711572971;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4ueY9XbTZPj7om76ZgH1Y67AlyzZ/RM7Zo4J78p4PI=;
        b=P+aH3kYgM8+VnXDYFCVDbCt4n77zsqebmdfKFYnWqUYPuFUQQ3XzSEgn548pOG9FqG
         T8Dvc+4aTJ1AenLMICnPgWF8ylb6/L3OOWiuW60snhbDrTSqU2Ql5glSwvP5zmOljxsb
         ZzunVolPAfyVjC4odkyXfHwHoKFiEYvuI/+AWG0LnjIQNX/uXKqOHljUDlXPAqCoMtOd
         EAKB5Ld9G8u6AdyWvhVKTnUet9PecSacmFPbpPi/JruWaGbq2hqY9qNloChwGMNBMvql
         s+9vgQJYsiJZ0qKX6cTVS3hUtX8UOoAfLtmTL9v1TPr2MD3/sCjwFkeUxKiwmw9LNFXV
         AA/g==
X-Gm-Message-State: AOJu0Yy2JfSw9TfegWBy1q6vlAtz2UQUrdyTxEqAubO6tI9UH/SdOK/B
	wNHAVLV2VUBPEHiK6ZhqyQHXuZvl/yHzwEYwcd+xgyFRZZqLQJdd
X-Google-Smtp-Source: 
 AGHT+IHMKDlKC05UOeItJDYzW2JFHbLsuanC0ZZXbg+GJ3g9Og6g7QReKajcLy7ig1nT9q22s/iqpQ==
X-Received: by 2002:ac8:5941:0:b0:431:5a8:7f72 with SMTP id
 1-20020ac85941000000b0043105a87f72mr1547360qtz.27.1710968171170;
        Wed, 20 Mar 2024 13:56:11 -0700 (PDT)
Received: from [10.193.190.170] (mobile-130-126-255-72.near.illinois.edu.
 [130.126.255.72])
        by smtp.gmail.com with ESMTPSA id
 bc8-20020a05622a1cc800b0042efe24b76esm5481573qtb.58.2024.03.20.13.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 13:56:10 -0700 (PDT)
Message-ID: <baf5dfd4-0ec0-47af-8c27-ca71f242244d@gmail.com>
Date: Wed, 20 Mar 2024 15:56:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, chenyuan0y@gmail.com
From: Zijie Zhao <zzjas98@gmail.com>
Subject: [sound/soc/qcom] Question about memory allocation in
 asoc_qcom_lpass_cpu_platform_probe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: zzjas98@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M4X4KWIWTBFJUR5UKSCDWW7MNB4CADY6
X-Message-ID-Hash: M4X4KWIWTBFJUR5UKSCDWW7MNB4CADY6
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:45:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4X4KWIWTBFJUR5UKSCDWW7MNB4CADY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear QCOM AUDIO maintainers,

We encountered an usual usage of devm_kzalloc while performing a 
static analysis for kernel code.

https://elixir.bootlin.com/linux/v6.8/source/sound/soc/qcom/lpass-cpu.c#L1239
```
int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
{
	...

	drvdata = devm_kzalloc(dev, sizeof(struct lpass_data), GFP_KERNEL);
	if (!drvdata)
		return -ENOMEM;
	...

	/* Allocation for i2sctl regmap fields */
	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
					GFP_KERNEL);

	/* Initialize bitfields for dai I2SCTL register */
	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
						drvdata->lpaif_map);
	if (ret) {
		dev_err(dev, "error init i2sctl field: %d\n", ret);
		return ret;
	}
	...
}
```

```
static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
			struct lpaif_i2sctl *i2sctl, struct regmap *map)
{
	struct lpass_data *drvdata = dev_get_drvdata(dev);
	const struct lpass_variant *v = drvdata->variant;

	i2sctl->loopback = devm_regmap_field_alloc(dev, map, v->loopback);
	...
}
```

Here devm_kzalloc might return NULL for drvdata->i2sctl if 
out-of-memory. Then i2sctl->loopback will cause segfault since i2sctl 
is never checked against NULL. Would a NULL check needed here? Like 
the drvdata above.

Please let us know if we missed any key information or assumption! We 
appreciate your time!

Best,
Zijie



Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF9693EF4
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 08:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CF7E83B;
	Mon, 13 Feb 2023 08:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CF7E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676273967;
	bh=xtxFOAdLWmnBFRumwwzm92Ba03ib2oTomhrasZMR6U0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rngzS7Jy8d5nx1ttEKjB5XPB9qBRTfY8zhdLTcCQ4jFk/wCYF7VYXtU7qUiqp3yfD
	 Z0ZdZuC7/Fk4BIoZaxJ5FydlbiKzXcTkc5+upZdVTpDuiHoR4kuxMUd29zcWd6y8ka
	 HvOAG3juYrS61hsgrDVUeDaE1z/S3rHuCvEtkC/s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 120CDF804B0;
	Mon, 13 Feb 2023 08:38:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E3D8F804B4; Mon, 13 Feb 2023 08:38:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A7CF80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 08:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A7CF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=vJlgzQvI
Received: by mail-wr1-x430.google.com with SMTP id by3so9802338wrb.10
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Feb 2023 23:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fES43cqBFMbD7FMaprgtpPtQ3m4cP80LvK4l63UpPU=;
        b=vJlgzQvIHRSg6WRHi2GBSk7NctdquDT4FI9Ke3FWosrlWA4fFVbvxGA+TCTTM7vz9a
         CnDoFZtyPy2oG0u3QwP5qErZOFN8nhSEoBqQz1qR5AwdP0J2FbqPt84ntHMXVk5Me0zX
         W2kZkSvJHX71vAFBlSLLB4TE2w3yg1sqtKJr8CCo/afvsfw4mgaD69IOwu2pqH63Ujo2
         Y5SYpeneDDHiQZkNL29KwGuzfdH2ENwVWIAsO4o1LLEsLBJ2qdbnFqd8D9YgqjuufalV
         oLcHs4S+mWqH0EcAYy0rm0mZJWXWa7XmMka0STUfJOQwx3p5B2+N0vQDpxo5y4PVcks4
         1xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fES43cqBFMbD7FMaprgtpPtQ3m4cP80LvK4l63UpPU=;
        b=uwCia1k0NN/ok54BwP95s6yg+dGnt4w/fRq1rfW0bbT3X1U4/rhmiO+whfLPQp0ltP
         JEDdR6PZVRiTpKeeGBBVsRXzIaFuy546RjRyjtHawvnNPwS4Zh120sMdyUsygN74kVan
         NHcb+Wfvoph2G2ja+4xzEA3c8SEQaVc8E6cPvYUHJxkTnFbPgDLdZJ1x7PZ5vacIaXhO
         ibm0s7VAvxVciTqIufNvnXsttnnJy21TREtlmTnJNwpsRq1vVREV43sTwsqpBdZdUFaS
         PtTp7/2ec/tWJQ5e33lpgVDNP5GiQAay+htADRN7to/LNWyYA7XgLjU5750WvTliydWw
         qmsQ==
X-Gm-Message-State: AO0yUKVoE4DyL4LQ+8Kvh0h5002BkjxMqmInKJmP/I7CwZDwCzxL2z3B
	tqHiz/7CpDBosfcuEeWNByuof9hOI1xOy7yBYXA=
X-Google-Smtp-Source: 
 AK7set8brAwSZrbEmT4jujqelm+GMP8gsSH1k3lV9L2hWg+sRI3mky/dvZ4Bc1LdMVFdlIm/ly7GOg==
X-Received: by 2002:adf:fc91:0:b0:2c5:4f06:5fe with SMTP id
 g17-20020adffc91000000b002c54f0605femr4954556wrr.57.1676273899794;
        Sun, 12 Feb 2023 23:38:19 -0800 (PST)
Received: from neptune.. ([82.79.69.144])
        by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b002c54241b4fesm8714108wri.80.2023.02.12.23.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 23:38:19 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] sound: soc: codec: tlv320adcx140: fix 'ti,gpio-config' DT
 property init
Date: Mon, 13 Feb 2023 09:38:05 +0200
Message-Id: <20230213073805.14640-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230211191315.24554-1-alex@shruggie.ro>
References: <20230211191315.24554-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: THYV5NZYYA26U5OOWQAEXNKIIWIZTDXN
X-Message-ID-Hash: THYV5NZYYA26U5OOWQAEXNKIIWIZTDXN
X-MailFrom: alex@shruggie.ro
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 steffen.aschbacher@stihl.de, patrick.frick@stihl.de,
 Alexandru Ardelean <alex@shruggie.ro>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THYV5NZYYA26U5OOWQAEXNKIIWIZTDXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Steffen Aschbacher <steffen.aschbacher@stihl.de>

When the 'ti,gpio-config' property is not defined, the
device_property_count_u32() will return an error, rather than zero.

The current check, only handles a return value of zero, which assumes that
the property is defined and has nothing defined.

This change extends the check to also check for an error case (most likely
to be hit by the case that the 'ti,gpio-config' is not defined).

In case that the 'ti,gpio-config' and the returned 'gpio_count' is not
correct, there is a 'if (gpio_count != ADCX140_NUM_GPIO_CFGS)' check, a few
lines lower that will return -EINVAL.
This means that someone tried to define 'ti,gpio-config', but with the
wrong number of GPIOs.

Fixes: d5214321498a ("ASoC: tlv320adcx140: Add support for configuring GPIO pin")
Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Changelog v1 -> v2:
* https://lore.kernel.org/alsa-devel/20230211191315.24554-1-alex@shruggie.ro/
* Added 'Fixes:' tag; forgot it on the first patch (getting rusty with this)

 sound/soc/codecs/tlv320adcx140.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 91a22d927915..530f321d08e9 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -925,7 +925,7 @@ static int adcx140_configure_gpio(struct adcx140_priv *adcx140)
 
 	gpio_count = device_property_count_u32(adcx140->dev,
 			"ti,gpio-config");
-	if (gpio_count == 0)
+	if (gpio_count <= 0)
 		return 0;
 
 	if (gpio_count != ADCX140_NUM_GPIO_CFGS)
-- 
2.34.1


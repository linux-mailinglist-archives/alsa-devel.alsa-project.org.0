Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DD7DDD32
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 08:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C043C3E8;
	Wed,  1 Nov 2023 08:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C043C3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698823769;
	bh=4Gp6zLFNW3MWI4+WEv9bd/0txvH5WdP0jOHnxp+498w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rdr8KhrBSeN909n5H6F/y0Xnx5XFppg+hiI6K3mrqRrS4MkbLtWkNfePajMSN//Ax
	 c/1IJqBv7HAx4gCRSVDIL9GdBw4/HTjd3tJkMRsbZwGrjF89999gOpIRJJd6DWkoBk
	 l4P/6wu2NbCJIvPJvBg+4xmV+fTSgyKSHF3pG7ys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3D37F805AC; Wed,  1 Nov 2023 08:27:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E4CF8057B;
	Wed,  1 Nov 2023 08:27:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63141F8059F; Wed,  1 Nov 2023 08:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16662F80588
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 08:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16662F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hekf0+Eq
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so6634185b3a.2
        for <alsa-devel@alsa-project.org>;
 Wed, 01 Nov 2023 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698823668; x=1699428468;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PR7/FSFU3XuiY86UW62eoabHfNqvkOWqiMmylDQZ7qY=;
        b=hekf0+EqCgZ9rBNqyACEHSdzq0DqhnzivMgiEl/gXrbOfBpyIU9cHtCfcuIsRAlzqT
         K5X7pznfvzCYJC9vOdkRAF02r0TpsjlPQjXZBj+3L6DOByNFniael+pHSBRS+BmVi2wM
         gu2SkvyQPOqJYPgD3sRgCPAj+pygUZm7y3l7yE6du9Ag+Bei9MlXJbxnfgLztxIp5Rfu
         0ZrAaIOvdRfxAvxyi5lDTMxK1yySN90AbFpptSoefwUBAAJPEziVQytM9RFFmv6rf8lI
         l0VdLl/k0FB3kfnR5TWSHU+Onefn1xKzUIqSVtnC7Jp9NpWhvlklXD5rcy2i93VcFBfR
         qUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698823668; x=1699428468;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PR7/FSFU3XuiY86UW62eoabHfNqvkOWqiMmylDQZ7qY=;
        b=DBJpfMKAMk9vW8PzhwA8pRNrNverifE65n4x1ieMxppwvoMzQD0FBjkPnkVhuZzvHB
         4KMoNUclY3tj4M34KR6wgXkh5p4+aysv0F4zFA3cX6z+67UVVwdvzvrOkmkBMNvcT+vo
         Cm42oTzMv84EmODIJ49jPpHAEWFIVnOua0BCOGpAFzciEv5VXd8ToAvpYvPpzI4ImrJp
         fvv10nBiFJtDhlegZ57+dsIvJ2uZx2xbwUrucAXcKccUPCqdEgyWK0MkFT+L1nqvSS5j
         PLvVU2+QCi+xhe9w3919V0gd93bZocW+izS58rCzsw7Zr2geKNf3xDsYt4GgB1Pr6OBH
         L6zg==
X-Gm-Message-State: AOJu0Yxmtz5Q4zgyQqodu5f5GO+k8Pycun6xs929m+39Y2zy1FpwAXr8
	oCmsqUnk0Sxcm0HNElvIQtSbZYMGqT/W6g==
X-Google-Smtp-Source: 
 AGHT+IHlwVhdz7ha55Fjd3eof7t7KKUVyNUJiByB5b6ZflzfvE0VTgoQXOhZb0wUuOtnuFfaJpDSTg==
X-Received: by 2002:a05:6a20:230b:b0:16b:e89b:fb18 with SMTP id
 n11-20020a056a20230b00b0016be89bfb18mr12378583pzc.26.1698823668088;
        Wed, 01 Nov 2023 00:27:48 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 t23-20020aa78f97000000b0068ff0a633fdsm686124pfs.131.2023.11.01.00.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 00:27:47 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 3/3] ASoC: codecs: ES8326: Changing the headset detection
 time
Date: Wed,  1 Nov 2023 15:27:02 +0800
Message-Id: <20231101072702.91316-4-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231101072702.91316-1-zhuning0077@gmail.com>
References: <20231101072702.91316-1-zhuning0077@gmail.com>
Message-ID-Hash: 7GA7LBZMRMYVZS7YF4JXT2G74I2NQQRO
X-Message-ID-Hash: 7GA7LBZMRMYVZS7YF4JXT2G74I2NQQRO
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GA7LBZMRMYVZS7YF4JXT2G74I2NQQRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    The old headset detection time is not enough for the new chip version.
    An error occurs with the old detection time.According to tests,
    400ms is the best detection time that does not trigger an error.
    The delay time after the trigger is reduced by 300ms to
    keep the whole detection time unchanged.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 772788811197..fa890f6205e2 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -691,14 +691,14 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		if (es8326->hp == 0) {
 			dev_dbg(comp->dev, "First insert, start OMTP/CTIA type check\n");
 			/*
-			 * set auto-check mode, then restart jack_detect_work after 100ms.
+			 * set auto-check mode, then restart jack_detect_work after 400ms.
 			 * Don't report jack status.
 			 */
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			queue_delayed_work(system_wq, &es8326->jack_detect_work,
-					msecs_to_jiffies(100));
+					msecs_to_jiffies(400));
 			es8326->hp = 1;
 			goto exit;
 		}
@@ -748,7 +748,7 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 				   msecs_to_jiffies(10));
 	else
 		queue_delayed_work(system_wq, &es8326->jack_detect_work,
-				   msecs_to_jiffies(600));
+				   msecs_to_jiffies(300));
 
 out:
 	return IRQ_HANDLED;
-- 
2.17.1


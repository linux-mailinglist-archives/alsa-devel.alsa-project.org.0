Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E36F6065
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 23:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0AD31564;
	Wed,  3 May 2023 23:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0AD31564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683147785;
	bh=iN/OFfbCr1n0AfjOXvyHH3KqD7/hqSrhz+1ssKW63Ow=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eUYlYTYUNNhZ4CpMLiOzSXpTXt8DdNdzlw/he7SOYVOgop+njU9bsqg2gTU/N24rV
	 y7lsw9e5jSBVACaCZ0YZLhsDhwK/3i5+B22HE54eBhS1orFmKpSlvKIWdmeiFJVYKG
	 r/BQPnBPxlrh1snqWcjlIl4MQa0WOjSMYw3q7pvA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DCFF8032B;
	Wed,  3 May 2023 23:02:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E734F8049E; Wed,  3 May 2023 23:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 063FBF80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 23:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 063FBF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Hxkhbodz
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6a5da18f7f5so4573427a34.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 May 2023 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683147715; x=1685739715;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FFnXiATEmM1OgNE2RVbpBTc8vDPgjbOECGz+LzdBk4=;
        b=HxkhbodzhGUrCqKhoVLL5V+uhtFn7AMXNc5s6nXc9FIKQkVWcwEusJb146CafCY6gT
         TElof4oVI1aSnloxGVyGfWpXsM2ZqrQnx6ppPQ/fWT7CxmPSKmqVQ6Xuk0cHuJRhXI/y
         TIbhhMoG6dtC8RgKIJAAtdxQXVj2Ja039GMwDjMCJ5pPMVd+diNpcaKwCjaBd6R7DqlP
         Ghr991nEJo3FR7gymHxX7rfh7JQsrTk/sk3hBoDr+CAirKMk3WQGADv8H1TwTC0fM6r9
         cyZHvyApF8MCSXrYVw+/pUOQKfLsxJfV5ihVGiHCK68GOmvgEhObpgRsRyY4VqK1YBtB
         3Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683147715; x=1685739715;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FFnXiATEmM1OgNE2RVbpBTc8vDPgjbOECGz+LzdBk4=;
        b=TI1rli2Uzb7kb84mO86OtoySjSpL7G3V7Kpb8Rnwd9qFAUqFLaj3nH4chsKz/P61GC
         bYPUdHzdPv0GF+dSKxZ8e2Qd/t4IgNVvXXcLDR2s00jdRZqBj/7zsV4j0woNF68QSP9X
         6Bwk8fo8YlHOGRcfoRctmpa+L1BMyMts3N20ehvDoAyXLPczx1gNjTjFlj4C0CKK9Hsm
         Y6TezQcFKW6FvoNJ9eeOAXb5UNawczYeTP6wocHDYue/CIoR/44wfTPV6hBL8o50lhIF
         MawSKy+hwtEtn6pyMRvZihVSJlIkAqMb+j4+U8BYTBcMfXwH933PLS1MEVcob//3xELO
         pXsg==
X-Gm-Message-State: AC+VfDwdvympTJoKJWQ6hrf6epVvgVurLdPtWaoKEPLMT0TNeEwV/HVp
	zi+oT3DrvHCJbuZ/GVnM+CoDdT/5j1Q8XfppVp0=
X-Google-Smtp-Source: 
 ACHHUZ7G+A6x8lROrJqLKnkkCgbLW/zXPfHO8BnlXSkEoIybkJgeZ4AYe2WOzuAxWQNG5vMAEW/bCg==
X-Received: by 2002:a9d:67c9:0:b0:6a5:dc74:1a7a with SMTP id
 c9-20020a9d67c9000000b006a5dc741a7amr10690908otn.38.1683147715206;
        Wed, 03 May 2023 14:01:55 -0700 (PDT)
Received: from geday ([2804:7f2:8006:42e0:35d6:3084:476c:a55e])
        by smtp.gmail.com with ESMTPSA id
 dg3-20020a056830480300b0069fa883c738sm985372otb.35.2023.05.03.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 14:01:54 -0700 (PDT)
Date: Wed, 3 May 2023 18:02:06 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: ALSA-devel <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: usb-audio: Add quirk for Pioneer DDJ-800
Message-ID: <ZFLLzgEcsSF5aIHG@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B6C3NCTGKY73FFNHY626DDO2GU4MZOV3
X-Message-ID-Hash: B6C3NCTGKY73FFNHY626DDO2GU4MZOV3
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6C3NCTGKY73FFNHY626DDO2GU4MZOV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One more Pioneer quirk, this time for DDJ-800, which is quite similar like
other DJ DDJ models but with slightly different EPs or channels.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Tested-by: Grégory Desor <gregory.desor@free.fr>

---

Hi Takashi, this one cropped up in the Mixxx forums as a request and it
works. Grégory says Master and Headphones work OK with this patch, MIC
inputs are untested. Thanks!

--- sound/usb/quirks-table.h	2023-05-03 17:55:23.133827915 -0300
+++ sound/usb/quirks-table.h	2023-05-03 17:56:29.054827946 -0300
@@ -3884,6 +3884,64 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
+{
+	/*
+	 * PIONEER DJ DDJ-800
+	 * PCM is 6 channels out, 6 channels in @ 44.1 fixed
+	 * The Feedback for the output is the input
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0029),
+		.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 6,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 6,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC|
+					USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
+
 /*
  * MacroSilicon MS2100/MS2106 based AV capture cards
  *

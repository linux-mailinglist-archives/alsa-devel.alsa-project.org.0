Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C442C83898C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 09:50:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC4F828;
	Tue, 23 Jan 2024 09:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC4F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705999852;
	bh=DGKrtDGdQPRgKJyhYhrxsoa1aDtlSRmC0I45VLz7qFM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pwuJwuHgMJ1nl97UvaD7pehdrzZgJ0LBU8nuQGzMsa/r5fPV0CvTAqpocnTL+ffqH
	 vYyrXLPOyQ828YfsSg2LrO72Es8NLBbpScMBmWU3Ny/2K6AdiWqKkwofl6Xjr88h2Q
	 6EBCUUaFvzdsstQhIx1N1GhqcsRcfeN1e573hcO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20B8DF80563; Tue, 23 Jan 2024 09:50:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5604DF8055C;
	Tue, 23 Jan 2024 09:50:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDDF3F80494; Tue, 23 Jan 2024 09:50:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0A9AF800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 09:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A9AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VdRSnDog
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55a50649ff6so4341419a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 00:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705999789; x=1706604589;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rYVD6pv2AkTe+bgU1Vf149fg5BMC7DKEF46un8wVt0=;
        b=VdRSnDogUTlLH+uGzsikw1jhC4CwtSj227RaDmnA7E/n4ZDCQcKBolADsT370OabHC
         Fdz06AZRWsJpWvevdbIPOsydLTyOjt7qltEpEm5vJ8m3L397pMzHoFUiWi1Utr4DbHMG
         tz+4/T6iuI0EUZLsn4SCi7OkUVYmkc0/1mWvOPHAiY4zuRZsW35H+4a4wfuii3GFIWw/
         TXELyT0YgRyKCcyfv2aKlahIxDPvW1t01lOOS99b8pTVctUEYoc/svOMu2mG6741ds59
         /Sk8foC9nPUuKgfI5MAP7+jW6HESbIbnxMAMCgrf200QQjt0Gi2kLLwstkEsmINBiUlR
         19vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705999789; x=1706604589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rYVD6pv2AkTe+bgU1Vf149fg5BMC7DKEF46un8wVt0=;
        b=FA1Ft9fD7ji24UHY1ImW58cbJkoHatlL5OTdIdts+nbwtKjfM0yIp4xKKpAymIk/Q9
         qnhDwF0AT/2QE9G+xkzAGwJXkM/WovIG8XgReBV3HHTAbwHwUFquG9aVB3CUpKEzYIMP
         nZHDgfADiq5yUqM4jsxeMSS/TgGzFdkanZCYQH+snM+TOwSKtQ3DqtRCJxGO35Hp34cn
         exI4mL4NW1MeCX+PR2SdeG6R+V7jWAxAE8cBHwVC5LM9znSbS2iwqeIproIYlf/uN+o/
         ldEn2iO8JhpqEGVwUpMsqxmetIBmd+ur0rkPFk8IToDvuEFeezi1arG1AOW0eSlJJYOQ
         bYiA==
X-Gm-Message-State: AOJu0Ywe497DOD2Dc0LlaEJm21P8YPmNFEZoMEXF2BtDVmbekYVURQMI
	Ev1GnHARUcpK+kjxWyexeapw+pfoilIFgPchKetNLhOvNCER+uVE
X-Google-Smtp-Source: 
 AGHT+IHoBnyWDvNxlNKl1ueKqwM1InwHrnZ0ixBcVeLASmOh8UhNtEuVfnTx5YLYHJwzZXUzTbHEyQ==
X-Received: by 2002:a50:ee19:0:b0:55a:4718:554d with SMTP id
 g25-20020a50ee19000000b0055a4718554dmr521365eds.80.1705999788734;
        Tue, 23 Jan 2024 00:49:48 -0800 (PST)
Received: from napoleon2.. ([2a02:908:1980:b9c0::d463])
        by smtp.gmail.com with ESMTPSA id
 b23-20020a056402139700b0055920196ddesm12061890edv.54.2024.01.23.00.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:49:48 -0800 (PST)
From: Julian Sikorski <belegdol@gmail.com>
X-Google-Original-From: Julian Sikorski <belegdol+github@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	stable@vger.kernel.org,
	Julian Sikorski <belegdol+github@gmail.com>
Subject: [PATCH] Add a quirk for Yamaha YIT-W12TX transmitter
Date: Tue, 23 Jan 2024 09:49:35 +0100
Message-ID: <20240123084935.2745-1-belegdol+github@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 35QQXS4EZLCFCV4R6JXQYUUZGIFB224B
X-Message-ID-Hash: 35QQXS4EZLCFCV4R6JXQYUUZGIFB224B
X-MailFrom: belegdol@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35QQXS4EZLCFCV4R6JXQYUUZGIFB224B/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The device fails to initialize otherwise, giving the following error:
[ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1

Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ab2b938502eb..bf0a7cca90d0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2031,6 +2031,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
-- 
2.43.0


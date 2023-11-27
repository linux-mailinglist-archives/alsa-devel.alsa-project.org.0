Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431817FAD5E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 23:21:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8817D836;
	Mon, 27 Nov 2023 23:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8817D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701123682;
	bh=DGKrtDGdQPRgKJyhYhrxsoa1aDtlSRmC0I45VLz7qFM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P/2Ewh6RB1JB1rwKdvi4ln2CaEl5tZIVDsUmF/yu4hu0t+UzDpMcJOclXKo3khrsc
	 CNFfT+AMm/1/TqXO/31RsWs8E1rBRnp7kb19Sdpe0oS0fFplLWwYbtGAdCJpguIln/
	 1QcCGCmh1DuFim4bJAM0pmqRL8hGWs8EGlic9NFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD60F8055A; Mon, 27 Nov 2023 23:20:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8F4F8055C;
	Mon, 27 Nov 2023 23:20:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F2BF801D5; Mon, 27 Nov 2023 23:16:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA0EAF800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 23:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0EAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PbBvG+Wi
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b479b9c35so9006195e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Nov 2023 14:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701123357; x=1701728157;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rYVD6pv2AkTe+bgU1Vf149fg5BMC7DKEF46un8wVt0=;
        b=PbBvG+WiQT5C/N5+RfSyTxqvCxOM5m8fsI+ia3hMrEhPGetqXB6Zyx4iDDvWg8Nwas
         c5PLWxo9CPaw3JyCAfqBYdvhhbg9/kO4tV+BVw84flmutKYr1pR48g1rUX1i0iys4/gK
         DW/0fC2Tj71XlzLUXWIybqK0YAh32Jzqqm/dMzlF7rA6PEs3nM/6mux5rLrlZKrzzUuh
         N7tREinBX0UdjERBEZxmSEmrDTSzfPXhiozjNuQmFhkTXduuuf7OJvs12zB9uNkSVgsf
         AfkRA0CKGTppJjJAiT8nsyYhYzjN/4g3hAnbTovLhz5TGxjTz0E5nilIIL5SOoXtOhFy
         YusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701123357; x=1701728157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rYVD6pv2AkTe+bgU1Vf149fg5BMC7DKEF46un8wVt0=;
        b=litQty1mA1ghBjrXlm1OQvZcJVhYHigqIOhHuKZ+t6J8D5stCvBZ8PX8JtjMtt0JKo
         NU/9ydVm85Kx0pQItYdm8EH7FIN67NO0j4AI5c2rgPsQ+M2vJbRgjmpnpP4C9lVvL8db
         ObbEjQG79eCzxCPvURvN8+0A3nA7+LRlE4iMnbUjCYb1HWGYvPkJmFmUC01lWcp9cpOf
         r/kAicSqwYv+0RO3bzxOkf0Jx0DBAcWnEDLKqYT55nBZaYJ44qZz5jLyjoZ/TeqXUkP4
         QYiLG0kFeaeFOVlqbhRl62DTJa2WuUEY2WPUzuVBtHe4kuViccawTCh/tzRrRVcLmWNz
         Jrhg==
X-Gm-Message-State: AOJu0Yzbf+fxo5F5O0Pj2M7MdYqikzIaQ9oY1mKIPS5EXNsmE3ZYUm0x
	AcY/bH6+nua7gZ3R+uXXVOG2DTcCGwo=
X-Google-Smtp-Source: 
 AGHT+IGGzRjM6xztXac9UAao5f9z7DFOWDjt5e+u8gKdJnjuH93e5m6ZoB7cywZZvxn8X8OExDAUDA==
X-Received: by 2002:a05:600c:1f8c:b0:40b:385f:4182 with SMTP id
 je12-20020a05600c1f8c00b0040b385f4182mr10171621wmb.27.1701123357094;
        Mon, 27 Nov 2023 14:15:57 -0800 (PST)
Received: from napoleon2.. ([2a02:908:1980:b9c0::5b7a])
        by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b0040b43da0bbasm6696022wmq.30.2023.11.27.14.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:15:56 -0800 (PST)
From: Julian Sikorski <belegdol@gmail.com>
X-Google-Original-From: Julian Sikorski <belegdol+github@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Julian Sikorski <belegdol+github@gmail.com>
Subject: [PATCH] Add a quirk for Yamaha YIT-W12TX transmitter
Date: Mon, 27 Nov 2023 23:15:52 +0100
Message-ID: <20231127221552.19087-1-belegdol+github@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y3J57K7F7NZBNZFTUS2PSB36LRN2RHOY
X-Message-ID-Hash: Y3J57K7F7NZBNZFTUS2PSB36LRN2RHOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3J57K7F7NZBNZFTUS2PSB36LRN2RHOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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


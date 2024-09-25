Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD72985138
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 05:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FF686F;
	Wed, 25 Sep 2024 05:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FF686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727233707;
	bh=4fPZFq9GucltM9qF4rscl7ftDfoWZ+wWMtPS0pSK47E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qw25kt+I3nb3J0fu9SIfNhGPXRw+5PaZTyoJE8tnfDCuU7nQlUOXne76u1EPsh4VE
	 2Efw2WbWa/KFE6WV+bdL8Msl4gfUtJvE8a7kwBPHJXLoDxHUBQEJzOd3GMEZQiH2Ma
	 upv/XJHif4giyUSDOWiIxXRnD/NoVINT2zebC/G8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E22BF805B6; Wed, 25 Sep 2024 05:07:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E77D4F805B1;
	Wed, 25 Sep 2024 05:07:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3483DF802DB; Wed, 25 Sep 2024 05:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7403F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 05:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7403F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZGv1/902
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-84e8bb409b6so7979241.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Sep 2024 20:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727233662; x=1727838462;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EYpCc4I8glQ7ck+nhqJAvbOoAL+loG6airV9nPgLSA0=;
        b=ZGv1/902YyoWwDoUc5sbGkYs3E5mwMQpJQ/rBXpfRMsnCsmMD9wU5xqk4766+ZlR5Y
         dJWScY0/fQPs9uK7TgXxiJfaYejFHu6Lk7GT/XA9xd1NY9jv+JEtV1aVTW98QsF7Ikh4
         0pXNdYhceFK57rrH287BytHdof+2hH02dxr3Aglh6PvhwWkfgxAHO2S4CBHaqjxiEY5v
         uDuyEaUeNtl31P0W2GSTI+tBqQSkjMK5DIPwQTgZXnYj7WHuxL9kLAl/NREjXqGxzFJ1
         nxYDYRm4zUyovkVzWU+OWnbRaYFfG7q0i6BoQJ4e2T/+6aW3ZIEH1t7e4Vybj0LL78+Q
         +d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727233662; x=1727838462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYpCc4I8glQ7ck+nhqJAvbOoAL+loG6airV9nPgLSA0=;
        b=g6emCX/PtId7iCyK2ImxFRXwSs5Nc1HjgImfAKK0hYjRTmzKgbGj1vwpibikkd8UYZ
         Dcmf1W+63qqmkMraMExbT6lPT/VTr0Yqdv6Fb8xLsJNOY7pEr0cYZswnvYWDqwAAiYu5
         9QTn7be8ogn2nzU9JgO2REanIEXs5oU35RdDnlkbkTfxKtire6FtFdWze2/BVGua4KYn
         33fG8Ff/Q0qLyoyX5EcvQcnyIRXQFrqQHaas3vc5ni+KD9T/Jn71WgqxdpcVBtWp73nV
         d/3PL+9jeBo4zr+46X/7l02RaynUxPdK4/vizVLfjNGS3NTxZNGTQY8K76O7kbDsA/08
         F1Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSKR2YfIDDlzyGdUwrjn86YXQjOtOGocGni+QD+3JDRpFPCCmy5xOd0Oq9Nnz4n1Xo92tbfC0hYhBl@alsa-project.org
X-Gm-Message-State: AOJu0Yw80O2gXiJj4QP7IzQYZj+nut2amgHSt3EDICSNSEnylwG3TDP8
	WHUEqSQdATWFhDsuAfJyLN1RsvPcCCtlXrywhfvWl5zJTpreFLCK
X-Google-Smtp-Source: 
 AGHT+IGHX3YR1tSYTG2yld904TImUX4Wt8i0FOff6GYl4zX2IlhtyXZHmm+gjvhabOxGdIUccbGoNA==
X-Received: by 2002:a05:6102:c11:b0:49b:c5df:ced6 with SMTP id
 ada2fe7eead31-4a15dc958c9mr1771357137.10.1727233662222;
        Tue, 24 Sep 2024 20:07:42 -0700 (PDT)
Received: from lenovoKubuntu.. ([2800:150:11c:b79:f1b0:792c:c69:ad52])
        by smtp.googlemail.com with ESMTPSA id
 a1e0cc1a2514c-84e73d22f77sm1272575241.33.2024.09.24.20.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 20:07:41 -0700 (PDT)
Sender: =?UTF-8?Q?Hans_Peter_M=C3=B6ller?= <hmoller@gmail.com>
From: Hans P Moller <hmoller@uc.cl>
To: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Hans P Moller <hmoller@uc.cl>
Subject: [PATCH] ALSA: line6: add hw monitor volume control to POD HD500X
Date: Wed, 25 Sep 2024 00:05:54 -0300
Message-ID: <20240925030554.31829-1-hmoller@uc.cl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LYILUZSYG5CZSNE4R76ZVGMFDFU4SCTH
X-Message-ID-Hash: LYILUZSYG5CZSNE4R76ZVGMFDFU4SCTH
X-MailFrom: hmoller@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYILUZSYG5CZSNE4R76ZVGMFDFU4SCTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add hw monitor volume control for POD HD500X. This is done adding
LINE6_CAP_HWMON_CTL to the capabilities

Signed-off-by: Hans P. Moller <hmoller@uc.cl>
---
 sound/usb/line6/podhd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index ffd8c157a281..70de08635f54 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -507,7 +507,7 @@ static const struct line6_properties podhd_properties_table[] = {
 	[LINE6_PODHD500X] = {
 		.id = "PODHD500X",
 		.name = "POD HD500X",
-		.capabilities	= LINE6_CAP_CONTROL
+		.capabilities	= LINE6_CAP_CONTROL | LINE6_CAP_HWMON_CTL
 				| LINE6_CAP_PCM | LINE6_CAP_HWMON,
 		.altsetting = 1,
 		.ep_ctrl_r = 0x81,
-- 
2.43.0


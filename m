Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614F90C938
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21B8A4D;
	Tue, 18 Jun 2024 13:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21B8A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718709980;
	bh=3156DIFjETCUi5nKVvfuBuAomo8aSmJgHYXpWsdSxO4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=g/mM/xLjKFNgqGZip/YGOxE72CQMII2TxULqZjEWHXpEa5WuPDva1RVBEKeF/BIIG
	 cjEFChbyaXEHt88JIqqvaqJgn0USulY5FuNXTH/AKIUmTIyth0orRE+zYSRuLETAjT
	 W/wtbyiZ9Cp6VfNajjza8kWYBFNMAqKll3Wc0e4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64AC6F80600; Tue, 18 Jun 2024 13:25:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24812F805EC;
	Tue, 18 Jun 2024 13:25:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C99F8023A; Sun, 16 Jun 2024 17:46:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2327CF800FA
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 17:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2327CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ksDTo6OD
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-6e40d54e4a3so2772342a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jun 2024 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718552756; x=1719157556;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7fp8UlyhTZugwgUTVEakWeUaqJf9C1Xu5hu6Y3OppA=;
        b=ksDTo6ODq1kakKMNnESm+VwM8fWE0gW6eFPJLHEIfJ5e1m4ByNOWmOskvW5e5iwuUL
         gl7Egrrzwc8tYAr3Yre0tPq1wMW4ledmEpKvEGOsq8CKhDAB8Jt9uGDSc0Wtzl3TCjx+
         mf7HZ13j2mG8+92yC98G5YWytYZ7ZQf0J93LBFMaBcWjPkb2n72R7w4ILSR5USjt1KnL
         07x9g+vIUsKyrVg/kPdHAqk7HVadTlhxnG9EInJKwQQYh49NAvytZRGgYiuIVwZ3RGYA
         Ay0a2L/b42q+qfPkK3yfJfoDIohHhMPGveaSa8w9tR7k2jZ/rvMhX29PBGsNStZ5epvl
         +d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718552756; x=1719157556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7fp8UlyhTZugwgUTVEakWeUaqJf9C1Xu5hu6Y3OppA=;
        b=l2mmvUyABggksN2B2ZdIuaDF37aFeShEwDA9tMFfSgd/hRguNfoS9tDYq7wQjJ5Kc9
         wI+yGBVZzgW5iHBQPX43iJfVoAZbnuPX1keZaE8uPLl4mRwXgZBTsC8JGx7H1pfqXaZC
         YkKR2QjgiOP3ELqRQayXO1BBWzyL+zyx8YpvBc8920ZdP+D8gINnLsVKKIg95T30ByhJ
         s4rxCT4Cq4xA1GmRb5kl+jjhU6xRlD3V+Usatn7mIs3xNkCkUB0DeHxOM414DGC5jF+1
         a3d02Zt2auefk9yJehKjUhnHIsCbLoabmgCSiKISfit+1nJbliP1l2fMsG33j0mlxcXd
         quSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIchztWPyd3jT6uKJt5Q8SkoykiR8svdzhcWK372+4KQhm6g/qrKyhjQH0mdBsschdjI1/zx2HiShIIoLSlcN9B1ba3x0KZF7Sil8=
X-Gm-Message-State: AOJu0YzegKPH/l9mZS7fs/XOOGt6QTjj3FOFzw73ZLOtlt14vQ5KKOOV
	kbdFw/H7sjPcoBaMhuC2DLQ97DJwWNZkSxU0zuC3C9LvB+ElKX7G
X-Google-Smtp-Source: 
 AGHT+IEeNwqXRCUbagaIZHN5sqtN03OgsiynC+a+Fqu36/lStwWRvh4U2rCQN9zhCCob0OV/1fcstw==
X-Received: by 2002:a05:6a20:7f95:b0:1b7:8d72:d00c with SMTP id
 adf61e73a8af0-1bae7ea1002mr7842615637.31.1718552755613;
        Sun, 16 Jun 2024 08:45:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c1:10da:1462:7d9e:737e:f8b0:47ad])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb90a33sm6063560b3a.187.2024.06.16.08.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 08:45:55 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com,
	skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	av2082000@gmail.com
Subject: [PATCH] slimbus: Fix struct and documentation alignment in stream.c
Date: Sun, 16 Jun 2024 21:15:31 +0530
Message-Id: <20240616154531.38232-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: av2082000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TLF3QEU5KWLJOUQPDSZFIRZXUWNX6BKJ
X-Message-ID-Hash: TLF3QEU5KWLJOUQPDSZFIRZXUWNX6BKJ
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:25:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLF3QEU5KWLJOUQPDSZFIRZXUWNX6BKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The placement of the `segdist_codes` array documentation was corrected
to conform with kernel documentation guidelines. The `@segdist_codes`
was placed incorrectly within the struct `segdist_code` documentation
block, which led to a potential misinterpretation of the code structure.

The `segdist_codes` array documentation was moved outside the struct
block, and a separate comment block was provided for it. This change
ensures that clarity and proper alignment with kernel documentation
standards are maintained.

A kernel-doc warning was addressed:
    ./drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 drivers/slimbus/stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..62661211a409 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -18,7 +18,6 @@
  *		and the first slot of the next  consecutive Segment.
  * @segdist_code: Segment Distribution Code SD[11:0]
  * @seg_offset_mask: Segment offset mask in SD[11:0]
- * @segdist_codes: List of all possible Segmet Distribution codes.
  */
 static const struct segdist_code {
 	int ratem;
@@ -26,7 +25,10 @@ static const struct segdist_code {
 	int segdist_code;
 	u32 seg_offset_mask;
 
-} segdist_codes[] = {
+};
+
+/* segdist_codes - List of all possible Segment Distribution codes. */
+static const struct segdist_code segdist_codes[] = {
 	{1,	1536,	0x200,	 0xdff},
 	{2,	768,	0x100,	 0xcff},
 	{4,	384,	0x080,	 0xc7f},
-- 
2.25.1


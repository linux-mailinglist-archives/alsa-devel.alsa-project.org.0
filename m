Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95B58C9E70
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1EED14E;
	Mon, 20 May 2024 15:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1EED14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213365;
	bh=+XvZ6d4i182WKkKIFekI5zg0hoZztDTHBp6z/XoY50U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rszL5RKwVrwyCHcsNjbdrmK5CQeFOPewtHB9j5ovfHpeGL1u1/VEU4tQPTdc9+xqO
	 1RFu0xkqhs015sStRMFvYm2JhVJfx/dSEt3kQjNDGdkaIeZytvrSAgAXHTD4Mdgkha
	 Dn5AdLc+ZCRYc+SQBmLBHaBS1Wq8tL0PmRpmeYgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12522F805A8; Mon, 20 May 2024 15:55:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB640F80525;
	Mon, 20 May 2024 15:55:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0CC7F805BF; Mon, 20 May 2024 15:28:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFD22F80578
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFD22F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lzsa4DP6
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-792b8bf806fso241278885a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716211675; x=1716816475;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTukOohCbA5F7xEgfP8EP+gEt6jl+p1n2yxKJs+r/CM=;
        b=Lzsa4DP6wRaCDP+Dj4xYbeqtukKUDie29MWuV+j20Lgyg3CLdS/1P/+v5MsIi+sbTZ
         91bFj1NGi9nF3CBRj984VGaBXuccBafTkb+dqRbjj4ykwx9d6LH070rG1/uxnBvwPeXS
         YL7g9h1VPuaNKrlBWhainwe8F+9Cm4o9KTbRMo28UaDpyJGVM2fIJsSDB3rYxarnDvOB
         SVAEWSlg2itqmA1YS10eUG7Rtd9S7yjIxQuqcqM2v6Ap99fl+bYXPPUT1b43p7eF24vH
         2qCv0FzFDSr7EzvhlRXa9/pIxcg0lPcAc23ai7e4dS9z4pN1mF5JValedgzcueKBhYVu
         nfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211675; x=1716816475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTukOohCbA5F7xEgfP8EP+gEt6jl+p1n2yxKJs+r/CM=;
        b=T30rCL/bwCMBdtori5ORYjWjGvpMRRvXXCosttjP+AEB2W8H71VT0iXJ7ndPaPYmBE
         qtcF+mVujn8I6PgD0iGoCSOQq1KGDa/syVndsDfzXl3RHDxSujI++xzpuDhu4Pvk9Kb1
         eNdKt1LGsp86tZs1hYE/TVCynxaN+AIySoiT84rdjz3NnxrpHj3gQfWRnfeeaF6rJPH+
         Et9Urre4fkavXPxzHuifkw4ZtSxvxatok/ZoTq+4fg/rU34Ey4LHWnrHrGAzxt+R03Je
         WrAnr7ztV8kJDMIC02uW/80u5yjgllDiAuu2u52Zp+kYXw9KGryYNn+dqOkkaS01EMC+
         w2VA==
X-Gm-Message-State: AOJu0YzhDuUfuTJiosFRVD3e/PCxs1bDozxmOV0FScrohFc27ob9I51W
	nYelNXIMGCxTz367rK878Qu6YzhPpOTiAXOMA3uLfRf4nYxGaA2VjJI0Np08HS8=
X-Google-Smtp-Source: 
 AGHT+IGWTwojRSUx54PlrPIRbCX2SnMpw8DyaPWMR0v4yghfUOM6EWROnUfONnTmNpNSDj2bOy2pVw==
X-Received: by 2002:a17:903:98f:b0:1f0:79a4:6847 with SMTP id
 d9443c01a7336-1f079a46b66mr190933405ad.55.1716051524761;
        Sat, 18 May 2024 09:58:44 -0700 (PDT)
Received: from localhost.localdomain ([136.185.82.72])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f099518969sm56544635ad.119.2024.05.18.09.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 09:58:44 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: srinivas.kandagatla@linaro.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Remove redundant description in struct segdist_code
Date: Sat, 18 May 2024 22:28:40 +0530
Message-Id: <20240518165840.29415-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: abhishektamboli9@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HJ6Y7CWE4KDMWJB3CRKQOZA4XWSSI7DZ
X-Message-ID-Hash: HJ6Y7CWE4KDMWJB3CRKQOZA4XWSSI7DZ
X-Mailman-Approved-At: Mon, 20 May 2024 13:55:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJ6Y7CWE4KDMWJB3CRKQOZA4XWSSI7DZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove redundant description, ensuring the documentation
accurately reflects the structure's members.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
The documentation for struct segdist_code contained an
excess description for the member 'segdist_codes',
which is not a member of the struct but rather
an array of segdist_code structs.

 drivers/slimbus/stream.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..9e7983507f19 100644
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
-- 
2.25.1

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D390C93B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B94BE64;
	Tue, 18 Jun 2024 13:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B94BE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718709991;
	bh=ia4edk8RmfbVzS93m+pKUdA00RtrRqwyHnd3U5dDO60=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZT7YXZKYM8RxzyJMM6U52yWu1omRqhZhPl0YHpMpYxGYForNze9A1oAqIgQ5wWSfE
	 E9bkeZU5JUxcXwfAbdIwoQbKhSOdYatiljLt2MHMJPZDbybWFKOJVthiH76cSv5ktb
	 ruVCBuoUDQOXWWeY+FAtzvT4PRi31oAdNOoVFmA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AD2EF80613; Tue, 18 Jun 2024 13:25:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BEDBF80607;
	Tue, 18 Jun 2024 13:25:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 137D5F8023A; Sun, 16 Jun 2024 22:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79E82F800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 22:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E82F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lSa4ydIv
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-6c53a315c6eso2627057a12.3
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jun 2024 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569967; x=1719174767;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ruQzJtdDUUq/rH+dZqwFNhNxz0nTDbK3w5CfEy2fEI=;
        b=lSa4ydIvIDlYFr67iurmJkfGeFX61pHM7btbuLSVRNpm5eGwthETl7GWgX/EmNASc1
         eAHxDbrgkiW3lyB4Eazm0DBxPA2PO50JKHs6gEgODDAL2G8/OD2U3s4HjHcqNhgThydO
         J9UOBpmWpQ7beG5V0xc9s/T/TBqIqVCj1OoWkLZfdtq6RIhnDKGsz7kTeHbumTdkGDUD
         pS430ccMWtE14ZXPFwuiS9h2uEJNQD9LXblnkelfLFPaF4OtuTuIsoF4A2QwEVIAnjvG
         0btTK5Fs4RyCNA8RPwQXopt47jq6uTDDjNVFzY3fv6CQt+EQgRw18zAo6kNUBfaVTSZR
         VzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569967; x=1719174767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ruQzJtdDUUq/rH+dZqwFNhNxz0nTDbK3w5CfEy2fEI=;
        b=NEIRpOnUZD9uk/QRWZ7DWm/4m3NvipEwMR9tJkgWUw5feDgNTamyA7mnt7DuHEIvTS
         DsUlNSFtyMaz4OXgWge1D5//P9Dkf1LnCUcepmt9lD0qZMAle1ZwBWLu4W+dc13XbwXv
         KyXBLG7M6KkzxuLPgt2FWzABkuy1b9bqpK8mAXnqTO5Ag9+6/ncOpIfghvwN2/+aEupd
         AyQ+1065EZYRBcVjEz03wlonS/uJjRaKW7VZHsIuvK603T4mO+e4pVJdJ+AuWNbXt5yb
         Cg58Oyl/HegbQTE4n/L8yJTevIzOTlcmgVpoZ19FU6ErDN2+0PVhPLIBNSfOa6g0Ep2Z
         wVSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFWyMx7pi8FcjASgelejNACNfeGievnyrlmroLpB9wUVeS+MQ7bbtGeeXVF/68x812GttluSQBCqYdWRO4rAsa/lSSmBAOwiQHfms=
X-Gm-Message-State: AOJu0YyswdGzKsqBE3uyBaLdG/R8HxF+DHSzZSe+NqMMP29uUNfx/xi+
	oi4d1enh0RFjJe7VHcqqJDoaIJcNw+oA0eC3D2JRd2xvb6kGISMd
X-Google-Smtp-Source: 
 AGHT+IHttRPT+l3u7KhI0+XnNjSbaauE24Xxu5vcXgX8eJpy16mVVB7TSc2rxGcJwba3DyjXRzPUMQ==
X-Received: by 2002:a17:902:d4c4:b0:1f8:44f8:a364 with SMTP id
 d9443c01a7336-1f862a167a1mr94641395ad.48.1718569966812;
        Sun, 16 Jun 2024 13:32:46 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c1:10da:1462:6c5b:68d6:dcd3:7aed])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855ee807fsm67611455ad.155.2024.06.16.13.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 13:32:46 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com,
	skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	av2082000@gmail.com
Subject: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Date: Mon, 17 Jun 2024 02:02:31 +0530
Message-Id: <20240616203231.43724-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: av2082000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BRADY4QHXNE6GXVX64W46CGQJTJC54ZY
X-Message-ID-Hash: BRADY4QHXNE6GXVX64W46CGQJTJC54ZY
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:25:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRADY4QHXNE6GXVX64W46CGQJTJC54ZY/>
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
Changes in v2:
    - Removed `static const` keyword from `segdist_code` structure declaration.

 drivers/slimbus/stream.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..863ab3075d7e 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -18,15 +18,17 @@
  *		and the first slot of the next  consecutive Segment.
  * @segdist_code: Segment Distribution Code SD[11:0]
  * @seg_offset_mask: Segment offset mask in SD[11:0]
- * @segdist_codes: List of all possible Segmet Distribution codes.
  */
-static const struct segdist_code {
+struct segdist_code {
 	int ratem;
 	int seg_interval;
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


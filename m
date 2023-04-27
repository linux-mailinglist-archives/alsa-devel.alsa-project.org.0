Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFBE6F2EDE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:46:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5C117F7;
	Mon,  1 May 2023 08:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5C117F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923615;
	bh=S/jOSbKEu1Iys2CZSu/Bv75Gzru8sAcoCoBmLTdwpfM=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=INOOSKAYWMJ3ZMyToDiQnjLhlNywVyLVdiukvd0NOEmfyAokJN/cCBiEF3oQiE2dd
	 WfvzmsSNftddhAyoZzMwYh6VlCHE9zOa1Ng/3Pr3m+Hu4/BPfKFlWwfeB66RuXtVXf
	 SJrV2cSQEXpD0KSSCw66FGsopWjNB4Xn2cH2e/V4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A44F805D2;
	Mon,  1 May 2023 08:41:18 +0200 (CEST)
To: broonie@kernel.org
Subject: [PATCH] ASoC: amd: yc: Add ASUS M3402RA into DMI table
Date: Thu, 27 Apr 2023 21:16:45 +0200
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:41:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QUFKNIF63R5O7VCTCNNSDFZHFZ3J3FT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292327838.26.3252113165352444373@mailman-core.alsa-project.org>
From: Enrico Belleri via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Enrico Belleri <kilgore.trout@idesmi.eu>
Cc: alsa-devel@alsa-project.org, Enrico Belleri <kilgore.trout@idesmi.eu>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89897F8025E; Thu, 27 Apr 2023 21:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6725AF80137
	for <alsa-devel@alsa-project.org>; Thu, 27 Apr 2023 21:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6725AF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=idesmi.eu header.i=@idesmi.eu header.a=rsa-sha256
 header.s=MBO0001 header.b=TRkpemao
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Q6lpx61z1z9t8X;
	Thu, 27 Apr 2023 21:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=idesmi.eu; s=MBO0001;
	t=1682623017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=he1u3nZUz/38H7+Zs5xdfVAxl5D2IfPMYSGZPsYah+g=;
	b=TRkpemaogGr/MKQbJaigodKG1h6Po1jWz+MUt29Zy8EvPm6sWj5fgTAleKcaYTuP6KbjiH
	d4Bj1NhZ3bcjqAV6fh/8w2A050XwR/J99dBQUWm/p6Y8QPYYuhJ0opeuyahMtXkCVenVyS
	CuEmKjghJMjMC3C/KUUbeWRHLe18d48x7aCd4Q+ojJ1AMar6HP55+KkxaJehMQs8FYvHol
	718J5qUC/wIgI/9sC2d0aNvqz0EPp5atTn+IHY5+JOEA++kNb5xLsqWn8XEDGZ0p0By9Tr
	ILHKANqA/d3yMOgLBZOkjMQNdPxklDMLQt9qIl2N4LjDvJDOrT2uYDup9FL3mA==
From: Enrico Belleri <kilgore.trout@idesmi.eu>
To: broonie@kernel.org
Subject: [PATCH] ASoC: amd: yc: Add ASUS M3402RA into DMI table
Date: Thu, 27 Apr 2023 21:16:45 +0200
Message-Id: <20230427191645.24519-1-kilgore.trout@idesmi.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4Q6lpx61z1z9t8X
X-MailFrom: kilgore.trout@idesmi.eu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3QUFKNIF63R5O7VCTCNNSDFZHFZ3J3FT
X-Message-ID-Hash: 3QUFKNIF63R5O7VCTCNNSDFZHFZ3J3FT
X-Mailman-Approved-At: Mon, 01 May 2023 06:41:14 +0000
CC: alsa-devel@alsa-project.org, Enrico Belleri <kilgore.trout@idesmi.eu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QUFKNIF63R5O7VCTCNNSDFZHFZ3J3FT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix builtin microphone on ASUS Vivobook S 14 OLED 2022 (M3402RA)

Same issue with this model as apparently with other Rembrandt laptops: https://bugzilla.kernel.org/show_bug.cgi?id=216270

Signed-off-by: Enrico Belleri <kilgore.trout@idesmi.eu>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4a69ce702360..80dfb6036859 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -213,6 +213,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M3402RA"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.40.0


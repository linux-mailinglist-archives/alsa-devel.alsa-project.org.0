Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EE6D9A5C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8E1ED4;
	Thu,  6 Apr 2023 16:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8E1ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791496;
	bh=JAFdP+RhWxCZpZQqzEh/8UwFmFSvQ5eGCtTgsL+EhM4=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=XFFZxFkyo/pEuikqeScCCX4s1N8iKz2OrwXWsyqDwLUDvncoVm9R7ruM6UIOP0nrM
	 APws4y9Xi5fNYVvpK8yLycknCF5AfKTG8y/zwJiBupXKzUDRy9h4KhYBu1jxuxQa4a
	 Vt2v+QO4efr6EAEDslN3sT6XmnNV+0PXbhYWBpF8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B7FF805C8;
	Thu,  6 Apr 2023 16:26:45 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add ASUS M3402RA into DMI table
Date: Thu,  6 Apr 2023 10:47:55 +0200
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3CUALCPICBCMFRHMJYL7JXYOTPAJ2TQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168079120408.26.3383544700797001255@mailman-core.alsa-project.org>
From: Enrico Belleri via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Enrico Belleri <kilgore.trout@idesmi.eu>
Cc: Enrico Belleri <idesmi@protonmail.com>,
 Enrico Belleri <kilgore.trout@idesmi.eu>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32FA0F80246; Thu,  6 Apr 2023 10:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 399AAF8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 10:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399AAF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=idesmi.eu header.i=@idesmi.eu header.a=rsa-sha256
 header.s=MBO0001 header.b=sGA4cp3B
Received: from smtp1.mailbox.org (unknown [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4PsZrt6zhrz9t4j;
	Thu,  6 Apr 2023 10:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=idesmi.eu; s=MBO0001;
	t=1680770879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C97U33ii7CfAJbQ3OayudLW2xJgkrpQRtGPwkeJJIdM=;
	b=sGA4cp3Bw7E1sgkuGhYubY+6HTCPSxWccHRGkwBUkVHtqXkGp0DpFS8SbMJoRr31vzkZ5R
	1hhOyFPyrf/Sjw36ll0hXqnzTFpU4dAd78P6z8Cq8RWGz82SgLC1o0s4dorCJTdBp1lfdC
	OOBPFy9sjS5c3xsPP0Yuv+YBChWiKjMdSAW54sJd5mFFbiNCUlcGde/xv/cH2zOVlSAi1+
	5wYntwmFeoyWV5AGPsW6Yv1iIHT8BWAM1Trwxd1TU2kKA5cbTHwLCJ/NyXgbuh9+1NFwc/
	77dIz9rxL1EzWS0QIOZuWlYXUavIa8qGt8uvQaaVaDrmgWJFU/otlUpIdsv0Wg==
From: Enrico Belleri <kilgore.trout@idesmi.eu>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add ASUS M3402RA into DMI table
Date: Thu,  6 Apr 2023 10:47:55 +0200
Message-Id: <20230406084755.31647-1-kilgore.trout@idesmi.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kilgore.trout@idesmi.eu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X3CUALCPICBCMFRHMJYL7JXYOTPAJ2TQ
X-Message-ID-Hash: X3CUALCPICBCMFRHMJYL7JXYOTPAJ2TQ
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:36 +0000
CC: Enrico Belleri <idesmi@protonmail.com>,
 Enrico Belleri <kilgore.trout@idesmi.eu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3CUALCPICBCMFRHMJYL7JXYOTPAJ2TQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Enrico Belleri <idesmi@protonmail.com>

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


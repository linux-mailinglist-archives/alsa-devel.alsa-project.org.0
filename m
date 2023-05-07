Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4496F955C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:33:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706851884;
	Sun,  7 May 2023 02:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706851884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419598;
	bh=Q2l8J41OyU469PilNyQEOpqfFO7xRFpbCy4X7cgypcQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TGZkmn9a08DAtWrhOJ5mc4nL3urWJA1rvI3Dr3GUlpbtYlRE3eGuYpIPTjUBdoKtu
	 erklRh62+vtJZ+Klo+iFjhGJ+8veJsCrLHl4bORVl4l1pDSUlCE3rs8VzpR/JHRgNo
	 mDC6idskzBIqDkC+zhA4QLVxM8wn0ZORqsbatPAI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F56F80571;
	Sun,  7 May 2023 02:31:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A424EF80578; Sun,  7 May 2023 02:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 790E6F80558
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790E6F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ceEQ9the
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CC8161447;
	Sun,  7 May 2023 00:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2698C433D2;
	Sun,  7 May 2023 00:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419478;
	bh=Q2l8J41OyU469PilNyQEOpqfFO7xRFpbCy4X7cgypcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ceEQ9thejsLBc+KNiikYH8tyYiXHSvy5YzQ3rSDpKVFL6KloKHTsZ5vd1gslrq3hN
	 rRY5KGl+pf+DTjVft+UeYMAWRbzQy2OQvh1bCLEQY+xr4PriYO2HokQEoufOd0od2f
	 UEwxoZlRWyNleXTnx8VVjIRX7oa0/lxmJnUOqld1eB39A4GjFZBR2cVyap+Hl8I+ZX
	 9suKBBPgOLbT0jvSylDV7yobv1/xTSO7K1Tlh5QAJUZHWoceLdIvN7dV63pOfp02y5
	 ccBuFe3WwDp1jNmLvkH9h1s+jSld4SY6NVDwg7fRu/FmeBMNb44OZdNI+FSkYJezs2
	 bYmuXVWPJLhjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 17/24] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to
 quirks list for acp6x
Date: Sat,  6 May 2023 20:30:13 -0400
Message-Id: <20230507003022.4070535-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003022.4070535-1-sashal@kernel.org>
References: <20230507003022.4070535-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33XM2QRR6CYE3KN2VIZ57366YOLC2FRH
X-Message-ID-Hash: 33XM2QRR6CYE3KN2VIZ57366YOLC2FRH
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Baishan Jiang <bjiang400@outlook.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, dukzcry@ya.ru,
 putr4.s@gmail.com, fengwk94@gmail.com, xazrael@hotmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33XM2QRR6CYE3KN2VIZ57366YOLC2FRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Baishan Jiang <bjiang400@outlook.com>

[ Upstream commit a8f5da0bf4d85a6ad03810d902aba61c572102a6 ]

ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same
microphone problem as ThinkBook 14 G4+ ARA.

Adding 21HY to acp6x quirks table enables microphone for ThinkBook
14 G5+ ARP.

Signed-off-by: Baishan Jiang <bjiang400@outlook.com>
Link: https://lore.kernel.org/r/OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1d59163a882ca..b9958e5553674 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -185,6 +185,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2


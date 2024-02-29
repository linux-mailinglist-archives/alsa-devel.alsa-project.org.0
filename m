Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22F86CD7A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 16:50:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBBC3A4B;
	Thu, 29 Feb 2024 16:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBBC3A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709221824;
	bh=qqQqYmeRobIgF1JaLhrO2YJ2mmVBNwvySbsBhS/0UMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fw5HHrHwNAe+EItb1fFgwfUj7CaC8YuljB5hLk3zkox9aa2yKYe7xl950jILj7bln
	 o8z5DsNIdbacPjzhfaZtK0lBvEycPTVcBp8cI7T/oPPIhash28LIlryG+Y6KB2rjy1
	 Czf7wZVXABiwtia4WjGyY4S6NkqEsOdFsuLMsc3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD687F805E1; Thu, 29 Feb 2024 16:49:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C20AF805DA;
	Thu, 29 Feb 2024 16:49:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E071F8024E; Thu, 29 Feb 2024 16:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59D25F805AC
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 16:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D25F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=peBWEtKl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9506601FF;
	Thu, 29 Feb 2024 15:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184E2C433F1;
	Thu, 29 Feb 2024 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709221775;
	bh=qqQqYmeRobIgF1JaLhrO2YJ2mmVBNwvySbsBhS/0UMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=peBWEtKlMGXpHRaqN7Ic0cIY9vCxx/CTdNl8ivm7iRhv8J/FEqMkb7TTkRV7g28Uv
	 H9vIPf+Jx66RcXEfHM6NqPtnEypv8QOJNS1L++1KNl/dniSGd8MsHHs9zeWKMbf8TV
	 JxnrJaWiXjkAi/JZ3mjXRcpLdBcb9KgzELPUde1Hlck6XT+oXGE/QRgHGOrUS7N2LP
	 pCckl9roQn0iUaVDpt4OlIAFpNgN55faL8JDY31yuGH0+y/tVvPUmD2guY8ljcjPrX
	 EugE8tMhi35vPs9Fw+kvDCgZX0OS3J+q6Cb34BT7N4hiGheqBW1EXi27dbpxOwhVoB
	 L4Msz6c6mpQKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Jean-Lo=C3=AFc=20Charroud?= <lagiraudiere+linux@free.fr>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 24/26] ALSA: hda/realtek: cs35l41: Add internal
 speaker support for ASUS UM3402 with missing DSD
Date: Thu, 29 Feb 2024 10:48:43 -0500
Message-ID: <20240229154851.2849367-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229154851.2849367-1-sashal@kernel.org>
References: <20240229154851.2849367-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NNVRK2UXPJGOU5N2BIY6VN556ABHNIFL
X-Message-ID-Hash: NNVRK2UXPJGOU5N2BIY6VN556ABHNIFL
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNVRK2UXPJGOU5N2BIY6VN556ABHNIFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jean-Loïc Charroud <lagiraudiere+linux@free.fr>

[ Upstream commit 706c1fa1ab09f11a131fc4d699ce4c0224b1cb2d ]

Add the values for the missing DSD properties to the cs35l41 config table.

Signed-off-by: Jean-Loïc Charroud <lagiraudiere+linux@free.fr>
Link: https://lore.kernel.org/r/1435594585.650325975.1707867511062.JavaMail.zimbra@free.fr
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 35277ce890a46..ffdff336678cc 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -89,6 +89,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431D1F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431DA2", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "10431E02", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "10431E12", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "10431EE2", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
@@ -423,6 +424,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431D1F", generic_dsd_config },
 	{ "CSC3551", "10431DA2", generic_dsd_config },
 	{ "CSC3551", "10431E02", generic_dsd_config },
+	{ "CSC3551", "10431E12", generic_dsd_config },
 	{ "CSC3551", "10431EE2", generic_dsd_config },
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
-- 
2.43.0


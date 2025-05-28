Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA034ACEB07
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 09:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2077560219;
	Thu,  5 Jun 2025 09:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2077560219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749109437;
	bh=VcMITpVr5gWwvB865s/OTvpGuzUj1bOsEtSF/dD4XZY=;
	h=From:Date:Subject:To:Cc:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JXxObYkqCwGitQkVW9XuKQdzoDKL2e6CLuHP0pe8nqtCo7+oQSEt1QINCSKIUgi2Y
	 9PvTMExxPIy03IlDh6MzpfZ4xMksj8vvABFVvrBoRYbIhx9BOrR6KmC1udabp0THEk
	 54FTWtcoj3g0cMy4Wz3r/4/6/sxFLAHtPcmVhUP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256C0F805E9; Thu,  5 Jun 2025 09:43:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C35AAF805E7;
	Thu,  5 Jun 2025 09:43:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6431F80212; Wed, 28 May 2025 19:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25DD3F800E2
	for <alsa-devel@alsa-project.org>; Wed, 28 May 2025 19:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DD3F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hjYUKwoL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 357FA61F1B;
	Wed, 28 May 2025 17:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5558C4CEE3;
	Wed, 28 May 2025 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748455029;
	bh=VcMITpVr5gWwvB865s/OTvpGuzUj1bOsEtSF/dD4XZY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hjYUKwoLJ0SCGq7IOOtEC3HIsb7/6992uKIsixcRsoF9+TXNNvivw6YDE540ZNLDK
	 NMWFrW6RQfLzJVPyA6CyQD1r6RDPD0toM2Ema4cJoAU/dWCVS+n4DvpOcIbkFDlwN3
	 HcRtz+3MyTZM/qjeXBLhJjX74PIK35tUp6tYKJolCQsiy9eIfsfqrZUWUb4msn8Xgq
	 zHYBknm4gjEIp0e0q+Y5SXZCb26a3Q0ragUQS/cDptrmcbBaAXjAbmGgcAmzGDNwh/
	 dyQDl4NRlmES5ulplAUroYpF9XXvtAQ0nHjvs8w40GrbOKzZNIGoingiY225GNV9VK
	 m77psZn0ZYNHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D2CC3ABB2;
	Wed, 28 May 2025 17:57:09 +0000 (UTC)
From: meowmeowbeanz via B4 Relay <devnull+meowmeowbeanz.gmx.com@kernel.org>
Date: Wed, 28 May 2025 10:56:58 -0700
Subject: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-yoga-7-16arp8-microphone-fix-v1-1-bfeed2ecd0c2@gmx.com>
X-B4-Tracking: v=1; b=H4sIAGlON2gC/x3MTQqAIBBA4avIrBsw+6WrRAvRqWaRyghRRHdPW
 n5v8R7IJEwZJvWA0MmZYyioKwVut2EjZF8MRptOd2bEO24WB6x7K2nEg53EtMdAuPKFpAfv2r5
 tSBsoiyRU8r+fl/f9AJXfnF1uAAAA
X-Change-ID: 20250528-yoga-7-16arp8-microphone-fix-e07dc4643e02
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, alsa-devel@alsa-project.org,
 meowmeowbeanz <meowmeowbeanz@gmx.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748455029; l=1199;
 i=meowmeowbeanz@gmx.com; s=20250528; h=from:subject:message-id;
 bh=pwC5yCZaXPRUyPuizllISjCOfre1eAHhzXvSoc3WKtk=;
 b=JdOuKTlrwAqDQaZnvlonVdIhlTPvxaOs7dr5et2hG5rqVyEKcXes5mNivLjLvz99mNAPqMp06
 KB/7zo6ufxxBiPBOsw3yUubthEW1aCB2WNPc+VfsoGaaUcvddWrzXJn
X-Developer-Key: i=meowmeowbeanz@gmx.com; a=ed25519;
 pk=gUBt2QAUfouneGh4/++G7dhBBU8WNcaw4woqB/QUV5M=
X-Endpoint-Received: by B4 Relay for meowmeowbeanz@gmx.com/20250528 with
 auth_id=415
X-Original-From: meowmeowbeanz <meowmeowbeanz@gmx.com>
X-MailFrom: devnull+meowmeowbeanz.gmx.com@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K3AB7CFXQBFL7TFVWV6SFKJUY7WISI5M
X-Message-ID-Hash: K3AB7CFXQBFL7TFVWV6SFKJUY7WISI5M
X-Mailman-Approved-At: Thu, 05 Jun 2025 07:43:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: meowmeowbeanz@gmx.com
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3AB7CFXQBFL7TFVWV6SFKJUY7WISI5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: meowmeowbeanz <meowmeowbeanz@gmx.com>

Add DMI quirk entry for Lenovo Yoga 7 16ARP8 (83BS) to enable
digital microphone support via ACP driver.

Fixes microphone detection on this specific model which was
previously falling back to non-functional generic audio paths.

Tested-by: meowmeowbeanz <meowmeowbeanz@gmx.com>
Signed-off-by: meowmeowbeanz <meowmeowbeanz@gmx.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3d9da93d22ee84914a92cfdc1de7b977dfd3bfa4..7e62445e02c1d0632f5f5e35cf97265f42829ba0 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83BS"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

---
base-commit: 76f8d35964e4de1b464de22e4f3fdc14937ed854
change-id: 20250528-yoga-7-16arp8-microphone-fix-e07dc4643e02

Best regards,
-- 
meowmeowbeanz <meowmeowbeanz@gmx.com>



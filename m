Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D0C474E3
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1423601C7;
	Mon, 10 Nov 2025 15:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1423601C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785931;
	bh=KAlbMy49hkms1Al+qR8sVuuf/ndsc9PyiN4dXJi+Mlo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=taqWR4fzFPiSnLjp4FDCvLN0bz3rvO1JhyTYSbrgQ4yb8SRhnDjaJP0bT5nZomJYW
	 gzdOLCrlydJa/+Owg5zGDPjJsoLHtrTQiGpyhHOw6xavGi2ykc074i3zXKDHCkxSve
	 BR8bfkVFiCiriugVRjtGbQ5RUW8c78HnZze1aH/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88DC8F80CC4; Mon, 10 Nov 2025 15:41:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84962F89612;
	Mon, 10 Nov 2025 15:41:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28D7BF80301; Sun, 14 Sep 2025 00:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,T_SPF_HELO_PERMERROR shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.inboxia.org (mail.inboxia.org [95.217.72.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06CB1F80162
	for <alsa-devel@alsa-project.org>; Sun, 14 Sep 2025 00:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06CB1F80162
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inboxia.org header.i=@inboxia.org header.a=rsa-sha256
 header.s=dkim header.b=ejVdlobP
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7CA9E6166713;
	Sat, 13 Sep 2025 22:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inboxia.org; s=dkim;
	t=1757802974; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=dg58pqC1a3dSXa+6eFNI1bKCrcYCFjCJ/ft1V528zas=;
	b=ejVdlobPsr+nkO/vflXoIUwqMlGMHaOAn2Z7mDMcIzJE/CimtrmDyckaktJnSekb7XYLy5
	XxbZpbPyYCArOm46ws/vFqLeCr4419Ir1jyhv66IynDFNsR8OivXyv5QhNLnxkR5Q+RiNL
	W4u1T75XQYYo0xRFlLF6nQ+aZxoOcjbbuO9IAjGrg5CODQC3u/gORgtOKO+eJMxzjnmoxU
	hwUKmNOiTYFzckVElZAzNDHVWR3SNLZ1ZP1jpk98zBg6hqsJNN5TrGgB1gAkQJ0HvrnyQ0
	Zxz+1RMMcSSBCCNvbUwX8I8/cDNEJrenZY/6jtWZ2xXq64RLo9ZNmbKYyx/TBw==
From: Bou-Saan Che <yungmeat@inboxia.org>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Bou-Saan Che <yungmeat@inboxia.org>
Subject: [PATCH 1/2] ALSA: hda: cs35l41: Support Lenovo Thinkbook 13x Gen 5
Date: Sun, 14 Sep 2025 01:35:57 +0300
Message-ID: <20250913223557.9116-1-yungmeat@inboxia.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: yungmeat@inboxia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5TQQDOSHO3B43ORIGI46JM4BFGO4U2KR
X-Message-ID-Hash: 5TQQDOSHO3B43ORIGI46JM4BFGO4U2KR
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TQQDOSHO3B43ORIGI46JM4BFGO4U2KR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This laptop does not contain _DSD so needs to be supported using the
configuration table.

Signed-off-by: Bou-Saan Che <yungmeat@inboxia.org>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index d8249d997c2a..16d5ea77192f 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -135,6 +135,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "17AA38C8", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
 	{ "17AA38F9", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA38FA", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
+	{ "17AA3929", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
+	{ "17AA392B", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
 	{}
 };
 
@@ -558,6 +560,8 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "17AA38C8", generic_dsd_config },
 	{ "CSC3551", "17AA38F9", generic_dsd_config },
 	{ "CSC3551", "17AA38FA", generic_dsd_config },
+	{ "CSC3551", "17AA3929", generic_dsd_config },
+	{ "CSC3551", "17AA392B", generic_dsd_config },
 	{}
 };
 
-- 
2.51.0


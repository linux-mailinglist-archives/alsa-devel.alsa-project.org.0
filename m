Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956AC894C74
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78DA2D3B;
	Tue,  2 Apr 2024 09:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78DA2D3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712042149;
	bh=GZJ0qHPwhhIYdtdZ/yXQI/beI8+GkNE90kSPhqbSSQQ=;
	h=From:Date:Subject:To:Cc:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WX1F3lOgaM37/p/I9948wYDK/UUbJ+ggdTyPQotXwTAqqataHwKOvAPjgzJ1nv2pt
	 AxYGH6vTLNwaMmMZIgQYHHzUow8o/MfaWRCYRchQb7UJYCOGM3c20I3/DRufmNpmhl
	 C63XUGxmfsslklAFaLxQgvIf4QvLon1FULe4GYO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30E71F89C65; Tue,  2 Apr 2024 08:57:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95D51F89C59;
	Tue,  2 Apr 2024 08:57:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFC3FF80236; Mon,  1 Apr 2024 16:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EE00F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 16:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EE00F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cl3a4PFy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3592A60C5F;
	Mon,  1 Apr 2024 14:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9970C433C7;
	Mon,  1 Apr 2024 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711981912;
	bh=GZJ0qHPwhhIYdtdZ/yXQI/beI8+GkNE90kSPhqbSSQQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cl3a4PFy9rmvwyZfAgOdn+b8rU3y/xg5TOSBKtZ7unfD/DmGRn6bDLXCdIsEFhAXK
	 2vBa0KbHLazy/ACncf6MPcfswdSwlgEyi+9+MecUuRkqc/73xlU2cGJiMcmpo6kQyj
	 UkySuiN4i5CcMpFLNTsoRs5n0EtzoQdlYhSmBocsRTJbjzI0bv2dRcf8FYNbnyrF1e
	 2RZgAiaqk+jzdRQZUVUmk3WWeCfa7+aK2jRw8zSffXhfLJClQdOrsIY3FmUGrza6gP
	 2GMC/q5G2pq31VPz48Oi7TVGHid/TmhWQfHaGJRR/8miN4WVf00l2ZJ5gbsx7LmWqf
	 AJxr7SEdCCJyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB401CD1292;
	Mon,  1 Apr 2024 14:31:52 +0000 (UTC)
From: Daniel Berlin via B4 Relay <devnull+dberlin.dberlin.org@kernel.org>
Date: Mon, 01 Apr 2024 10:31:30 -0400
Subject: [PATCH] Add support for 2024 ROG Strix G634JZR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-add-rog-strix-16-g634jzr-v1-1-ac396095409e@dberlin.org>
X-B4-Tracking: v=1; b=H4sIAEHFCmYC/x3MQQ5AMBBA0avIrE3SVkm4ilhUO2oskKmIEHfXW
 L7F/w8kEqYEXfGA0MmJtzVDlwX42a2RkEM2GGWsskqjCwFli5gO4Qt1g7Gp7HILtlTbVnkXvBk
 h57vQxNe/7of3/QAvzIPVagAAAA==
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Berlin <dberlin@dberlin.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711981912; l=1959;
 i=dberlin@dberlin.org; s=20231103; h=from:subject:message-id;
 bh=OkAb0mgem2LTUaEtI3QpWVORvUHuRQ4HTHDw+7mTmOo=;
 b=YVpBuS/DPGPSMIvGvxBHJw3haqM0JyxXizPd9bNmgUQrCczpAtLBPuXOb2U+cilk8c/JMCLHZ
 djiMPPPiofUCumZT2HN3Y3EM2dPYqLVSXN41TPEjDEE0IspYGoyAv1W
X-Developer-Key: i=dberlin@dberlin.org; a=ed25519;
 pk=cy2fotxgi42vqBilzDOe7Wq2+TsfMspPwg7pfE9Te+M=
X-Endpoint-Received: by B4 Relay for dberlin@dberlin.org/20231103 with
 auth_id=96
X-Original-From: Daniel Berlin <dberlin@dberlin.org>
X-MailFrom: devnull+dberlin.dberlin.org@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OBEOP7565E3M66QEUGQXQLCWMG46NSCN
X-Message-ID-Hash: OBEOP7565E3M66QEUGQXQLCWMG46NSCN
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: dberlin@dberlin.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBEOP7565E3M66QEUGQXQLCWMG46NSCN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Berlin <dberlin@dberlin.org>

The windows driver inf says it uses the exact same tunings and setup as the
older G634, and then reuses the data for ID 1043:1CAF.

We do the same here.
Tested on an actual laptop, sound works fine with this patch plus
default fallback firmware.

Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 72ec872afb8d..25c117db3317 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -108,6 +108,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "10433A60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA38AB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
@@ -496,6 +497,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
+	{ "CSC3551", "10433A60", generic_dsd_config },
 	{ "CSC3551", "17AA386F", generic_dsd_config },
 	{ "CSC3551", "17AA38A9", generic_dsd_config },
 	{ "CSC3551", "17AA38AB", generic_dsd_config },

---
base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
change-id: 20240401-add-rog-strix-16-g634jzr-9e5490cadc2b

Best regards,
-- 
Daniel Berlin <dberlin@dberlin.org>



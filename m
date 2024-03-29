Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B58919E1
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9582CA6;
	Fri, 29 Mar 2024 13:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9582CA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711716536;
	bh=24ZfbhX4pI7+/FQ2TTtmh8cVzbSFP7TYidogpYLdsoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pCXFyd2BMtwAEKdxK872EcsgjxhcVrVCUhvdvg05tIC3EtRumI5k4Os9gZZyUW4fy
	 CF7NsX7f6hqDr+KdOlQx6E2vju3/JBa4jDD6sIsxCz1t+pg4SFdfBY1w9s1cU8J8ba
	 vk5j281b/yWkf2geRBP8J5hGFUd89vauRVCRa1MY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BB8DF805AB; Fri, 29 Mar 2024 13:48:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC84BF805A1;
	Fri, 29 Mar 2024 13:48:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E9EF8025F; Fri, 29 Mar 2024 13:48:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA1EF80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:48:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA1EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cKasXNMv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CBA28CE2F8B;
	Fri, 29 Mar 2024 12:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26C8C433F1;
	Fri, 29 Mar 2024 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716494;
	bh=24ZfbhX4pI7+/FQ2TTtmh8cVzbSFP7TYidogpYLdsoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKasXNMvd2fi9ZFinhLwPB+8oMkPSed3RdqKp3YVn09CFXZnm4CKrKarGTHA/5Cvf
	 nXEB/Se5K58G4wj7FazzU3OETHBOw4lI57lFApQtcdmx9tW809VwtLQuAfKBALSunX
	 enYLqbF3F2RmkyWJC5kycvgCPRJpkBwb067VjivVJCcbLbDc1cewYEJiFvpQOT0yXe
	 yInUn+qcq7cyWUYCoR8z8dDAMl9BiSbGp3G3EbGMpqqK1y84fv5YEh4EakG0tQ6ABt
	 Fcd8ue8ihX+OslvLb7edYySAjMe+8w5kZ9+qcswRuxCRyrTU5sT3OmrMwXMzioT3kz
	 +H2/Ij9pEyi5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	clemens@ladisch.de,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 13/34] ALSA: firewire-lib: handle quirk to
 calculate payload quadlets as data block counter
Date: Fri, 29 Mar 2024 08:47:14 -0400
Message-ID: <20240329124750.3092394-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124750.3092394-1-sashal@kernel.org>
References: <20240329124750.3092394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.153
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P3HGH7ARZ3T4TLCT2WQTKWPJEEDFZAJJ
X-Message-ID-Hash: P3HGH7ARZ3T4TLCT2WQTKWPJEEDFZAJJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3HGH7ARZ3T4TLCT2WQTKWPJEEDFZAJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit 4a486439d2ca85752c46711f373b6ddc107bb35d ]

Miglia Harmony Audio (OXFW970) has a quirk to put the number of
accumulated quadlets in CIP payload into the dbc field of CIP header.

This commit handles the quirk in the packet processing layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20240218074128.95210-4-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/amdtp-stream.c | 12 ++++++++----
 sound/firewire/amdtp-stream.h |  4 ++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f8b644cb9157a..8753125683692 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -771,10 +771,14 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 	} else {
 		unsigned int dbc_interval;
 
-		if (*data_blocks > 0 && s->ctx_data.tx.dbc_interval > 0)
-			dbc_interval = s->ctx_data.tx.dbc_interval;
-		else
-			dbc_interval = *data_blocks;
+		if (!(s->flags & CIP_DBC_IS_PAYLOAD_QUADLETS)) {
+			if (*data_blocks > 0 && s->ctx_data.tx.dbc_interval > 0)
+				dbc_interval = s->ctx_data.tx.dbc_interval;
+			else
+				dbc_interval = *data_blocks;
+		} else {
+			dbc_interval = payload_length / sizeof(__be32);
+		}
 
 		lost = dbc != ((*data_block_counter + dbc_interval) & 0xff);
 	}
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 1f957c946c956..cf9ab347277f2 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -37,6 +37,9 @@
  *	the value of current SYT_INTERVAL; e.g. initial value is not zero.
  * @CIP_UNAWARE_SYT: For outgoing packet, the value in SYT field of CIP is 0xffff.
  *	For incoming packet, the value in SYT field of CIP is not handled.
+ * @CIP_DBC_IS_PAYLOAD_QUADLETS: Available for incoming packet, and only effective with
+ *	CIP_DBC_IS_END_EVENT flag. The value of dbc field is the number of accumulated quadlets
+ *	in CIP payload, instead of the number of accumulated data blocks.
  */
 enum cip_flags {
 	CIP_NONBLOCKING		= 0x00,
@@ -51,6 +54,7 @@ enum cip_flags {
 	CIP_NO_HEADER		= 0x100,
 	CIP_UNALIGHED_DBC	= 0x200,
 	CIP_UNAWARE_SYT		= 0x400,
+	CIP_DBC_IS_PAYLOAD_QUADLETS = 0x800,
 };
 
 /**
-- 
2.43.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA858919C4
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:47:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD102CB2;
	Fri, 29 Mar 2024 13:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD102CB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711716449;
	bh=24ZfbhX4pI7+/FQ2TTtmh8cVzbSFP7TYidogpYLdsoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dzSteFW/VNYyFwKDL6Ai040E7eFQM1Hlj3azgVl9UAbmGyfejJarwgDCmCznNLqeJ
	 sf99VcptFU4ONuNYryWX+wsxF9K5UrjR6ovGWq55VmzAeEzl/Tfof3j5h4UdUBJpv6
	 2QilszTMXl4NdqqQT6md676vcha41OZ8PaFw7rt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9173BF805C9; Fri, 29 Mar 2024 13:46:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A53F805C6;
	Fri, 29 Mar 2024 13:46:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 978C6F80564; Fri, 29 Mar 2024 13:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A26F5F801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A26F5F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u05kSsP3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0E836190D;
	Fri, 29 Mar 2024 12:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898B5C433C7;
	Fri, 29 Mar 2024 12:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716402;
	bh=24ZfbhX4pI7+/FQ2TTtmh8cVzbSFP7TYidogpYLdsoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u05kSsP3XMmwAi1gOWmybowXYvNJ79q/0IOKGS6W97PHtwqx6BE+fLZ2P0kKeX4pR
	 6C2tJC4jLuB496GBRnUtENZKaPS8aYQzkd24ecWqn8n0cQb46050z6AfrbufwMZ6LB
	 1pNbcbgyrmeEiC1iPlyMjjJL6bA4pNulIE1GyjwB7LvJr9o6N+OvWTQipTfCtRJpGj
	 1DtD+JmoxnMa15dFbs+xILH+B5IZ8GSdj5LAPhGZveUuxV5M2DwDvQG5dOs0g12Xdb
	 cEK7OQTJnWgMpUrMl1LkTRRAsULIEqYD388mx7xUEy2YM84lqOKURJEPBlH2Q6D/X3
	 9AyoEX13qCpTg==
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
Subject: [PATCH AUTOSEL 6.1 20/52] ALSA: firewire-lib: handle quirk to
 calculate payload quadlets as data block counter
Date: Fri, 29 Mar 2024 08:45:14 -0400
Message-ID: <20240329124605.3091273-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124605.3091273-1-sashal@kernel.org>
References: <20240329124605.3091273-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.83
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L4WC4XARAQZ23ZZYKYEYF6FEOFKFEWVB
X-Message-ID-Hash: L4WC4XARAQZ23ZZYKYEYF6FEOFKFEWVB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4WC4XARAQZ23ZZYKYEYF6FEOFKFEWVB/>
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


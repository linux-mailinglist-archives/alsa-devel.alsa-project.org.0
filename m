Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B185954D
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 08:50:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401AA9F6;
	Sun, 18 Feb 2024 08:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401AA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708242652;
	bh=a2736GuvevjxKu2DugmT3osmAD4m8ekkFwJXyTibR1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OYEUE2qVDLpah4d+nWspVXG+Iwz6Pvs8/fLSKD+PKm9/cTJA9LNg7YwSOtAQlGOXj
	 +jDfu1Mxb8ksGFL/rc9PK7S4NGVZh2MyKL8UsAKjdkVs8PEIRWmpF3aY4DjoXrD3OW
	 izl8HCSxA3aATsVZenPvHW/TG21Vf19ZxHztZF8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8363BF805B1; Sun, 18 Feb 2024 08:50:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF52F805A0;
	Sun, 18 Feb 2024 08:50:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 350F0F80496; Sun, 18 Feb 2024 08:44:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD6FEF80496
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 08:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD6FEF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=Yz+aFdrn;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=W8WwA7kQ
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D0C15C0070;
	Sun, 18 Feb 2024 02:41:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 18 Feb 2024 02:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1708242099; x=
	1708328499; bh=q2s75MGjAW5JOX5jbhZdViqawKA/HJYPnRCN4QVm5Yc=; b=Y
	z+aFdrnnEUM8bKJVfgzVLB9+tmP8xrnje8TlEkUIeSWB4idHMmINQjFxpTnHIDaU
	WoTWMm6YK0Da4QDBqdksgxos7h7UoEAdFjJWmil6/8sq1khKOkVxJ32bDmpFrNUi
	Kv1R7vdX5CFLjfnbfN4aas821JB5Onj+/3z7zlQVcPdJOgXoLoWx8DBe38LbWrMs
	oTh69pxqKnsHC08Ps5y6A03GAw46d61wKWbW8OyR7tBxLGedLk5VTaqVSYWAVIf9
	7oXYFCnwwoqppckyPnDbCFL8KwLSdJ6Ux8GMJalzrxEcIjjqQ5McsLo9bU6A8VG0
	mzIvBqjogufTNO6waYcLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708242099; x=
	1708328499; bh=q2s75MGjAW5JOX5jbhZdViqawKA/HJYPnRCN4QVm5Yc=; b=W
	8WwA7kQj2JLbRSf2hsLWttYd+4sK/P2/Gxv21TWukJzHnMlEYLbhpwxiJdXBxwXl
	fwZ/IVG9oYrmXbGWgVlUqGiZbynQFpMOqS+m4byM7HzoDOxIew4AQzAouKk/PhIl
	g57wW2eBg6al7wovGng7NMyGgrthu4zWkUlHX7gwkFLAL7eJzt9yAohCf3K/Au76
	k220x1w0TqdoV8Reh3CA8Nd6JnqB2OCerOiCyrh8jNoc0U8LxaavSMfG2YKckX8k
	H37nPubwsTVoK98Hl2Ylxb/LkF3uEgf1mWfXGuyZcWT8RuJTxxjLseh7175CH8Th
	+Yrj/yV5jm8N8PV5aLyBg==
X-ME-Sender: <xms:s7TRZWR8cdvKWp4TEGHmNPtIxEj0PNpIhpBEi4VzOyKc7Hg3Lg4qEQ>
    <xme:s7TRZbzqORGY9zBkgWgvWFM1Mdqs1o-KCQ9KF7BrCKZZE-pToTjuO0Q2sUDqy5ijX
    i5abJNFrIqgXBqVyB8>
X-ME-Received: 
 <xmr:s7TRZT0yPsPF69Yky5K5KBFPR7OviHPUf9hbRySly8f9tYU0Tg15rLY1aF3E4lA5HhCsq07GFnj7zybxFYRdg_B6h3fG14KyN00d7w4A90AX>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:s7TRZSCevX0ja_qVcGUO0C6Pv1nFX--JYoUwKUsAA_U9PviXdAUX8A>
    <xmx:s7TRZfjXkKc2upoH31PfcYpoWAHg4uyV5_uLdvloZE3IX03W1Tk-1w>
    <xmx:s7TRZepgOySo4kEw8-1OaPZJ47v6V07u8vBqmJWYusTGp3JLfdCOGA>
    <xmx:s7TRZfJ5VhrsFpgwbVMEm4Gq2_d6YKyi5BneaU64bzD_Kx41Y2kE2g>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Feb 2024 02:41:38 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: firewire-lib: handle quirk to calculate payload
 quadlets as data block counter
Date: Sun, 18 Feb 2024 16:41:27 +0900
Message-Id: <20240218074128.95210-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
References: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 66JL433DMJQFPVDK4NZ2X4KHWYGCGJUO
X-Message-ID-Hash: 66JL433DMJQFPVDK4NZ2X4KHWYGCGJUO
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66JL433DMJQFPVDK4NZ2X4KHWYGCGJUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Miglia Harmony Audio (OXFW970) has a quirk to put the number of
accumulated quadlets in CIP payload into the dbc field of CIP header.

This commit handles the quirk in the packet processing layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 12 ++++++++----
 sound/firewire/amdtp-stream.h |  4 ++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index a13c0b408aad..9d5a025d2e96 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -773,10 +773,14 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
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
index b7ff44751ab9..a1ed2e80f91a 100644
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
2.40.1


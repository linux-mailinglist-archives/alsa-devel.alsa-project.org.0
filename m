Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558531D9521
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFBC31742;
	Tue, 19 May 2020 13:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFBC31742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887223;
	bh=5qD/bY9YJ/JrPmYgg2Ml/mFCseCo5xFfkQuFuZ0r3lA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7vWlmfjAgBnnKHfAFGQtAG9YMKK5GMtORiTFIULjWZYiO327kBvJncA93av90t7Q
	 h2alXXTvhoYXxWzbIGpe63xOaosBjL6gHlEMqX0L7J7ngw8lXemyvtPEgp5VFPDV+n
	 xQE7OQHrU8RLtKEL8RLW9esJ0LoRmceRXpZs5NI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55128F80229;
	Tue, 19 May 2020 13:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254B4F80299; Tue, 19 May 2020 13:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A394F80161
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A394F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qIv6iCBh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2qbS/r9K"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 70FAF5C0074;
 Tue, 19 May 2020 07:16:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3B9HKdY/hS3Hd
 jAi0IFmVKqwVKz9pVBcQZDcxKXTB3U=; b=qIv6iCBhgZNLZuFX0IcCS09y+uZEq
 ok2W/dK4chxK3BXd/kPwOeNPKMfYKnSRt/hf61XY1iFRc2H1i39V04MMgg0WsCl2
 IGPiQae2VvlQ+q3Ajps8qTT2tbVbffNWxJ3tMdh9+/QqwuQWhrw0jK5RC1MT/Lav
 Y3XoOU/vT3v2SmKmAC0Z9Aq48atizby1LnNjMt1tFWDhUbhJuAmFDybWhpgaXU4U
 ra1MCYRQUhe2t+/ybCDM+iuWQPSZRCIJBrZssQiQTphYOD/bBcZtKlg1oYQWnj3G
 02iTsjhlfwsacfRdLPQCakKGXFbNjcfCzlrEs/OZ+dGEz25i/OigAP0YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3B9HKdY/hS3HdjAi0IFmVKqwVKz9pVBcQZDcxKXTB3U=; b=2qbS/r9K
 IcQq4mE66Ea6fmVGBl2+5eYtMXoKSr03/M1JTmGmAiWCHYQYXAFUp8VTSJKgwZzg
 wV/JTB3s49cJQrFVILEdWlszyGDpJdAUm/VaLnR9KXSTvHx7/PsBxP3bC9pULK4u
 WQ+n5PphsxcwbnlGauLwb2+H84SH3fIfzLDApF8geAkTrew/Pvnt7v9nfRKXPIp1
 iNmErfb9eUq+AO4nxcGdGpSeAiGySoueiubBKkQuANNSVradDZXY/KrfNY9wvcjo
 8MygPfqLY2KqZHlNSgV6RFAPyCq5WxaxXgtsjE6kv9h1Ixr9MqfxI/6IU6jjM7gf
 d5ikNZ6VRKzneA==
X-ME-Sender: <xms:I8DDXsWefOwyErKX27brwy1F56djBsG-smyhbbX1BIjx-2FfpinvkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:I8DDXgm0RiOW73eDn0CbfNDUyV85w1dM6w-_xZg0N-ZYVk9dgZczNw>
 <xmx:I8DDXgYWh0hR1XW1_rR-pO5lwyjihweOk1xS2iZbBQYO34obLc0AbQ>
 <xmx:I8DDXrUwuQWMj_yoBzQLkJtUDCNhsjsoVHm6hVr7MJ5TESxLscCwxg>
 <xmx:I8DDXgT__4FgJwePrwoyx5wdoxVRaAh2RccY5FLAqkZup2-rkR5g4Q>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 329AE328005E;
 Tue, 19 May 2020 07:16:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 03/14] ALSA: firewire-motu: localize protocol data
Date: Tue, 19 May 2020 20:16:30 +0900
Message-Id: <20200519111641.123211-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
References: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit adds enumerations of protocol version to localize protocol
data.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c       |  7 ++++---
 sound/firewire/motu/motu-protocol-v2.c |  6 +++++-
 sound/firewire/motu/motu-protocol-v3.c |  5 ++++-
 sound/firewire/motu/motu-stream.c      |  2 +-
 sound/firewire/motu/motu.h             | 11 +++++++----
 5 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 0fd36e469ad0..17c9ea8eb4c8 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -440,7 +440,7 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
-		    const struct snd_motu_protocol *const protocol)
+		    const struct snd_motu_spec *spec)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 	int fmt = CIP_FMT_MOTU;
@@ -454,14 +454,15 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		 * Units of version 3 transmits packets with invalid CIP header
 		 * against IEC 61883-1.
 		 */
-		if (protocol == &snd_motu_protocol_v3) {
+		if (spec->protocol_version == SND_MOTU_PROTOCOL_V3) {
 			flags |= CIP_WRONG_DBS |
 				 CIP_SKIP_DBC_ZERO_CHECK |
 				 CIP_HEADER_WITHOUT_EOH;
 			fmt = CIP_FMT_MOTU_TX_V3;
 		}
 
-		if (protocol == &snd_motu_protocol_v2) {
+		if (spec == &snd_motu_spec_8pre ||
+		    spec == &snd_motu_spec_ultralite) {
 			// 8pre has some quirks.
 			flags |= CIP_WRONG_DBS |
 				 CIP_SKIP_DBC_ZERO_CHECK;
diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index ed71c08e5942..2cd710a7c792 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -293,7 +293,7 @@ static int v2_cache_packet_formats(struct snd_motu *motu)
 	return 0;
 }
 
-const struct snd_motu_protocol snd_motu_protocol_v2 = {
+static const struct snd_motu_protocol snd_motu_protocol_v2 = {
 	.get_clock_rate		= v2_get_clock_rate,
 	.set_clock_rate		= v2_set_clock_rate,
 	.get_clock_source	= v2_get_clock_source,
@@ -303,6 +303,7 @@ const struct snd_motu_protocol snd_motu_protocol_v2 = {
 
 const struct snd_motu_spec snd_motu_spec_828mk2 = {
 	.name = "828mk2",
+	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.protocol = &snd_motu_protocol_v2,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
@@ -319,6 +320,7 @@ const struct snd_motu_spec snd_motu_spec_828mk2 = {
 const struct snd_motu_spec snd_motu_spec_traveler = {
 	.name = "Traveler",
 	.protocol = &snd_motu_protocol_v2,
+	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
 		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
@@ -333,6 +335,7 @@ const struct snd_motu_spec snd_motu_spec_traveler = {
 
 const struct snd_motu_spec snd_motu_spec_ultralite = {
 	.name = "UltraLite",
+	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.protocol = &snd_motu_protocol_v2,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK | // padding.
@@ -346,6 +349,7 @@ const struct snd_motu_spec snd_motu_spec_ultralite = {
 
 const struct snd_motu_spec snd_motu_spec_8pre = {
 	.name = "8pre",
+	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.protocol = &snd_motu_protocol_v2,
 	// In tx, use coax chunks for mix-return 1/2. In rx, use coax chunks for
 	// dummy 1/2.
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 947fab7905fe..548c97752cb8 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -307,7 +307,7 @@ static int v3_cache_packet_formats(struct snd_motu *motu)
 	return 0;
 }
 
-const struct snd_motu_protocol snd_motu_protocol_v3 = {
+static const struct snd_motu_protocol snd_motu_protocol_v3 = {
 	.get_clock_rate		= v3_get_clock_rate,
 	.set_clock_rate		= v3_set_clock_rate,
 	.get_clock_source	= v3_get_clock_source,
@@ -317,6 +317,7 @@ const struct snd_motu_protocol snd_motu_protocol_v3 = {
 
 const struct snd_motu_spec snd_motu_spec_828mk3 = {
 	.name = "828mk3",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.protocol = &snd_motu_protocol_v3,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
@@ -335,6 +336,7 @@ const struct snd_motu_spec snd_motu_spec_828mk3 = {
 
 const struct snd_motu_spec snd_motu_spec_audio_express = {
 	.name = "AudioExpress",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.protocol = &snd_motu_protocol_v3,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
@@ -348,6 +350,7 @@ const struct snd_motu_spec snd_motu_spec_audio_express = {
 
 const struct snd_motu_spec snd_motu_spec_4pre = {
 	.name = "4pre",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.protocol = &snd_motu_protocol_v3,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index a17ddceb1bec..11a2b8b37768 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -317,7 +317,7 @@ static int init_stream(struct snd_motu *motu, struct amdtp_stream *s)
 	if (err < 0)
 		return err;
 
-	err = amdtp_motu_init(s, motu->unit, dir, motu->spec->protocol);
+	err = amdtp_motu_init(s, motu->unit, dir, motu->spec);
 	if (err < 0)
 		fw_iso_resources_destroy(resources);
 
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 7774c23f1637..9db692006d95 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -108,6 +108,11 @@ enum snd_motu_clock_source {
 	SND_MOTU_CLOCK_SOURCE_UNKNOWN,
 };
 
+enum snd_motu_protocol_version {
+	SND_MOTU_PROTOCOL_V2,
+	SND_MOTU_PROTOCOL_V3,
+};
+
 struct snd_motu_protocol {
 	int (*get_clock_rate)(struct snd_motu *motu, unsigned int *rate);
 	int (*set_clock_rate)(struct snd_motu *motu, unsigned int rate);
@@ -119,6 +124,7 @@ struct snd_motu_protocol {
 
 struct snd_motu_spec {
 	const char *const name;
+	enum snd_motu_protocol_version protocol_version;
 	enum snd_motu_spec_flags flags;
 
 	unsigned char analog_in_ports;
@@ -127,9 +133,6 @@ struct snd_motu_spec {
 	const struct snd_motu_protocol *const protocol;
 };
 
-extern const struct snd_motu_protocol snd_motu_protocol_v2;
-extern const struct snd_motu_protocol snd_motu_protocol_v3;
-
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
 extern const struct snd_motu_spec snd_motu_spec_traveler;
 extern const struct snd_motu_spec snd_motu_spec_ultralite;
@@ -141,7 +144,7 @@ extern const struct snd_motu_spec snd_motu_spec_4pre;
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
-		    const struct snd_motu_protocol *const protocol);
+		    const struct snd_motu_spec *spec);
 int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 			      unsigned int midi_ports,
 			      struct snd_motu_packet_format *formats);
-- 
2.25.1


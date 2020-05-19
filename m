Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E11D9535
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:23:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25241715;
	Tue, 19 May 2020 13:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25241715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887433;
	bh=/YjFibRGsfp7m65HeklPmVpDJMbm/uoJZevC8VLhQN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdV9gaY9zCNxhBB9fXnsVPv/e6siVLPdwvBG4HTMY+dE1ZHXv+kIF8Pymsgkphqdb
	 sd45LActG05SQ/FsfDpCUDyFQwCA/9nZtb9soZtpohodAr+AXXtmJ6rLI3JsA5h/Kr
	 TJW+eueYiPLnzqyjGI5ikKwwXWWj9SGVaJtrocSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A38F80303;
	Tue, 19 May 2020 13:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 785E0F8028F; Tue, 19 May 2020 13:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF4EBF80229
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF4EBF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FF7/scM1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JsOkPsyy"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EC3BD5C0116;
 Tue, 19 May 2020 07:16:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=or9GvClY+OjS/
 zDehrxaO4uPkfBLR8YBmsa/ccJBc28=; b=FF7/scM1+JgOO4Br/LbyJ+lUIHhYV
 o2CYUTA4TelDnP/tHqRgMzsPJyezxlA8riwbvbb+O2UoV6fagAjlEWgrKMzARxbD
 QyBh8ewgG7Ln67M7EHg6/wwdj3BRLFEoi5g4h7e5bPRpS58e3neJNR3zSkRQaGG7
 baZBcb7LpVqAqny/IL7OmaXL/VbGE8p0bIQszEH5MLuYWWnDAoRH+sKrfG3ejpNb
 m8MOng+g0gtyZjJ5aJI7i4EsRqZ9TFiIDhTizf0TY7yUsBjhbOyV4sz6kLOz7ppC
 pYZPTzc7EUXbaf1sHCpToCwiDalVXnHSpm/XNfDdEcrDsHPNYwWVz4wQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=or9GvClY+OjS/zDehrxaO4uPkfBLR8YBmsa/ccJBc28=; b=JsOkPsyy
 jKutpyUPHXdUuoLJ5qft0yojaW8oTH3YAhCbWfNlD6xcn4tqnIhkakqfIavgLgI4
 ObOZ4M2E++grqSMeuQm0BmRR9WR9p9Bx7Gvvwgy5MPNp7/pn0ONLbyf4/OK3koYH
 6P/t1nfQl4sQZeTTPp5OlOoUTVgxh1KDLITl2zTmo5CqCJTVxPccDYYd2TMociRV
 AnBRnsL8risjKrbhsgsh81KJ0ZNhy9+RQO/hFGq9ZSBGg8kM1hlcaRdtslq5s+ri
 lz9Alq1iZgoxLW3uI30Y09/3zmDpedNSuSGEWvfSqml1WDkCcx+Cu/BSm5kDu6LE
 dhSHuOVMv91rKw==
X-ME-Sender: <xms:JMDDXuwNicbztJcdDi687iYjIHsmhpmfpYfnKnsEo8NYr0zh1Uiw1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:JMDDXqQRY3AXJ-rax07h6LBvYghcZcrEK7rdOEIt7m3i0drlYCCMKg>
 <xmx:JMDDXgUzmE78mkOmrvgwDdaUJDX2IR_RXYlMuynpxe_tttXds7f2HQ>
 <xmx:JMDDXkijI9hNa_dDfjKjBsUh4tzLjozAwhaK0a5ITnUNND488eftUg>
 <xmx:JMDDXv9UMt0x0qTCaMrOdJtlJbJjSoFrUUS11ffO-GEscvk4lmQynQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 91C3C328005E;
 Tue, 19 May 2020 07:16:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 04/14] ALSA: firewire-motu: add wrapper functions for
 protocol-dependent operations
Date: Tue, 19 May 2020 20:16:31 +0900
Message-Id: <20200519111641.123211-5-o-takashi@sakamocchi.jp>
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

This commit adds helper functions which wraps function call for each
protocol.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-pcm.c         |  5 +-
 sound/firewire/motu/motu-proc.c        |  8 ++-
 sound/firewire/motu/motu-protocol-v2.c | 20 ++++---
 sound/firewire/motu/motu-protocol-v3.c | 20 ++++---
 sound/firewire/motu/motu-stream.c      | 10 ++--
 sound/firewire/motu/motu.h             | 75 ++++++++++++++++++++++++++
 6 files changed, 103 insertions(+), 35 deletions(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 2d41a1a4052c..b24bb870388e 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -133,7 +133,6 @@ static int init_hw_info(struct snd_motu *motu,
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
-	const struct snd_motu_protocol *const protocol = motu->spec->protocol;
 	struct amdtp_domain *d = &motu->domain;
 	enum snd_motu_clock_source src;
 	int err;
@@ -152,7 +151,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	err = protocol->get_clock_source(motu, &src);
+	err = snd_motu_protocol_get_clock_source(motu, &src);
 	if (err < 0)
 		goto err_locked;
 
@@ -166,7 +165,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		unsigned int frames_per_buffer = d->events_per_buffer;
 		unsigned int rate;
 
-		err = protocol->get_clock_rate(motu, &rate);
+		err = snd_motu_protocol_get_clock_rate(motu, &rate);
 		if (err < 0)
 			goto err_locked;
 
diff --git a/sound/firewire/motu/motu-proc.c b/sound/firewire/motu/motu-proc.c
index 187f6abd878c..71d02602d84d 100644
--- a/sound/firewire/motu/motu-proc.c
+++ b/sound/firewire/motu/motu-proc.c
@@ -28,13 +28,12 @@ static void proc_read_clock(struct snd_info_entry *entry,
 {
 
 	struct snd_motu *motu = entry->private_data;
-	const struct snd_motu_protocol *const protocol = motu->spec->protocol;
 	unsigned int rate;
 	enum snd_motu_clock_source source;
 
-	if (protocol->get_clock_rate(motu, &rate) < 0)
+	if (snd_motu_protocol_get_clock_rate(motu, &rate) < 0)
 		return;
-	if (protocol->get_clock_source(motu, &source) < 0)
+	if (snd_motu_protocol_get_clock_source(motu, &source) < 0)
 		return;
 
 	snd_iprintf(buffer, "Rate:\t%d\n", rate);
@@ -45,12 +44,11 @@ static void proc_read_format(struct snd_info_entry *entry,
 			     struct snd_info_buffer *buffer)
 {
 	struct snd_motu *motu = entry->private_data;
-	const struct snd_motu_protocol *const protocol = motu->spec->protocol;
 	unsigned int mode;
 	struct snd_motu_packet_format *formats;
 	int i;
 
-	if (protocol->cache_packet_formats(motu) < 0)
+	if (snd_motu_protocol_cache_packet_formats(motu) < 0)
 		return;
 
 	snd_iprintf(buffer, "tx:\tmsg\tfixed\tdiffered\n");
diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 2cd710a7c792..26534ed97fbc 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -35,7 +35,8 @@ static int get_clock_rate(u32 data, unsigned int *rate)
 	return 0;
 }
 
-static int v2_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
+int snd_motu_protocol_v2_get_clock_rate(struct snd_motu *motu,
+					unsigned int *rate)
 {
 	__be32 reg;
 	int err;
@@ -48,7 +49,8 @@ static int v2_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
 	return get_clock_rate(be32_to_cpu(reg), rate);
 }
 
-static int v2_set_clock_rate(struct snd_motu *motu, unsigned int rate)
+int snd_motu_protocol_v2_set_clock_rate(struct snd_motu *motu,
+					unsigned int rate)
 {
 	__be32 reg;
 	u32 data;
@@ -122,8 +124,8 @@ static int get_clock_source(struct snd_motu *motu, u32 data,
 	return 0;
 }
 
-static int v2_get_clock_source(struct snd_motu *motu,
-			       enum snd_motu_clock_source *src)
+int snd_motu_protocol_v2_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src)
 {
 	__be32 reg;
 	int err;
@@ -136,7 +138,8 @@ static int v2_get_clock_source(struct snd_motu *motu,
 	return get_clock_source(motu, be32_to_cpu(reg), src);
 }
 
-static int v2_switch_fetching_mode(struct snd_motu *motu, bool enable)
+int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
+					      bool enable)
 {
 	enum snd_motu_clock_source src;
 	__be32 reg;
@@ -265,7 +268,7 @@ static void calculate_differed_part(struct snd_motu_packet_format *formats,
 	formats->differed_part_pcm_chunks[1] = pcm_chunks[1];
 }
 
-static int v2_cache_packet_formats(struct snd_motu *motu)
+int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 {
 	__be32 reg;
 	u32 data;
@@ -294,11 +297,6 @@ static int v2_cache_packet_formats(struct snd_motu *motu)
 }
 
 static const struct snd_motu_protocol snd_motu_protocol_v2 = {
-	.get_clock_rate		= v2_get_clock_rate,
-	.set_clock_rate		= v2_set_clock_rate,
-	.get_clock_source	= v2_get_clock_source,
-	.switch_fetching_mode	= v2_switch_fetching_mode,
-	.cache_packet_formats	= v2_cache_packet_formats,
 };
 
 const struct snd_motu_spec snd_motu_spec_828mk2 = {
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 548c97752cb8..d8b42d28304a 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -24,7 +24,8 @@
 #define  V3_NO_ADAT_OPT_OUT_IFACE_A	0x00040000
 #define  V3_NO_ADAT_OPT_OUT_IFACE_B	0x00400000
 
-static int v3_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
+int snd_motu_protocol_v3_get_clock_rate(struct snd_motu *motu,
+					unsigned int *rate)
 {
 	__be32 reg;
 	u32 data;
@@ -45,7 +46,8 @@ static int v3_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
 	return 0;
 }
 
-static int v3_set_clock_rate(struct snd_motu *motu, unsigned int rate)
+int snd_motu_protocol_v3_set_clock_rate(struct snd_motu *motu,
+					unsigned int rate)
 {
 	__be32 reg;
 	u32 data;
@@ -85,8 +87,8 @@ static int v3_set_clock_rate(struct snd_motu *motu, unsigned int rate)
 	return 0;
 }
 
-static int v3_get_clock_source(struct snd_motu *motu,
-			       enum snd_motu_clock_source *src)
+int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src)
 {
 	__be32 reg;
 	u32 data;
@@ -133,7 +135,8 @@ static int v3_get_clock_source(struct snd_motu *motu,
 	return 0;
 }
 
-static int v3_switch_fetching_mode(struct snd_motu *motu, bool enable)
+int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
+					      bool enable)
 {
 	__be32 reg;
 	u32 data;
@@ -275,7 +278,7 @@ static void calculate_differed_part(struct snd_motu_packet_format *formats,
 	}
 }
 
-static int v3_cache_packet_formats(struct snd_motu *motu)
+int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 {
 	__be32 reg;
 	u32 data;
@@ -308,11 +311,6 @@ static int v3_cache_packet_formats(struct snd_motu *motu)
 }
 
 static const struct snd_motu_protocol snd_motu_protocol_v3 = {
-	.get_clock_rate		= v3_get_clock_rate,
-	.set_clock_rate		= v3_set_clock_rate,
-	.get_clock_source	= v3_get_clock_source,
-	.switch_fetching_mode	= v3_switch_fetching_mode,
-	.cache_packet_formats	= v3_cache_packet_formats,
 };
 
 const struct snd_motu_spec snd_motu_spec_828mk3 = {
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 11a2b8b37768..87a8d9016f83 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -88,7 +88,7 @@ static void finish_session(struct snd_motu *motu)
 	u32 data;
 	int err;
 
-	err = motu->spec->protocol->switch_fetching_mode(motu, false);
+	err = snd_motu_protocol_switch_fetching_mode(motu, false);
 	if (err < 0)
 		return;
 
@@ -110,7 +110,7 @@ int snd_motu_stream_cache_packet_formats(struct snd_motu *motu)
 {
 	int err;
 
-	err = motu->spec->protocol->cache_packet_formats(motu);
+	err = snd_motu_protocol_cache_packet_formats(motu);
 	if (err < 0)
 		return err;
 
@@ -140,7 +140,7 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
 	unsigned int curr_rate;
 	int err;
 
-	err = motu->spec->protocol->get_clock_rate(motu, &curr_rate);
+	err = snd_motu_protocol_get_clock_rate(motu, &curr_rate);
 	if (err < 0)
 		return err;
 	if (rate == 0)
@@ -153,7 +153,7 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
 		fw_iso_resources_free(&motu->tx_resources);
 		fw_iso_resources_free(&motu->rx_resources);
 
-		err = motu->spec->protocol->set_clock_rate(motu, rate);
+		err = snd_motu_protocol_set_clock_rate(motu, rate);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
 				"fail to set sampling rate: %d\n", err);
@@ -272,7 +272,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 			goto stop_streams;
 		}
 
-		err = motu->spec->protocol->switch_fetching_mode(motu, true);
+		err = snd_motu_protocol_switch_fetching_mode(motu, true);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
 				"fail to enable frame fetching: %d\n", err);
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 9db692006d95..d59841677596 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -179,4 +179,79 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu);
 int snd_motu_create_midi_devices(struct snd_motu *motu);
 
 int snd_motu_create_hwdep_device(struct snd_motu *motu);
+
+int snd_motu_protocol_v2_get_clock_rate(struct snd_motu *motu,
+					unsigned int *rate);
+int snd_motu_protocol_v2_set_clock_rate(struct snd_motu *motu,
+					unsigned int rate);
+int snd_motu_protocol_v2_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src);
+int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
+					      bool enable);
+int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu);
+
+int snd_motu_protocol_v3_get_clock_rate(struct snd_motu *motu,
+					unsigned int *rate);
+int snd_motu_protocol_v3_set_clock_rate(struct snd_motu *motu,
+					unsigned int rate);
+int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src);
+int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
+					      bool enable);
+int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu);
+
+static inline int snd_motu_protocol_get_clock_rate(struct snd_motu *motu,
+						   unsigned int *rate)
+{
+	if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V2)
+		return snd_motu_protocol_v2_get_clock_rate(motu, rate);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
+		return snd_motu_protocol_v3_get_clock_rate(motu, rate);
+	else
+		return -ENXIO;
+}
+
+static inline int snd_motu_protocol_set_clock_rate(struct snd_motu *motu,
+						   unsigned int rate)
+{
+	if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V2)
+		return snd_motu_protocol_v2_set_clock_rate(motu, rate);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
+		return snd_motu_protocol_v3_set_clock_rate(motu, rate);
+	else
+		return -ENXIO;
+}
+
+static inline int snd_motu_protocol_get_clock_source(struct snd_motu *motu,
+					enum snd_motu_clock_source *source)
+{
+	if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V2)
+		return snd_motu_protocol_v2_get_clock_source(motu, source);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
+		return snd_motu_protocol_v3_get_clock_source(motu, source);
+	else
+		return -ENXIO;
+}
+
+static inline int snd_motu_protocol_switch_fetching_mode(struct snd_motu *motu,
+							 bool enable)
+{
+	if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V2)
+		return snd_motu_protocol_v2_switch_fetching_mode(motu, enable);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
+		return snd_motu_protocol_v3_switch_fetching_mode(motu, enable);
+	else
+		return -ENXIO;
+}
+
+static inline int snd_motu_protocol_cache_packet_formats(struct snd_motu *motu)
+{
+	if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V2)
+		return snd_motu_protocol_v2_cache_packet_formats(motu);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
+		return snd_motu_protocol_v3_cache_packet_formats(motu);
+	else
+		return -ENXIO;
+}
+
 #endif
-- 
2.25.1


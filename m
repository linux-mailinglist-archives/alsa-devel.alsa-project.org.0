Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B342EB31
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB49E16BC;
	Fri, 15 Oct 2021 10:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB49E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285536;
	bh=0Gd/hCVxnmCyWU1BQQ/shWH3MgPa38lQu1Sz3C2HhX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jC6GWDJ96QLj8d+fVptxve95eT1RVGzlWTqmvcDPQ+W72Qw8H/r84Zj1iQOabB10j
	 VraQnn6s7Ega8vVQHzgtKmjCHz1SPDMkpfYcTodZtIx/lKlyHl4UNyOn0MPNfM1Jyj
	 coUe3QZB8InfxEUvOE7p6XiDXBqz/Hd3El1LZpOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA251F80517;
	Fri, 15 Oct 2021 10:09:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DE4F80517; Fri, 15 Oct 2021 10:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4584F80517
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4584F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kyIbZPb6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BYgukIRQ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 564663201CD3;
 Fri, 15 Oct 2021 04:08:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Oct 2021 04:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Rawyq6b2EwGzQ
 10zbMa0ZxOCEc/hS9oJ2n8QVKj/UeU=; b=kyIbZPb6Xe4/MMibZNanQ+s2MMOeH
 n4ytUFVHGsTEE55TxODmtraE4HlobcDxJYxYEfuut9xvI4c4Q90D1ToBMwqQhVPf
 d/nDX6IpXwv59A2/0ts2jbq33KUxg5mXACG7oqTdGnN54QBuoNowRtTElTCBnizU
 amH/RMfKBBzrROTwtUpmsyUgpegOnwXtmnIFCqfSX1FBk8bw47KS+oEBLWPt2jCc
 BUBZeToP+Tme4olIC2SvsY7wC7L6gn68wvQKvq9TkLVLRvnE6dceOYVvYHaQfNXB
 no4VNftlfYeknXRddjxQ5jecKxvQ+HqofmPgjyUI9CneDsyoNn7v8btTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Rawyq6b2EwGzQ10zbMa0ZxOCEc/hS9oJ2n8QVKj/UeU=; b=BYgukIRQ
 wlV9z5wEbOCgcmfGrGe8fI9Wt5V+cYeLdlAgur4/aMblvP6LSbbD5XjZ4VPT2dEB
 lmhLeRsR0a54z+aa+VYfk55iBAQVAG4h2QUM8husF+W8GORsZth2KI5pu3s69NI4
 etoYiwh9uwbWPOUbvSIP0dEfMkIQrZWpfxxsz9PJgUDsxHYmh0OOB/v7BCwrYmcz
 Om2NxAb7IYs5andx4Nw/XbjRTcQEwQ4puBVZpQ6+bhLZeMGehaC0HNl3LN0IxkdW
 OoX4BJIPNMmEp5AS+FrcAVoV5CK8yJTOmp7xdpeSdrRGyS6/GhyiluRjb2p39fXy
 LoQsiz7SlyJdPA==
X-ME-Sender: <xms:GDdpYTah600bSEmSkNZIzcTLkjkSB6s1UfI_Q-ss1DZZsv2hu0c4dw>
 <xme:GDdpYSZE6JkxUg0vR90gcASk-A-8m1PgqNniaINS4ySq0L_rnYqhNiL4xW9Q0TXaM
 yctbwbhM8wbULM-BlY>
X-ME-Received: <xmr:GDdpYV-Ah_PfAFyUPfcdJoDTsNDdaQiHCO9DbQ8OTMwa8xrl6WiEOL4BF20jQv2AkSz314ZOMIUpiKb0yJkGfedUiG7H11xNGNllUN5so6Wrf47YgTt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:GDdpYZpufmwFSx8Pm8Sgcw_tDkmav7Fi7m2HDBpoGVOsALOEa88AtQ>
 <xmx:GDdpYeo3b4fZdJ4wPb4bkTh21wsEq3szy5nNauE9fdGTpdEChvCupQ>
 <xmx:GDdpYfSmNY82SOvK9P7VWS8fk4WJ-3q8nKD_NpxRQhefE2wyX8ht_w>
 <xmx:GDdpYV2YrbC8iqzB-z1rVrw05aGhHm9vRrHVpuI_cF2izi-pICfkGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 10/11] ALSA: firewire-motu: queue event for parameter change
 in register DSP model
Date: Fri, 15 Oct 2021 17:08:25 +0900
Message-Id: <20211015080826.34847-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

This commit is a preparation to notify parameter change of register DSP
to userspace application. A simple queue is added to store encoded data
for the change as long as ALSA hwdep character device is opened by
application.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-hwdep.c              |  2 +
 .../motu/motu-register-dsp-message-parser.c   | 93 ++++++++++++++++---
 sound/firewire/motu/motu.h                    |  1 +
 3 files changed, 82 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 699136b911c7..389e59ff768b 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -258,5 +258,7 @@ int snd_motu_create_hwdep_device(struct snd_motu *motu)
 	hwdep->private_data = motu;
 	hwdep->exclusive = true;
 
+	motu->hwdep = hwdep;
+
 	return 0;
 }
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index ed9fd0cef200..cda8e6d987cc 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -78,6 +78,8 @@ enum register_dsp_msg_type {
 	METER = 0x1f,
 };
 
+#define EVENT_QUEUE_SIZE	16
+
 struct msg_parser {
 	spinlock_t lock;
 	struct snd_firewire_motu_register_dsp_meter meter;
@@ -90,6 +92,9 @@ struct msg_parser {
 
 	u8 input_ch;
 	u8 prev_msg_type;
+
+	u32 event_queue[EVENT_QUEUE_SIZE];
+	unsigned int push_pos;
 };
 
 int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
@@ -117,6 +122,24 @@ int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu)
 	return 0;
 }
 
+static void queue_event(struct snd_motu *motu, u8 msg_type, u8 identifier0, u8 identifier1, u8 val)
+{
+	struct msg_parser *parser = motu->message_parser;
+	unsigned int pos = parser->push_pos;
+	u32 entry;
+
+	if (!motu->hwdep || motu->hwdep->used == 0)
+		return;
+
+	entry = (msg_type << 24) | (identifier0 << 16) | (identifier1 << 8) | val;
+	parser->event_queue[pos] = entry;
+
+	++pos;
+	if (pos >= EVENT_QUEUE_SIZE)
+		pos = 0;
+	parser->push_pos = pos;
+}
+
 void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
 					unsigned int desc_count, unsigned int data_block_quadlets)
 {
@@ -172,19 +195,34 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 
 					switch (msg_type) {
 					case MIXER_SRC_GAIN:
-						param->mixer.source[mixer_ch].gain[mixer_src_ch] = val;
+						if (param->mixer.source[mixer_ch].gain[mixer_src_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, mixer_src_ch, val);
+							param->mixer.source[mixer_ch].gain[mixer_src_ch] = val;
+						}
 						break;
 					case MIXER_SRC_PAN:
-						param->mixer.source[mixer_ch].pan[mixer_src_ch] = val;
+						if (param->mixer.source[mixer_ch].pan[mixer_src_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, mixer_src_ch, val);
+							param->mixer.source[mixer_ch].pan[mixer_src_ch] = val;
+						}
 						break;
 					case MIXER_SRC_FLAG:
-						param->mixer.source[mixer_ch].flag[mixer_src_ch] = val;
+						if (param->mixer.source[mixer_ch].flag[mixer_src_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, mixer_src_ch, val);
+							param->mixer.source[mixer_ch].flag[mixer_src_ch] = val;
+						}
 						break;
 					case MIXER_SRC_PAIRED_BALANCE:
-						param->mixer.source[mixer_ch].paired_balance[mixer_src_ch] = val;
+						if (param->mixer.source[mixer_ch].paired_balance[mixer_src_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, mixer_src_ch, val);
+							param->mixer.source[mixer_ch].paired_balance[mixer_src_ch] = val;
+						}
 						break;
 					case MIXER_SRC_PAIRED_WIDTH:
-						param->mixer.source[mixer_ch].paired_width[mixer_src_ch] = val;
+						if (param->mixer.source[mixer_ch].paired_width[mixer_src_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, mixer_src_ch, val);
+							param->mixer.source[mixer_ch].paired_width[mixer_src_ch] = val;
+						}
 						break;
 					default:
 						break;
@@ -203,10 +241,16 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				if (mixer_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT) {
 					switch (msg_type) {
 					case MIXER_OUTPUT_PAIRED_VOLUME:
-						param->mixer.output.paired_volume[mixer_ch] = val;
+						if (param->mixer.output.paired_volume[mixer_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, 0, val);
+							param->mixer.output.paired_volume[mixer_ch] = val;
+						}
 						break;
 					case MIXER_OUTPUT_PAIRED_FLAG:
-						param->mixer.output.paired_flag[mixer_ch] = val;
+						if (param->mixer.output.paired_flag[mixer_ch] != val) {
+							queue_event(motu, msg_type, mixer_ch, 0, val);
+							param->mixer.output.paired_flag[mixer_ch] = val;
+						}
 						break;
 					default:
 						break;
@@ -215,19 +259,34 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				break;
 			}
 			case MAIN_OUTPUT_PAIRED_VOLUME:
-				parser->param.output.main_paired_volume = val;
+				if (parser->param.output.main_paired_volume != val) {
+					queue_event(motu, msg_type, 0, 0, val);
+					parser->param.output.main_paired_volume = val;
+				}
 				break;
 			case HP_OUTPUT_PAIRED_VOLUME:
-				parser->param.output.hp_paired_volume = val;
+				if (parser->param.output.hp_paired_volume != val) {
+					queue_event(motu, msg_type, 0, 0, val);
+					parser->param.output.hp_paired_volume = val;
+				}
 				break;
 			case HP_OUTPUT_PAIRED_ASSIGNMENT:
-				parser->param.output.hp_paired_assignment = val;
+				if (parser->param.output.hp_paired_assignment != val) {
+					queue_event(motu, msg_type, 0, 0, val);
+					parser->param.output.hp_paired_assignment = val;
+				}
 				break;
 			case LINE_INPUT_BOOST:
-				parser->param.line_input.boost_flag = val;
+				if (parser->param.line_input.boost_flag != val) {
+					queue_event(motu, msg_type, 0, 0, val);
+					parser->param.line_input.boost_flag = val;
+				}
 				break;
 			case LINE_INPUT_NOMINAL_LEVEL:
-				parser->param.line_input.nominal_level_flag = val;
+				if (parser->param.line_input.nominal_level_flag != val) {
+					queue_event(motu, msg_type, 0, 0, val);
+					parser->param.line_input.nominal_level_flag = val;
+				}
 				break;
 			case INPUT_GAIN_AND_INVERT:
 			case INPUT_FLAG:
@@ -243,10 +302,16 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				if (input_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_INPUT_COUNT) {
 					switch (msg_type) {
 					case INPUT_GAIN_AND_INVERT:
-						param->input.gain_and_invert[input_ch] = val;
+						if (param->input.gain_and_invert[input_ch] != val) {
+							queue_event(motu, msg_type, input_ch, 0, val);
+							param->input.gain_and_invert[input_ch] = val;
+						}
 						break;
 					case INPUT_FLAG:
-						param->input.flag[input_ch] = val;
+						if (param->input.flag[input_ch] != val) {
+							queue_event(motu, msg_type, input_ch, 0, val);
+							param->input.flag[input_ch] = val;
+						}
 						break;
 					default:
 						break;
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index fa0b3ab7b78d..9703d3af59ec 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -74,6 +74,7 @@ struct snd_motu {
 	int dev_lock_count;
 	bool dev_lock_changed;
 	wait_queue_head_t hwdep_wait;
+	struct snd_hwdep *hwdep;
 
 	struct amdtp_domain domain;
 
-- 
2.30.2


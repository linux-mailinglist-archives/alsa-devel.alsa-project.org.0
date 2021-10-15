Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C234842EB25
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2560116A1;
	Fri, 15 Oct 2021 10:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2560116A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285428;
	bh=eOiPnHWImQVATkZcOMfKf8jeWvNgiq8I44tsNcIkjWk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MxA/TM/ZWrPhGrTl+RGV/rVKDvFsnWKOOx+zpQaqh8XbU8YTs6bJT++T7+BJcBv54
	 WSBB+yNnk8ie0BJWYs6K0Te6rdZqN3U7MhBM3/2kMF+p8jg08UvU8eORLkH3RFsxod
	 +aBfCBiNh6Tnxvpg+6QeadNWb7XQVkGjDl4B1BIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B0D3F804E5;
	Fri, 15 Oct 2021 10:08:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D328F804E5; Fri, 15 Oct 2021 10:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFDA3F80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFDA3F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="04nzR6Ry"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Iz9d2ki5"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 890123201D0A;
 Fri, 15 Oct 2021 04:08:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 15 Oct 2021 04:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SI4oKekCUTtYp
 0E9YNHYJyO8yUV4+U1vJL74Ywu1ig0=; b=04nzR6RycZiMr8U2dIdS2vQj9JUW6
 CchiHWWQryS1QNtnAW2d7p4nbfG+5iTRRKZ1PaF7HhtKYC1k79twerDbiU+tVZnO
 GJ+y+3Esf6DqopsZD+SpXt3iAFSSoY2h7vWn/t2vNkTafFJS1w9Ob5yA1sUidi03
 MXCu39n7Os8ONKNfdUU/0iRkHZBxQUoNWN49AddOfx5Rulnsd/Bmcgb5Um1e0oNh
 by4qen9ftyHn2VoCe+cAXctKoUq2y+Evc+wMBV1cjJ8B7JSggTH7UZJon7zgFs9i
 7RuMqjbmY+C6JUDNAHhEjhpxgW5BmAF+vrfYNlM+Pl7mHPiI0ar/J4Lhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SI4oKekCUTtYp0E9YNHYJyO8yUV4+U1vJL74Ywu1ig0=; b=Iz9d2ki5
 UwZQjIbVnn5CKf+WAXMUUeAXTbzEnuxJmxC0ClerhKkVmwg2Kz5/b/KPU4jWlsmb
 8pV7CptzAtNy0irNHpQ8lKYRkByKmfa5uxb0SqYoPxrzoB/ujRI8A5BnNNkgNpym
 WuOZnQ7WNBdxzIgVoAvIv9RuRzSDtCMqAy9ANJgZ+4jPt+iRDQQzcYkT6U55p7wd
 +WWJYE+2ZpTDNBGW+hAvILTAMMajNFITdDoxsHyFcdgcsmjr1VkPtVB7CYs+IVjN
 DKzS2X/P656Hy530t4pnlgaCK8mluh4Iu+GiY9GMd74GkCimy66GefwY5DK2XP/w
 qaDIlPsNT1+nDg==
X-ME-Sender: <xms:CTdpYWe6z3WcZ99Hv2PFoGpmlMIZ0o-DgydjnN3cDF5Cq_LHjnwGLw>
 <xme:CTdpYQME1Tv3vwIQmIzbv_amOyaQked80M5_--q_FWC05yaPHc84_NPT0_Grn-lmh
 dxV1-ngvjSWq5lvmxQ>
X-ME-Received: <xmr:CTdpYXi_cR8gYR2HlpZqoHT3FGN1C-NomTNloA2aVKkXdaO-L2M1oqUK46Y6tsWCvaapZErz7-_30jHVovL_hx6j2eQpI2fC1NkxzpgdEQ2Seqm5EJaE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:CTdpYT_C92xr5LyyhUCqgi1gqS1cmi975RfmLMdNosmvwYY06nnlbQ>
 <xmx:CTdpYSsTWu58flL5rOVVohHes1c2H3SK3AW7XitElVS1WJgdfCuMzg>
 <xmx:CTdpYaFnHeBoA5in1edhlt0x6H2op0fG-0HylaqRnQmNreGPxK19hw>
 <xmx:CTdpYb46huKuC_JJeUfO5_ThwAmOSPrCGD8H7SwDgdQngvQyfW-qxg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 04/11] ALSA: firewire-motu: parse messages for mixer source
 parameters in register-DSP model
Date: Fri, 15 Oct 2021 17:08:19 +0900
Message-Id: <20211015080826.34847-5-o-takashi@sakamocchi.jp>
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

In register DSP models, current parameters of DSP are always reported by
messages in isochronous packet. When user operates hardware component such
as rotary knob, corresponding message is changed.

This commit parses the message and cache current parameters of mixer
source function, commonly available for all of register DSP models.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 | 28 ++++++++
 .../motu/motu-register-dsp-message-parser.c   | 64 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index a8df8fb03b52..bb5ecff73896 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -145,6 +145,34 @@ struct snd_firewire_motu_register_dsp_meter {
 	__u8 data[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT];
 };
 
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT		4
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT	20
+
+/**
+ * snd_firewire_motu_register_dsp_parameter - the container for parameters of DSP controlled
+ *					      by register access.
+ * @mixer.source.gain: The gain of source to mixer.
+ * @mixer.source.pan: The L/R balance of source to mixer.
+ * @mixer.source.flag: The flag of source to mixer, including mute, solo.
+ * @mixer.source.paired_balance: The L/R balance of paired source to mixer, only for 4 pre and
+ *				 Audio Express.
+ * @mixer.source.paired_width: The width of paired source to mixer, only for 4 pre and
+ *			       Audio Express.
+ *
+ * The structure expresses the set of parameters for DSP controlled by register access.
+ */
+struct snd_firewire_motu_register_dsp_parameter {
+	struct {
+		struct {
+			__u8 gain[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
+			__u8 pan[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
+			__u8 flag[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
+			__u8 paired_balance[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
+			__u8 paired_width[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
+		} source[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT];
+	} mixer;
+};
+
 // In below MOTU models, software is allowed to control their DSP by command in frame of
 // asynchronous transaction to 0x'ffff'0001'0000:
 //
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index fe804615294c..6df40e5ee9db 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -82,6 +82,11 @@ struct msg_parser {
 	spinlock_t lock;
 	struct snd_firewire_motu_register_dsp_meter meter;
 	bool meter_pos_quirk;
+
+	struct snd_firewire_motu_register_dsp_parameter param;
+	u8 prev_mixer_src_type;
+	u8 mixer_ch;
+	u8 mixer_src_ch;
 };
 
 int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
@@ -99,6 +104,12 @@ int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
 
 int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu)
 {
+	struct msg_parser *parser = motu->message_parser;
+
+	parser->prev_mixer_src_type = INVALID;
+	parser->mixer_ch = 0xff;
+	parser->mixer_src_ch = 0xff;
+
 	return 0;
 }
 
@@ -126,6 +137,59 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 			buffer += data_block_quadlets;
 
 			switch (msg_type) {
+			case MIXER_SELECT:
+			{
+				u8 mixer_ch = val / 0x20;
+				if (mixer_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT) {
+					parser->mixer_src_ch = 0;
+					parser->mixer_ch = mixer_ch;
+				}
+				break;
+			}
+			case MIXER_SRC_GAIN:
+			case MIXER_SRC_PAN:
+			case MIXER_SRC_FLAG:
+			case MIXER_SRC_PAIRED_BALANCE:
+			case MIXER_SRC_PAIRED_WIDTH:
+			{
+				struct snd_firewire_motu_register_dsp_parameter *param = &parser->param;
+				u8 mixer_ch = parser->mixer_ch;
+				u8 mixer_src_ch = parser->mixer_src_ch;
+
+				if (msg_type != parser->prev_mixer_src_type)
+					mixer_src_ch = 0;
+				else
+					++mixer_src_ch;
+				parser->prev_mixer_src_type = msg_type;
+
+				if (mixer_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT &&
+				    mixer_src_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT) {
+					u8 mixer_ch = parser->mixer_ch;
+
+					switch (msg_type) {
+					case MIXER_SRC_GAIN:
+						param->mixer.source[mixer_ch].gain[mixer_src_ch] = val;
+						break;
+					case MIXER_SRC_PAN:
+						param->mixer.source[mixer_ch].pan[mixer_src_ch] = val;
+						break;
+					case MIXER_SRC_FLAG:
+						param->mixer.source[mixer_ch].flag[mixer_src_ch] = val;
+						break;
+					case MIXER_SRC_PAIRED_BALANCE:
+						param->mixer.source[mixer_ch].paired_balance[mixer_src_ch] = val;
+						break;
+					case MIXER_SRC_PAIRED_WIDTH:
+						param->mixer.source[mixer_ch].paired_width[mixer_src_ch] = val;
+						break;
+					default:
+						break;
+					}
+
+					parser->mixer_src_ch = mixer_src_ch;
+				}
+				break;
+			}
 			case METER:
 			{
 				u8 pos;
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E159F42EB39
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D81B16AE;
	Fri, 15 Oct 2021 10:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D81B16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285622;
	bh=HNnwUPiZfuv/Aw3vJ6IlVJwY6jwNKy/JnOXlWN5ZCGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sy4ObdtG/GV8aSeGMlCS3nmcj9G4yX8zSdSnB+LMrCbhoe4PyVGlwrOwtqV17nucq
	 iGbHBELuV9hdhJwDDRb5DfcVGy/xhiWggnrQyxZ+MCR29rMV+9y+Gqicnzr9q7NDun
	 5MZK3gl4NgthuTr4VBKp8ODBiy4+68iCzhGtgvdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FB23F80538;
	Fri, 15 Oct 2021 10:09:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B32F80423; Fri, 15 Oct 2021 10:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13184F804EC
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13184F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n2SZfKIo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CIpegp4h"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 660FD3201D2C;
 Fri, 15 Oct 2021 04:08:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 15 Oct 2021 04:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=navGhxA4EgrBr
 MatGQRObwhpsBzRKXcYbnWd52XMQ6k=; b=n2SZfKIoab1h19OymLIK7l2lX2mxt
 kwYJDUtM+i7sNR57MF92xiSghedKYcdybRPZkkXYuwcw3xJTAXiRWbYfHJhk3D7d
 T97V/9nWFK29LGkeyJTZQvrmtG6bO80loaRKTUVK7vVma64g3AGBAsUPFj+S2zEh
 2d/nTZVjJ/91H9WTzL/7joNWypSYxaVvDLcrpkX4eEvscsyurHPEyoleY2Qq7WOS
 v1NCYsWizHuNXNFubz13g70ft7IcCT6k/v3vccyys9eKkp7A0QAyxS+joJ5qWK7W
 1/yppt7xW+2+D+ao77uS5sj5KTmjOLopFuHXm1ZZ4Ad1mmKhA9q2BnFjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=navGhxA4EgrBrMatGQRObwhpsBzRKXcYbnWd52XMQ6k=; b=CIpegp4h
 iApJ1tH6USj1Vsvswwx2+mAfPIEl7F4tWm6viyM7vWQOpATSvr9dxnpIqkrcsol4
 70hTgt9ThXICM9XJGKoopbr4FUg3EV8pKY0FQpqMJjGzlZyU8VS+l7B0oD6/0ckV
 3glOAkD+FK//qua21Eb2CZWkRAi/gnyDvfZ5Ft5k2PcPe1dkVn0m4EvJOS5sXJbi
 pQg3I1L0pL5pj16/DBeQS4rbYQ7Z52PkrNlSLq/SgTDdo7/JMUHgQqNQsU3RkoXh
 KmVaHzVm3fFgIbOhOgnOJ6PJ1P4UkOd7KDQOZQ/nvGSdQnuMl9JfLSldxSV8Brcs
 LFQ7jikA059jcw==
X-ME-Sender: <xms:EzdpYcgDZ3udOYoOSf2zCP-bzoD9Ha8MrEQFz6EY-QaEFyAtbwGmLg>
 <xme:EzdpYVBomEz3Cb3WSHLEHFKW-QMmVEcqVN0-dcmaMFCZT6B1qryjZWMsFOeLZqvgB
 GYkaISgoWnD_zD-W4s>
X-ME-Received: <xmr:EzdpYUGivAtoNz93mTMhhZIOvkniFm-qxaKdtkBkUSfWuiGMm-T_movZMvVy-aCyIwOq2tGP8OBLMHDkISX0gytsp0F5-nZsrrE_szJBZ670GBehH6zy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:EzdpYdTn5q-3Cr3j-Hc2q90YzVK70oNNM3QJHb9ekrqRhrY5GEGvSA>
 <xmx:EzdpYZzxTCXMmTr6e0nlvGfR3r8i54d6yIpcmvsC67NAmiG9GACdug>
 <xmx:EzdpYb6ji4f3048KDufCQc_B2v2LdA9ktUpsLseHXoeE3LUdVvqLuA>
 <xmx:FDdpYU8WUiXsu6XPAdpw3-lBRXKnUsC_BiG0U9KskQd_bS80bT1GJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 08/11] ALSA: firewire-motu: parse messages for input
 parameters in register DSP model
Date: Fri, 15 Oct 2021 17:08:23 +0900
Message-Id: <20211015080826.34847-9-o-takashi@sakamocchi.jp>
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

This commit parses message and cache current parameters of input function,
available for MOTU Ultralite, 4 pre, and Audio Express.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 | 12 ++++++
 .../motu/motu-register-dsp-message-parser.c   | 43 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 049934e2a53c..6366127e923e 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -147,6 +147,8 @@ struct snd_firewire_motu_register_dsp_meter {
 
 #define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT		4
 #define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT	20
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_INPUT_COUNT		10
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_ALIGNED_INPUT_COUNT	(SNDRV_FIREWIRE_MOTU_REGISTER_DSP_INPUT_COUNT + 2)
 
 /**
  * snd_firewire_motu_register_dsp_parameter - the container for parameters of DSP controlled
@@ -168,6 +170,11 @@ struct snd_firewire_motu_register_dsp_meter {
  * @line_input.nominal_level_flag: The flags of nominal level for line inputs, only for 828mk2 and
  *				   Traveler.
  * @line_input.reserved: Padding for 32 bit alignment for future extension.
+ * @input.gain_and_invert: The value including gain and invert for input, only for Ultralite, 4 pre
+ *			   and Audio Express.
+ * @input.flag: The flag of input; e.g. jack detection, phantom power, and pad, only for Ultralite,
+ *		4 pre and Audio express.
+ * @reserved: Padding so that the size of structure is kept to 512 byte, but for future extension.
  *
  * The structure expresses the set of parameters for DSP controlled by register access.
  */
@@ -196,6 +203,11 @@ struct snd_firewire_motu_register_dsp_parameter {
 		__u8 nominal_level_flag;
 		__u8 reserved[6];
 	} line_input;
+	struct {
+		__u8 gain_and_invert[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_ALIGNED_INPUT_COUNT];
+		__u8 flag[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_ALIGNED_INPUT_COUNT];
+	} input;
+	__u8 reserved[64];
 };
 
 // In below MOTU models, software is allowed to control their DSP by command in frame of
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index 85faf7a4e8a3..d94ca4875714 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -87,6 +87,9 @@ struct msg_parser {
 	u8 prev_mixer_src_type;
 	u8 mixer_ch;
 	u8 mixer_src_ch;
+
+	u8 input_ch;
+	u8 prev_msg_type;
 };
 
 int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
@@ -109,6 +112,7 @@ int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu)
 	parser->prev_mixer_src_type = INVALID;
 	parser->mixer_ch = 0xff;
 	parser->mixer_src_ch = 0xff;
+	parser->prev_msg_type = INVALID;
 
 	return 0;
 }
@@ -225,6 +229,35 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 			case LINE_INPUT_NOMINAL_LEVEL:
 				parser->param.line_input.nominal_level_flag = val;
 				break;
+			case INPUT_GAIN_AND_INVERT:
+			case INPUT_FLAG:
+			{
+				struct snd_firewire_motu_register_dsp_parameter *param = &parser->param;
+				u8 input_ch = parser->input_ch;
+
+				if (parser->prev_msg_type != msg_type)
+					input_ch = 0;
+				else
+					++input_ch;
+
+				if (input_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_INPUT_COUNT) {
+					switch (msg_type) {
+					case INPUT_GAIN_AND_INVERT:
+						param->input.gain_and_invert[input_ch] = val;
+						break;
+					case INPUT_FLAG:
+						param->input.flag[input_ch] = val;
+						break;
+					default:
+						break;
+					}
+					parser->input_ch = input_ch;
+				}
+				break;
+			}
+			case UNKNOWN_0:
+			case UNKNOWN_2:
+				break;
 			case METER:
 			{
 				u8 pos;
@@ -239,11 +272,17 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				else
 					pos = (pos & 0x1f) + 20;
 				parser->meter.data[pos] = val;
-				break;
+				// The message for meter is interruptible to the series of other
+				// types of messages. Don't cache it.
+				fallthrough;
 			}
+			case INVALID:
 			default:
-				break;
+				// Don't cache it.
+				continue;
 			}
+
+			parser->prev_msg_type = msg_type;
 		}
 	}
 
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3042EB2D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0C0E16B1;
	Fri, 15 Oct 2021 10:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0C0E16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285491;
	bh=k5k82mAOq27TEi/0sITjyKqe+Q+Gx6rP1h+vkGn1cyI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jTV14WW5qALxsbvidELMEnewE/NXStYv6kaCxvGsRyLwr+OtDoyGiXNatLNQ91E1P
	 ATqWdkr5zeUUMsvcHaGYsIJMkk/n0UuYNy3hN23FwjaE3OQxE6bPXpEcWust9/M3eC
	 TOwV7AhBx7OUaV9S3pjPOKCyUIiZPiMxG3prW5mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D941F8050F;
	Fri, 15 Oct 2021 10:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58410F804FE; Fri, 15 Oct 2021 10:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B9CF8025B
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B9CF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VdzZ+QIE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bSG2J2E6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4453D3201CED;
 Fri, 15 Oct 2021 04:08:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 15 Oct 2021 04:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fXqk+f7cNtfnc
 gjYuUxEKXr0fn5hEfKvdFA/KZD2Usw=; b=VdzZ+QIEjMwoeTgNNwnf8mgliURJT
 SmMtVmv3eVYhoChpwZDWKSF0Z4OiUoI4CMvro+VI6ZGfPOBU04UkGEMivBIpOYR5
 WGv0JYTc8ywza0psliEQB7nGH8i3AqfAQa2Rva/kYWh3nm47/8mHfN6y727Z5fFi
 qppT6fV9gwOSdI/2u8dhMeQF9CU04op0/1btr8peD4dKKcsBw6XjreBKOVqBx8od
 xBhxaQdzZ5NkNc4m5csMKAkMomfC3XAkFRqvIiZlP4P8hmunuV3vf9+2f4kWAWg/
 wocqo36IS6fcFzAQDkPNoDBq+zD+dLlKsQivT1LuDVFWgQPrEuIZOXrVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fXqk+f7cNtfncgjYuUxEKXr0fn5hEfKvdFA/KZD2Usw=; b=bSG2J2E6
 k5w5tJOw0Z0psbveAV9dvti9+V5RxUf7ntg10jrMlHwDqnjPuOW5LILZsWCqFSru
 pFoyrq595Z+00VaGcM7BzeIo0TsL/CIJEv+TuwrAvZLymOGgVLnkM91O5gyXB1XC
 cXOelAga9nwzwwho7kj+rzgPc7VO3f26IjomCO0g7jD+gmYpsBM9YieUK1a5E07z
 7+QqNyJDPjldNezUENTXmi4XQ8u/QaT0dCqWjRMf0RXRvnBHC5Pii8uZIvCSgxRV
 M4NJHMzn38wDTlXhDtkMaHaH7nQh1i5nlmDHvBYqerBv41uai3y2AO9ov2NcDDoL
 DCxyaR1GRk+AbQ==
X-ME-Sender: <xms:DDdpYYmKznl7xKvXjz6Wn__qjy2BI6JWCWFECq_9Fe1pxZGkoU7ayg>
 <xme:DDdpYX0uqjmsWV05LpqVttcaBhveCXNSeAR1esa8eKhFouqP1A2Q_euMaRClawtqD
 40TRoynN4Ue9ydfUyg>
X-ME-Received: <xmr:DDdpYWpx1qtFZeuTLVEPqjwHWrRQJ2uYPb38HFUtiDlX77gRSjxQICgbHjb7uluZ7AM7qr7hpo2oIlrBrmEgVJCG-pZBqpIGkfEr73TUIIfIHzEmwS7y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:DDdpYUnyzpIEiTvUifqeRHJNYGgmV9TXNOfJMc1xEHhtDXeqxWcSbg>
 <xmx:DDdpYW2DWlXxHumPO2k3Hvdm6ZKhrLcU-ef_DlXfQ-3Z-fOM1E7gFQ>
 <xmx:DDdpYbt_ANlGpnyRvqkKy0KllZUSaz5yGMsV9ya-1R3yO6HNPSdxjA>
 <xmx:DDdpYUCx16ZO1vkEmuUW4WUEvAN8SEfxCIllGaLkdYkJIx8CC1ZtVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 05/11] ALSA: firewire-motu: parse messages for mixer output
 parameters in register DSP model
Date: Fri, 15 Oct 2021 17:08:20 +0900
Message-Id: <20211015080826.34847-6-o-takashi@sakamocchi.jp>
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

This commit parses message and cache current parameters of mixer output
function, commonly available for all of register DSP model

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 |  6 ++++++
 .../motu/motu-register-dsp-message-parser.c   | 20 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index bb5ecff73896..f663a26c5205 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -158,6 +158,8 @@ struct snd_firewire_motu_register_dsp_meter {
  *				 Audio Express.
  * @mixer.source.paired_width: The width of paired source to mixer, only for 4 pre and
  *			       Audio Express.
+ * @mixer.output.paired_volume: The volume of paired output from mixer.
+ * @mixer.output.paired_flag: The flag of paired output from mixer.
  *
  * The structure expresses the set of parameters for DSP controlled by register access.
  */
@@ -170,6 +172,10 @@ struct snd_firewire_motu_register_dsp_parameter {
 			__u8 paired_balance[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
 			__u8 paired_width[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_SRC_COUNT];
 		} source[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT];
+		struct {
+			__u8 paired_volume[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT];
+			__u8 paired_flag[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT];
+		} output;
 	} mixer;
 };
 
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index 6df40e5ee9db..867cb09a3521 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -190,6 +190,26 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				}
 				break;
 			}
+			case MIXER_OUTPUT_PAIRED_VOLUME:
+			case MIXER_OUTPUT_PAIRED_FLAG:
+			{
+				struct snd_firewire_motu_register_dsp_parameter *param = &parser->param;
+				u8 mixer_ch = parser->mixer_ch;
+
+				if (mixer_ch < SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT) {
+					switch (msg_type) {
+					case MIXER_OUTPUT_PAIRED_VOLUME:
+						param->mixer.output.paired_volume[mixer_ch] = val;
+						break;
+					case MIXER_OUTPUT_PAIRED_FLAG:
+						param->mixer.output.paired_flag[mixer_ch] = val;
+						break;
+					default:
+						break;
+					}
+				}
+				break;
+			}
 			case METER:
 			{
 				u8 pos;
-- 
2.30.2


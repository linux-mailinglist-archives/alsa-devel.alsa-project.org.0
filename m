Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E742EB30
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB8F16B0;
	Fri, 15 Oct 2021 10:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB8F16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285521;
	bh=eELBjpqLoTj7BzCXF86l6y3l78dn7IZHFSBbwjfbnRU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULozEeO/rmnK3WSRULNi62s+JUm/4rxzEbWUPJt+/Eg9d66ml9uBZdXVaW8matkUg
	 v+ndXwKQmLiB8BWK03lsbkOTvqalHqaQh/4qi6dPmO3uDYHBWeRem9+QBbas6DLzuZ
	 4+/euFcprtft/Yl7yjVTkYg0BkH7+vh5wYXf1v3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F8BDF8051C;
	Fri, 15 Oct 2021 10:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C98F8051C; Fri, 15 Oct 2021 10:09:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D640BF804D8
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D640BF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="d0p5tWlH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jnjIFppf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F22933201D14;
 Fri, 15 Oct 2021 04:08:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Oct 2021 04:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=DJjnrfbN+qW8O
 bqkZ2HiCkiLgJPRNA+gQWghdBs33bY=; b=d0p5tWlH+UxG4AXabAEj1ArToQF9K
 DzUB0jXBJiykjhTifrns4yooyL+euuW/QZHitfR/lsaevQQpCS9V/O8RHD14c7WT
 CpjbnQMY4xsa1SKKy2ddBcVcCkPOImrWlido7eygQ1TRop5gj966ZvQVF5gxcevA
 GvUjNKt+HPNhrQCSYl4jkELkVrOum5s4UBdt5gJifCUHxOmlwElIyV0dBo8fyOba
 CaKkPMFi0yMzpXSkQt8Iq+J04tJsYOLpLXKJwM3OYz3tsa3KyR8fgpdzf5h1Y0BS
 nt18+GjPM+9GiXL+cVAtHQ/69sCoBWlgiCrnqc22l5c843Wo0Z6bRR+9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DJjnrfbN+qW8ObqkZ2HiCkiLgJPRNA+gQWghdBs33bY=; b=jnjIFppf
 6FL7Egt4Y/aIJFUx63FKAxDhqv5A6sZenYdpgk7XvcQne2/4jxVc+nzaUpLWn0tz
 RCHudProiO1sC3dYxQ7WavoArkVrukr3yr7g1e4v9b6yQocBbGleKOsjN42QRoJk
 +fJpvv/in+iKGYtdF1D4HIH432C22+pu/8GktQ8+MIWB9bONANv3q70F8SdXPrtf
 EXVT7myXB0ZEkRI9vqj2ZTK8y5AkPuexLsfV6CWZ4qUYh+eyQr09rx+u7YrDerym
 491msMC3fIzIqDsosnxd66UC9gl4BfJ+3FyeHwUPxLGoFn8mEuwWHbo3SxilHwMy
 WKCO3yRC580ZBw==
X-ME-Sender: <xms:ETdpYVWDgOtild5UB9YWWZl63yZ_eS5BJWprJ7-12NUBaAFnsqWQNQ>
 <xme:ETdpYVllCMwHQpTVUBpl_Llcj0Xp3cOHr1mDyf3WuGpcnWsEwn4RfapYDVBIgHcS2
 u543rW0R13hEZjUUq0>
X-ME-Received: <xmr:ETdpYRZ1Df4Uin5VltShT95nV8iqN1CSRh1QjGYkwFxmxYUnZBBcxDmNChvZW9MJ5nTEmMY8VgSnnl9BHeZsY_4cyHobyt2u49xMbtoXwwBZyZcnQ-9Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ETdpYYUKGIz1uJDSpCc69oyuOoHtuMVUIxSN0XbD1Ia3ME0W_G3U6w>
 <xmx:ETdpYfm8j4TSF2xaewiBH8WzhrYXJ4ATg5Oa4nXRR84NfBbDFc1hqA>
 <xmx:ETdpYVfIbTnYCeuHNzsesghtuBVIZeisRgISIJ4uSDKL44JL8re2LA>
 <xmx:ETdpYUwQrhC9UO-bfJNIF4bs6TZB9niCwEx2PdE6gJdMXRirIvO9wA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 07/11] ALSA: firewire-motu: parse messages for line input
 parameters in register DSP model
Date: Fri, 15 Oct 2021 17:08:22 +0900
Message-Id: <20211015080826.34847-8-o-takashi@sakamocchi.jp>
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

This commit parses message and cache current parameters of line input
function, available for MOTU 828 mk2 and Traveler.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                          | 9 +++++++++
 sound/firewire/motu/motu-register-dsp-message-parser.c | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 16ca7b43568b..049934e2a53c 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -164,6 +164,10 @@ struct snd_firewire_motu_register_dsp_meter {
  * @output.hp_paired_volume: The volume of paired hp output.
  * @output.hp_paired_assignment: The source assigned to paired hp output.
  * @output.reserved: Padding for 32 bit alignment for future extension.
+ * @line_input.boost_flag: The flags of boost for line inputs, only for 828mk2 and Traveler.
+ * @line_input.nominal_level_flag: The flags of nominal level for line inputs, only for 828mk2 and
+ *				   Traveler.
+ * @line_input.reserved: Padding for 32 bit alignment for future extension.
  *
  * The structure expresses the set of parameters for DSP controlled by register access.
  */
@@ -187,6 +191,11 @@ struct snd_firewire_motu_register_dsp_parameter {
 		__u8 hp_paired_assignment;
 		__u8 reserved[5];
 	} output;
+	struct {
+		__u8 boost_flag;
+		__u8 nominal_level_flag;
+		__u8 reserved[6];
+	} line_input;
 };
 
 // In below MOTU models, software is allowed to control their DSP by command in frame of
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index 244f7ada851f..85faf7a4e8a3 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -219,6 +219,12 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 			case HP_OUTPUT_PAIRED_ASSIGNMENT:
 				parser->param.output.hp_paired_assignment = val;
 				break;
+			case LINE_INPUT_BOOST:
+				parser->param.line_input.boost_flag = val;
+				break;
+			case LINE_INPUT_NOMINAL_LEVEL:
+				parser->param.line_input.nominal_level_flag = val;
+				break;
 			case METER:
 			{
 				u8 pos;
-- 
2.30.2


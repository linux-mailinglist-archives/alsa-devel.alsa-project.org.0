Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C1138C70
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 08:37:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4738815F8;
	Mon, 13 Jan 2020 08:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4738815F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578901068;
	bh=K6pe6pWdU9DDE60yjUtBkbZjfyoNn0mNgzNv2d9uHEU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ng0INDcDVyR+vNYPzKpWrhW0f7WwMiYoOTGg3jnFRtDCfhgAKON5tVFrRv6g68aKz
	 7LHBRGtH4cOjLfE9VLrUFglx4RnCY7R4wgLfhfhquAVBqhef9WedTSQtRNsPwW3zz4
	 R7zQBkK0IFkhKEkXs/BQX6DC2tTr7FZJ42QvFzsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64240F80274;
	Mon, 13 Jan 2020 08:34:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E63EF801F7; Mon, 13 Jan 2020 08:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C34CF8014B
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 08:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C34CF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WTcfEPHM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tGBH+IXl"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 521BF21CDD;
 Mon, 13 Jan 2020 02:34:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 02:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OYHWOKhpnrw2r
 FWQhbLAa/+wRbfWT8iDhIic779Z0xs=; b=WTcfEPHMD9xI9m9q9CDY6xRMQfsnF
 zJx9+FyQYXy8O+IMlMZ6bx75FcMUnXWXok3sS/dM+BLsx7atM63WdQQiEv/YJhZm
 P6asKEL7PmU7qPhUZTMDTpNZJWEBwAXMqSb04R562Oxgvyna2/ZeaVTY9ZCfQ4rf
 Fiw2fbGVmJV6S4NcC41LuxuKOBcUYuaJjLMSbIuMYAX29wDB8D/IkH2I6YTXwA0K
 whz5u5/7miYV6g01lwg4CATUBkVa11BgCAYklOAZbpjk4nDhLb1p0HIFXNYp2CFK
 XbV8DXBbvSpis4bgATTKJed0n+vZf+HhnE2ftK8VrRGow3JvBYVVGwzLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OYHWOKhpnrw2rFWQhbLAa/+wRbfWT8iDhIic779Z0xs=; b=tGBH+IXl
 7MgEdXpl/I+5wUAa0vTHzzMW+eLxsOs3OrG4bHUvjyxH/DJIYDrie8nuTmEC2+oe
 2z2kopYTeIlcWz4q7z961ozBttmG1WcNYDOyljTWgSnROuagsc9jyB5HwF5sPp81
 +B3tEBUTzQTwCwieDtmHQGKtMhve8Ey3RSFGC/3bgZPrY+V3Itjzg99tY5GuLVYo
 jhJBBfCtPe4iqTeS7TErTAdupBuTCGnWXg2sTKhpSyk04XmiNqwgL0o99Ik2+TkA
 bfW/mK48IuiSDQnkKC6Nar85gX86SnGxKJxwfVYcHtojST744IMb97GneygPNMtQ
 VMuHzIk+CTSJtw==
X-ME-Sender: <xms:fx0cXmB6BWSZLWL8Pp_gDrlUiMrAA5gduRAe6MwoIcakfjajFgpS1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:fx0cXsCklsfNfSC1oNO0kSOQQuj2vzJSZnb8nudeXftrXdAYcQYzDA>
 <xmx:fx0cXgnp_AOf-2PTASTRnQ_PHSJd_71sKRuIfHbgU8dvlC0jr9W4xQ>
 <xmx:fx0cXttULgey7mVn9etLssdnjrKSr8i-21Ub6mfbvlAq3ZaHytgGPw>
 <xmx:fx0cXvbBIj1d-Re00MXgoJpwRbldIQaEryXJNHTBMlW7zV51ntXVKA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DC0F80065;
 Mon, 13 Jan 2020 02:34:22 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 16:34:16 +0900
Message-Id: <20200113073418.24622-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113073418.24622-1-o-takashi@sakamocchi.jp>
References: <20200113073418.24622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/3] ALSA: oxfw: use ENXIO for not-supported
	cases
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When AV/C command returns 'NOT IMPLEMENTED' status in its response, ALSA
oxfw driver uses ENOSYS as error code. However, it's expected just to be
used for missing system call number.

This commit replaces it with ENXIO.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-command.c |  6 +++---
 sound/firewire/oxfw/oxfw-stream.c  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-command.c b/sound/firewire/oxfw/oxfw-command.c
index 16dc337c7093..d2e57c76070d 100644
--- a/sound/firewire/oxfw/oxfw-command.c
+++ b/sound/firewire/oxfw/oxfw-command.c
@@ -38,7 +38,7 @@ int avc_stream_set_format(struct fw_unit *unit, enum avc_general_plug_dir dir,
 	else if (err < len + 10)
 		err = -EIO;
 	else if (buf[0] == 0x08) /* NOT IMPLEMENTED */
-		err = -ENOSYS;
+		err = -ENXIO;
 	else if (buf[0] == 0x0a) /* REJECTED */
 		err = -EINVAL;
 	else
@@ -83,7 +83,7 @@ int avc_stream_get_format(struct fw_unit *unit,
 	else if (err < 12)
 		err = -EIO;
 	else if (buf[0] == 0x08)	/* NOT IMPLEMENTED */
-		err = -ENOSYS;
+		err = -ENXIO;
 	else if (buf[0] == 0x0a)	/* REJECTED */
 		err = -EINVAL;
 	else if (buf[0] == 0x0b)	/* IN TRANSITION */
@@ -147,7 +147,7 @@ int avc_general_inquiry_sig_fmt(struct fw_unit *unit, unsigned int rate,
 	else if (err < 8)
 		err = -EIO;
 	else if (buf[0] == 0x08)	/* NOT IMPLEMENTED */
-		err = -ENOSYS;
+		err = -ENXIO;
 	if (err < 0)
 		goto end;
 
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 501a80094bf7..692324670c78 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -513,7 +513,7 @@ int snd_oxfw_stream_parse_format(u8 *format,
 	 *  Level 1:	AM824 Compound  (0x40)
 	 */
 	if ((format[0] != 0x90) || (format[1] != 0x40))
-		return -ENOSYS;
+		return -ENXIO;
 
 	/* check the sampling rate */
 	for (i = 0; i < ARRAY_SIZE(avc_stream_rate_table); i++) {
@@ -521,7 +521,7 @@ int snd_oxfw_stream_parse_format(u8 *format,
 			break;
 	}
 	if (i == ARRAY_SIZE(avc_stream_rate_table))
-		return -ENOSYS;
+		return -ENXIO;
 
 	formation->rate = oxfw_rate_table[i];
 
@@ -565,13 +565,13 @@ int snd_oxfw_stream_parse_format(u8 *format,
 		/* Don't care */
 		case 0xff:
 		default:
-			return -ENOSYS;	/* not supported */
+			return -ENXIO;	/* not supported */
 		}
 	}
 
 	if (formation->pcm  > AM824_MAX_CHANNELS_FOR_PCM ||
 	    formation->midi > AM824_MAX_CHANNELS_FOR_MIDI)
-		return -ENOSYS;
+		return -ENXIO;
 
 	return 0;
 }
@@ -656,7 +656,7 @@ static int fill_stream_formats(struct snd_oxfw *oxfw,
 	/* get first entry */
 	len = AVC_GENERIC_FRAME_MAXIMUM_BYTES;
 	err = avc_stream_get_format_list(oxfw->unit, dir, 0, buf, &len, 0);
-	if (err == -ENOSYS) {
+	if (err == -ENXIO) {
 		/* LIST subfunction is not implemented */
 		len = AVC_GENERIC_FRAME_MAXIMUM_BYTES;
 		err = assume_stream_formats(oxfw, dir, pid, buf, &len,
@@ -728,7 +728,7 @@ int snd_oxfw_stream_discover(struct snd_oxfw *oxfw)
 			err);
 		goto end;
 	} else if ((plugs[0] == 0) && (plugs[1] == 0)) {
-		err = -ENOSYS;
+		err = -ENXIO;
 		goto end;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

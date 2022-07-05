Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4D5686DF
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3BB16CA;
	Wed,  6 Jul 2022 13:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3BB16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657107743;
	bh=MVNoAajfEQWoVf6jfzbsfM2MwV1dKQ/pr1ERO0P3FWw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o4JT7o3jSQFu9Wcl32siEXUi9xLr/UV1600sRwt0FhF1MLl0zhKZ7YstUqSzzxjFX
	 b6u6tQK44Xz81uzNthJlVrRpCf/JmGOWt22XF05IAb+YuKbC/T77K065q/SW0c63Yt
	 YhlSOR2W+2sV9s/zyG0OJT7g45WNeMtOEFSxoZGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 644B1F804E0;
	Wed,  6 Jul 2022 13:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1045F8015B; Tue,  5 Jul 2022 15:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3594DF800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 15:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3594DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=jschaer.ch header.i=@jschaer.ch
 header.b="E1oDX32+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hoLQje2m"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CDC3B5C0078;
 Tue,  5 Jul 2022 09:58:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Jul 2022 09:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jschaer.ch; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657029493; x=1657115893; bh=3pBWnobVtm
 Yk1o03Q9pUyRbRyBRkuWaatCBSNZWziGc=; b=E1oDX32+Om+A4pnHDWMGnSlTTC
 3EoKQsAU7+cHq00t23I/VSdvMgP4vngJ1mueWTIeLMxkMoWAOasif6/ECwHDZdL+
 zCYKtPPd/fL2zu72pv/DlDCEM8QFUn7Qq0V83sVxMpEhRZAQl3vp7jjdhQHA2obp
 ak60nyn7ysS14ODVsAZWzG0tPUGtSavR3z3mOJF/2ufa4iZreptMECY/60fMv87x
 WfB9GP2VjuGkxNo2tZwayOqon936grGAa88E0sAyMAI29x6Lro7MNisv57nBjucg
 nsiSwoDOff1iQNjHh9FqiU9aD/1E8/nFpY06Ag0Yh5hTKV3Yl7u199Dp7snQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1657029493; x=1657115893; bh=3pBWnobVtmYk1
 o03Q9pUyRbRyBRkuWaatCBSNZWziGc=; b=hoLQje2mKQvlcFuaVeqd+qtAcLQve
 FV7KHmO9j6CVHVvYriKBVAsubZU033xpKcwY8r6i8CPFYH/XWjGPoOOFQWLAmiZ+
 qt9HQfCR6V8EmhcPILFgrAjgw1WV15g1TfkmJDvEDEf6xpw4ho9DJx4nonKUswdz
 VpHuSO1OXbvLUuLC0yV+UcnnrDGUliKCtmsH93Zqi4IQIjJU4z9vH1Vg2/MMSJ4U
 L7iWvkkOKRitz+0ksFNBRpaUUA7WBKGACD0eNqRyDfIb1+4lYONcEsmEzl7oqdjB
 g2qWNlpjvCOborsbxTFMGKVr13JfFBiyEqUutEBjIld18jOcvisJEJqzA==
X-ME-Sender: <xms:dUPEYpR-T9WaiaPBKwOX2EPKDvXsHF0rX0Foye0MNuOzXi81aiY-TA>
 <xme:dUPEYiz5946stziXOcl1-qItBLuXbGwgc3C80IYQ48Zzy671J6FSp_TS_J2pVYZz1
 6By5RFyrr3rNXaNhn4>
X-ME-Received: <xmr:dUPEYu33Yn342-ogfRyQQMfSPZgZMBB-fIVk7uMTGEo9OLlM-ihI2Dl6VdFazz7kuguwCNZ5PrWIaYV2tJ_jbKEsusv0WVMhvrcH5XOaRqLi2tcFbFQq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflrghnucfu
 tghhmohruceojhgrnhesjhhstghhrggvrhdrtghhqeenucggtffrrghtthgvrhhnpeffie
 egtdfgjefguefgiefgleeigfelfeetieefhfeifeethfekgfdvjeeljeetleenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepjhgrnhesjhhstghhrggvrhdrtghh
X-ME-Proxy: <xmx:dUPEYhDqQaca7pZtJVX8XUgX_2XBAlbZbxC3V1HEBuvS7jJfYrg_Sw>
 <xmx:dUPEYijNXlKmYzeoLi5_CZAu9fdvWDHstGM5IxpZOKJDQiRjZRGfBQ>
 <xmx:dUPEYlrmdZCGJTIHlTPF3vEnlEDacwjQFO20KjlEiPDC5OJ_vhMDNQ>
 <xmx:dUPEYltXN7to9nT3sTQezripRUTPG6ciTjCl_rZq6g8nknUSEFKSQA>
Feedback-ID: ie67446dc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 09:58:12 -0400 (EDT)
From: =?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: Add endianness annotations
Date: Tue,  5 Jul 2022 15:57:46 +0200
Message-Id: <20220705135746.13713-1-jan@jschaer.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Jul 2022 13:40:50 +0200
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>,
 kernel test robot <lkp@intel.com>
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

Fixes: 4b8ea38fabab ("ALSA: usb-audio: Support jack detection on Dell dock")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/202207051932.qUilU0am-lkp@intel.com
Signed-off-by: Jan Schär <jan@jschaer.ch>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5a45822e60e7..c06d6dfa8139 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -1967,7 +1967,7 @@ static int snd_soundblaster_e1_switch_create(struct usb_mixer_interface *mixer)
 static int realtek_hda_set(struct snd_usb_audio *chip, u32 cmd)
 {
 	struct usb_device *dev = chip->dev;
-	u32 buf = cpu_to_be32(cmd);
+	__be32 buf = cpu_to_be32(cmd);
 
 	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), REALTEK_HDA_SET,
 			       USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_OUT,
@@ -1978,7 +1978,7 @@ static int realtek_hda_get(struct snd_usb_audio *chip, u32 cmd, u32 *value)
 {
 	struct usb_device *dev = chip->dev;
 	int err;
-	u32 buf = cpu_to_be32(cmd);
+	__be32 buf = cpu_to_be32(cmd);
 
 	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), REALTEK_HDA_GET_OUT,
 			      USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_OUT,

base-commit: 2ef9868fff184a6246d2f71190be108a71aa2faa
-- 
2.32.0


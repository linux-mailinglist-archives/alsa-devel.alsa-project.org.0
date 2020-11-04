Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687E2A63E8
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 13:08:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15F0F16A8;
	Wed,  4 Nov 2020 13:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15F0F16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604491732;
	bh=TW8Ff73+IeWGQpjQP/Shz6QsP2kiV7+WpI35Lmkyay8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fZF4RK5DpkHyCPjBxe2KkWVczNysdVZHgXxYm+a+mu/JH9Qf9uVW2xu2M3nqdKOt9
	 NdYqUsUc8gebGQTFrJmnhOjZjvCoO8HXfOmPYuCDSkSWS4fIYM/hyeuWxAg9uiamGJ
	 A5TD8LPwPW/C40LFVsc0ovmD4asNs3N4tkB/r5L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 815B3F8015A;
	Wed,  4 Nov 2020 13:07:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33274F800EC; Wed,  4 Nov 2020 13:07:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A3CFF800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 13:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A3CFF800EC
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id 0A4C76or019143;
 Wed, 4 Nov 2020 22:37:06 +1030
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id 0A4C75YI019142;
 Wed, 4 Nov 2020 22:37:05 +1030
Date: Wed, 4 Nov 2020 22:37:05 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for MODX
Message-ID: <20201104120705.GA19126@b4.vu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.2.2i
Cc: Frank Slotta <frank.slotta@posteo.de>
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

This patch fixes audio distortion on playback for the Yamaha MODX.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Tested-by: Frank Slotta <frank.slotta@posteo.de>
---

 pcm.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b401ee894e1b..22fbd1f48b3e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -345,6 +345,7 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x2466, 0x8003): /* Fractal Audio Axe-Fx II */
+	case USB_ID(0x0499, 0x172a): /* Yamaha MODX */
 		ep = 0x86;
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;

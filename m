Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AF4D6950
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:16:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A9A18DB;
	Fri, 11 Mar 2022 21:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A9A18DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647029775;
	bh=yr0wqfz/5omDgz5A56JPzaEkc41VyITYQncs1Q50cpA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qQpi9+tQ4wlDdXHX3ff2T+jyaRsDux6c3+WIXClksppWYRmWZz6H+K3eQoFgTL+gl
	 vWatp6PBFltk/cum2fWfn494C/kUlryl+7OTdyS6eXAUYg7OzQJosnL9Q4ngT9e/WD
	 QCEU3uBpYWHNUt9eHBUKgmKonrS0fncXIsFDTGws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56798F80085;
	Fri, 11 Mar 2022 21:15:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 351E9F80227; Fri, 11 Mar 2022 21:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB2CF8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB2CF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="WAB6QQHu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=ZVDcCpO/0E/ykbsgbIMmswF2OSPMyLGBt9qq4Nypk3E=; b=WAB6QQHuW25VP+/UWuc8tdgmDk
 LPAvPPpfZOniDjPwyj5nkNFPLBv+oruf65DsAB0FT8N9zTjQSFbWgJNw7I5J9oGL/46K3xNMR53KQ
 Jdt9H53RRTj6vb0BvSnRJg3bfwIF/6UrxJ1ljBhWSMF1Zy7prYBmi6bfHMsrHnbQaSlubbA74C1Rl
 IRCoYPz0jVJA4iml/osSYfI9YILwO25bgMGuz8+xiEqLbxh5CMr9xJUCRInxLU7CzLRKLC8gcdKdY
 QWhAUM7fmLhuF8m8NTBTVlb056CsTNj5xFGGcD+Rxefp6xIJ0GicE8ymqkPyUe/pZ/ivmtkuits4y
 Ocl2PAnw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1nSlf7-0009yI-Sg; Fri, 11 Mar 2022 21:14:57 +0100
Received: from [2001:a61:2b4b:5001:9e5c:8eff:fe01:8578]
 (helo=lars-desktop.fritz.box)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1nSlf7-000VS9-ND; Fri, 11 Mar 2022 21:14:57 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: Add mute TLV for playback volumes on RODE
 NT-USB
Date: Fri, 11 Mar 2022 21:14:00 +0100
Message-Id: <20220311201400.235892-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.5/26478/Fri Mar 11 10:27:25 2022)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

For the RODE NT-USB the lowest Playback mixer volume setting mutes the
audio output. But it is not reported as such causing e.g. PulseAudio to
accidentally mute the device when selecting a low volume.

Fix this by applying the existing quirk for this kind of issue when the
device is detected.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/usb/mixer_quirks.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index e447ddd6854c..d35cf54cab33 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3360,9 +3360,10 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 		if (unitid == 7 && cval->control == UAC_FU_VOLUME)
 			snd_dragonfly_quirk_db_scale(mixer, cval, kctl);
 		break;
-	/* lowest playback value is muted on C-Media devices */
-	case USB_ID(0x0d8c, 0x000c):
-	case USB_ID(0x0d8c, 0x0014):
+	/* lowest playback value is muted on some devices */
+	case USB_ID(0x0d8c, 0x000c): /* C-Media */
+	case USB_ID(0x0d8c, 0x0014): /* C-Media */
+	case USB_ID(0x19f7, 0x0003): /* RODE NT-USB */
 		if (strstr(kctl->id.name, "Playback"))
 			cval->min_mute = 1;
 		break;
-- 
2.30.2


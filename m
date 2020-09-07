Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B625FC6A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:58:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BEF16D5;
	Mon,  7 Sep 2020 16:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BEF16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599490717;
	bh=QkHCdP+HSp94bJnlBpjYKa/KAoOjp/oPWOpwsQOF274=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jB3hVk5/V3W97xuefvGtRQ/HB9FIr/W9TB3UMPQO7oy74uZJSQXXzRr7QeFG1pbHg
	 Ua22py8kXEO9cSYJNdI3neq126GsxwMxnyfy7xriiFpth2dIq0a7Le8yytSBl/bEZd
	 /VrNWEpFmAl9f9qJF8DyGwx9CyX4VMPP+96fBNqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED9D2F80333;
	Mon,  7 Sep 2020 16:51:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 622C7F80305; Mon,  7 Sep 2020 16:51:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 092A7F802FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 092A7F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="If90dhou"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF88921D1A;
 Mon,  7 Sep 2020 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599490289;
 bh=QkHCdP+HSp94bJnlBpjYKa/KAoOjp/oPWOpwsQOF274=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=If90dhouW6N4/r8is7BQs/yBjxud6qO6c5+ufUOQf8CXsy3gv1V2w2PGAy49dIHm/
 G3ml1sY6lzQGW8SXyG1noSerdbf5dAVtP+nfveAVGBwAmVmMOwFsajNut8Ka3mvAIA
 93XNYS89t/ZaY7XxlmUeAC8YAvdGBivshk5xJf/8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 09/11] sound: hiface: move to use usb_control_msg_send()
Date: Mon,  7 Sep 2020 16:51:06 +0200
Message-Id: <20200907145108.3766613-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 marcel@holtmann.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org
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

The usb_control_msg_send() call can return an error if a "short" write
happens, so move the driver over to using that call instead.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
 - Added reviewed-by from Takashi

 sound/usb/hiface/pcm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index a148caa5f48e..f9c924e3964e 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -156,16 +156,14 @@ static int hiface_pcm_set_rate(struct pcm_runtime *rt, unsigned int rate)
 	 * This control message doesn't have any ack from the
 	 * other side
 	 */
-	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0),
-			      HIFACE_SET_RATE_REQUEST,
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-			      rate_value, 0, NULL, 0, 100);
-	if (ret < 0) {
+	ret = usb_control_msg_send(device, 0,
+				   HIFACE_SET_RATE_REQUEST,
+				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
+				   rate_value, 0, NULL, 0, 100);
+	if (ret)
 		dev_err(&device->dev, "Error setting samplerate %d.\n", rate);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static struct pcm_substream *hiface_pcm_get_substream(struct snd_pcm_substream
-- 
2.28.0


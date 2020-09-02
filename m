Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD3425AA08
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3A616F6;
	Wed,  2 Sep 2020 13:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3A616F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599044915;
	bh=q1GkWLHnrhLyuAuirgakuk07qJQEXB3APlzotDBfAM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=naFcnIEG4fHw6V5W1Ex3Y3V4iIHmXjXflEXkrWWRhFGycBgb+XaFhmGjOZVusZso1
	 l3GVds3WtjyBqYPmOvlAM70bUoyOTm4mspX+mbNaIySmXUfjYCr+vXLA9WU9xUb/tF
	 d1k/qoqaTrbxlEW056emJbeplYGknHI93Jq/EjkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE2BF80337;
	Wed,  2 Sep 2020 13:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71275F80333; Wed,  2 Sep 2020 13:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39A60F802FE
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A60F802FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZsA0wR5n"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E07621548;
 Wed,  2 Sep 2020 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044482;
 bh=q1GkWLHnrhLyuAuirgakuk07qJQEXB3APlzotDBfAM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZsA0wR5nOXGHfuvP+1NX07RBGoZ0l9Sw4sGLRoOsFj59Z/PsVVylqeokV6SwPxJu1
 4N7rpZ4dO2UwWiqS0FMeoKAdHrTkIHWxydh21+rKPnXk1x0MxXAXufh3OFH3LDW3dp
 KjbsrgZQTsAKStjwEigDpuzcZJCfrmvdtyPMnors=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 06/10] sound: usx2y: move to use usb_control_msg_send()
Date: Wed,  2 Sep 2020 13:01:08 +0200
Message-Id: <20200902110115.1994491-7-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org
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

The usb_control_msg_send() call can handle data on the stack, as well as
returning an error if a "short" write happens, so move the driver over
to using that call instead.  This ends up removing a helper function
that is no longer needed.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/usx2y/us122l.c | 42 ++++++++--------------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index f86f7a61fb36..e5c5a0d03d8a 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -82,40 +82,13 @@ static int us144_create_usbmidi(struct snd_card *card)
 				  &US122L(card)->midi_list, &quirk);
 }
 
-/*
- * Wrapper for usb_control_msg().
- * Allocates a temp buffer to prevent dmaing from/to the stack.
- */
-static int us122l_ctl_msg(struct usb_device *dev, unsigned int pipe,
-			  __u8 request, __u8 requesttype,
-			  __u16 value, __u16 index, void *data,
-			  __u16 size, int timeout)
-{
-	int err;
-	void *buf = NULL;
-
-	if (size > 0) {
-		buf = kmemdup(data, size, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-	}
-	err = usb_control_msg(dev, pipe, request, requesttype,
-			      value, index, buf, size, timeout);
-	if (size > 0) {
-		memcpy(data, buf, size);
-		kfree(buf);
-	}
-	return err;
-}
-
 static void pt_info_set(struct usb_device *dev, u8 v)
 {
 	int ret;
 
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			      'I',
-			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      v, 0, NULL, 0, 1000);
+	ret = usb_control_msg_send(dev, 0, 'I',
+				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				   v, 0, NULL, 0, 1000);
 	snd_printdd(KERN_DEBUG "%i\n", ret);
 }
 
@@ -305,10 +278,11 @@ static int us122l_set_sample_rate(struct usb_device *dev, int rate)
 	data[0] = rate;
 	data[1] = rate >> 8;
 	data[2] = rate >> 16;
-	err = us122l_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC_SET_CUR,
-			     USB_TYPE_CLASS|USB_RECIP_ENDPOINT|USB_DIR_OUT,
-			     UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep, data, 3, 1000);
-	if (err < 0)
+	err = usb_control_msg_send(dev, 0, UAC_SET_CUR,
+				   USB_TYPE_CLASS|USB_RECIP_ENDPOINT|USB_DIR_OUT,
+				   UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep, data, 3,
+				   1000);
+	if (err)
 		snd_printk(KERN_ERR "%d: cannot set freq %d to ep 0x%x\n",
 			   dev->devnum, rate, ep);
 	return err;
-- 
2.28.0


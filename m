Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA1A25AA00
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1E3184E;
	Wed,  2 Sep 2020 13:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1E3184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599044812;
	bh=NXgeav573xoVWsJ9e7SLPQ8svoQ2BcSre88zTAW0a84=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dm3FVlWjoFM73MDEu18IaRY/19TmA3On182dGhqqOantfTAv1O5TjvldHaRz1mjSp
	 iCxDNdqVTyY/uN+yR3aU1/Z5MZQZECfeG7RWJPjPEWW5dIcj1T93T/YeruMx+JKt+o
	 rG0nGBEUTZTRQQwJC4F4Wn0GZHlYadIJTiF4eGIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F2CF80304;
	Wed,  2 Sep 2020 13:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53A9BF802FB; Wed,  2 Sep 2020 13:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EED5F802D2
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EED5F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LN8KTAvs"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 621652098B;
 Wed,  2 Sep 2020 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044475;
 bh=NXgeav573xoVWsJ9e7SLPQ8svoQ2BcSre88zTAW0a84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LN8KTAvshdpXMQxfJz2GAfxA34G5mquJQFmkcoLMqumsTybBV/KzvVmSQj8cEnAPq
 5wxM7bZYVIexRH0dBH6DP/uU5J+0naKKCegjXSjrYLmO3nl0dW8OvKbpcZSacQwlzS
 MtAidBU3SMfrFtUFmUTkntIy31bd96kWh9SGToEQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 03/10] USB: core: message.c: use usb_control_msg_send() in a
 few places
Date: Wed,  2 Sep 2020 13:01:05 +0200
Message-Id: <20200902110115.1994491-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>
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

There are a few calls to usb_control_msg() that can be converted to use
usb_control_msg_send() instead, so do that in order to make the error
checking a bit simpler.

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/message.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 6aa49b237717..dfd079485c76 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1081,7 +1081,7 @@ int usb_set_isoch_delay(struct usb_device *dev)
 	if (dev->speed < USB_SPEED_SUPER)
 		return 0;
 
-	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	return usb_control_msg_send(dev, 0,
 			USB_REQ_SET_ISOCH_DELAY,
 			USB_DIR_OUT | USB_TYPE_STANDARD | USB_RECIP_DEVICE,
 			dev->hub_delay, 0, NULL, 0,
@@ -1203,13 +1203,13 @@ int usb_clear_halt(struct usb_device *dev, int pipe)
 	 * (like some ibmcam model 1 units) seem to expect hosts to make
 	 * this request for iso endpoints, which can't halt!
 	 */
-	result = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-		USB_REQ_CLEAR_FEATURE, USB_RECIP_ENDPOINT,
-		USB_ENDPOINT_HALT, endp, NULL, 0,
-		USB_CTRL_SET_TIMEOUT);
+	result = usb_control_msg_send(dev, 0,
+				      USB_REQ_CLEAR_FEATURE, USB_RECIP_ENDPOINT,
+				      USB_ENDPOINT_HALT, endp, NULL, 0,
+				      USB_CTRL_SET_TIMEOUT);
 
 	/* don't un-halt or force to DATA0 except on success */
-	if (result < 0)
+	if (result)
 		return result;
 
 	/* NOTE:  seems like Microsoft and Apple don't bother verifying
@@ -1558,9 +1558,10 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 	if (dev->quirks & USB_QUIRK_NO_SET_INTF)
 		ret = -EPIPE;
 	else
-		ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-				   USB_REQ_SET_INTERFACE, USB_RECIP_INTERFACE,
-				   alternate, interface, NULL, 0, 5000);
+		ret = usb_control_msg_send(dev, 0,
+					   USB_REQ_SET_INTERFACE,
+					   USB_RECIP_INTERFACE, alternate,
+					   interface, NULL, 0, 5000);
 
 	/* 9.4.10 says devices don't need this and are free to STALL the
 	 * request if the interface only has one alternate setting.
@@ -1570,7 +1571,7 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 			"manual set_interface for iface %d, alt %d\n",
 			interface, alternate);
 		manual = 1;
-	} else if (ret < 0) {
+	} else if (ret) {
 		/* Re-instate the old alt setting */
 		usb_hcd_alloc_bandwidth(dev, NULL, alt, iface->cur_altsetting);
 		usb_enable_lpm(dev);
@@ -1718,11 +1719,10 @@ int usb_reset_configuration(struct usb_device *dev)
 		mutex_unlock(hcd->bandwidth_mutex);
 		return retval;
 	}
-	retval = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			USB_REQ_SET_CONFIGURATION, 0,
-			config->desc.bConfigurationValue, 0,
-			NULL, 0, USB_CTRL_SET_TIMEOUT);
-	if (retval < 0)
+	retval = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
+				      config->desc.bConfigurationValue, 0,
+				      NULL, 0, USB_CTRL_SET_TIMEOUT);
+	if (retval)
 		goto reset_old_alts;
 	mutex_unlock(hcd->bandwidth_mutex);
 
@@ -2103,10 +2103,10 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 	}
 	kfree(new_interfaces);
 
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-			      USB_REQ_SET_CONFIGURATION, 0, configuration, 0,
-			      NULL, 0, USB_CTRL_SET_TIMEOUT);
-	if (ret < 0 && cp) {
+	ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
+				   configuration, 0, NULL, 0,
+				   USB_CTRL_SET_TIMEOUT);
+	if (ret && cp) {
 		/*
 		 * All the old state is gone, so what else can we do?
 		 * The device is probably useless now anyway.
-- 
2.28.0


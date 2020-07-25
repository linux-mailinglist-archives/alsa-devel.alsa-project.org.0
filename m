Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5522D560
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jul 2020 08:11:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA871688;
	Sat, 25 Jul 2020 08:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA871688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595657482;
	bh=uAIbfE5YXFVRdf89ImZD0i1A5o6+lg797GJ0ie73DFk=;
	h=Date:From:To:References:Subject:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jQvlBN66LB68bNhe4Dita0V/QXbLc/1YTd1u53XtejxPXuuwsSEiPwFlzc8AY3PuZ
	 HoACsBjg98XYeqnbW4rot+H8bp/53r7YB1BENAVeBeYxTPV2H0L8RllA9P6s07n/Ay
	 ori1YHK/VOWgGFKf/lm0iXEniPBkU15mT5ZlDRys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF37F800DE;
	Sat, 25 Jul 2020 08:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19164F80212; Sat, 25 Jul 2020 08:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG, MIME_HTML_ONLY, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.198])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CAAF800DE
 for <alsa-devel@alsa-project.org>; Sat, 25 Jul 2020 08:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CAAF800DE
Received: from localhost (unknown [192.168.167.249])
 by regular1.263xmail.com (Postfix) with ESMTP id CCA0169D;
 Sat, 25 Jul 2020 14:09:14 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from bj-wm-cp-2 (unknown [192.168.166.190])
 by smtp.263.net (postfix) whith ESMTP id
 P16471T139735924197120S1595657355064098_; 
 Sat, 25 Jul 2020 14:09:15 +0800 (CST)
X-UNIQUE-TAG: <8585fa2619e78ab680edf6bd8baeeb07>
X-RL-SENDER: penghao@uniontech.com
X-SENDER: penghao@uniontech.com
X-LOGIN-NAME: wmsendmail@net263.com
X-FST-TO: gregkh@linuxfoundation.org
X-SENDER-IP: 192.168.166.190
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Sat, 25 Jul 2020 14:09:14 +0800 (CST)
From: =?UTF-8?B?5b2t5rWp?= <penghao@uniontech.com>
To: =?UTF-8?B?R3JlZyBLSCA=?= <gregkh@linuxfoundation.org>
Message-ID: <2108119032.587807.1595657354769.JavaMail.xmail@bj-wm-cp-2>
References: <20200725040155.27648-1-penghao@uniontech.com>,
 <20200725054844.GA1045868@kroah.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCAxNDIxNi8xNDIxNl0gQUxTQTogdXNiLWF1ZGlvOiBUaGlzIHBhdGNoIGZvciBwcmV2ZW50IGF1dG93YWtldXAgZnJvbSBzMyB0cmlnIGJ5IHVzYiBkaXNjb25uZWN0IHNpZ25hbCBmcm9tIExlbm92byBUaGlua2NlbnRyZVRJMDI0R2VuMyAgVVNCLWF1ZGlvLg==?=
X-Send-Individually: 0
X-Reply-Previous-EmailId: 
X-SENDER-IP: 111.204.108.116
X-Priority: 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?UTF-8?B?YWxzYS1kZXZlbCA=?= <alsa-devel@alsa-project.org>,
 =?UTF-8?B?cGVuZ2hhb0BkZWVwaW4uY29tIA==?= <penghao@deepin.com>,
 =?UTF-8?B?bGludXgta2VybmVsIA==?= <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?dGl3YWkg?= <tiwai@suse.com>,
 =?UTF-8?B?cGh6MDAwOCA=?= <phz0008@163.com>
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

   Thank you for your guidance, I will improve

   ç»ä¿¡è½¯ä»¶ææ¯æéå¬å¸

   UnionTech Software Technology Co., Ltd. ã

   å®ç½ï¼www.uniontech.comãã

   åº§æºï¼+86-10-62669253
   æ¤çµåé®ä»¶æ¶æ¯ä»ä¾é¢ææ¶ä»¶äººä½¿ç¨ï¼å¶ä¸å¯è½åå«ä¿å¯æç¹æä½¿ç¨ä¿¡æ¯ãå¦ææ¨
   ä¸æ¯é¢ææ¶ä»¶äººï¼è¯·å¿ä½¿ç¨ãä¼ æãååæå¤å¶æ¤çµåé®ä»¶æä¿¡èµæ¤é®ä»¶éåä»»ä½è
   ¡å¨ãå¦ææ¨è¯¯æ¶äºæ¤é®ä»¶ï¼è¯·ç«å³åå¤é®ä»¶éç¥ç»ä¿¡è½¯ä»¶ææ¯æéå¬å¸åä»¶äººï
   ¼å¹¶å é¤è¯¯æ¶çµåé®ä»¶åå¶ç¸å³éä»¶ãæè°¢éåï¼
   This email message is intended only for the use of the individual or
   entity who/which is the intended recipient and may contain information
   that is privileged or confidential. If you are not the intended
   recipient, you are hereby notified that any use, dissemination,
   distribution or copying of, or taking any action in reliance on, this
   e-mail is strictly prohibited. If you have received this email in
   error, please notify UnionTech Software Technology  immediately by
   replying to this e-mail and immediately delete and discard all copies
   of the e-mail and the attachment thereto (if any). Thank you.

   From: "Greg KH <gregkh@linuxfoundation.org>"

   To: "penghao <penghao@uniontech.com>"

   CC: "perex <perex@perex.cz>","tiwai <tiwai@suse.com>","alsa-devel
   <alsa-devel@alsa-project.org>","linux-kernel
   <linux-kernel@vger.kernel.org>","phz0008
   <phz0008@163.com>","penghao@deepin.com <penghao@deepin.com>"

   Sent: 2020-07-25 13:48

   Subject: Re: [PATCH 14216/14216] ALSA: usb-audio: This patch for
   prevent autowakeup from s3 trig by usb disconnect signal from Lenovo
   ThinkcentreTI024Gen3  USB-audio.

   On Sat, Jul 25, 2020 at 12:01:55PM +0800, penghao wrote:
   > From: "penghao@deepin.com" <penghao@deepin.com>
   >
   >  TI024Gen3 USB-audio is controlled by TI024Gen3,when TI024Gens
   >  enter sleep mode, USB-audio will disconnect from USB bus port,
   >  so disabled the /sys/bus/usb/*/power/wakeup Fixesimmediately
   >  wakup form s3 state
   Why the indentation?
   >
   > Signed-off-by: penghao@uniontech.com <penghao@uniontech.com>
   > Signed-off-by: penghao@deepin.com <penghao@deepin.com>
   We need a name, not just an email address.
   And where are the 14215 other patches in this patch series?
   > ---
   >  sound/usb/card.c | 7 +++++++
   >  1 file changed, 7 insertions(+)
   >
   > diff --git a/sound/usb/card.c b/sound/usb/card.c
   > index 2644a5ae2b75..969c3809e051 100644
   > --- a/sound/usb/card.c
   > +++ b/sound/usb/card.c
   > @@ -640,6 +640,12 @@ static int usb_audio_probe(struct usb_interface
   *intf,
   >   }
   >   }
   >   dev_set_drvdata(&dev->dev, chip);
   > + /*
   > + * ALSA: usb-audio: Add prevent wakeup from s3 state trig by lenovo
   > + * ThinkCentre TI024Gen3 USB-audio
   > + */
   > + if ((usb_id->idVendor == 0x17ef) && (usb_id->idProduct == 0xa012))
   > + device_set_wakeup_enable(&dev->dev, 0);
   Shouldn't there be a quirk for this type of device that can be used
   instead?
   thanks,
   greg k-h

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8624AF39
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 08:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FAE31678;
	Thu, 20 Aug 2020 08:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FAE31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597904869;
	bh=jBn2drysbD9pWTGWPp/NgsGN+CEn7oYj7CIcxDOyfn8=;
	h=Date:From:To:References:Subject:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NvO8sGSk3itlNcqIs5CIpa5aMvRB3UCH5bY8eK/W4VX+eDA9mlTm3fDMX26BU4/Qx
	 x97/TgSrnfl/uWHByxt3i8l6RNbblFr3CmLmraqPoi8zWJijPHZjp79HQ2VhJ9jZ3U
	 Ka5Gpq4eKrbyydCIX7F+utju7ezu0gJhw0q5mS3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CFBCF800C0;
	Thu, 20 Aug 2020 08:26:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 074CBF800C0; Thu, 20 Aug 2020 08:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.196])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 572FDF800C0
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 08:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 572FDF800C0
Received: from localhost (unknown [192.168.167.247])
 by regular1.263xmail.com (Postfix) with ESMTP id 60FBE15DB;
 Thu, 20 Aug 2020 14:25:41 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from bj-wm-cp-2 (unknown [192.168.166.190])
 by smtp.263.net (postfix) whith ESMTP id
 P7245T139922465859328S1597904741383125_; 
 Thu, 20 Aug 2020 14:25:41 +0800 (CST)
X-UNIQUE-TAG: <81db075b30519433b4c730898f2ee7b0>
X-RL-SENDER: penghao@uniontech.com
X-SENDER: penghao@uniontech.com
X-LOGIN-NAME: wmsendmail@net263.com
X-FST-TO: hui.wang@canonical.com
X-SENDER-IP: 192.168.166.190
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Thu, 20 Aug 2020 14:25:41 +0800 (CST)
From: =?UTF-8?B?5b2t5rWp?= <penghao@uniontech.com>
To: =?UTF-8?B?SHVpIFdhbmcg?= <hui.wang@canonical.com>, 
 =?UTF-8?B?S2FpLUhlbmcgRmVuZyA=?= <kai.heng.feng@canonical.com>, 
 =?UTF-8?B?VGFrYXNoaSBJd2FpIA==?= <tiwai@suse.de>
Message-ID: <665369453.1023613.1597904741338.JavaMail.xmail@bj-wm-cp-2>
References: <20200819115757.23168-1-penghao@uniontech.com>
 <s5h364ih7vd.wl-tiwai@suse.de>
 <74B3A9AD-8B49-4E5F-BE9F-BF88865304B7@canonical.com>, 
 <fdd0d029-d7b5-ff43-5f84-9d73de867bca@canonical.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gQUxTQTogdXNiLWF1ZGlvOiBBZGQgcHJldmVudCB3YWtldXAgZnJvbSBzMyBzdGF0ZSB0cmlnIGJ5TGVub3ZvIFRoaW5rQ2VudHJlIFRJMDI0R2VuMyBVU0ItYXVkaW8=?=
X-Send-Individually: 0
X-Reply-Previous-EmailId: 
X-SENDER-IP: 124.126.19.250
X-Priority: 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?UTF-8?B?bW9kZXJhdGVkIGxpc3Q6U09VTkQg?= <alsa-devel@alsa-project.org>,
 =?UTF-8?B?Y3J3dWxmZiA=?= <crwulff@gmail.com>,
 =?UTF-8?B?bGludXgta2VybmVsIA==?= <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?Z3VzdGF2b2FycyA=?= <gustavoars@kernel.org>,
 =?UTF-8?B?YWxleGFuZGVyIA==?= <alexander@tsoy.me>,
 =?UTF-8?B?ZGFuLmNhcnBlbnRlciA=?= <dan.carpenter@oracle.com>,
 =?UTF-8?B?TWFyayBQZWFyc29uIA==?= <mpearson@lenovo.com>
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

   hi Hui Wang

    Lt is Lenovo A630z TIO built-in usb sound card,

   Thanks,

   penghao


   ç»ä¿¡è½¯ä»¶ææ¯æéå¬å¸

   UnionTech Software Technology Co., Ltd. ã

   å®ç½ï¼www.uniontech.comãã

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



   From: "Hui Wang <hui.wang@canonical.com>"

   To: "Kai-Heng Feng <kai.heng.feng@canonical.com>","Takashi Iwai
   <tiwai@suse.de>"

   CC: "moderated list:SOUND <alsa-devel@alsa-project.org>","penghao
   <penghao@uniontech.com>","linux-kernel
   <linux-kernel@vger.kernel.org>","crwulff
   <crwulff@gmail.com>","gustavoars <gustavoars@kernel.org>","alexander
   <alexander@tsoy.me>","Mark Pearson
   <mpearson@lenovo.com>","dan.carpenter <dan.carpenter@oracle.com>"

   Sent: 2020-08-20 09:42

   Subject: Re: [PATCH] ALSA: usb-audio: Add prevent wakeup from s3 state
   trig byLenovo ThinkCentre TI024Gen3 USB-audio

   On 2020/8/20 ä¸å2:10, Kai-Heng Feng wrote:
   >
   >> On Aug 20, 2020, at 01:18, Takashi Iwai <tiwai@suse.de> wrote:
   >>
   >> [ Adding a few more relevant people to Cc. ]
   >>
   >> On Wed, 19 Aug 2020 13:57:57 +0200,
   >> penghao wrote:
   >>> TI024Gen3 USB-audio is controlled by TI024Gen3,when TI024Gens
   >>> enter sleep mode, USB-audio will disconnect from USB bus port,
   >>> wakup form s3 state
   >>>
   >>> Signed-off-by: penghao <penghao@uniontech.com>
   >>> ---
   >>> sound/usb/card.c | 6 ++++++
   >>> 1 file changed, 6 insertions(+)
   >>>
   >>> diff --git a/sound/usb/card.c b/sound/usb/card.c
   >>> index 696e788c5d31..6bdbb34009b3 100644
   >>> --- a/sound/usb/card.c
   >>> +++ b/sound/usb/card.c
   >>> @@ -658,6 +658,12 @@ static int usb_audio_probe(struct
   usb_interface *intf,
   >>> }
   >>>
   >>> dev_set_drvdata(&dev->dev, chip);
   >>> + /*
   >>> + *ALSA: usb-audio: Add prevent wakeup from s3 state trig by Lenovo

   >>> + *ThinkCentre TI024Gen3 usb-audio
   >>> + */
   >>> + if ((usb_id->idVendor == 0x17ef) && (usb_id->idProduct ==
   0xa012))
   >>> + device_set_wakeup_enable(ï¼dev->dev, 0);
   >> Here it's no proper ASCII letter, and this must be broken.
   >> Please check the actual patch before submitting.
   >>
   >> In anyway, before going further, I'd like to hear from other people

   >> whether this is really mandatory and appropriate. And whether it's
   >> specific to that device, too (not other Lenovo devices?)
   > If USB remote wakeup on this device is broken then we need to fix it
   in USB core instead of USB audio.
   > We need USB and xHCI logs to understand the real problem here, the
   commit message doesn't contain enough information.
   >
   > Kai-Heng

   I checked with our QA, we didn't enable this machine before.  And I
   tried 2 different usb audio cards, neither of them has wakeup
   capability. it is weird that your usb sound card (maybe a built-in usb

   sound card) has wakeup capability.

   You could file a bug to
   [1]https://bugs.launchpad.net/ubuntu/+source/linux/+filebug, then
   upload
   the needed logs,  Kai-Heng and I will help investigate this issue.

   Thanks,

   Hui.

   >>
   >> thanks,
   >>
   >> Takashi

References

   1. https://bugs.launchpad.net/ubuntu/+source/linux/+filebug,

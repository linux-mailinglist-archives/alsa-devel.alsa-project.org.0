Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4D105B5B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 21:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E34217BA;
	Thu, 21 Nov 2019 21:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E34217BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574369531;
	bh=xgkb7/ai4uPO9sbc71FbE1aGSRoQSFGNrZ9/aOLx4KM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdmoJRC2Vr/HtUlDj36sSB8uMcwFHCH3i1UCdNFZ3Xcl9MzlPwTHvu9Aqr9Pa7sxk
	 dXwtH0oJONHl0UKUq1RAwVbq2M0xAos0SJH6CtwJpz+xtwjXYj/BgbVQBF8H7DOx5t
	 aS4ErhynDLC3FUR4RVmjrIlymSYqONNaDJ0VPBzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D4FF80147;
	Thu, 21 Nov 2019 21:50:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98BFF80146; Thu, 21 Nov 2019 21:50:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SORTED_RECIPS,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14846F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 21:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14846F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="sRJg4b6j"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xALKnNGp101533;
 Thu, 21 Nov 2019 20:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=JqMqk6Pam98kfZFKlDoAMn1so5XjHeYutDiswf96RFU=;
 b=sRJg4b6jEE3FX2oCNtwZ3h7BrtDVOvdJXXXsQzMgYNFaT4KkWQQZBvCr16tl3uDvg3QL
 hbUZIinoXwIE7c9h1GLbhs0NmFIgSikwqy1uesZmB2XfjcW9Q+bzTywvrhIYVC7Pov1m
 KYjCQ3fvDcl3ETtHADppgN1sJjOjAfudpFle9vKC7IFdZBGj/1rhnlrYdiAl8Q+OEwlc
 oW696zYDYubgmamGDUGG6FjQOBkZ2X6g0XvAgaRPXkCfldVTawfPvEE+zL/OOiyo+Vbo
 4vwStNp3RSACWtqoUgag2JAo5RCGXT5Uny8+F7rnqlKIgy+hCaQxW9g0kLR5Jc0egKBb Rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2wa92q6uu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 20:50:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xALKiT7a129317;
 Thu, 21 Nov 2019 20:50:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2wd4700v9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 20:50:15 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xALKo7PE022130;
 Thu, 21 Nov 2019 20:50:11 GMT
Received: from kadam (/41.210.146.123) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 21 Nov 2019 12:50:07 -0800
Date: Thu, 21 Nov 2019 23:49:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: syzbot <syzbot+a36ab65c6653d7ccdd62@syzkaller.appspotmail.com>
Message-ID: <20191121204956.GE617@kadam>
References: <0000000000002129080597dce70d@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000002129080597dce70d@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911210173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9448
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911210174
Cc: alsa-devel@alsa-project.org, g@b4.vu, andreyknvl@google.com,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 benquike@gmail.com, wang6495@umn.edu
Subject: Re: [alsa-devel] general protection fault in snd_usb_create_mixer
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

On Thu, Nov 21, 2019 at 07:25:09AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    46178223 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=176f9836e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
> dashboard link: https://syzkaller.appspot.com/bug?extid=a36ab65c6653d7ccdd62
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1447d3bae00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ef3a86e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+a36ab65c6653d7ccdd62@syzkaller.appspotmail.com
> 
> usb 1-1: 208:241 : does not exist
> usb 1-1: 208:242 : does not exist
> usb 1-1: 208:243 : does not exist
> usb 1-1: 208:244 : does not exist
> usb 1-1: 208:245 : does not exist
> usb 1-1: 208:246 : does not exist
> usb 1-1: 208:247 : does not exist
> usb 1-1: 208:248 : does not exist
> usb 1-1: 208:249 : does not exist
> usb 1-1: 208:250 : does not exist

These error messages are because:

sound/usb/card.c
   128  static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int interface)
   129  {
   130          struct usb_device *dev = chip->dev;
   131          struct usb_host_interface *alts;
   132          struct usb_interface_descriptor *altsd;
   133          struct usb_interface *iface = usb_ifnum_to_if(dev, interface);
   134  
   135          if (!iface) {
   136                  dev_err(&dev->dev, "%u:%d : does not exist\n",
   137                          ctrlif, interface);
   138                  return -EINVAL;
   139          }

"iface" is NULL.  The caller ignores the -EINVAL (correctly I think).

Then the NULL dereference happens in snd_usb_mixer_controls_badd()

sound/usb/mixer.c
  2903  static int snd_usb_mixer_controls_badd(struct usb_mixer_interface *mixer,
  2904                                         int ctrlif)
  2905  {
  2906          struct usb_device *dev = mixer->chip->dev;
  2907          struct usb_interface_assoc_descriptor *assoc;
  2908          int badd_profile = mixer->chip->badd_profile;
  2909          struct uac3_badd_profile *f;
  2910          const struct usbmix_ctl_map *map;
  2911          int p_chmask = 0, c_chmask = 0, st_chmask = 0;
  2912          int i;
  2913  
  2914          assoc = usb_ifnum_to_if(dev, ctrlif)->intf_assoc;
  2915  
  2916          /* Detect BADD capture/playback channels from AS EP descriptors */
  2917          for (i = 0; i < assoc->bInterfaceCount; i++) {
  2918                  int intf = assoc->bFirstInterface + i;
  2919  
  2920                  struct usb_interface *iface;
  2921                  struct usb_host_interface *alts;
  2922                  struct usb_interface_descriptor *altsd;
  2923                  unsigned int maxpacksize;
  2924                  char dir_in;
  2925                  int chmask, num;
  2926  
  2927                  if (intf == ctrlif)
  2928                          continue;
  2929  
  2930                  iface = usb_ifnum_to_if(dev, intf);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
iface is not checked.

Should it be "if (!iface) continue;?"

  2931                  num = iface->num_altsetting;
  2932  
  2933                  if (num < 2)
  2934                          return -EINVAL;
  2935  

I'm not sure.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

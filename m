Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98A3A012E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 21:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B48A178C;
	Tue,  8 Jun 2021 21:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B48A178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623179096;
	bh=+oH+LN155SfdhgY1iOP3phsvvk1fC3ROVhpbGKGcMt4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RhW/8qytkO+RM6h+OtBAFC2aY6Ssy3PyEMOnbwuZoHRM9EdEA/p4KRvEpupK0B3vr
	 pJS2PIQnp40kNP0om9y9ZGIq0IknzazlIi6M5HsjhM41yVJvuWaI3pTRYBbePD0BOJ
	 mIalrUVRO5To/wuf/HyG6fU3MvkO3nCYFzDtbxQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA817F8019B;
	Tue,  8 Jun 2021 21:03:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA01F80218; Tue,  8 Jun 2021 21:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40685F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 21:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40685F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="rVqFouYN"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 158IxN0B162782;
 Tue, 8 Jun 2021 19:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=j0df0DsrgRK7rP6JHcazLasTnvwUHJCMSdLsmrSBdIk=;
 b=rVqFouYN60CwGQkp7fs6kUgDEGtBdQ9jeoG2pRCbFonNsae3zYGuyEwAmrfx+4mOrzqT
 pFaJiyTRu/3n+fmllORPO1OgWqlQvy+hwsW/5zGcRFlPPIIMQaOMmezmdoCfgPfvCtuP
 rawreV/g9QrNIkXDy6C6xBNE30NOLDi/hU0J0Z1b6oMhAbm6lT1JKnyxFs2QTH8KBbIH
 dN3i6eJ3ECwj2aDdA+IbUTCqevlNHIcywqCUvEzP5VaVJyarpBoieOpJqAhxaQOKeHxT
 PJIIXioNiTkDf4YA3Vw/0tECqibDhxdavPiDrgdKh3mGDVb8rF25mggK73ckvvi5M4Lo lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 38yxscf4ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Jun 2021 19:03:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 158J0NqW106820;
 Tue, 8 Jun 2021 19:03:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38yxcux454-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Jun 2021 19:03:19 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 158J3I94111295;
 Tue, 8 Jun 2021 19:03:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 38yxcux44m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Jun 2021 19:03:18 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 158J3FGA008601;
 Tue, 8 Jun 2021 19:03:18 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Jun 2021 19:03:15 +0000
Date: Tue, 8 Jun 2021 22:03:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [bug report] media: sound/usb: Use Media Controller API to share
 media resources
Message-ID: <20210608190309.GJ10983@kadam>
References: <YLeAvT+R22FQ/Eyw@mwanda>
 <3c0f6858-ca94-3cd9-7398-20073dfff7b0@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c0f6858-ca94-3cd9-7398-20073dfff7b0@linuxfoundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: ZsybVIvGloSWrv07uGNaO6QeClWWOCvp
X-Proofpoint-GUID: ZsybVIvGloSWrv07uGNaO6QeClWWOCvp
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10009
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106080123
Cc: alsa-devel@alsa-project.org, shuah@kernel.org
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

On Tue, Jun 08, 2021 at 11:53:53AM -0600, Shuah Khan wrote:
> On 6/2/21 6:59 AM, Dan Carpenter wrote:
> > Hello Shuah Khan,
> > 
> > The patch 66354f18fe5f: "media: sound/usb: Use Media Controller API
> > to share media resources" from Apr 1, 2019, leads to the following
> > static checker warning:
> > 
> > 	sound/usb/media.c:287 snd_media_device_create()
> > 	warn: 'mdev' can also be NULL
> > 
> > sound/usb/media.c
> >     270
> >     271          mdev = media_device_usb_allocate(usbdev, KBUILD_MODNAME, THIS_MODULE);
> >                  ^^^^
> > 
> > If CONFIG_MEDIA_CONTROLLER is disabled then "mdev" is NULL.
> 
> If CONFIG_MEDIA_CONTROLLER is disabled, this file won't be compiled.
> Please see below clause in the Makefile.
> 
> sound/usb/Makefile:
> snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
> 
> Also, this select in sound/usb/Kconfig selects appropriate
> configs.
> 
> select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
> (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)
> 
> We are good here with the above in place to make sure media.c
> code isn't in play when CONFIG_MEDIA_CONTROLLER is disabled.

Smatch is working based on a real .config but I misunderstood the
problem.

include/media/media-dev-allocator.h
    21  
    22  #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
                                                ^^^^^^^^^^^^^^^^^^^
When I have CONFIG_USB=m then this is false, but when I use CONFIG_USB=y
then this is true.  I'm not an expert on the kernel build system so I
can't explain why defined() is not working as expected but I know that
if we used IS_ENABLED(CONFIG_USB) that would work.

#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER) && IS_ENABLED)CONFIG_USB)

    23  /**
    24   * media_device_usb_allocate() - Allocate and return struct &media device
    25   *
    26   * @udev:               struct &usb_device pointer
    27   * @module_name:        should be filled with %KBUILD_MODNAME
    28   * @owner:              struct module pointer %THIS_MODULE for the driver.
    29   *                      %THIS_MODULE is null for a built-in driver.
    30   *                      It is safe even when %THIS_MODULE is null.
    31   *
    32   * This interface should be called to allocate a Media Device when multiple
    33   * drivers share usb_device and the media device. This interface allocates
    34   * &media_device structure and calls media_device_usb_init() to initialize
    35   * it.
    36   *
    37   */
    38  struct media_device *media_device_usb_allocate(struct usb_device *udev,
    39                                                 const char *module_name,
    40                                                 struct module *owner);

regards,
dan carpenter


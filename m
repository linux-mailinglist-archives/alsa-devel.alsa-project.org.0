Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B0365146
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 06:22:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC0C1680;
	Tue, 20 Apr 2021 06:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC0C1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618892569;
	bh=mT1P/0V1Kk7Ha+oRfnhOKkK5dIIkfFW7uxOgrol6ItI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7C/ZWOUoT+fSjD4UCPkFzRB+XVJWXvx1nJ74B+P8EqnzgWiY8ZP6Yd1pUiGjJ1fX
	 MOXTRyxytGTzAAqvCBMvO1R/DfPnGswFMQmXW0tj5P1XjanGWuuGSb7/1IavGQsbno
	 e+LV5kfymXWKjR9eV5RytcQH88daics8W9KCdYho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB41F80168;
	Tue, 20 Apr 2021 06:21:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E9DF80253; Tue, 20 Apr 2021 06:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_21,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44483F80164
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 06:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44483F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tYBKjmRD"
Received: by mail-ed1-x532.google.com with SMTP id g17so42649967edm.6
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 21:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhORXXZw6vekyF5rkC7bo+EF81jvGX9SqWkbSqZ6Q7A=;
 b=tYBKjmRD4tR98rZzVQSbZI8HmElVSTX4zk4+xCl8x5XQ7pn0aH/K6HZbGmiT9poIPy
 17Qydqla9egDucm4QcZjh85IystTbuojBLXG0w1p3pVI0+r1lIH0/XJr7PymeKmx/Pxv
 Iz9cnP+1s8lBUQrrE8I4jBkbquRQUS+LioT7D8+ehqI+vYS0MUI5zF8BkDYFU2amTqLN
 6lFv+sJ46jCq2k6UTDaRj82lX7ssq/cKoaTDAzaAAb5JPSstnyUpakdEspyU3fO3PQdy
 wZ43XBPnh6yZiFwtCObbaJ0OqieB72v31ARx5JEAeL3qIa4g/10GZ/+32C8Te3vZm+a2
 OtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhORXXZw6vekyF5rkC7bo+EF81jvGX9SqWkbSqZ6Q7A=;
 b=clMJJ1ECuCAdz4G/objBDmO11MzZ1dYWZaE6NCMsltxmcfrn7CZXuuv3GOY3EFA8KW
 /vI9jvhGWmiztx6DzgdtDxs2hMJbCRoaToDp9rF0200m2dkF+gpLqSFyuvevekn73dCf
 b5Rq17DVhvMhiAL9TYHNkk8oOUxJOEE3RzmXFlnfZPNXu23oeCVCLdoiKVvxK5AQw/Nk
 DvWoqLlJ1/yR1x6YDgLMSvxa46p9noTsheXcyUurEaaVKUjqqdurD1ii7y5J4X9JGzWq
 XMCTsTw5Piv5TqPWPABFwYtbHdecd+akA9yGJGXqVPhs9/NWtZ/9kzAY0Ljr1RqFKEGN
 LSqA==
X-Gm-Message-State: AOAM531Xvm2+pPoF6AwbYyxW8VIbhcXopvYSYuWCeIIJXKjPNOHlxVFV
 3Eg9LzC1l868gEr/5x/mc53mQazgv5e2H81qRa/tMm9CkhY=
X-Google-Smtp-Source: ABdhPJyRS3BRLvFvwgOkRNA1lWbeKM3IVdIa8mx9KbSkxneiGEssQgFuVl2VlYVgfjkbdyqBvoBijx1R/CB+9GI70Ds=
X-Received: by 2002:a05:6402:1cb9:: with SMTP id
 cz25mr17505791edb.163.1618892469007; 
 Mon, 19 Apr 2021 21:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
 <5949663.lOV4Wx5bFT@kam-desktop>
In-Reply-To: <5949663.lOV4Wx5bFT@kam-desktop>
From: Lucas <jaffa225man@gmail.com>
Date: Mon, 19 Apr 2021 23:20:57 -0500
Message-ID: <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: "Keith A. Milner" <maillist@superlative.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Keith, if it's anything like the Roland devices I've tested with this
long-awaited patch, could you show the JS-8's "lsusb -v"?

For me, silence due to the wrong line takes the form of unheard output
playback, while still working for input capture, so I'm not sure this has
any bearing on your issue.

Takashi Iwai has indicated a likely connection between needing the
IMPLICIT_FB_BOTH_DEVICE line if there's "Asynchronous" "Synch Type" for
both input and output endpoints.  Otherwise, possibly, it should be
reverted to IMPLICIT_FB_FIXED_DEVICE for the JS-8.

I did check my Roland devices with jack, but only after they were all
working with standard arecord and aplay.

Thanks,

  Lucas

On Mon, Apr 19, 2021 at 9:13 AM Keith A. Milner <maillist@superlative.org>
wrote:

> On Wednesday, 14 April 2021 16:08:54 BST Mike Oliphant wrote:
> > Thanks for your help with this, Takashi.
> >
> > I have tested this patch on BOSS GT-1 and BOSS Katana, so we have a
> fairly
> > high degree of confidence that it will work on the other BOSS devices.
> >
> > It may well help with other similar Roland devices. If your device has
> > playback working, but with occasional pops/clicks in the audio stream, it
> > is worth trying to add the IMPLICIT_FB_BOTH_DEV quirk for the device.
> >
>
> I have confirmed that it works with the GT-1 and Boss Katana as well.
>
> I have also tested with the Boss BR-80 and GT-001 and this still seems to
> work
> well for me, so no obvious issues have arisen from making this change.
>
> I did also try the Boss JS-8. This works in Ardour, but capture from
> command
> line using arecord results in a file of silence. I'll do some more digging
> into
> this one.
>
> Regards,
>
> Keith
>
>
>
>
>

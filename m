Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62652158DF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39A51891;
	Tue,  7 May 2019 07:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39A51891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206553;
	bh=svau/QuiQOpMD7AjOn0Wt8QSk96jzUSbzO8plAwbny0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7fx5ObWgMaFIvK8UsbroY5cGXQQT5kJCK8EKhyqU/U5yR+KWnQUXb0NsFVOoQ7s1
	 9Ps+UbP49geCSrlJDfWJlMglI5iU0/V0dwAbO9GFqhsoV2dxFB9XAXgF9TqyVWeRgi
	 WlFr1G0lma3Wl0GqHNPWtN0xqyoDT+oqJvFyrcEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2111EF896DA;
	Tue,  7 May 2019 07:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0916F896E6; Mon,  6 May 2019 11:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CC3F8963C
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CC3F8963C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YiczZxhl"
Received: by mail-pl1-x641.google.com with SMTP id a5so1100836pls.12
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zkFvMfXSuPxA7TswP4qZ+QIZKRpTzLAUwlBxIZ9PzU=;
 b=YiczZxhl+N5iLdzUGTmZ+vv61ahbfT5sYkO+ZKl1O183V89+BhJz/LVCYZW69Rs96I
 B9L09hT9RKBTMzQPy68tiva/wZUTF1HeqiQA0wgIQKQi9hc9wauqzRc3OKkCm1b+45xD
 /TIxR7gFTxFuR4TGryfYzNp53n1d0MoSOlSKqUI1PygQXIr4DIq/BsZfwXixIBOH9ZxQ
 yFa4fMS2Zky76vcoykF14xxJXsTp6HA89kojG6J76npL+WXgKQ2KtB8ZUuikGBrAHTkD
 gd51bYyzDfYbsyUC+pmkXYFFrzi2nJRQ6fAyiK8dpDyV02X1sRuhxEHafOiBQ4LbnHZJ
 uFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zkFvMfXSuPxA7TswP4qZ+QIZKRpTzLAUwlBxIZ9PzU=;
 b=YQ/xo5mN41u5cPps6nJz8lDhhIZBg2GgpWknzU5vdCTwJ76w1RSZvaUV8CVd6+niMm
 wn8a5KzzvYjNwbrp44HMRnBgkJD2U+Vmc3wXoI0qFXG4OTcELuhH3dilgRHmd0FUJ2Ny
 7n3ROc5yCFvDudz8Myj3rhsSJNnmp4vcydFD7i9+pPIUeshN+26aryYEM7IlLDytO9Yy
 l/Rd5FZapEGd+zUSaYwmH0EwoWg5Zl8am7B0MI5DCaj+qM4Ny0qsvx9K1p8s0jZa+wMO
 mniClQEk5L4XI3HySSmg00eHt/tI9UhoOQFjU7xuaET2YMLPkJCJWhbiDYRQSr03oZ9K
 IrNQ==
X-Gm-Message-State: APjAAAU2oHLkgGkIIYrJRHNACLJwnuhZhmrvSTzIbVF+flb/MI/b8zRp
 LSiabGesGY+QLhZjiilCJsOGW8AVUNghCmbRv84=
X-Google-Smtp-Source: APXvYqzcd/LiJVbbE8cCf+fOVIBhczP6XN4ND6V/1pkV1QnBDFee3E6dAicqEB0BMR5uY867+F0seVXH98gF0RaaX4M=
X-Received: by 2002:a17:902:8349:: with SMTP id
 z9mr30421370pln.144.1557133433288; 
 Mon, 06 May 2019 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2019 12:03:42 +0300
Message-ID: <CAHp75Vc2-zzRYk0vpdPQm5duZwW+v=svEndTPV4Sr59QrGcMHg@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:44 +0200
Cc: Linux NVMe Mailinglist <linux-nvme@lists.infradead.org>,
 linux-iio <linux-iio@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 linux-ide@vger.kernel.org,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 sparclinux@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-scsi <linux-scsi@vger.kernel.org>, linux-bluetooth@vger.kernel.org,
 y2038@lists.linaro.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-input <linux-input@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, linux-ppp@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 00/26] compat_ioctl: cleanups
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

On Tue, Apr 16, 2019 at 11:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Hi Al,
>
> It took me way longer than I had hoped to revisit this series, see
> https://lore.kernel.org/lkml/20180912150142.157913-1-arnd@arndb.de/
> for the previously posted version.
>
> I've come to the point where all conversion handlers and most
> COMPATIBLE_IOCTL() entries are gone from this file, but for
> now, this series only has the parts that have either been reviewed
> previously, or that are simple enough to include.
>
> The main missing piece is the SG_IO/SG_GET_REQUEST_TABLE conversion.
> I'll post the patches I made for that later, as they need more
> testing and review from the scsi maintainers.
>
> I hope you can still take these for the coming merge window, unless
> new problems come up.

>  drivers/platform/x86/wmi.c                  |   2 +-

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

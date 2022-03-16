Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BE4DBFF0
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD56190B;
	Thu, 17 Mar 2022 08:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD56190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500654;
	bh=TSNR/AVXv0z8By2JiHvGWs2VPTR7+C1JzIsgvTWWeaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yc+sd4MpMVTDtAkakQR1HDYwPQ6/Wya5+JUQYdcj34TGmMeJcBlfvD9yR5P34eYAG
	 LSxgMo9P0nZTSCe2slcBYnkd8NjSaQ0qOoAwb2sWWFphv8MrtAXY0sMgFTv+lmI/XS
	 KoNGBuCcoOpJKGM6dImzAoEkuOyOvtAG7FeWdMqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC4BF805EF;
	Thu, 17 Mar 2022 07:55:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D8B8F80084; Wed, 16 Mar 2022 16:55:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE19AF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE19AF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ThLCeQCL"
Received: by mail-ej1-x631.google.com with SMTP id bg10so5149159ejb.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xrv4PFSyhAtwnCAL/pjWyzmn6e9Q3pw3qGeeMjVLkWc=;
 b=ThLCeQCLe60XloIENcKZTLtoa92AsszbMGtlE1VP85Nj8ONYeGAtPtd3THFkwuE1R4
 Rb+p8levz1Kkk/esESpsWOOce4y/GAs3zE/h/Iq8JTZadMNMhSzoXuCsi65zQcSj9uj9
 roUu7BL6G2KSrbQdMUcXxa1eBfn7GLPhFdgtrRtKQ1B6XjhvDCk1M6WlSKyn57HnuVDa
 81Zd+YwZwjEFy9IgsZIWqi9+OJ0hcLCs/C3anzU5mAn4GgUA+5ei9x+U8aPDc4PlCURW
 8DQSGQ08z9c9bhp4uK79m+ecf2bqZ6sdte5Pd0FZyKDC2WwgAQ/cfFk5gcysCgAmWYjH
 wmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xrv4PFSyhAtwnCAL/pjWyzmn6e9Q3pw3qGeeMjVLkWc=;
 b=VqJouvyKP4mC3Y9fPmhKM/XyUfIruey4OZDD1gRfUoEtoeWly3VkVI6YZoo9oVka02
 lhNo3A4yC6wEdYHSdpR7Yvs0PFWnYQqeu9MGTTD6/1vAZ+a4wgaWyKSTk9r8yP+/XmWY
 r8mA/o2iBObl9b645WnSm3q3bdOJScJD2w4VfA63mqNvmeuboq8a2LEalzStjgjgdAEW
 gwLTgvc1rOys7tNnJC/bruafKJLcFFz+kosqbO4eO9OvLxLr3vOVdSHg1EzesnJrIpru
 rA6kl18al0VU9qnMBh2dqYIoVUUSl/pzrmKF5p7xlDynYUkTP30t9TMi4dNOKZuA0Fi2
 04Eg==
X-Gm-Message-State: AOAM533ey6IseI9pIQf/hQMqzBGP30s/B/LyRGy2kKPGUiAwD0TAMDs9
 9DAQq38/P/IRy0FJvndPhTsq33prwHiiLw0mUbVmAS6gD+19/w==
X-Google-Smtp-Source: ABdhPJx7tfhflG1OGwg4hJv+lc6fCCCsMyBIcaeP4g7aVOZtvesN3U3Aevmj9sLhxYjH7UWlro+fkCpgMa2F3+GK74E=
X-Received: by 2002:a17:907:6e01:b0:6d0:562c:e389 with SMTP id
 sd1-20020a1709076e0100b006d0562ce389mr499870ejc.497.1647446118072; Wed, 16
 Mar 2022 08:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
 <20220316150533.421349-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316150533.421349-2-krzysztof.kozlowski@canonical.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 Mar 2022 17:54:04 +0200
Message-ID: <CAHp75VeaQdzUKJSKzH9FjbmON5asqH799AS8OzHGoDiRnJifNw@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] driver: platform: Add helper for safer setting
 of driver_override
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Wed, Mar 16, 2022 at 5:06 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

...

> +int driver_set_override(struct device *dev, const char **override,
> +                       const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;

> +       if (!dev || !override || !s)
> +               return -EINVAL;

Sorry, I didn't pay much attention on this. First of all, I would drop
dev checks and simply require that dev should be valid. Do you expect
this can be called when dev is invalid? I would like to hear if it's
anything but theoretical. Second one, is the !s requirement. Do I
understand correctly that the string must be always present? But then
how we NULify the override? Is it possible? Third one is absence of
len check. See below.

> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;

I would relax this to make sure we can use it if \n is within this limit.

> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);

Here is a word about the len check.

> +       if (!new)

If len == 0, this won't trigger and you have something very
interesting as a result.

One way is to use ZERO_PTR_OR_NULL() another is explicitly check for 0
and issue a (different?) error code.

> +               return -ENOMEM;
> +
> +       device_lock(dev);
> +       old = *override;
> +       if (cp != s) {
> +               *override = new;
> +       } else {
> +               kfree(new);
> +               *override = NULL;
> +       }
> +       device_unlock(dev);
> +
> +       kfree(old);
> +
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko

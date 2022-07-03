Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BAA56538C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A2E7176B;
	Mon,  4 Jul 2022 13:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A2E7176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934365;
	bh=0g1yMbWSv5El5C5U8eKMjmTTQ/CIiD+fZQkvaxYlrMo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3HQssWXSwyl3E7f8JmGI08fvUOMSWT6x3vBxjIeoRfP5KPnPauW5KftOLNINV5jI
	 oXsihHBnwCB+NhMWRl+f2EFYjCifvSy4B8oWaAQS1EjzQR+YAd8T4NvqcWLzpTPllh
	 v7P6YCnub25c1X7wCF5vNb02oQHdtskOtN6epB6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 775DEF8060A;
	Mon,  4 Jul 2022 13:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A32E7F80249; Sun,  3 Jul 2022 05:26:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7388F8014E
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 05:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7388F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Augt3VIV"
Received: by mail-pj1-x1033.google.com with SMTP id ju17so1123580pjb.3
 for <alsa-devel@alsa-project.org>; Sat, 02 Jul 2022 20:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/LE3/OvnxwC10hHaqp2JoOJSN7rfZOpUu2WCyCiyCz4=;
 b=Augt3VIV/iWcoU+DHx6Yl7vroOm9Hwz+XtZe2jvyXkhsx95p/JLAo0xcEd6ix1ZIVf
 qIfg68MUyw+xLjl2gBsPYsbv6l3jY94RzOJD92gb6rxdLTyy5Av/dXPYvA/EXIhLOtLz
 svOqPB75mbgpDTnbuNTXc8rdS2DrehpRBgIiYcfLEACt56jQqPD4OYEXOr+iSon97xBH
 KYxD4XfgTiHC/xmDNEPOFfPpT2EHhts4G6H0Pm0fJr3aoQ7VOuwkBeKtFwd1B4K1k9D/
 GdNdQLrWNIKMTC9YgyvhuIjL+GirhGz9Rbn2DEPjhAWabLVNFd+wt0MxRzds1x2rF4/L
 8aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/LE3/OvnxwC10hHaqp2JoOJSN7rfZOpUu2WCyCiyCz4=;
 b=dJ4sdfEKjZZ3vF5KlR3kKRXl4C2LwzsxwhJ5NySlz8Lu3FATRp4I1KS7S1NKLHfNq4
 SFJiLn179WTK64JTr8gjNKWr6q2X9WJBQAg2yMucO4d5jDUpFEZSYCWqiVmVXtBqfUT4
 aSErpYUC8vKKlawvj9/OUHLlSnW+tFI59yrh+q6QWBOKjEH4A5xhT8S+mSVL5Pw/fNPl
 smIDUr2/AOHTgD+bfw5GTKgY8q/+j65WSNW6H0KPW7QD4KmjqgfG4ZZ5wr0PIc0NUzQr
 ESVbclnMBiNsHmTKx2h7T1+ce4MIhOpERlc/0lD4BAiL14JzoAclrJmUczy/XbOy5qqp
 tyag==
X-Gm-Message-State: AJIora/80SWgazuZnoQMtaVXquU0IL8/bo7keU3wEgETTy0cgOeJEe2t
 RRzKGhXx4EBRH6La/n453xyPWgWJGJ6Hig==
X-Google-Smtp-Source: AGRyM1v/qGK0NX2/G7uiSvuhmywhBxQ+rRzGPCB7tQOWN8p4Gfx3qW4Qvkfllc0ImMReMYjkXPk5jA==
X-Received: by 2002:a17:903:2c6:b0:16a:276a:ad81 with SMTP id
 s6-20020a17090302c600b0016a276aad81mr29074812plk.65.1656818782428; 
 Sat, 02 Jul 2022 20:26:22 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-33.three.co.id. [116.206.28.33])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a170902e81100b0016a0db8c5b4sm1866809plg.156.2022.07.02.20.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:26:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id EA78810390C; Sun,  3 Jul 2022 10:26:16 +0700 (WIB)
Date: Sun, 3 Jul 2022 10:26:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 00/12] Fix several documentation build warnings with
 Sphinx 2.4.4
Message-ID: <YsEMWDYCdjxiUZ1P@debian.me>
References: <cover.1656759988.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1656759988.git.mchehab@kernel.org>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Gwendal Grignou <gwendal@chromium.org>, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-pci@vger.kernel.org,
 Brendan Higgins <brendanhiggins@google.com>, alsa-devel@alsa-project.org,
 dm-devel@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-kselftest@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-tegra@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Eric Dumazet <edumazet@google.com>, Dipen Patel <dipenp@nvidia.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
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

On Sat, Jul 02, 2022 at 12:07:32PM +0100, Mauro Carvalho Chehab wrote:
> This series is against next-20220701. It fixes several warnings
> that are currently produced while building html docs.
> 
> Each patch in this series is independent from the others, as
> each one touches a different file.
> 
> Mauro Carvalho Chehab (12):
>   docs: ext4: blockmap.rst: fix a broken table
>   docs: tegra194-hte.rst: don't include gpiolib.c twice
>   docs: device-mapper: add a blank line at writecache.rst
>   docs: PCI: pci-vntb-function.rst: Properly include ascii artwork
>   docs: PCI: pci-vntb-howto.rst: fix a title markup
>   docs: virt: kvm: fix a title markup at api.rst
>   docs: ABI: sysfs-bus-nvdimm
>   kunit: test.h: fix a kernel-doc markup
>   net: mac80211: fix a kernel-doc markup
>   docs: alsa: alsa-driver-api.rst: remove a kernel-doc file
>   docs: arm: index.rst: add google/chromebook-boot-flow
>   docs: leds: index.rst: add leds-qcom-lpg to it
> 

Hi Mauro,

Thanks for cleaning up these warning above. However, I have already
submitted some of these cleanups (pending reviews or integration):

[1]: https://lore.kernel.org/linux-doc/20220702042350.23187-1-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/linux-doc/20220612000125.9777-1-bagasdotme@gmail.com/
[3]: https://lore.kernel.org/linux-doc/20220627095151.19339-1-bagasdotme@gmail.com/
[4]: https://lore.kernel.org/linux-doc/20220627082928.11239-1-bagasdotme@gmail.com/

There's still a warning left:

Documentation/ABI/testing/sysfs-bus-iio-sx9324:2: WARNING: Unexpected indentation.

But I think the Date: field that triggered the warning above looks OK.

Regardless of that, the build successed.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

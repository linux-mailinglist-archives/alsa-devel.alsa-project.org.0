Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A23F0752
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9CEE168C;
	Wed, 18 Aug 2021 17:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9CEE168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629298874;
	bh=v98hRU2eNSNMrekeYgf8DiUMV6TqJhBOHeR0vLTmpaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TcEG3i+edXADj0nk9/aZi/9e5MaujRd/Nqy80OZ2iN7oOGlsxt6o/QrASnCn7obMe
	 AIe5n+vacirI9ROkM9pw4nrBdWj0ToZWSbaRfXzhH8thlsVNIFRZQ+Jaifa628kwcR
	 XEZI+ADpW9JzT3erTJ4sfX+O2wl1Jq5W2WYpR9pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF3D5F80259;
	Wed, 18 Aug 2021 16:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C264F80249; Wed, 18 Aug 2021 16:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB884F80163
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 16:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB884F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="r3lXDwsq"
Received: by mail-pg1-x529.google.com with SMTP id 17so2509204pgp.4
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EBgoBWZ1Nj5av7VhKX9E+2duoDv+qmChdEi2w6LtlvU=;
 b=r3lXDwsqVpzCbwrLVj0t1BPGIqrau9mGcpVCpLgjbbnJIpyqRObCCTeHdmP4xkc65q
 zKNkkkEGCGppUmAM64SksrZt4ccxCakfQCuRSUMwHEg0b4Bk9w4vcE314SeoYKOXmsK4
 lJojPQYIVwkKvrUVfMST0N9ZfsxnYKemqhNa2CTLvgwTx3teygWBXYu71KdDf7fLq0zP
 kEIqrY41bNHC6x+iWGwbgcUSqUiWw77KI+GQXv40wqOvKzzL0++dq+VGOxiE4awGtKQV
 HfoAxyM5LKVN9Ghw3geZ4uH7FyEQYC8fCm+qByxioCZ+aU6JIT7GuETzcNwYfShplY8b
 xGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EBgoBWZ1Nj5av7VhKX9E+2duoDv+qmChdEi2w6LtlvU=;
 b=TofsD+6GqPXRm0dkxzMNGqQ4xK7Z4CXp0QyG88LoF8HEZbzPS/PT41rPlwQah3CjFQ
 a3Z4oVZICcU2iKSOO0DalGZLmOVTPe4htPbyLkIv2kI/de3wtcryCOsDiVMjBVgOM8cO
 CEAZOLJ/kcab0sgi9DfWswbBB0DYtzR6YrW6HwLgwKpSCDtuTDfWFzv76WGMqfUprI9s
 YOgR01NnDJ9xE7bH7vqlc82Za4QMDW3COxDlWwz5nguynq1Xfq42pvw3p5vLv3ApYX6V
 s3cwqDHAeOd6FgLTMkFi6Bwx7PZVVE4Dtw/gT0rgRmOQzsCtGZ5hCFDlXH8baNj4wGOP
 G1nQ==
X-Gm-Message-State: AOAM531l1+ORRXbprpUX/7FjZ4icS2OSl6HniQGo9GzT2Nb6i+n8pUBE
 mGZ3WBK5xfTAV+9oLYGpUIDMokpXzz68c1p4Vliilg==
X-Google-Smtp-Source: ABdhPJwXDA/RU3SgFGIGZf73vkhszMMBN089VDmiusykFqaL07LtRIpSGnrZKMdg45ppW2cbOPZwLYzE/SLt70DkATM=
X-Received: by 2002:a63:3c7:: with SMTP id 190mr9167314pgd.240.1629298786167; 
 Wed, 18 Aug 2021 07:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-2-pierre-louis.bossart@linux.intel.com>
 <YRyeR6imvSwOOasQ@kroah.com> <20210818115736.GA4177@sirena.org.uk>
 <YR0Ji7DQXoo0z4vP@kroah.com> <20210818134814.GF4177@sirena.org.uk>
 <14235b8d-d375-6e2d-cae9-33adf9c48120@linux.intel.com>
In-Reply-To: <14235b8d-d375-6e2d-cae9-33adf9c48120@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 18 Aug 2021 07:59:35 -0700
Message-ID: <CAPcyv4hWNk-avNOPdWBNND9Bd9nebzs2A4Weveqy289gM+A1Bw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] driver core: export
 driver_deferred_probe_trigger()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Aug 18, 2021 at 7:52 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> >>> The issue is that the driver core is using drivers completing probe as a
> >>> proxy for resources becoming available.  That works most of the time
> >>> because most probes are fully synchronous but it breaks down if a
> >>> resource provider registers resources outside of probe, we might still
> >>> be fine if system boot is still happening and something else probes but
> >>> only through luck.
> >
> >> The driver core is not using that as a proxy, that is up to the driver
> >> itself or not.  All probe means is "yes, this driver binds to this
> >> device, thank you!" for that specific bus/class type.  That's all, if
> >> the driver needs to go off and do real work before it can properly
> >> control the device, wonderful, have it go and do that async.
> >
> > Right, which is what is happening here - but the deferred probe
> > machinery in the core is reading more into the probe succeeding than it
> > should.
>
> I think Greg was referring to the use of the PROBE_PREFER_ASYNCHRONOUS
> probe type. We tried just that and got a nice WARN_ON because we are
> using request_module() to deal with HDaudio codecs. The details are in
> [1] but the kernel code is unambiguous...
>
>         /*
>          * We don't allow synchronous module loading from async.  Module
>          * init may invoke async_synchronize_full() which will end up
>          * waiting for this task which already is waiting for the module
>          * loading to complete, leading to a deadlock.
>          */
>         WARN_ON_ONCE(wait && current_is_async());
>
>
> The reason why we use a workqueue is because we are otherwise painted in
> a corner by conflicting requirements.
>
> a) we have to use request_module()
> b) we cannot use the async probe because of the request_module()
> c) we have to avoid blocking on boot
>
> I understand the resistance to exporting this function, no one in our
> team was really happy about it, but no one could find an alternate
> solution. If there is something better, I am all ears.

Additionally you mentioned that the consumer is unknown to the
producer, so you are not able, for example, to use the newly exported
device_driver_attach() to directly trigger the unblocked dependency.

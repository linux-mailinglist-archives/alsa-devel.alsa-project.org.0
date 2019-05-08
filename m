Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E398B17E5F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB5F1AA3;
	Wed,  8 May 2019 18:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB5F1AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557333897;
	bh=M/p8O7CHkxahnJo7rUNgcIAKEljBIDEdCu6Vq0zPnlo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBokE///TuhfisK4Fq01hwV1DzzayKe2Wx9KpyoQEIcTTtqvG5Xf9ci5UnGGQgmp6
	 PxVUghJ5ciEIvbi/7Oz2U/aPy4zyuH2hOQbnIOGxpEExD7UF+GJf6gH20zhfw7ezQ0
	 6Jil2/vDb38wwRuSyiOXJqIjVmsolrN6+uRlnhSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AFC2F8970F;
	Wed,  8 May 2019 18:43:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97920F89705; Wed,  8 May 2019 18:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A99BF896E6
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A99BF896E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hYD5u5tQ"
Received: by mail-lj1-x244.google.com with SMTP id 14so281977ljj.5
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bE2g2/J7jcovpzbNiK1OGJndwPVuuKcWH0XZQkXZprw=;
 b=hYD5u5tQEgcbqVOlPqx5/nEt9O9Z7X8BAv20e+5EZiUy0lly8gA/9guE6y3GL4x5IN
 MKvJN9psUkKmanEK1Mlx6WZVYiUAmPH+IGPBi1JRJJvDrhmxEnfDqKM48VxCQn7z4Uys
 0N3+G87YR9b37t+d5zCumoc7eM4h6PG6bIb+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bE2g2/J7jcovpzbNiK1OGJndwPVuuKcWH0XZQkXZprw=;
 b=Rjp21p7HuoXtnLJsLkxB+6deRGZv41gLb5locV3ATTmLE+FDNUErp5ZdiDFaEPhffr
 /QhGSq1I3phnKRoI4gtkUylZsoNRH6ErHtQUdeKrxJPPwjQ9cAAz4Otu5Nc68TR4tbuI
 4DvG7sDaHLlcJoUfk03t/xs/YdxAT5ugjhCbKMJw6uPumjLZZSsHucYkZQ5Ikkw7jACf
 30gIhQC9supKdxOx992S+2m2mrHpZOlGM9Vu1LcZee/69MFeoUWFeprunHwK+pwU6Syd
 byNCZ7rwhoCx1OAlzyqDPIj5tn75WU/AR/iifTHdEBPcATQMFaxPXLcdRqttjoId7suC
 TJJA==
X-Gm-Message-State: APjAAAUUpt1J1xKpHLLxDTDFuDe6gdbd/duINiQRW6LWQzWgQYvnLTqB
 6d8hPEJkBZeL/MVe5k7RICbHz41O/Xo=
X-Google-Smtp-Source: APXvYqwm1q6pbu7X1EJCDb3Umv1rTBm4Hxg07y1wGKtxlDLNUKATffXsAA9ya+58uY7X/JEXSfiM0Q==
X-Received: by 2002:a2e:8709:: with SMTP id m9mr13034791lji.140.1557333803481; 
 Wed, 08 May 2019 09:43:23 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id t7sm3907151ljj.87.2019.05.08.09.43.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:43:22 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id n134so13200648lfn.11
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 09:43:22 -0700 (PDT)
X-Received: by 2002:a19:1dc3:: with SMTP id
 d186mr20179267lfd.101.1557333801942; 
 Wed, 08 May 2019 09:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190507215359.113378-1-evgreen@chromium.org>
 <20190507215359.113378-2-evgreen@chromium.org>
 <cb0accd5-6b0d-065a-9b54-321252862d88@linux.intel.com>
In-Reply-To: <cb0accd5-6b0d-065a-9b54-321252862d88@linux.intel.com>
From: Evan Green <evgreen@chromium.org>
Date: Wed, 8 May 2019 09:42:45 -0700
X-Gmail-Original-Message-ID: <CAE=gft7PtNWzH1QYigbQvDcJwZSb7ZLWoKzurPGBnh72DYcZrw@mail.gmail.com>
Message-ID: <CAE=gft7PtNWzH1QYigbQvDcJwZSb7ZLWoKzurPGBnh72DYcZrw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: Add Comet Lake PCI IDs
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

On Tue, May 7, 2019 at 3:14 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Minor nit-picks below. The Kconfig would work but select CANNONLAKE even
> if you don't want it.
>
> >
> > +config SND_SOC_SOF_COMETLAKE_LP
> > +     tristate
> > +     select SND_SOC_SOF_CANNONLAKE
>
> This should be
> select SND_SOF_SOF_HDA_COMMON

You mean SND_SOC_SOF_HDA_COMMON I assume.
Except that I also need &cnl_desc, so I need CANNONLAKE to be on as
well. Should I select them both?
-Evan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6322A712
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 07:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BC2A1657;
	Thu, 23 Jul 2020 07:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BC2A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595483317;
	bh=4x5oNtZqFN1bPNMLayQbwIE3+/HMBn5eonG0+A4rzh8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlwkqKpwTe4ZMo6ksO850EaUzNu8whWWPcYyuWj1QwU+KoPIeRCNnH24e9Y3ILYsI
	 hgGCaNfUuwokz3OjSGM0YSw4SNUCaEnZC77EyWt+NW/gn2G3RTxf/NbD9uRhbwvt2B
	 D0gfIxgJP/qpPj4FgoEauhpKjF2gDGsyw0AeXKn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33ADCF8024A;
	Thu, 23 Jul 2020 07:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F28CBF80212; Thu, 23 Jul 2020 07:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 647A7F8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 07:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647A7F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h1NFcx22"
Received: by mail-pl1-x644.google.com with SMTP id p1so2058595pls.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 22:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=4Bsv9nIgqKmSYSIOMPedKdrcSWXd/PYFSO2aIq/191g=;
 b=h1NFcx22ZnIuEzuWbSbkC3x7IEN9Y2dN6+57CJu8RbnCZqVp91BCoOWxD1R6Zx93Sb
 lo4nx9IxNGFCzW2Vz6QX3Plltlj4h16/LmJ0YIpIuapYsFxfeqrNXg9VDLvCy2d2UU/J
 haOQ4c/cYL4G2Y4SES+dw1eVWHBr7SQGOS22NA2U1bvjwxKAggTPT31ZqEZ3WTNy+Z7d
 PMLE8ufxcP4Y16XHvH3S/qkr0LjvrGNndguO5t1XbH1XujDd0rCNUBn2mcdMWQrhslMf
 sTP8OF/bVRL/XHpQt9lGLV6hdQRH5BtFSe/3/rFD60TtGwM6GvYDM2P8XIPmb+ZLPh6Y
 afdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4Bsv9nIgqKmSYSIOMPedKdrcSWXd/PYFSO2aIq/191g=;
 b=nMQOUJIQ1jH8T5Gm34TOB6HUVxrW+RGlrZyKgAgifPyJfA9LX9c1gPQZlUw2bHe19T
 g3wJZpds5eEUIpsxafJaGKDI83XhJseZQwHo3T2byk+PMCMrGTfgGERV3qOc8zLpVc5E
 qIC6hG/SHGUwmglw6rKWi4RxabmXTkd9goQxeSC+2r2WuFkkc0yja+KA7vWlg495zlJt
 YuTdau6aRtdVO89sDRYzcDa1fbdGo9Vx0uiYVGO98i9AosANBDI7TBBk6PEpKBhO/ngN
 iIB8amxPi8DpI2ijSjJD1/jb/OFZLdvE2o7HarYnI4HUuLQ2GAnGo/nLBo/GuFgfUzsy
 t7ow==
X-Gm-Message-State: AOAM531rEnTYYvlQIAIDJnqLsR3cGLHxx+9NFDlqGrAVNAND2pBhCNGR
 YA66Ri7r3Nu9QDf6TQjFomo=
X-Google-Smtp-Source: ABdhPJyIls34k7x9JFSOkkgOqf1QQEkFiI5YZQPlp/pPPicar1BpkkeJw1obLQi4kxe5E1ASY31oLg==
X-Received: by 2002:a17:90a:1a02:: with SMTP id
 2mr2574014pjk.150.1595483201112; 
 Wed, 22 Jul 2020 22:46:41 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u16sm1295001pfn.52.2020.07.22.22.46.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jul 2020 22:46:40 -0700 (PDT)
Date: Wed, 22 Jul 2020 22:46:07 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200723054604.GC5476@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <abdd7265-43d2-49b5-6afd-70d65baac30e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abdd7265-43d2-49b5-6afd-70d65baac30e@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

On Fri, Jul 17, 2020 at 01:16:42PM +0200, Arnaud Ferraris wrote:
> Hi Nic,
> 
> Le 02/07/2020 à 20:42, Nicolin Chen a écrit :
> > Hi Arnaud,
> > 
> > On Thu, Jul 02, 2020 at 04:22:31PM +0200, Arnaud Ferraris wrote:
> >> The current ASRC driver hardcodes the input and output clocks used for
> >> sample rate conversions. In order to allow greater flexibility and to
> >> cover more use cases, it would be preferable to select the clocks using
> >> device-tree properties.
> > 
> > We recent just merged a new change that auto-selecting internal
> > clocks based on sample rates as the first option -- ideal ratio
> > mode is the fallback mode now. Please refer to:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200702&id=d0250cf4f2abfbea64ed247230f08f5ae23979f0
> 
> While working on fixing the automatic clock selection (see my v3), I
> came across another potential issue, which would be better explained
> with an example:
>   - Input has sample rate 8kHz and uses clock SSI1 with rate 512kHz
>   - Output has sample rate 16kHz and uses clock SSI2 with rate 1024kHz
> 
> Let's say my v3 patch is merged, then the selected input clock will be
> SSI1, while the selected output clock will be SSI2. In that case, it's
> all good, as the driver will calculate the dividers right.
> 
> Now, suppose a similar board has the input wired to SSI2 and output to
> SSI1, meaning we're now in the following case:
>   - Input has sample rate 8kHz and uses clock SSI2 with rate 512kHz
>   - Output has sample rate 16kHz and uses clock SSI1 with rate 1024kHz
> (the same result is achieved during capture with the initial example
> setup, as input and output properties are then swapped)
> 
> In that case, the selected clocks will still be SSI1 for input (just
> because it appears first in the clock table), and SSI2 for output,
> meaning the calculated dividers will be:
>   - input: 512 / 16 => 32 (should be 64)
>   - output: 1024 / 8 => 128 (should be 64 here too)

I don't get the 32, 128 and 64 parts. Would you please to elaborate
a bit? What you said sounds to me like the driver calculates wrong
dividers?

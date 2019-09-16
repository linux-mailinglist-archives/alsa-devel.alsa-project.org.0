Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4356B4433
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 00:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0F1166D;
	Tue, 17 Sep 2019 00:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0F1166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568673903;
	bh=DTP4BqC6BINQYcId9NqpbQ/SgsTsS7ZuNgFOE2gMDSw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNjm+AIo56O5wT25DT9IdtrZ0u46FeroA1pU8XilQ3Jv0ZfRTYAmEDoYsUA0AhkaH
	 ZhILSVlz3u/ft6vOP87N5FJD9hNnrYnmI/T0reKBkjpIaePJ56I27fS+htRs3pWoLe
	 RRaNnm9tPzWyQOTZrWCShrLrhnCES5U5dAZ5/eOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D7BF80535;
	Tue, 17 Sep 2019 00:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1398F80506; Tue, 17 Sep 2019 00:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 189E6F80137
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 00:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 189E6F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IMUR9inG"
Received: by mail-pf1-x444.google.com with SMTP id q21so793361pfn.11
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cBZmVkDcKZz5zZDlHp5T39g0CCRjx154L73p3yLa6i4=;
 b=IMUR9inG/mwmcrmffeDDt03n3boFWWZwMhpmFtIhuW8MN3yX8L6SCfAknaT4kLGDek
 EmwPLX+yhIByGkpmzhWfqSRoaR7D+GP1+JsN6zESyBBEhY4/5gI8nMNniKe7bqG3Gz4Y
 J+7jHPs6G4CvZ6ISiAoqmiuxErUqWwN20jkVflyBHSJyyC5P5eC4nsbKU/6k5b5mIrcD
 +2aEeJBo3jI8jejEICUuxrdguC4UfvQk5UhGhGPwP16lX2YJIT3LZHAY3tDo1icmdAHF
 QO0IhVJ8HWw/wgmmG56RiGW3i52MvGam0j52TJU61KU9TOhCMhdPXu44fqDnPiBjpuGZ
 7+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cBZmVkDcKZz5zZDlHp5T39g0CCRjx154L73p3yLa6i4=;
 b=il0riTg7ecZP7hJi0z264/BiQF0wFXxbAdY/OrGXLhzZc4x4MmSbT8m0ky5SrDlVVO
 W/t4fVCuS7AVbnBV8ji8dUklci65eHwJknjYIPuaGjBXUw/ZcAFkCeH/8PsTu8UF7o6i
 wovnFURLgUSuF0EM2KEJBztRd8lCqNKLWt2+A/Qsk0avCZJytx4htOaEGt7QeWO3BkVo
 O5Gd9o35+UnT/4VW2nIZwzu7TES/HSktOXMx516mCgG3XH2u1MlF4PIV2KqK/DEaeazL
 DWp7ub5mgPrUe0DfdDAzsCH3XkGGwjKPXTaTRi7mlqyfqGfO+4inU7IoG9Dg5U8nBjbd
 PvEg==
X-Gm-Message-State: APjAAAVzYfVIJ7cruZMdk9ODXDg4l0qx68SV8mL4toIjXVZI+vpKltGj
 BPlJbaKIlD2zv7Ugv6Z2ZiE=
X-Google-Smtp-Source: APXvYqwB6gvQcdks+jrYjCow1jWYalLI0aO/HIFRY6W9E6qaFAat/V97b6+aesqJTosfdItuAgcG0Q==
X-Received: by 2002:a17:90a:9201:: with SMTP id
 m1mr1736979pjo.58.1568673786005; 
 Mon, 16 Sep 2019 15:43:06 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u4sm124058pfu.177.2019.09.16.15.43.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Sep 2019 15:43:05 -0700 (PDT)
Date: Mon, 16 Sep 2019 15:42:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190916224244.GA12789@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20190912235103.GD24937@Asurada-Nvidia.nvidia.com>
 <VE1PR04MB6479A4161F9C71FD394A3DA9E3B30@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479A4161F9C71FD394A3DA9E3B30@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH 2/3] ASoC: fsl_asrc: update
 supported sample format
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

On Fri, Sep 13, 2019 at 05:48:40AM +0000, S.j. Wang wrote:
> Hi
> 
> > 
> > On Tue, Sep 10, 2019 at 02:07:25AM +0000, S.j. Wang wrote:
> > > > On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > > > > The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> > > > > should not be supported, it is word width is 20bit.
> > > >
> > > > I thought 3LE used 24-bit physical width. And the driver assigns
> > > > ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit
> > > > would go for that 24-bit slot also. I don't clearly recall if I had
> > > > explicitly tested S20_3LE, but I feel it should work since I put there...
> > >
> > > For S20_3LE, the width is 20bit,  but the ASRC only support 24bit, if
> > > set the ASRMCR1n.IWD= 24bit, because the actual width is 20 bit, the
> > > volume is Lower than expected,  it likes 24bit data right shift 4 bit.
> > > So it is not supported.
> > 
> > Hmm..S20_3LE right-aligns 20 bits in a 24-bit slot? I thought they're left
> > aligned...
> > 
> > If this is the case...shouldn't we have the same lower-volume problem for
> > all hardwares that support S20_3LE now?
> 
> Actually some hardware/module when they do transmission from FIFO
> to shift register, they can select the start bit, for example from the 20th
> bit. but not all module have this capability.
> 
> For ASRC, it haven't.  IWD can only cover the data width,  there is no
> Other bit for slot width.

Okay..let's drop the S20_3LE then. But would it be possible
for you to elaborate the reasoning into the commit message
also? Just for case when people ask why we remove it simply.

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

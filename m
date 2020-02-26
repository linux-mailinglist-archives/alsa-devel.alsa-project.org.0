Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B0C16F5DF
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 03:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C51E31687;
	Wed, 26 Feb 2020 03:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C51E31687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582685851;
	bh=vpJBftnch6W0aZBcY1dGEjiFTFvs9+NIOhP7Gerzqh8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oO4Ah4bnMD5gXY3/YpMEKu/wltNHKSf2v2P+T02IByn++3Dei6WLwy7jripWn307r
	 YZos3y577GuoNQe8tMVWkA/t4QY3Trc2ELpllx7XLOUp3ttvdkCjlJfS1g91TTbjxW
	 ht1V49v9hnnuOg3NXq+r3KfwM4CLIf6vv2ypANHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF336F8016F;
	Wed, 26 Feb 2020 03:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4C5EF800E8; Wed, 26 Feb 2020 03:55:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE4C0F800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 03:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE4C0F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Moy0oe77"
Received: by mail-pj1-x1041.google.com with SMTP id d5so615242pjz.5
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 18:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bfSVMJ6Zntz6A9BJaM12dNm4EQGGybEoHbVncbTsUMA=;
 b=Moy0oe77F1nP33WomY+/yVeQF9YOUm9A+K2Dmya3vWO3y1gDf7kXx+ARQoGIqJsbcn
 sPDlocDXHhiYZjO+XyXUp5tQV8BJw2C7x+2ghY8gYyPWFQ7qduGfKCkjbgpdinZcGNjB
 WxhCMHnCKG0c8t5hywtULwpBqj4C0bP6PHBAoxnZH9WUICVJuyrYV1mqj2wAShGjfCs6
 tIJzuV4Fe3jr6nyPLQ/HjFbLHYzt3rgUTWbLX8hMswIRiB57T3uJgkHbl/XIWiXtE5Fv
 PNehsU30K6Pj2wGG2X6MPSgieuIgHYhU1Oya8m/3JHtMlRpQXMzTlhwP7/IXW+Pi/+xR
 gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bfSVMJ6Zntz6A9BJaM12dNm4EQGGybEoHbVncbTsUMA=;
 b=fovchjIPxow7FOUunHC36jPrJ9U1GX67WEmjl2myxinXF+f7QGYPC8YY9NUYIUuPUo
 UOklJgZM34+UIxICzAhBlHRaArbMslbrqHWpuKeIyElb9fk0GmPTx94dchBrpRVcGzPb
 znWMssUaynOsaZw8CI5cRrdS1sM6mPMVl963tGqeUn/GjWnJ/1U9zBAvV3efA0XERsuU
 EukOQ7rGxWtuJk/2laxvA4fRv5o5xS+oCXq/3YW4zX669cD891LjWufTDrbh4ZDuBaJh
 8GdB3ncpJewtqv+bNIWBjFKdGpcpQw6phZp7eTTpY/Pp2eLKmkTIXn8w0Oft3TZZXT/L
 5w9w==
X-Gm-Message-State: APjAAAWuXshR0Fq4DV1rlvgdwzBTwdJ/D6cjIfCNFUAx4ny/AnBMHieo
 uTuuKC/Y+UTA+ltgYmt3yLs=
X-Google-Smtp-Source: APXvYqxX5rlyRMCuaRBBYuYMduxdjpm5x24xmrS5n9R3CJux7Jc4o6x9N7kxgP+pNGY/fDI9hDV73g==
X-Received: by 2002:a17:902:9f88:: with SMTP id
 g8mr1790693plq.100.1582685743306; 
 Tue, 25 Feb 2020 18:55:43 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id l13sm444798pjq.23.2020.02.25.18.55.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Feb 2020 18:55:43 -0800 (PST)
Date: Tue, 25 Feb 2020 18:55:40 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
Message-ID: <20200226025540.GA22445@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB6479BCA376502F6F1251602BE3EC0@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20200225080350.GA11332@Asurada>
 <CAA+D8AMFzDs8uXiR-N8harRVmhC+3i8p9HdO2CgxOCX8WVfXAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AMFzDs8uXiR-N8harRVmhC+3i8p9HdO2CgxOCX8WVfXAw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, Feb 26, 2020 at 09:51:39AM +0800, Shengjiu Wang wrote:
> > > > > +static const struct regmap_config fsl_easrc_regmap_config = {
> > > > > +     .readable_reg = fsl_easrc_readable_reg,
> > > > > +     .volatile_reg = fsl_easrc_volatile_reg,
> > > > > +     .writeable_reg = fsl_easrc_writeable_reg,
> > > >
> > > > Can we use regmap_range and regmap_access_table?
> > > >
> > >
> > > Can the regmap_range support discontinuous registers?  The
> > > reg_stride = 4.
> >
> > I think it does. Giving an example here:
> > https://github.com/torvalds/linux/blob/master/drivers/mfd/da9063-i2c.c
> 
> The register in this i2c driver are continuous,  from 0x00, 0x01, 0x02...
> 
> But our case is 0x00, 0x04, 0x08, does it work?

Ah...I see your point now. I am not very sure -- have only used
in I2C drivers. You can ignore if it doesn't likely work for us.

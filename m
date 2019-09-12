Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826EEB16D1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 01:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 180E31658;
	Fri, 13 Sep 2019 01:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 180E31658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568332658;
	bh=kPWRXcCpFtw9p1kAnehVFBVHIJAfNLH6wsQ7RchdvFE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/Z0wl2Wb9VXdyrJfLrOQUE0gO9VeCu8EoY3J6Fx3Q5p8OJWk0uU8gacIpgSFU2eB
	 y27+SpIeJOgk4OzA2zpFSXmSIR5U3x9IkKm3Uxq6Mo0U73dgv2LRiyVCV7kiNbBj4W
	 TLaIyYNUc/uAYPPi4npn3LXW6MO8ypOSATtL1E3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CA7F80368;
	Fri, 13 Sep 2019 01:55:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49451F805A0; Fri, 13 Sep 2019 01:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCFCFF80368
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 01:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFCFF80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N/9FVwqw"
Received: by mail-pg1-x541.google.com with SMTP id u17so14281390pgi.6
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MKg9N5Ak/mqK4Z77OiWZOmXzQbsQdtgDZRsUGqX7iZY=;
 b=N/9FVwqw2HM4pjK9/KOapQ6CrsHfOWXlQZf5cbvJspNfr5YemTKwvog5nEJquW6vNB
 dhb8QaktoUZb+TX2cX2BqUb5r+E1dvNebQMcdWPh/J4FiNdPstJmUUdAZAD1kJgmW/Af
 08haBzhalAZIsIPN29D7lBbgQjrl1RU3GRGrgJdxIgO8NdK32r7OiRK33X1bLBEwmewl
 /p4DtShHDsmPP7cb7nbP08iwxYdtD9Nblw29H3yAzefARKSyVftxzo39jEpvRvonGGXr
 bQ3TDRfX6z+Ezlf2vy3/BzFYT04GPSrPvMtEkR8C4ti0MnH3JYOzQyBeGGZ9FcbwOba6
 REbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MKg9N5Ak/mqK4Z77OiWZOmXzQbsQdtgDZRsUGqX7iZY=;
 b=GCwYN0E3fmMg6T9fHOaiBva9Hu8k22InuoDYJhay/dzaoJa7nhVG3kH8/N8F1PrOmB
 wx81oszr5bPMzdwIm5I9IuADkyrlUMV6wjIAEThkdfRPdbdaZLyojeAuIGfQLbNgcqw8
 lGuw+oV+95pGd2FstOTWj0jTSfIwE/uDwRjwyOkqEE2wVnV/PUDuGu4Yk50jfSYQur1Y
 3qs/wElsQAZhOKHKgXZ8MU5M05KNWo828cuCEp1OrzZw2jMZsFzpx9In6rgs+9zDhDME
 8ThSh9u5UsHL5eFmzqUyTT43cwhIB4/fqqY9aRyR6wc0DXeEuaiGQTfvg5EWBLdIZQVA
 SOfQ==
X-Gm-Message-State: APjAAAWhzl1sdYSYmCHhHuw3N91rMofxVAugyCOjKcaUPa9JnZFC2ly3
 x0Nj5Ex6qYoJbwaFOqgry8o=
X-Google-Smtp-Source: APXvYqwGccc6+qJ6fu7lfAAauwtZvtPeLkhiMe9OxJMG2Jg+hfl9NJGSzizq4OGkb7Sp0XJb4FrbIQ==
X-Received: by 2002:aa7:8d10:: with SMTP id j16mr5842105pfe.109.1568332545774; 
 Thu, 12 Sep 2019 16:55:45 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 1sm24596429pff.39.2019.09.12.16.55.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:55:45 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:55:24 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190912235523.GG24937@Asurada-Nvidia.nvidia.com>
References: <20190830215910.31590-1-daniel.baluta@nxp.com>
 <20190906012938.GB17926@Asurada-Nvidia.nvidia.com>
 <20190911110017.GA2036@sirena.org.uk>
 <CAEnQRZAid2xXu+6PxWDCBNDwS6c8DfNXEcNqseDPAsVJ7kEHeg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEnQRZAid2xXu+6PxWDCBNDwS6c8DfNXEcNqseDPAsVJ7kEHeg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Implement set_bclk_ratio
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

On Wed, Sep 11, 2019 at 04:06:41PM +0300, Daniel Baluta wrote:
> On Wed, Sep 11, 2019 at 2:01 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Sep 05, 2019 at 06:29:39PM -0700, Nicolin Chen wrote:
> > > On Sat, Aug 31, 2019 at 12:59:10AM +0300, Daniel Baluta wrote:
> >
> > > > This is to allow machine drivers to set a certain bitclk rate
> > > > which might not be exactly rate * frame size.
> >
> > > Just a quick thought of mine: slot_width and slots could be
> > > set via set_dai_tdm_slot() actually, while set_bclk_ratio()
> > > would override that one with your change. I'm not sure which
> > > one could be more important...so would you mind elaborating
> > > your use case?
> >
> > The reason we have both operations is partly that some hardware
> > can configure the ratio but not do TDM and partly that setting
> > TDM slots forces us to configure the slot size depending on the
> > current stream configuration while just setting the ratio means
> > we can just fix the configuration once.  I'd say it's just a user
> > error to try to do both simultaneously.
> 
> Yes, exactly. We wanted to have a better control of bclk freq.
> Sorry for the late answer, I'm traveling.

I see. Thanks for the explain. Just acked.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

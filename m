Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2572216C6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 23:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902061662;
	Wed, 15 Jul 2020 23:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902061662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594847127;
	bh=paIyuaQb7r3011gMJZJy0c1Yse/+WCU83OO1y9OLHOY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7VVeqEyfjZj3OyXLvZjRAdC7PAmB1u+fRmvYHDcCzdOfsIQx8YoFHYal1leuwPUM
	 cjXwzUcdV58R7CJyWYs2IzV8IkWh1lQ9i5eLHj4GQE/Jl8Kpu1hcs9e2Fx4LrFZKZu
	 VElNM63FibzLr4dEIQnt4kY+3V5+IG9iROxSzC0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD024F80217;
	Wed, 15 Jul 2020 23:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D67F8021D; Wed, 15 Jul 2020 23:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2BA8F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 23:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2BA8F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M0a6hIft"
Received: by mail-pf1-x443.google.com with SMTP id u185so2652133pfu.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hRzNY1JDvrNXSdO8U7l97e0qNXhN4R2q/raGpfh2xSg=;
 b=M0a6hIftqMPigj4qmdMeWnqpRS3Mhy/U/7tUxAJxo7OSSYbXSs1F2eHV2Got5uVniB
 fnnxdnC9ZZJqASAvHEjKtn37vsFNBdsR0Y+c7kAeDJx9/bg+oiwPjtcgbgWSxF45qxW/
 +YUIUkpaCLuGaqFeYoJ7IQUIUHnjtTDVdO2eOUlLAEZc+mqjD5ce/+F+m7DsX6qxzgsf
 zt3i0YoDpSePFWCBoqV0JgX2k1GtNZd9x0PsQ6mObkRRhuqa8i13bcNSo0ft2Yhdpy+8
 FlYet5jyBRKAe9z/e6RkiL/kXCrQdGGuqn8MWdizP19m3CiL1UddjV1tqOIDudAmNzml
 3zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hRzNY1JDvrNXSdO8U7l97e0qNXhN4R2q/raGpfh2xSg=;
 b=i1uQ1NDDrFmvGJq1Hqk1CE4HJ+2sMqPgc/9QSXTncYcFHqXZTytSbLhbtaHcgnkiNT
 +6tPRnGgY3H5jW1mfvnY8xwvEx1NPpmlVKKyubT2LD/XKvuyYTnFl+DWYFRfpkh41iIn
 dj9ubqNQy6w/O866b7PSEFY2vHpPfBkh7C0ugPwST6SgpjxVYntzfQwfwEIY82cOru/Q
 OQRwCELRalVF50h7VF5z/iPhKiBihax+LhbF3XmCyN+aEB9BBMYcEXpJoYEOEJ3Y4RI4
 H0YKRs9FjFnaHBpZtio/eEuzFFY6d1qfA0ApqxwKKtS8Ly3t6elYVtfa5EUzEifixjwr
 l0UA==
X-Gm-Message-State: AOAM530c/9v1+PKIzJ1r15uTzttBy9Qwz15EEc8rwOgFuFG6jcwkB9t8
 B2hEdnFOUA5ex0LJVUu3bMg=
X-Google-Smtp-Source: ABdhPJzJmgyhP7wX+GxWvJnVu0WYkg3Mrtb2coBAaKPhmJ2puWco+JxG7AG7U8wtv2nQBQYdGGywbw==
X-Received: by 2002:a62:e919:: with SMTP id j25mr957900pfh.123.1594847013262; 
 Wed, 15 Jul 2020 14:03:33 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y7sm2949173pjy.54.2020.07.15.14.03.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jul 2020 14:03:33 -0700 (PDT)
Date: Wed, 15 Jul 2020 14:03:08 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200715210308.GA14589@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
 <20200714201544.GA10501@Asurada-Nvidia>
 <20200714202753.GM4900@sirena.org.uk>
 <20200714205050.GB10501@Asurada-Nvidia>
 <20200715140519.GH5431@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715140519.GH5431@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Timur Tabi <timur@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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

On Wed, Jul 15, 2020 at 03:05:19PM +0100, Mark Brown wrote:
> On Tue, Jul 14, 2020 at 01:50:50PM -0700, Nicolin Chen wrote:
> > On Tue, Jul 14, 2020 at 09:27:53PM +0100, Mark Brown wrote:
> 
> > > The nominal rate might be the same but if they're in different clock
> > > domains then the actual rates might be different (hence the desire for
> > > an ASRC I guess).  I can see the system wanting to choose one clock or
> > > the other on the basis of some system specific property (quality of the
> > > clock sources, tolerances of the devices involved or something) though
> > > it's a rather fun edge case configuration :/ .
> 
> > Thanks for the input. Fox i.MX6, I don't feel it would be that
> > drastically different though. And both SSI1 and SSI2 can simply
> > select the same root clock source to avoid that happen.
> 
> If you've got two radios that both need to sync to some radio derived
> frequency it gets a bit more entertaining.

I'm simply curious what could be a problem. Do you mind educating
me a bit? And ASRC here isn't a radio but a sample rate converter
working as a BE in DPCM setup, using radio-capture for example...

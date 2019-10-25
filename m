Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F233CE43D0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 08:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD341766;
	Fri, 25 Oct 2019 08:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD341766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571986557;
	bh=a6IYVujwJA7EAORVvJLOIDhQh5nq6ZsBru9HlbQLNEI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLGhfJ/ojuS/YDcaefBlhgCAZBb2qyPaTPPJoMGRmeQDy7CnnF/VXX0y2EyYdWwNn
	 Xf3dqxkOYEP0fz7LsY6NSTz8SWIkEfgIemRL+LKoDBbQa3tBrhQOsZ2+jSrnJeDtw0
	 7iMRmxZZnZq9AmZorgG7gAA9xMuwSsUUKdkyL/PM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3606F8036F;
	Fri, 25 Oct 2019 08:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9036F803A6; Fri, 25 Oct 2019 08:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B571F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 08:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B571F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MD7VplAM"
Received: by mail-pg1-x529.google.com with SMTP id u23so924647pgo.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m+VkYOgB7cCdSZGNDZmPasUQ1M1DmEk9SPAL9l8GP1A=;
 b=MD7VplAMSnE6eBcOxhBncJ1w7gZgL2vajru9wAqudsdqaQdHSjaosigKCexVhSgoKE
 Nq9j/jeyMN+LeTVVmmAoP0z/DFE4hUYz9NCVTZMKqbSqX+i3ZAtgwb7gGHg+p4X7+TEo
 3kiESUbManeemJ3xCExgKIBZWb6+cHq4shtvyoPft8qTN7pMtV8ZWbnQUD2XM4XdY7Rv
 loSwM9UinPzIrmZwAFqKpGadpFiLSvlbq7vDyppqk/Uv5sf04RsliKidoTQAgdRVtUfz
 RAZdpGYb6zsW5Uu31WIZHN9C6A5UeFjipvLod8tVE4H1EvCHExEQKbX315/EAQDHfeGM
 9Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m+VkYOgB7cCdSZGNDZmPasUQ1M1DmEk9SPAL9l8GP1A=;
 b=V47hg0W3O8ywVUOBrAk3IHrxicOjRFsIU8p9jOyJkA0zqsoTHodVw15Wt3SHvLgRIh
 LhH8WKm7pkfUBgmGhmsx/fKWget1DxGBLevRppJ5LcNl3XJteLluOBmw4XL6/rSYjvFZ
 iR3q0ZFogYV4mkmMfTMjSNWwUMpHKVk4iIQPmF40r9Xhzl03m/dDgtksPuQhr66eVnXY
 puqz7igrPD3rtWzs5SN/VGKTppBMNZfYsbuCPJxkh9CR9kI6MOmymTu1BGcswDB6RNjK
 7XXtws9Kfu+e40pGY5nI3ZlLuo52DMmivIE/ssUYDqgSF/CE2RV3r1ADxFcGEPPkHRmd
 yPvg==
X-Gm-Message-State: APjAAAUsnmqGcpBtZ41KnENLWcYJqzGfqVuEOuB3Jr9suCC7A/cnWeOu
 5hYbWY/8eH8BoDon+FG0almJOH/L
X-Google-Smtp-Source: APXvYqwQ2i3psJ0yIsvpXC4E8x2YWCDuJQPZ1N62DtBq1Tv3B55wCjarX0d9MG67laCjyfLsu1WfCA==
X-Received: by 2002:a17:90a:fe04:: with SMTP id
 ck4mr2048608pjb.90.1571986487460; 
 Thu, 24 Oct 2019 23:54:47 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 d14sm1800708pfh.36.2019.10.24.23.54.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 23:54:47 -0700 (PDT)
Date: Thu, 24 Oct 2019 23:54:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20191025065433.GA4632@Asurada>
References: <VE1PR04MB6479AC63FFE5D57B4E2C33D2E3650@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479AC63FFE5D57B4E2C33D2E3650@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_asrc: refine the setting of
 internal clock divider
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

On Fri, Oct 25, 2019 at 05:33:17AM +0000, S.j. Wang wrote:
> > > > > +             pair_err("The divider can't be used for non ideal mode\n");
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     /* Divider range is [1, 1024] */
> > > > > +     div[IN] = min_t(u32, 1024, div[IN]);
> > > > > +     div[OUT] = min_t(u32, 1024, div[OUT]);
> > > >
> > > > Hmm, this looks like we want to allow ideal ratio cases and p2p
> > > > cases to operate any way, even if the divider wasn't within the
> > > > range to get the in/out rates from the output clock?
> > >
> > > Yes. We still allow the p2p = true,  ideal = false.  Note that p2p is
> > > not Equal to ideal.
> > 
> > Got it.
> > 
> > Overall, I feel it's better to have a naming to state the purpose of using
> > ideal configurations without the IDEAL_RATIO_RATE setup.
> >         bool use_ideal_rate;
> > And we can put into the asrc_config structure if there's no major problem.
> > 
> 
> Asrc_config may exposed to user, I don't think user need to care about
> The using of ideal rate or not. 

Given that M2M could use output rate instead of ideal ratio rate
as well, it could be a configuration from my point of view. Yet,
we may just add it as a function parameter like you did, for now
to ease the situation, until we have such a need someday.

> 
> > So the condition check for the calculation would be:
> > +       if (ideal && config->use_ideal_rate)
> > +               rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
> > +       else
> > +               rem[OUT] = do_div(clk_rate, outrate);
> > +       div[OUT] = clk_rate;
> > 
> > And for that if (!ideal && div[IN]....rem[OUT]), I feel it would be clear to
> > have them separately, as the existing "div[IN] == 0"
> > and "div[OUT] == 0" checks, so that we can tell users which side of the
> > divider is out of range and what the sample rate and clock rate are.
> > 
> Do you mean need to combine this judgement with "div[IN] == 0"
> Or "div[OUT] == 0"?

Not necessarily. Could put in the else path so its error message
would be more ideal ratio configuration specific.

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

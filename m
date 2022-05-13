Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B38527F41
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3FB41693;
	Mon, 16 May 2022 10:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3FB41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688498;
	bh=gd6Mw0Sx2oUiF3i//WT8McGTf3vVhdaTzUHJgP0PZlM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fom7wR3N1ogYqul/78X4rtW0Wxf0jLRAGhxOpvj98bgax7mKv8OXJ9jfZalCKk0W3
	 e3MEur7i3HiAbUK9iu7EBiBDdLxQK+u1H+Uaz3TC04t2eKdSRHj58r3kThCs31f9Qy
	 44dw8oFrNfuXDZRZFQv6pA7P4SJHB/+/CDlAzKEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F47EF80559;
	Mon, 16 May 2022 10:04:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99650F80236; Fri, 13 May 2022 17:21:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40614F800E9
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 17:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40614F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="bg30amuY"
Received: by mail-ed1-x52e.google.com with SMTP id p18so10354184edr.7
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KDglamaHwWNFsJjMH8n4M899cYov2fck92ehvXsUuIU=;
 b=bg30amuYU6wYV2P5qNbOJwBy+IHyuJBCdFy8NHgLEKqZRlbttCeGVB6vZTCxzmmzks
 TI65tZFse17Bg3FTztLPHu1C8djT/1uvA8rpdFOEs5aIVqnyD3DmRbMX/7rUU3ibecKW
 Ihf3tG7TXQU2aUXnBa5zDS+4psPozMmTmWNO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KDglamaHwWNFsJjMH8n4M899cYov2fck92ehvXsUuIU=;
 b=HU0X22OgGY8gPZYTL2T0VyLlt3C8SAw2wOvhtLCRsFTz02xfRWiCKrv9yBBmu6uDyA
 d3ML/RlDUNMpD1aGXOayGSflfjX5S1UH0lnRKGfz8gXH0PDI1Bc2EhEoBUxVvh8t6aw3
 PKCmhEMdUAuw9ActeQhgWDjXSybRjHR8wBbsM4MCG3euc9Q9f8z2c7UYCvdOefafGwxh
 isuWeMH2tN+NPUuyXifZJQsBr2wYzBjQR0jZs2YPT37yUrLEcbW1ZnR+A7V/nXCo/gHy
 k1BvGZSoeGo0azW981JkOImAXI7XzR76WJJT+AabHQGgjEAeLvSoQlNsE7DJMZCdv2xC
 /UaQ==
X-Gm-Message-State: AOAM5307I8/BjU0NIk3W7mZX0KZJXFF/OQVClMSjIVX+uewFtOrie4t3
 wIyeT6Tq8zE1c3SKZOYOEGebZw==
X-Google-Smtp-Source: ABdhPJz5SIuwEhnGjOo1CpkBxiFz+zWBgcGI917RzqTFj2OLAcaJYHvW9ENjZfahkvxrAN9gCxWmGQ==
X-Received: by 2002:a05:6402:5190:b0:427:df4a:19d9 with SMTP id
 q16-20020a056402519000b00427df4a19d9mr41598107edd.384.1652455258470; 
 Fri, 13 May 2022 08:20:58 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-59-245.cust.vodafonedsl.it. [188.217.59.245])
 by smtp.gmail.com with ESMTPSA id
 el10-20020a170907284a00b006f3ef214e2csm873386ejc.146.2022.05.13.08.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:20:58 -0700 (PDT)
Date: Fri, 13 May 2022 17:20:55 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <20220513152055.GI649073@tom-ThinkPad-T14s-Gen-2i>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
 <20220512104642.GD649073@tom-ThinkPad-T14s-Gen-2i>
 <YnznExLDOvRpXNVh@sirena.org.uk>
 <20220512110959.GF649073@tom-ThinkPad-T14s-Gen-2i>
 <YnztJxdSFau6SYC5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnztJxdSFau6SYC5@sirena.org.uk>
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:52 +0200
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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

On Thu, May 12, 2022 at 12:19:03PM +0100, Mark Brown wrote:
> On Thu, May 12, 2022 at 01:09:59PM +0200, Tommaso Merciai wrote:
> > On Thu, May 12, 2022 at 11:53:07AM +0100, Mark Brown wrote:
> > > On Thu, May 12, 2022 at 12:46:42PM +0200, Tommaso Merciai wrote:
> > > > On Thu, May 12, 2022 at 11:12:02AM +0100, Mark Brown wrote:
> 
> > > > > These look like they should be DAPM controls since they're controlling
> > > > > audio routing but they're being added as regular controls.
> 
> > > > Sorry again. You suggest to create a new structure for these entries,
> > > > for example:
> 
> > > If that's how they fit into the routing for the device, yes - you'd need
> > > to define the bypass mixer as well and set up appropraite routes.
> 
> > I added this reg as regular controls because this reg is pretty generic
> > as you can see this controll bypass of some output, not all. 
> > What do you think about?
> 
> That sounds exactly like a DAPM control, please make them DAPM controls.

Hi Mark,
Sorry again, but I'm quite new on alsa subsystem. I need an help on figuring out
on how to implements your solution. From what you suggest I got that I need to create
a bypass mixer for every switch (4 -> SPK, REC, MIC2, INA):

/* Out Mixer SPK */
static const struct snd_kcontrol_new max98088_output_bypass_spk_mixer_controls[] = {
       SOC_DAPM_SINGLE("SPK Bypass Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0),
};

/* Out Mixer REC */
static const struct snd_kcontrol_new max98088_output_bypass_rec_mixer_controls[] = {
       SOC_DAPM_SINGLE("REC Bypass Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0),
};

/* Out Mixer MIC */
static const struct snd_kcontrol_new max98088_output_bypass_mic_mixer_controls[] = {
       SOC_DAPM_SINGLE("MIC2 Bypass Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, 0),
};

/* Out Mixer INA */
static const struct snd_kcontrol_new max98088_output_bypass_ina_mixer_controls[] = {
       SOC_DAPM_SINGLE("INA Bypass Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0),
};

After that, I need to route the new control mixers on the switch:

 {"Out Mixer SPK", "SPK Bypass Switch", "RECN"},
 {"Out Mixer REC", "REC Bypass Switch", "RECP"},
 {"Out Mixer MIC", "MIC2 Bypass Switch", "MIC1"},
 {"Out Mixer INA", "INA Bypass Switch", "INA"},

Then route the bypass switch to the new output:

 {"SPKL", NULL, "SPK Bypass Switch"},
 {"RECN", NULL, "REC Bypass Switch"},
 {"MIC2", NULL, "MIC2 Bypass Switch"},
 {"MIC1", NULL, "INA Bypass Switch"},

I'm in the right way? What do you think about?
Can you point me a similar bypass switch into the kernel to take as reference?
Thanks in advance

Regards,
Tommmaso




-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com

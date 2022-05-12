Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F8527F2F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E4E1698;
	Mon, 16 May 2022 10:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E4E1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688419;
	bh=S4kptFH3ECMANIJ/7YyPdcrjdsdCqdXki4MAwxo9MJU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZwcoHeKNutHSV8h881qi0e4tMoxxOStz3s10RT/ZRoWiC0k73DVUjWg1S1qCdefq
	 gV8mXf6BTIYg/LDk5RuVEaW7dGcySTYxQPU7n0y2o91iGwJqXYLXmX4hggkwvcuUQN
	 50xKvIVLnM5Ij1AgasTMVyOUIBdSGLC0+B7/7sPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C253F80536;
	Mon, 16 May 2022 10:03:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05750F800BB; Thu, 12 May 2022 12:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E645F800BB
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 12:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E645F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="exBhr0fe"
Received: by mail-ej1-x634.google.com with SMTP id ch13so9313589ejb.12
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mUztazuSyDgxN4IJuGsokHY/xl1xmIQV403RgKJ0d1A=;
 b=exBhr0feoHxv67tzko0LaAbgsRFgF+WeYOI16AQIEIEA+ahzVeV229CoWiQggBp59T
 HEQyurCaR6bbN3aFuckPLTxXF4rXreefHMr4uH8ds8t+qctxW1Mtui6o3phQUsXB74j3
 q4Oc66AA9bzAfEhIFg1tjII/FI/mqUvxxmDeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mUztazuSyDgxN4IJuGsokHY/xl1xmIQV403RgKJ0d1A=;
 b=drlTwWkKkt7JbvxEbCesXiWz7MMnTRUrJl1ox04v1JQu8wH6PGwtUulQ/rFiAi6Gll
 WI9KNYo3EVMTgP+6o28HRZpS4ES5Ob2CpcJusj/ZUldt89K7fL74cf+iO4qdKGytvV7S
 sYI06+y4rZYc+eKVlC+n5rq4Q0edbaWI/Ztvh/cR4zQxGZkuuLidl/Iroq+NhLUxIQUs
 US7t8PWrrBjmcIQdIRZk5tcAy79aJeGrdUe0lWqF2iGOtMFwOXBA6q0aUXQdjFL6hSUm
 dfk/fy2P0snd8iFNhJE/NTqu40DZ5wNYVyxxUWEf/mf8d7exiZqowtl4CsA3afNbyAez
 fxFA==
X-Gm-Message-State: AOAM531dsJW8l1sDUPIcbm8uv1AgdoMgvap6kJq/doQ+OGb0MUK05dEU
 PlsCk5G4V16+l2oUSaWWnRV9tQ==
X-Google-Smtp-Source: ABdhPJysw+usrrjuAJ6WRTiu4TkZhjhOXkvdySgQAijN5gZxaVp50vUZYfUmATW2TmsDLvWo7vy+ww==
X-Received: by 2002:a17:906:58d4:b0:6f4:cebd:c4b with SMTP id
 e20-20020a17090658d400b006f4cebd0c4bmr28988010ejs.492.1652352405476; 
 Thu, 12 May 2022 03:46:45 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-59-245.cust.vodafonedsl.it. [188.217.59.245])
 by smtp.gmail.com with ESMTPSA id
 sa3-20020a170906eda300b006f3ef214ddasm1961028ejb.64.2022.05.12.03.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:46:45 -0700 (PDT)
Date: Thu, 12 May 2022 12:46:42 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <20220512104642.GD649073@tom-ThinkPad-T14s-Gen-2i>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnzdcubW7m+CwnvN@sirena.org.uk>
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
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

On Thu, May 12, 2022 at 11:12:02AM +0100, Mark Brown wrote:
> On Thu, May 12, 2022 at 09:43:58AM +0200, Tommaso Merciai wrote:
> 
> > Add mixer controls support for M98088_REG_4A_CFG_BYPASS register
> 
> > +++ b/sound/soc/codecs/max98088.c
> > @@ -486,6 +486,11 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
> >         SOC_SINGLE("EQ1 Switch", M98088_REG_49_CFG_LEVEL, 0, 1, 0),
> >         SOC_SINGLE("EQ2 Switch", M98088_REG_49_CFG_LEVEL, 1, 1, 0),
> >  
> > +       SOC_SINGLE("SPK Bypass Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0),
> > +       SOC_SINGLE("REC Bypass Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0),
> > +       SOC_SINGLE("MIC2 Bypass Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, 0),
> > +       SOC_SINGLE("INA Bypass Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0),
> 
> These look like they should be DAPM controls since they're controlling
> audio routing but they're being added as regular controls.

Hi Mark,
Sorry again. You suggest to create a new structure for these entries,
for example:

/* Out Bypass mixer switch */
static const struct snd_kcontrol_new max98088_out_bypass_mixer_controls[] = {
       SOC_DAPM_SINGLE("INA Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0),
       SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, 0),
       SOC_DAPM_SINGLE("REC Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0),
       SOC_DAPM_SINGLE("SPK Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0),
};

Let me know.

Thanks in advance.
Tommaso

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

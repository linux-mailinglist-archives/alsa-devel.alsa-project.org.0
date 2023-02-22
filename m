Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893569F561
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 14:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C66EA3;
	Wed, 22 Feb 2023 14:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C66EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677072563;
	bh=f/S92/t3wpapc4JBI5h0TdPTBVC32g/JNIoyRkl5eLw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYSUK0gagxT/Ct2d2J0XmxLfSE/7HHgc8tCSRMqm8LkBNFOLIxqYahqaglHhDuc0u
	 M0tS1pHn7y7JxXocEHLsGVQgnGbWFGiQVhZxCWIesDgS44Aehph9OeaH/A2aVWqp4c
	 zZhM2hSsi/5YMK7YidQQIpAEjLpOwfcdvvEvvxkA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDCBAF8025A;
	Wed, 22 Feb 2023 14:28:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EEDF80266; Wed, 22 Feb 2023 14:28:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A499F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 14:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A499F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UZGYmUBk
Received: by mail-wm1-x332.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so974681wms.1
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRqorO2vW/DufntBHkr33Jk+mJdL3BUMcZ2IPymDsYQ=;
        b=UZGYmUBk9dzhFyTJ1mKIzeCgtz3H8PPlnNWpL6GNgTh+WCEVQIs6MyBhpYapgTzHzb
         LmnkbOn6oPezl1KawOa5hQqnXZPTWd9lxLUIoEknDT8ydTZz3AyYJkgMiJBbMDPu2RZ2
         vziscPHbZEtDqKiksO4g1bjQmu9l8XMfeQ/sH5ZipD1bBiCtXVTLa+oZ+QYrq/qjNLo0
         GoqdbW+iAFseShtisMEEYCaPCBbJ/9R6ahQlFNMd33yvu2xqRA7sqtiaLIQobfy26yr6
         uxOFMQxxpi2HrxkuiwwQftRpannj5OABrzbwOjUHXHXOFFalmKb6XYjTTG7WYewLnR48
         FRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRqorO2vW/DufntBHkr33Jk+mJdL3BUMcZ2IPymDsYQ=;
        b=PhnYA9AjJzciCIgQyCSKzbsz8Y721B8SQ5t9tir4zn7k3n9ocobt/J9Zefnvs8ZtpL
         nVVIdejl4xk4vijFHxqBoJJZ959TuS+oY0QZzEN9ZFXdOzqL9wHB4+tQMvMXkX4h7iOb
         aErIEF1WF71206LMpUfrPlV+7sdCyOhJrGu2CyytDDwmb8qdDfG2V/fUa+vTjfsUUFcb
         EPmg1kpqWTtkQLxZJYZGfqYVto2ZGoicM9IWFwKBNLbD3RFfesFNQzKdzsIG09wqod3Y
         TMeg8SPcr7xDkgkdMgkozOa+GQkdyH+Tg1aQEeM6tdu6i3x0OqQtyA4vK1UkLLWI+bZl
         3R3A==
X-Gm-Message-State: AO0yUKWKXAOSTQLfPWuNT0Lh2VViQDd3MI2WFMKIWuhiZeCOZlctR1y3
	J+27HtotAP3ePoqL/g37vU0=
X-Google-Smtp-Source: 
 AK7set+1T7UXYTMG+b5hEaUsQLKpOa7X0ZCsLXXfMprUIO7Z2kOeVL2AXaWm/ZKLRpGhcUYrnXFSlA==
X-Received: by 2002:a05:600c:4493:b0:3e1:97d:612e with SMTP id
 e19-20020a05600c449300b003e1097d612emr318020wmo.29.1677072497017;
        Wed, 22 Feb 2023 05:28:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003e9ded91c27sm1370wmq.4.2023.02.22.05.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:28:16 -0800 (PST)
Date: Wed, 22 Feb 2023 16:28:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
Message-ID: <Y/YYaVhE7WwqLIey@kadam>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
 <Y/UcXNueAmrrhWG0@kadam>
 <CAPVz0n01YWQ6FY9RDsa1rw_36n=NKpRLokFiVTxLsMDpQEd4YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAPVz0n01YWQ6FY9RDsa1rw_36n=NKpRLokFiVTxLsMDpQEd4YA@mail.gmail.com>
Message-ID-Hash: DWHP46SCM36UKVUEP2BAS5P5QPRMEK3T
X-Message-ID-Hash: DWHP46SCM36UKVUEP2BAS5P5QPRMEK3T
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWHP46SCM36UKVUEP2BAS5P5QPRMEK3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 22, 2023 at 09:55:52AM +0200, Svyatoslav Ryhel wrote:
> вт, 21 лют. 2023 р. о 21:32 Dan Carpenter <error27@gmail.com> пише:
> >
> > On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
> > > diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> > > index 78faa8bcae27..607800ec07a6 100644
> > > --- a/sound/soc/tegra/tegra_asoc_machine.c
> > > +++ b/sound/soc/tegra/tegra_asoc_machine.c
> > > @@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
> > >  };
> > >
> > >  /* Mic Jack */
> >
> > This comment doesn't make sense now.  It was never super useful, though.
> > Just delete it.
> 
> It does. Headset is Mic Jack + Headphones combined. headset_check function
> performs check for a Mic Jack component in plugged Jack 3.5
> 

I feel if we need to discuess what a comment means or if it even means
anything then that's a useless comment by definition.

regards,
dan carpenter


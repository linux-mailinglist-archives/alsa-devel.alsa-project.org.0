Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145734883E3
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jan 2022 14:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D260177A;
	Sat,  8 Jan 2022 14:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D260177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641650373;
	bh=2YxT2uDI9asV/C+CzYAHXsh8OICbQNGWps8sG430XBo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BblSSKyEWkPBPIqNynW5EmASbYP8zRBLThaBT6doXPz2YaArizl/Z/6VTG3/z8Auf
	 GS6EhJ+RMsKBqOOLM6srZYgx1QVhLDaEK+aq3dkx/mf4B2D0BJZz0z10peUBRm5eCy
	 4gYEHCNQf936QRDxCIu5GuxuibI8osJCn5W7d2JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF29F80083;
	Sat,  8 Jan 2022 14:58:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35495F801EC; Sat,  8 Jan 2022 14:58:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0FFF8007E
 for <alsa-devel@alsa-project.org>; Sat,  8 Jan 2022 14:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0FFF8007E
ARC-Seal: i=1; a=rsa-sha256; t=1641650273; cv=none; d=zohomail.eu; s=zohoarc; 
 b=d5q6hQaE6CAivfFg4bEbzI/4xoFiPBTuUHB0JpI3ZesXO8dtWH5MsLgTlLt1LAFg0Dmmj8dskJ2dJ/ypnEdvprlj5Zo9z42L0q2Z2UQtS+w2Lw40HMVVodVP12nqnf1rcfzDy96C+KCjhkCfNc1yXhdFyTXoggXOmMkkyFWNNc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1641650273;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=db5dCjQMdprZm2Q/1BnWSui0du673YXgro1crJr6KQ8=; 
 b=ARQp6LaC+RyK2nl4fndultqFUsktM7AH3/Y+DjcEmsT4LsvWKutCP+Y3UZ2zn11rxv5ZapiaAd5UHzLt4WfA90orJO7kiX8qAM+LUO1K01kJJGyGYmx9jDuWG8r6kQssAd8p4YZuD2rvlr18p6st5I5Th+KHd0xjP/vDgNWkl+I=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-86.unity-media.net [37.201.192.86])
 by mx.zoho.eu with SMTPS id 164165027124930.82840161754507;
 Sat, 8 Jan 2022 14:57:51 +0100 (CET)
Date: Sat, 8 Jan 2022 14:57:49 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: kuninori.morimoto.gx@gmail.com
Subject: Re: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for
 componants provideing jack events via set_jack
Message-Id: <20220108145749.f55500222b049f344415a5c3@uvos.xyz>
In-Reply-To: <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
 <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
 <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
 <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tony@atomide.com, merlijn@wizzup.org, sre@kernel.org,
 linux-omap@vger.kernel.org
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

Hi,

> (X)	int asoc_simple_init_jack(...)
> 	{
> 		...
> 		if (gpio_is_valid(det)) {
> 			...
> 
> 			snd_soc_card_jack_new(...);
> 			snd_soc_jack_add_gpios(...);
> 			for_each_card_components(card, component)
> (Y)				snd_soc_component_set_jack(component, ...);
> 		}
> 		...
> 	}

So for the case of cpcap codec on motorola mapphones this dosent help,
because we dont have a gpio to sense plug state, thus no gpio in dts
and thus gpio_is_valid will return false, therefore, no jack.

Moving 

sjack->pin.pin		= pin_name;
sjack->pin.mask		= mask;

snd_soc_card_jack_new(card, pin_name, mask,
		      &sjack->jack,
		      &sjack->pin, 1);

and

for_each_card_components(card, component)
			snd_soc_component_set_jack(component, &sjack->jack, NULL);

outside of the if block should make this work, at least cpcap gets the jack then.
-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>

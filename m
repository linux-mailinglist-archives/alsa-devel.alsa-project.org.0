Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22474D9820
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 10:52:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E424174A;
	Tue, 15 Mar 2022 10:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E424174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647337979;
	bh=LQMKDYoUGarbHyxNQgvd7Ia8sbO9uKypMiZE8FxYnC4=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=it1Ai7jsX91SrRAeD4WePlbTLaQxuFVBdHWMZHYRu7nkqNT0csVOs2Hz1nf/+Jww1
	 qHicalWHbN/HeL3K1LmjFFvt8IBN6NMBz1ptPsrOC7cEVbHmGHVZYYHKZgfW+M8MUD
	 lSRlaAwSHyf3VSeMTeRA7hzW5FjCyU/p31KvOivE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB33F80095;
	Tue, 15 Mar 2022 10:51:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3923F80162; Tue, 15 Mar 2022 10:51:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90538F80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 10:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90538F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="PrFeJbRd"
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6430BE0004;
 Tue, 15 Mar 2022 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647337901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28XMruDxI5xAXqFcoprJ5/JI/xvSWIcx4Mr3f3QhgHc=;
 b=PrFeJbRdbeCRnDiITSoOpE4e6OAsnYgEZzmDgu9XfXEDp9wwr/Q/waNkohjRvnX8kAmzW4
 DZXAzQq3tpO91Y4cBcnBgH2YzRzBE7YC4llFA4BIEF1Sa6Bb6oruSQ8/grcFprGNqePba7
 WIl44YdasFxbPLBvqfQFcyrjtV81PFEZ8I7wWz7cOI/dJY1LGw9YqAuQad13FCOtPgvHkZ
 08BwxNA+VCkwBeL1Mnb1kYD7J/f137P99ZlQlOz+WkVUrTeSMi4p9cU/DER0SwtlVXG83v
 Hhm+ThL5CJM+6o4vOYTKDCV7UUhiX5ld0gXpNRjQ7rNc+K2kSuPSwynLlpfl5Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tlv320aic3x: add dmic widget support
In-Reply-To: <YitBvMce9OAh0Jx5@sirena.org.uk>
References: <20220311100627.2181756-1-gregory.clement@bootlin.com>
 <YitBvMce9OAh0Jx5@sirena.org.uk>
Date: Tue, 15 Mar 2022 10:51:35 +0100
Message-ID: <87tubzh7bs.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

Hello Mark,

> On Fri, Mar 11, 2022 at 11:06:27AM +0100, Gregory CLEMENT wrote:
>
>> +static const char * const aic3x_dmic_rates[] = { "off", "128x", "64x", "32x" };
>> +static SOC_ENUM_SINGLE_DECL(aic3x_dmic_rates_enum, AIC3X_ASD_INTF_CTRLA, 0,
>> +			    aic3x_dmic_rates);
>> +static const struct snd_kcontrol_new aic3x_dmic_rates_controls =
>> +	SOC_DAPM_ENUM("Route", aic3x_dmic_rates_enum);
>
> ...
>
>> +	{"GPIO1 dmic modclk", NULL, "DMic Rate"},
>> +	{"DMic Rate", "128x", "DMIC"},
>> +	{"DMic Rate", "64x", "DMIC"},
>> +	{"DMic Rate", "32x", "DMIC"},
>> +	{"DMic Rate", "off", "DMIC"},
>
> This isn't really idiomatic and won't be power efficient since we don't
> automatically manage the power so we'll have the DMIC clock running even
> when no recording is in progress.  What would be better would be to have
> an enum equivalent of the _AUTODISABLE() controls, providing an enum
> with the clock rates backed by a field in the driver data and then a
> DAPM widget which writes the value to the hardware when the widget is
> enabled and sets it back to off on disable.  It'd be fine to open code
> that in the driver for now rather than actually implementing a generic
> thing if that's too much hassle.

Thanks for tour feedback, I will work on a second version based on this.

Gregory

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F6554FA2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9051DFF;
	Wed, 22 Jun 2022 17:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9051DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912550;
	bh=casDfdzqWuIZjwWdH0PD4a/P4HQ3NVuzYN5HDqX4EP8=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxyLFYZUbk8yvvO+zexZ0IGwhwZbKxmgyy8CuD5/gy1IRKI6vm2JvLXuvzZi0eKpw
	 4fktuhIVJZndUzui4biMwNDCl/ixfRj3kqxQizew2DGzmMwNRm+d+tXvqJwJMUtuZo
	 o0FO2PaSWHHJ8zHbQGjeOi4avzXgikj5c6qzNiSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE18CF80764;
	Wed, 22 Jun 2022 17:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C9AF800E3; Tue, 21 Jun 2022 23:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B219F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B219F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fwTohF+N"
Received: by mail-wm1-x32e.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso7874527wml.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 14:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version; bh=v2qblIOiEq3IV+Rw5HWdpUsMOXZ3HPIB/MKM16Vrm1A=;
 b=fwTohF+N5txaueZetr08UocKNsHSlc0pzESbB1F/y7wPIx38EW4abh69DjLIIjg/mK
 PU5/PAH62EX7TRCqSDP8SsNK5QMFUusTly5FVdavQPdaKxAMzKjYBMDAGreFR6ilv4x4
 Q9rSo5W3HuGDB4NIyUy4Zy9cXxhJnNXFdpWoE0dRh5GS0J/K7eqtjcrwyZq0CH6X+1Y0
 mIk+D/RxPlF8lPrxMUpcP798DAj0/aM/TM0peucKs2oabnmprSy/oo94jxdJiLKNHOgW
 GMSyJCSCHgyPxF2XER+hKCvjGlgXmLCvJq8G4/sS5aro8+uViOglPu+6dioavbEmSzZY
 9VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=v2qblIOiEq3IV+Rw5HWdpUsMOXZ3HPIB/MKM16Vrm1A=;
 b=uEUx4R/ClecmiSA0ibN1M04hmeJz9kPDgVh83G09iehduMRu7zug2IkaefnsbHBbj6
 J2kEuvdZDBfllDQOqrKNXpE/7tRqNYt9ALFpq3Jv9SQwKH5ZCw5czW7MzrAeuRsJcKxR
 Puv8jtskj2c2EQWa/rvFFPpjDZceHyGtdjuB3yDeEA9UJDif8HekP6u8CGzmql+WnZTE
 5hJ+CMuBcXbvmT5hOVmG8qKix/M9LxVpjdHEZJ72Vb1HAzVJ0jJx7p3sgas2tbwqpZDK
 xHOidwmv1E76sup824l1e8iGqRaI1NXzGVSSIopGlxHR8drxlfvyCs/diNHE/GaG6AIb
 80yA==
X-Gm-Message-State: AJIora8XKYc/2ZoStWU5Mq6UBRNXBzEGWV/lrSVGgM3cfU37mweuXFA8
 ltlme4IgK5wRdZ3gKSmCGtI=
X-Google-Smtp-Source: AGRyM1seawZlN42pmJSLDQJ3ijOHsGsLAxYpv/JRO9LAGuWDU9AGN2HjpN9wo6nVNwoUmKfzn+8ozg==
X-Received: by 2002:a7b:cf2a:0:b0:39c:4eef:29e with SMTP id
 m10-20020a7bcf2a000000b0039c4eef029emr117762wmg.28.1655845434599; 
 Tue, 21 Jun 2022 14:03:54 -0700 (PDT)
Received: from localhost (92.40.168.123.threembb.co.uk. [92.40.168.123])
 by smtp.gmail.com with ESMTPSA id
 w3-20020adfec43000000b0021b89c07b6asm11227967wrn.108.2022.06.21.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:03:54 -0700 (PDT)
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <YrH7JurP2LAl1uYU@sirena.org.uk>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/49] regmap-irq cleanups and refactoring
In-reply-to: <YrH7JurP2LAl1uYU@sirena.org.uk>
Date: Tue, 21 Jun 2022 22:04:59 +0100
Message-ID: <oewDtaKXJJctSx2HcLTI4xuAmbzWo8Vb@localhost>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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


Mark Brown <broonie@kernel.org> writes:

> On Mon, Jun 20, 2022 at 09:05:55PM +0100, Aidan MacDonald wrote:
>
>> Here's a bunch of cleanups for regmap-irq focused on simplifying the API
>> and generalizing it a bit. It's broken up into three refactors, focusing
>> on one area at a time.
>
> This series is very large and the way it is interleaving patches for
> several different subsystems adds to the difficulty managing it.  As
> you've identified there's several different subserieses in here, if you
> need to resend any of this (I've not even started looking at the actual
> patches yet) it would be easier to digest with some combination of
> sending as separate serieses and reordering things so that all the
> things for each subsystem are grouped together.  That'd help with both
> review and with merging, both large serieses and cross subsystem
> dependencies tend to slow things down.

Thanks for the advice. After reading this and some of Andy's comments I
think I understand how to organize this better.

I'll send a trimmed down series including only regmap changes, and
instead of removing things right away I'll just mark them deprecated.
Then the driver patches can go by subsystem (one series per subsystem?)
and once everything is merged the deprecated stuff in regmap-irq can be
removed at a later date.

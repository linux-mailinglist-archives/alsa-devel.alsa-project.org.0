Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851356BCF0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 17:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76623E8;
	Fri,  8 Jul 2022 17:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76623E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657294435;
	bh=k3bXkm64Ggzvinfi/pv+UmDjE7yW7Zxd/ZHKgbVky3o=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P0zDqqO8+5CNa2JZErKc8d3J9pHNiimC3gtPUT+v/qXZ8qkioYU4VZALfozzhK+A1
	 nfpGZQEPOZWy5deKwsQaqoJFwKhhtiEmxBwGtb/FU52cw+ocOt6C+iAqmnStsV7kC9
	 +ktJwgGihFUoRLIc98BY5tAgT1f/Z6jz7GU7IXU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22BEAF8025B;
	Fri,  8 Jul 2022 17:32:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2C12F80167; Fri,  8 Jul 2022 17:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A723F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 17:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A723F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JqyzyFx4"
Received: by mail-wr1-x42b.google.com with SMTP id v16so19592874wrd.13
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:date:in-reply-to:message-id
 :mime-version; bh=7Gr1DIwlquSsFy5gvJ8I7cokiRlnBL/lo0iBO4OC3QI=;
 b=JqyzyFx4yc1hWWomwr6OIKKgym/3owtxy/4LE652WY3EFU0PxFbAKqUAxssvHIlC6Q
 uARvrf07eKwX2RWdUgtuvt2hlpDowP6/5fx7QAkDNQPGFpemSTmdLm/SIGXJmR2IYkk3
 fy6VSjKnTQnN6ciYNvz2Hi3Psb+omTM3iwlMN/Mvt8G+mZg58i2soituPkE6RapuZFGg
 riuSDkbX93/+BdhLzyckUHs/2aLAuwgbBT54vHv7vTMJuTxXqLaBReYfZeUMmyT0bRkr
 1qcHaQstOW0r/dwXZrjrndA3snyGlYzeQ/9dMZV/df7i8RUTTTYEyNodJq45qRTzICxk
 woDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=7Gr1DIwlquSsFy5gvJ8I7cokiRlnBL/lo0iBO4OC3QI=;
 b=3zExMyDKX/UmctjDPH8o0fdG6Oe+b4hTj1Wds/J+hy1Nlvz7BoVb4E9as+ga8EInz9
 Hk74mct0jZFCTYcsFhjWsfJkWfSJJ5cZS08TDKggeD2ZSCfI8QKYNsszTAMGP+xjrsZ3
 9G/ICWG0HVLWXKRaOKIK9WDRoL/fSuv8BDlFEtTiIhQtvP9V+JKOFCtuOKLXhhkj6/ta
 UyxOzU+yrx548gLnVTnRS74f/uSeyzYJHiRjoeXl90Dwj6ipvtvSwQQEWsz9DsYAR7AS
 8G/qWnuBCWFbD5KnJ3Eoepf+9ftUodAs4cb2VoIvjVESldevWXjtpK4w+vRv8WtB027H
 nK6w==
X-Gm-Message-State: AJIora/qvWcertSIGBLnxsKY3gCV5VMsZG9RKrMn3yS54mcYx9Fiicr2
 IaJfw2u3ypjJKNSwNxcSmt7Ez0fx1FM=
X-Google-Smtp-Source: AGRyM1vgDADaiocyDgtoIhQ8s0fcwP2kLrbv46+a78WOeMjJtNaJzz1ctV9dgn3acFPZmpQgtK1qQA==
X-Received: by 2002:a05:6000:18d:b0:21b:901e:9b27 with SMTP id
 p13-20020a056000018d00b0021b901e9b27mr3972766wrx.389.1657294368605; 
 Fri, 08 Jul 2022 08:32:48 -0700 (PDT)
Received: from localhost (92.40.203.214.threembb.co.uk. [92.40.203.214])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b003973ea7e725sm3452720wmq.0.2022.07.08.08.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:32:47 -0700 (PDT)
References: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
 <20220708104304.51415-5-aidanmacdonald.0x0@gmail.com>
 <YsgmkBpk4JBTkjPz@sirena.org.uk>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 04/11] ASoC: jz4740-i2s: Handle independent FIFO
 flush bits
Date: Fri, 08 Jul 2022 16:30:55 +0100
In-reply-to: <YsgmkBpk4JBTkjPz@sirena.org.uk>
Message-ID: <NuOKvbkZUvbLCcCv2cXfJsp97ioQdiVG@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 paul@crapouillou.net
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

> On Fri, Jul 08, 2022 at 11:42:57AM +0100, Aidan MacDonald wrote:
>> On the JZ4740, there is a single bit that flushes (empties) both
>> the transmit and receive FIFO. Later SoCs have independent flush
>> bits for each FIFO, which allows us to flush the right FIFO when
>> starting up a stream.
>> 
>> This also fixes a bug: since we were only setting the JZ4740's
>> flush bit, which corresponds to the TX FIFO flush bit on other
>> SoCs, other SoCs were not having their RX FIFO flushed at all.
>> 
>> Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
>
> Fixes should generally be at the start of a patch series so they don't
> end up depending on other patches needlessly.

Okay then, I'll refactor it to allow for easier backporting.

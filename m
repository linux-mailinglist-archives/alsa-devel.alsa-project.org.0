Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 700445B695E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 10:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D858E1752;
	Tue, 13 Sep 2022 10:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D858E1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663057210;
	bh=GWw0zSQ9xTnkTikFbHw+rsiQfNjEPV1Hd4C5UeHJAQ8=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqMB9NJCO127QcSWIBhctMWlKMNKnKPrFtVuioKi0O6WAmZRD25dfjks46p+92g9j
	 xeHDMXZk3j5cq0gvPkuVmmL/4f90iVSFXaQwBJ8zcDke0+CSJqgSxEw+bITjhGjyEe
	 VJeG4BC2exXXNWgiMgzdeTVScYrGkiA8Bk3/rfNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55215F8025D;
	Tue, 13 Sep 2022 10:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DF7AF80224; Tue, 13 Sep 2022 10:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FC0F8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 10:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FC0F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="AyXi/TA0"
Received: by mail-wr1-x42c.google.com with SMTP id t7so19432473wrm.10
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 01:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date;
 bh=l8XMGYeKsZZ89DqDIo+/5RloD3JtzsKL/BfidRY4shA=;
 b=AyXi/TA0kKWynhBkYehMp7/4TNiU8VsyV84tSjrI24N4wXnggqDokx+no93Haps/DH
 j8So1rAuYDkyRYmqFtb+V1/ehWicOc3sV1avt42FCYFMzHb8ROZODNI/RCaa686NvDdf
 QP/VyQAq2Iuz7dsiWZGv1dk2pOF9O2Fv2ofUPC9TBcMB6KVroi3ZBwIUttme3HJfJ/NB
 0EQAfxW26Ycqb/OQ0+UR5bduiQylFJWvnR9ZmwF+JwIV2rsW9tVDPVK8P3ymRjBAQ65G
 D3gAjvdKV4QAnC4a+ZBaJNMbr+lN+3kA6QT0leM/xPfN0aBVUX4OLRHhfzpLqPbTcNI2
 qaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
 bh=l8XMGYeKsZZ89DqDIo+/5RloD3JtzsKL/BfidRY4shA=;
 b=OUmzxpSmzdxTueqK4+pRKlnLdogKtUyAsOVYQ6LQNfB25WIZ7d2+vOzZaVoOWe5B7N
 4QW8/mgpyemNJEO8LRk6IS+6qc6kM7ZIxf/OZ1aImuu77TDs94ElufBlzdpgfnDj2SJQ
 4tHLV07bBHsLxB0BJnp6E1u8+baPBId4K0N9PQNQxKqBmRg+XJnLTYhZM3Rr1/HK9Rph
 BNOGD1/WCgO7L8pzhMnt0QRAgAx95DUxUsR16uIynwhSyo38LvS63F2r0htKoqAzdcBO
 4iTWuZ7TDXmpOcg1PhzNbrwh1MW21h+4FoQxBAamyWIc3sM/UPrwPm3mnJ99RXDuuRGx
 aTVA==
X-Gm-Message-State: ACgBeo3BAmqvOF+oATlRMsegYz88Z4TpCOTsWqk5oTHLUKtrDo6kcI/P
 2G+eCsRkCk06J2ELzBKd/5+tVg==
X-Google-Smtp-Source: AA6agR6RYdeoQZLObIikU6bluIeNVVqCjUzuVqzDCm0+dB9FaVEj98KuD3Du5MT4AZiQZH5Pbk27ww==
X-Received: by 2002:a5d:6245:0:b0:225:41ae:a930 with SMTP id
 m5-20020a5d6245000000b0022541aea930mr17792353wrv.342.1663057141674; 
 Tue, 13 Sep 2022 01:19:01 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 t16-20020adfe110000000b00229b76f872asm11499126wrz.27.2022.09.13.01.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 01:19:00 -0700 (PDT)
References: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
 <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
 <YxtpyvC/f6of8scT@sirena.org.uk>
 <87v8ps5gji.wl-kuninori.morimoto.gx@renesas.com>
 <87mtb4596e.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(), and remove
 .remove function
Date: Tue, 13 Sep 2022 10:06:11 +0200
In-reply-to: <87mtb4596e.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jpmfz3cwc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>
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


On Tue 13 Sep 2022 at 01:56, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome, Mark, again
>
>> > > > Current aiu-fifo.c is using kzalloc()/kfree(), but we can replace
>> > > > it by devm_kzalloc(), and remove kfree().
>> > > > This patch do it.
>> > 
>> > > I'm not sure about this change Kuninori.
>> > 
>> > > This is the dai probe, not the device driver probe.
>> > > If I'm not mistaken it gets called when binding the card.
>> > 
>> > > The components and card drivers are different here.
>> > 
>> > > If the card probes several times for any reason, EPROBE_DEFER for
>> > > example, wouldn't this allocate the memory several times without
>> > > releasing it ?
>> > 
>> > Yes, indeed.  You'd need to move the allocation to the device level
>> > probe to convert to devm (which *would* be a good thing to do if
>> > possible).

The AIU is a device that provides multiple ASoC components. I know it is
border line to have this and I'm sorry I was not able to contribute on
this lately.

The device is a bit complex as it is. The allocation in question really
belongs to DAI. Moving it to the device level might be possible but it
would not help make the code easy to follow and maintain.

I usually pick devm_ function whenever possible but here I chose the old
school way on purpose, to make sure the memory is managed correctly.

Beside the general recommendation to use devm when possible, is there an
issue I am missing ?

>> 
>> Oh, yes, indeed.
>> I will fixup it in v2.
>
> If there was EPROBE_DEFER issue, snd_soc_bind_card() will return at (A)
> *before* calling probe callback on each DAIs at (B).
> So, I think calling devm_kzalloc() at .probe is maybe no problem.
>
> 	static int snd_soc_bind_card(...)
> 	{
> 		...
>
> 		for_each_card_prelinks(card, i, dai_link) {
> (A)			ret = snd_soc_add_pcm_runtime(card, dai_link);
> 			if (ret < 0)
> 				goto probe_end;
> 		}
>
> 		...
>
> 		/* probe all DAI links on this card */
> (B)		ret = soc_probe_link_dais(card);
> 		...
> 	}

It would still allocate the memory multiple times if the card driver
gets unloaded and reloaded, manually for example.

It would be strange to do so, but it remains incorrect from the driver
to allocate the memory like this.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto


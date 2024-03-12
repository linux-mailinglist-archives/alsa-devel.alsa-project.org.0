Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C787996F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 17:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFB0EA3;
	Tue, 12 Mar 2024 17:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFB0EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710262640;
	bh=+Jpp0SctZBoE5oavR5EXIu8le75lHRXJ7ZnPAA9ap1k=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQw7Ckf71gpn1D9YQN0dxJ2Y8EIqrcDgTWcmeUmwGT8J92ShZinEyD7YA+NhcR2uQ
	 ftCRiiey73QY564h/E6ekpumYb/99QJCBay0T07gGYO/XLG7vX0eTInkjxiLE0OVTH
	 kW0mYTJNSLWNd3PGpIgNoDnSxEn79qVuAgX6F6oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8F1EF805A1; Tue, 12 Mar 2024 17:56:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42918F8057C;
	Tue, 12 Mar 2024 17:56:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB8BF8028D; Tue, 12 Mar 2024 17:56:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C037F80093
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 17:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C037F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=y8OMofjg
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512e39226efso138316e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Mar 2024 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710262595;
 x=1710867395; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=3B6MiC9H6tI4tQWlutOAgnzSQZlla384PUxY79mvHQA=;
        b=y8OMofjglLkoEo8HSOlPVXNUSHFnob6qNQ5aRZBrrwiawmB6KZE2cIqF/1GuQoIj56
         GcPkTu5DCPCHPZZs9kR1yfc/zhntuZtbGYBq2NLjLDKE0o8IQgHYSabyFN2XpO6kR+BO
         CxPrngh12feX4wfGLsvyC235JQQRT6tWXujLIfHjqBvKS+MrPBOJe/QBCoxG5HRfVd9e
         YYzfmC0iMATDFVYsEnDijzDIyajFkn9BicQ81c5tel3qdIXKdR7KOeEEDzLeZQBka0lp
         54Aa424nBQGzmE3bdvQ1WvfAUCX+vM5h6odix94guD5kqKC8q6TrIB/M84Q+xXnsu6z8
         v79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262595; x=1710867395;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B6MiC9H6tI4tQWlutOAgnzSQZlla384PUxY79mvHQA=;
        b=iKhggGwcBMA/vC6cSbxkNWHE/wdaUFqNSmyx5uLz8gRyDsVqmdDTfrycX1C+9zsfFL
         96VE/B9B+g8KdqnGXBIRrTe05LVXQktWfwIIhG2ct4zW3aPaqc1lRziLa/h3hDX81/Ej
         yzBt5uYhGGsuGc4MMgsoukuXaoANjm9a6eOxJ8P6CNposzCpyjFSOudMaFDiVxeLt7ey
         jEFOZ18s1xyho9DsdZJ5HDiW65L/lqX4f5bDLQsfifQL6EIO8Ev9zlqRqXvZ3NCjkwmA
         ipDmMaf66b2s9YjrwnFiBZa84Ks9y9m+6xKKvihocEMITAtYxsQPBtVmvXvuyRg6QKTF
         N7Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFi3IbwNt95+DNY2v8L1cPabF+mSipeSYbsaGISsYGvKV9/GoWQcvbZVQKwFPtRdn43CSe2oT4/KEtshBlvXLJKl+bKI444p3a564=
X-Gm-Message-State: AOJu0YySEEvKtHsTnCeXwcpjNqziIGvpupm2XlKyUu7sDZTSUVeiEyya
	Mk1nFuR8WC6rkTpwDR1T5bzS5a+U0pxXp7X7flQ0Dz8Xf/nNaecARG6HEFTk7po=
X-Google-Smtp-Source: 
 AGHT+IF8U0bYGEWYmFU/rjKOeBTXnSq7EtQmLk15zyx333S4XxlgMeiXcEfYOOnLbUq1ruRV41D6WQ==
X-Received: by 2002:ac2:5497:0:b0:513:39a0:1fec with SMTP id
 t23-20020ac25497000000b0051339a01fecmr494622lfk.66.1710262594782;
        Tue, 12 Mar 2024 09:56:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:af7b:cf60:208b:83f4])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b004131d2307e7sm12971255wmq.12.2024.03.12.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 09:56:34 -0700 (PDT)
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
 <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
 <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
 <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
 <7248b107-db87-4409-b93c-f65035d0a6b4@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map
 more generic
Date: Tue, 12 Mar 2024 17:29:25 +0100
In-reply-to: <7248b107-db87-4409-b93c-f65035d0a6b4@sirena.org.uk>
Message-ID: <1jo7bje6da.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: UUUMZNJAWKJMIREQLZEGFYBWY5EDCUST
X-Message-ID-Hash: UUUMZNJAWKJMIREQLZEGFYBWY5EDCUST
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUUMZNJAWKJMIREQLZEGFYBWY5EDCUST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 12 Mar 2024 at 13:51, Mark Brown <broonie@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Tue, Mar 12, 2024 at 01:36:47AM +0000, Kuninori Morimoto wrote:
>
>> Hmm...
>> does it have un-cleared "dai_link->ch_maps" ?
>
>> Thank you for your help !!
>
> I can't immediately see where ch_maps would get set for this board (it
> looks like Intel is the only user?) but I might be missing something.  I
> don't have the board myself so can't run anything directly - Jerome?

This board (the u200 reference design) does not have anything particular
compared to other Amlogic g12 based design. Not sure I have an u200 with me,
I'll check.

Mark, I suspect the boards you have (like the libretech Alta/Solitude or
the kvim3 maybe) will show the same thing.

The axg sound card (sound/soc/meson/axg-card.c) does not touch ch_maps.

This cards uses a few tricks to deal with this rather complicated HW.
Off the top of my head, maybe the following could complicate things
for this rework:

* dai_links are allocated with krealloc because we need to add links
  for the TDM loopbacks. Whether or not loopback are needed is only known
  halfway through the parsing of DT. Still, __GFP_ZERO is used, so ch_maps
  should be cleared - so I doubt this is the problem

* In addition to DPCM, the card uses "Codec 2 Codec" links.
  IOW, there is 2 layers of links with '.no_pcm = 1'.
  This is necessary because there another layer of digital routing past the
  DPCM backends (basically a mux between the TDM backends and internals
  codecs, like HDMI). Maybe this does not play well with this patch series.

I can't really test right now, sorry.
I can check and test further later this week.

>
> [[End of PGP Signed Part]]


-- 
Jerome

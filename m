Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB46966CC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 15:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA0E84A;
	Tue, 14 Feb 2023 15:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA0E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676384834;
	bh=1KUT1tm2JstK4SHwVMqDxwvsGpX4N3Zg4TqA6+/967I=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y9w+PEraaPgDd1r6tDj/gYGn7kx6TDgCn5oAXz4Cf4KAb1fz1ei+pPT7Hq5iqMJfu
	 laZsoVS5t3YLiw8+MLRMTBUWLzIaDdSGr8wSvfvsh+S1W17wabC8ulDSN+sk2v0Zsb
	 zIYa2dwlKvYPfnnIi0YzfrN2gDKlucmXfREpHrrg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FFCEF800F0;
	Tue, 14 Feb 2023 15:26:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB885F801C0; Tue, 14 Feb 2023 15:26:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24133F8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 15:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24133F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bkGxPa/4
Received: by mail-wr1-x432.google.com with SMTP id y1so15859223wru.2
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1KUT1tm2JstK4SHwVMqDxwvsGpX4N3Zg4TqA6+/967I=;
        b=bkGxPa/4UTf9Yqbew+EqucLOjb01XPqUnayINAeq3O8YkqvGssbdeX/j8ftFQRIaZb
         jAg93u+jCxGYoyz2nqeousjEOlYWsh6yKqKBxSeZYNYsgAXhfgAjXuHewG01HdjDKqXm
         YiW22MT2QQfmbnveSJjA9ty3/uS19S3c9+k7xw3PDBMfI1pv9i6KQ9lbw0PYytNK4cpU
         IdLUGZLhWebpw5up5YHxzdbiP+zd/z9EaV3S4k+PfXX74zLGCCwlZo1FQRB+MfxYBrAg
         DOTbPYf5EdRFzN2UagvgW8LVQZHdVckbr4BMDUfnenBmTZh2WSA48rZnEgk4ukkY3YIx
         agjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KUT1tm2JstK4SHwVMqDxwvsGpX4N3Zg4TqA6+/967I=;
        b=0FEI8qFxXdWtn/cmtcJ+nuG9WWVahvHw8LE13lg68ijEdbjKj/ZWKpKiQnvsm0r4ie
         a14R7rT7LMn+xSHr7hJMQ4v7B53Z/S+UTokzBPIJS3KJAd47kS8W0OEoFPuvSJcZfeTX
         YLygLiT9OBlozUn3FL1G7s5rVxvmaxJl1ajOrctkOTkpTMJFjeg9WnU6OgfoDdRkelaO
         h7/GUgMr8AaO2vo1L2nW0YwDri7dONVieitAuosD7Zsp0H6k1A19Eey8QGEipt6hGH9O
         EMBjGbalJU3FLZLqpe0ClFfpCfpwi6sb7fuN4Ll0DNSbGvCcMO3se1j/EtALLfm5Sdc0
         UX7Q==
X-Gm-Message-State: AO0yUKUrrcENbZsmRF5UKa5DHsvpgG68BIaeXgcgMVO2zR1HSklvyZas
	TWogmd0ud4MF8VOhMzW94V0=
X-Google-Smtp-Source: 
 AK7set8dprBf3qnsvY1G06+DkvcfRpjsUDfPlDx4iUVhJnmFWS8SPhMrb7n+rF97nB8B4OL22RuZig==
X-Received: by 2002:adf:f806:0:b0:2c5:5184:abc with SMTP id
 s6-20020adff806000000b002c551840abcmr2347554wrp.59.1676384775231;
        Tue, 14 Feb 2023 06:26:15 -0800 (PST)
Received: from tuxbook.home ([2a02:1210:8629:800:b2be:83ff:fe21:42e1])
        by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003de8a1b06c0sm20322136wml.7.2023.02.14.06.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:26:14 -0800 (PST)
Message-ID: <ba51ecefb814115e977d90062ca5fe99859cb327.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: ep93xx: Add I2S and AC'97
 descriptions
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Date: Tue, 14 Feb 2023 15:26:14 +0100
In-Reply-To: <c4f5f733-ce22-2dfa-30f7-cde309eadaf9@linaro.org>
References: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
	 <46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org>
	 <109868b9492aecaca0a7170cba9fb51e62de7116.camel@gmail.com>
	 <c4f5f733-ce22-2dfa-30f7-cde309eadaf9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
Message-ID-Hash: S6WWBGHH7EMZMOU26G7DO3ILVQERTYZ5
X-Message-ID-Hash: S6WWBGHH7EMZMOU26G7DO3ILVQERTYZ5
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6WWBGHH7EMZMOU26G7DO3ILVQERTYZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Krzysztof!

On Tue, 2023-02-14 at 15:11 +0100, Krzysztof Kozlowski wrote:
> > > > +=C2=A0 interrupts:
> > > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > > +
> > > > +=C2=A0 clocks:
> > > > +=C2=A0=C2=A0=C2=A0 minItems: 3
> > >=20
> > > maxItems instead
> >=20
> > reg and clocks are required, I suppose I should include both minItems
> > and maxItems for both of them?
>=20
> No. minItems is implied.

I see. But I think minItems "3" should be included for clocks, right?

> >=20
> > > > +
> > > > +=C2=A0 clock-names:
> > > > +=C2=A0=C2=A0=C2=A0 items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mclk
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: sclk
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: lrclk
> > >=20
> > >=20
> > > The clk suffixes are quite redundant. Don't these inputs have some
> > > meaningful name?
> >=20
> > They are actually meaningful, as they are usually named in I2S, please
> > refer to the EP93xx User's Guide:
> > https://cdn.embeddedts.com/resource-attachments/ts-7000_ep9301-ug.pdf
> > page 71, for instance.
>=20
> OK, but then I like the example - if datasheet would use name
> "clk_clk_this_is_clk" would you still find it meaningful?
>=20
> Every clock input in clocks is a clock. There is usually no need to say
> that a clock is a clock...

I see you point, but this is legacy code (sound/soc/cirrus/ep93xx-i2s.c)
which took these names back in platform data times... I also see that
rather majority of *i2s*.yaml use something "*clk", so maybe it could
be accepted for legacy code?
=20
--=20
Alexander Sverdlin.


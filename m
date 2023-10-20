Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895F7D198F
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 01:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D600E83B;
	Sat, 21 Oct 2023 01:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D600E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697844029;
	bh=yqnO0GyCPQQeD5I0B1DjoMIOhZkBapig4j5yRoqsCBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KjRl24tHGqbM1aj5tq95QhYYnIEcPXCNUFQlTYE0pPTBuEPnUvVQJfKEGbReXPFz4
	 63UyaJEVIkdYglIxYoFNu2Uf766jjcT1Uru14nOyyRxS8BOhxdCXGfVyl9naXiasuX
	 JLuNyTqHSN53/rmyp2OqzZoYmFyrFEcebVm1WP4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F788F8024E; Sat, 21 Oct 2023 01:19:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07833F8024E;
	Sat, 21 Oct 2023 01:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78758F8025F; Sat, 21 Oct 2023 01:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9436FF80236
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 01:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9436FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eCSMDsrm
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507c8316abcso1703323e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697843964; x=1698448764;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gd+y1EVP7Tnl3Fn7df202mdRXZ1tRrmqlbxFbYLZtrg=;
        b=eCSMDsrmH7NUtH3v/EMOIIaPtg0DaW6DkvJ9dF7StYi0HltFs/4372vW5n7y/e1oE9
         7/2FdKTcF+0W7YXAMCcZl2QkaFSmzsBaRPJnOUyySArp++K0/Rq7GKNY36JsiUDIM2ji
         +oDuGwJA3DCXG9Dq5/yGtqR26cmYqGYcD3BvffOtip0U/CvNNia6lg/h9Wi7KoICUcfa
         hiatpWmnst24EFQxc/BedQaZnwcUcBCe+flZYL37F6xru5vB7kZrQK/whSX7od+piUOr
         Rq+SjxKTC0qKVbzQwxWGPVbZC5Y0lvxbcIkCtuPrgSV7QN5/oKhvtGTGbB0UNj6FvI6w
         vjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697843964; x=1698448764;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gd+y1EVP7Tnl3Fn7df202mdRXZ1tRrmqlbxFbYLZtrg=;
        b=OborQJQKRqxfUJwkk/HNxblSQjKbams2wymFg7ETXg7aovmd3xX/86ipzAveWb53l4
         mpJUWRsnfhaMlw+xsl9h+PQoxSmgsSmpsUsq13u9spSHzQKKjMruHnSrCxx7higEUIVh
         llAqJq95nG9Ai/lVczwhDcAUwJcsRwS0ULkbaxtQY26yAwomVMJBttu3t/KaiemU6Qir
         x1WQmlABdLxnAOyVkhJ9ZL6aslRAjsq6x9KsXpNnjg1a6Cx9Vu0/sobq4shTn+MWpNhG
         tRT6YxPb8iq0R0g1hYmLvZBJ9araTMYhxYoVa+gUE0NFu1kvKGX+0WQ7aFaNC7LofNmF
         m+/g==
X-Gm-Message-State: AOJu0YyH0qV+7BovwMgzYlX6IzfcngYT5p4yxRo6mnluLrOAH2Jkgu5N
	wMSMCK8MRTJ7K6YgYyeWJdA=
X-Google-Smtp-Source: 
 AGHT+IFbO5a9uW2x8EMaPxKrNZYl8CKdmOJba3kWXFwTKqv6/E/6iwbLLAWd+A/kzuWQwx8SQFHmdA==
X-Received: by 2002:ac2:4183:0:b0:507:9f51:acee with SMTP id
 z3-20020ac24183000000b005079f51aceemr2101993lfh.22.1697843963947;
        Fri, 20 Oct 2023 16:19:23 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.dynamic.inetia.pl.
 [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id
 24-20020ac24858000000b0050797006048sm576424lfy.68.2023.10.20.16.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 16:19:22 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Date: Sat, 21 Oct 2023 01:19:20 +0200
Message-ID: <13380212.uLZWGnKmhe@dell>
In-Reply-To: <9bbab4c8-f616-4abc-9eee-022c19c6921d@sirena.org.uk>
References: 
 <20231008135601.542356-1-jmkrzyszt@gmail.com>
 <9bbab4c8-f616-4abc-9eee-022c19c6921d@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2913659.e9J7NaK4W3";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Message-ID-Hash: 6O6Y4W2P2MTBARRSDL4DSG2R5XNSBLTQ
X-Message-ID-Hash: 6O6Y4W2P2MTBARRSDL4DSG2R5XNSBLTQ
X-MailFrom: jmkrzyszt@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6O6Y4W2P2MTBARRSDL4DSG2R5XNSBLTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--nextPart2913659.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Date: Sat, 21 Oct 2023 01:19:20 +0200
Message-ID: <13380212.uLZWGnKmhe@dell>
In-Reply-To: <9bbab4c8-f616-4abc-9eee-022c19c6921d@sirena.org.uk>
MIME-Version: 1.0

On Thursday, 19 October 2023 13:40:57 CEST Mark Brown wrote:
> On Sun, Oct 08, 2023 at 03:53:10PM +0200, Janusz Krzysztofik wrote:
> > The driver is now built only when MACH_AMS_DELTA is selected, which
> > requires a very specific selection of ARCH settings.  As a consequence, it
> > gets very little attention from build-bots, if not none.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Hi Mark,

Thanks for your Ack.

Since the fix required for successful compilation of the ams-delta ASoC 
driver already reached v6.6, my former suggestion to pass this change also 
via Greg's tty tree is probably no longer vital.

Thanks,
Janusz


--nextPart2913659.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmUzCvgACgkQ2WqSnlts
jBpNFAf9FNv7JXlsqK4cead1KZEZ3CLVzOWvKWgquVyK21Rf35wQOfJvzlWTXSeB
J/GS5Jdb399q0uSGJ0H9tN7E2kUQ7A3EffqHigsjDsmUlJamS00OFWlw93CpZlKB
11TtR6hrxxXoCoDZXmzYLvCac0+AZ6moIQ0mJqY6AlBho4QNAxPafvwaQ1bzAkmA
v39as9EopIOAaH8XYgX2fnQruN8jY7s9dhZwoO7VzpzcQliwakIxE2fGbXpnh45s
k0BHkOLJgF2z2nj2PekKh1vnGw0757dytIAUpPu/j/jtTA6AI94bTTEYMQHTWjaz
fDCU+8ORkRns59sg882e2rnWGjh73A==
=m2Dz
-----END PGP SIGNATURE-----

--nextPart2913659.e9J7NaK4W3--




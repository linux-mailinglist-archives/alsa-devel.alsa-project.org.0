Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43548786AA8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 10:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6998186E;
	Thu, 24 Aug 2023 10:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6998186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692867007;
	bh=lbq43WGZ1Fe+aNbqYns34xOszBQ4DFwPY/67iL5oAPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQq0xhvFuzh8j3O5mhoOcx4CSpqtI6AT7QCPsv+ERwB6Bm2TJvofs0hRfAEVKeN/f
	 ZgbntoImYEvU67932VQiVQZWXL2/O/P7pqGg7YFaFjOA4GsIfEnsrdjS3iC3rTuTcR
	 LNZ58jhfNXMeWUu6v1QLzWcPJvzSWfJNnMQ8vGmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEAEFF80571; Thu, 24 Aug 2023 10:48:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E1AF80563;
	Thu, 24 Aug 2023 10:48:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BCA2F80158; Wed, 23 Aug 2023 18:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13604F800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13604F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PlQI+RDk
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bba6fc4339so89351921fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692807225; x=1693412025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l95LCr0GMnr5YIrvqZTvdFeVvMdsvoY6X85sEcfYdiE=;
        b=PlQI+RDkk1NVSZGlQ84IghRbiWgml+c5nhCu6EL9Adlzg+YYBScfkWOJMK5PjQ7GGF
         rVvJ8SUfT72W+q2h3rTCOLrG1ZCh6/SLHp69P/pGMWGzivp4jQP2BaO1ibeoDDKTG98h
         jlcrM/dUGy/NeTDagNToM3Ob60wtBQAiiADwEErEaJHxuXFlzGdMdL+WCBkI2ULyOMiy
         fZJKWu0Azt7io9ky45aGIZDbc1SyTe6raDeR/VZ+PAhBzrVq2NeW0avh7AhIZikbmka3
         HAp4IgTwRJAmgKiAsz7uh+ThJyLgH47ymSGVJY+Ok6so+/bmu0w5iOT7qp52I9vCn9/2
         uD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807225; x=1693412025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l95LCr0GMnr5YIrvqZTvdFeVvMdsvoY6X85sEcfYdiE=;
        b=Tg4BGI1KUhALZ/cRUV1nSJSIQe0JP24Exhr+3rffglJ5X6uSqXDI8DUM22vdLYzX/0
         CTXqAQfo238lgmfJSOVj8MnqNxOP1aKpLEpXMWjwdOOp7c65TlZjotnPNC7dZDmISfrf
         bjCjqpygoHaNUuDQTozcLO4d8y7RPvs3R5A0GYQz5PHCxXo6nCM82LOyZzvDqmpZ+K0K
         7u3wSj/79d1f276678nggeD6ZHf6tRxjZWfASLRWcqHUp9rXwmMOPhoJOzuErcOOdxKP
         CLjBv1LN5SCVbnOTobQxfgWgxpHn1e1aH7Dc4t7ArxD7bDvOJMcSNRJ45roXTIjgRsiI
         yYVA==
X-Gm-Message-State: AOJu0YxOzfWv8zuh++1Ieukhpw42oD57K3ya76owdSRACghBNlP3TiBp
	2tI22XlRh4JNyDXMjEJxy1sxdq8RVl8Ndv8k3BY=
X-Google-Smtp-Source: 
 AGHT+IEg3+HoSNgWCsU5nKzt+RBMxv37klHp8t/UlohBP0GSJi3Ntpjq/Fb5EwAahM5Tl0nX9STzlX0dMhXv7HMOebE=
X-Received: by 2002:a2e:9dcd:0:b0:2b6:e105:6174 with SMTP id
 x13-20020a2e9dcd000000b002b6e1056174mr9882353ljj.47.1692807224549; Wed, 23
 Aug 2023 09:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com>
 <20230821154739.GA1720453-robh@kernel.org>
In-Reply-To: <20230821154739.GA1720453-robh@kernel.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 23 Aug 2023 20:13:33 +0400
Message-ID: 
 <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for
 "allwinner,sun20i-d1-codec-analog"
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: bigunclemax@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FHOEXFDHQOYDBZPBQI4S24ZJINC2AFCJ
X-Message-ID-Hash: FHOEXFDHQOYDBZPBQI4S24ZJINC2AFCJ
X-Mailman-Approved-At: Thu, 24 Aug 2023 08:48:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHOEXFDHQOYDBZPBQI4S24ZJINC2AFCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=BF=D0=BD, 21 =D0=B0=D0=B2=D0=B3. 2023=E2=80=AF=D0=B3. =D0=B2 19:47, Rob=
 Herring <robh@kernel.org>:
>
> On Sat, Aug 05, 2023 at 09:05:02PM +0300, Maksim Kiselev wrote:
> > Add a DT schema to describe the analog part of the Allwinner D1/T113s
> > internal audio codec.
> >
> > Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> > ---
> >  .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,s=
un20i-d1-codec-analog.yaml
>
> Looks the same as allwinner,sun8i-a23-codec-analog.yaml. Why can't you
> use that?
>
Hmm. You're right. But let me explain my decision :)
When I added a new file, I assumed that since this is a separate driver,
then the binding should be in a separate file.

As an example, I looked at the sun50i-a64-codec-analog.yaml binding.
It is mostly the same as sun8i-a23-codec-analog.yaml too.

So I really don't know which approach is better. If you advise me
just add a new compatible sting to sun8i-a23-codec-analog.yaml,
then I'll gladly do it in the next version.

Cheers,
Maksim

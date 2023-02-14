Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CB696421
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 14:03:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37FD827;
	Tue, 14 Feb 2023 14:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37FD827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676379818;
	bh=sBul4mgzs45bE2WzuID5dXHTGBIFUQ/hKqlFkOwGiAc=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M7fyxy3JRgl0PSi+2GwtrEJ12OGJEQFAZnrlyAUZtQ35QApPjVz/EUE+x0uBO4JT0
	 USastrbsdhjrG1M35ei7bnprspwmAJAIWgqIolZ8Bnz95Od1yhYUxiLMl4vBaFB/g0
	 gcTYLODYbXpvAgs+DnWHkqYfelUMPzIN7EQejyZ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A0E2F800B6;
	Tue, 14 Feb 2023 14:02:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9B0EF801C0; Tue, 14 Feb 2023 14:02:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FE1FF8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 14:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE1FF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BNlMqkCx
Received: by mail-wr1-x429.google.com with SMTP id j23so15600366wra.0
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 05:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sBul4mgzs45bE2WzuID5dXHTGBIFUQ/hKqlFkOwGiAc=;
        b=BNlMqkCxB6wVRpny4TkhAV36P3pHCVa75zArBFzcfTykR1B/pSlGuLrUg5yV+S+luX
         Iqd0Eq7e7ruG+Vi2BJxQ9jzD94Q+TsN7yZ4Ghht7bnxAUIRcCzgGRAwdNs6MGKl/alc0
         IkltwGUTsQt8qIzLnt3jEM2WwmwmnKigqNsInawYfgwQlIclRZM7SQWxDPnf/ouomKp9
         Tqe7g3Xyqyu4B2Vr/bpWImqTvQslQQyFjYiXRg9v5h1alwHIr4wyiC6SnM6SW4kRH1vy
         APleaNg9titz/wA4y42tzLJ+pRlAQNdzuRhzP0jL6LKImCa7TE88uhdY5KL7GpeaoYbQ
         LtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBul4mgzs45bE2WzuID5dXHTGBIFUQ/hKqlFkOwGiAc=;
        b=dswC+zbIU7K39ul/FZeRSzOgs6VFVz5/9HDNML8InAhY0E//79Wesl/5gsB6oS8yZp
         +ijtybWQ6Woawj+TC70xXyzmkYxMaCOkv7phn7XnVN67DE8j0wT4y95um0ZyHwMLY/CA
         BQZcWpNNSaIkXb80kvake4lkSV30dl6swkIrnu8uv3HEc+G4PeXrQa2z62N+giD6w2oD
         nq2v7Bzk5l6lVSsxIrDz0S9RNhKSc8g7fVQN6DNmVwzq1tVOGE2jW5PMaRl4V39M2lJf
         KO7tUrGdLDIo45aXdqS6QxGVHDgZ01OFGhlBLfQgtte0hgjBYQt05QglYAKPeZ5XDrmK
         XBwg==
X-Gm-Message-State: AO0yUKUIB3lgIwA5uWvyIdBmiZEgyZOF3AMANWMDeZDktyqmlv+LBzR4
	QuMUEmNqwOYCVOuadv7l0X4=
X-Google-Smtp-Source: 
 AK7set/5JzZC9z60wMQR6fIFUfEKjuQDAdJ1gaPUmOgHOtcDI3lkfCyOKYhZ/oNcsE8Jtt6Z5kDP0Q==
X-Received: by 2002:a5d:6885:0:b0:2c5:5451:9d7a with SMTP id
 h5-20020a5d6885000000b002c554519d7amr1847991wru.46.1676379748503;
        Tue, 14 Feb 2023 05:02:28 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5411000000b002c558f58c5bsm4997034wrv.28.2023.02.14.05.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:02:28 -0800 (PST)
Message-ID: <109868b9492aecaca0a7170cba9fb51e62de7116.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: ep93xx: Add I2S and AC'97
 descriptions
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Date: Tue, 14 Feb 2023 14:02:27 +0100
In-Reply-To: <46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org>
References: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
	 <46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Message-ID-Hash: XC2GLRHELC2UP2ZWRY6IQLKKPE2PC2KS
X-Message-ID-Hash: XC2GLRHELC2UP2ZWRY6IQLKKPE2PC2KS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XC2GLRHELC2UP2ZWRY6IQLKKPE2PC2KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Krzysztof,

thank you for the quick review!

On Tue, 2023-02-14 at 11:58 +0100, Krzysztof Kozlowski wrote:
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: cirrus,ep9301-i2s
> > +
> > +=C2=A0 '#sound-dai-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 0
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 minItems: 3
>=20
> maxItems instead

reg and clocks are required, I suppose I should include both minItems
and maxItems for both of them?

> > +
> > +=C2=A0 clock-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mclk
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: sclk
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: lrclk
>=20
>=20
> The clk suffixes are quite redundant. Don't these inputs have some
> meaningful name?

They are actually meaningful, as they are usually named in I2S, please
refer to the EP93xx User's Guide:
https://cdn.embeddedts.com/resource-attachments/ts-7000_ep9301-ug.pdf
page 71, for instance.

--=20
Alexander Sverdlin.


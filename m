Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FC79CEE1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5160E7A;
	Tue, 12 Sep 2023 12:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5160E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694515904;
	bh=x1zhy1UCOP1ljrKVhLiacaxWhwvSH+VCp0kMLxhoeYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7RWCLWnQQ+ey0OygzzENuU38GqOxTcCdPVSagc1i/+URHbGlHXuWGlKFS3QE+gUp
	 rRP8v7ZntXQK/0SBwNBTADk0lg2q+UOPDCxC08d3oyCRaHg6/bfF3EmYkc8kv10+Tx
	 UdvCxjWwT5wfja6KnpQsmpilCi1FeijPVrPjLkZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0507EF80212; Tue, 12 Sep 2023 12:50:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51DDEF80246;
	Tue, 12 Sep 2023 12:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EF1AF80425; Tue, 12 Sep 2023 12:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 082DDF800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 12:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 082DDF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gleuklvJ
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d7d50ba994eso4732865276.1
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Sep 2023 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694515830; x=1695120630;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1zhy1UCOP1ljrKVhLiacaxWhwvSH+VCp0kMLxhoeYk=;
        b=gleuklvJfO4ADetji66Gz2bA88ngCH0rPGjReuX++p4rEOYgfcP4D9XPexFtrvZD5j
         J8pO5ITtjHRbqGhESopM1kHgoHl8ecxMCwIN52pSDGjgzpgMe1cEI1wEmzSiouVukxwC
         ClRb+gbDMXHghbKNTFDzeebbbRwtFUP5jKwDKehoyU6UUuHs8SFenburlPMTVZi+Y8iV
         rtqJb2v/4sbCs2ZPRjL5nryjwNZw2eLT6l8MLcGeA1otenYtZjC5J/hz71fa0p/haJ62
         4TWrufDEDG/OnUikSfEphOpx8D9QHWJjOaYBdSTD2A6njzmnU/wY645UV8QYdrGyHVzB
         yhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694515830; x=1695120630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1zhy1UCOP1ljrKVhLiacaxWhwvSH+VCp0kMLxhoeYk=;
        b=UWH29hKzCLcUcCI++I8ZXTLz849Q76/Nw/lFm8W6SKuGoFiHuCI3mZAlcphDq6l7KC
         OIM1HFtSc5+b++Js4F+kNxOk+fMgk16tPnHz02Lay6SE1I5aXtJ1nB8+NXl3WmHIHD2g
         QclooL4U9Whm0XimKmnPWCJwZdp6rInfJZ05fGzsIDFl+6BIxnPKRMTEbtFYGXKYWx2v
         m9pRUf6zRxbvGUVKbJzE+zAHHUzahkaj3CLjltoBL1uMYX1lsfksjUTekHgRGv52Einl
         iosu/00b8HwW3Hw3UqQPZ+JilZoerhzFBpCoE/c1C/FupXKTctUcb/N5IqU/kZxbsllX
         wviA==
X-Gm-Message-State: AOJu0Yzwpkgt2B309BNwHc80y1IcJicEJ0WcUNFqWB2mEzgTSir2u9nt
	BpPE+k8o0xixhP+vnJIDGSOdnkER9ro9hEr4SedHyA==
X-Google-Smtp-Source: 
 AGHT+IF07zf9UK//ddp32dWpF4Y9JXdGQlakVWNajAly9WIIg0061on0AU2876ifTbnQDu3Gsm2uIBLaneAG2d7vX6I=
X-Received: by 2002:a5b:d05:0:b0:d78:98f:4aa1 with SMTP id
 y5-20020a5b0d05000000b00d78098f4aa1mr12462208ybp.7.1694515830489;
 Tue, 12 Sep 2023 03:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101458.225870-1-herve.codina@bootlin.com>
In-Reply-To: <20230912101458.225870-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 12:50:18 +0200
Message-ID: 
 <CACRpkdYFuqQYhB7dOnRnUo8kfRiVZFzYBQuWCpEPLLKVSzKkJg@mail.gmail.com>
Subject: Re: [PATCH v5 27/31] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: I4XMBKW7CVZEWJQSOHK2WFHAOKDXTDZ6
X-Message-ID-Hash: I4XMBKW7CVZEWJQSOHK2WFHAOKDXTDZ6
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4XMBKW7CVZEWJQSOHK2WFHAOKDXTDZ6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

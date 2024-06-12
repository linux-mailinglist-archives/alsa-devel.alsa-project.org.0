Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6590780E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CAB1947;
	Thu, 13 Jun 2024 18:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CAB1947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295401;
	bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S0OmRBGK85vwms2YRctCC9el2Xk6gmN3EvL0qBVBcRs2MWUwc7d/1Jngq4vX9wDXa
	 wrm/t55jTW+Kw/TN8zSyiVsNm63UardPNIMEUnB/feKr2Ijv5eo0XPfA74eu+CJX7N
	 yqctc64qQTveCsW4sU6gDoJ8l6Vlt901llJWqBrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68379F899D7; Thu, 13 Jun 2024 18:05:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CDBFF899DF;
	Thu, 13 Jun 2024 18:05:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A480F8057A; Wed, 12 Jun 2024 10:03:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6679F8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 10:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6679F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dU2DZi8/
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6b072522bd5so19375196d6.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718179383;
 x=1718784183; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
        b=dU2DZi8/5/w6FhOFTVVJ04vuVUNWxQmQg1YqGfKXp2lQLOge7MMcZtkS1zAuKzdF2a
         DavQWQgQojUbFbn6ISc+Aw5L7MUCwLrPpflPONFEIUOVpgcuEQDZBuLNUOq31zqEugV8
         Mg/E6q4IuWyx6rfcUQjUefgvrEyaPtT3ycBx1OoqyaJ02U0YXlrqUQD8AvUdGXI/UI2C
         cp/x8/lP3HxVUMOMjGkRvoF3CznGC62IJQAWLEHjWsHkpGF1z4Y8b8NSibRdLsax8WBO
         yCts7S/Be6Dsxtw2DJld9se0bV6rOK+Jjws1a3oEJg8LahvCvBHIq/LqB/ruFkDeixmE
         hxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179383; x=1718784183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
        b=Knslh+A2bItdqlg2HcR3a2Qq4DszKnPBhRBaLZYBlu07t1fkoQn+qK4EnoOAqtWq5Z
         J9eQBqvPpllQozKnq0UDvtwEwZwQafMEeJCemM82XC/RYly1PUDZjxBSzp7cEy8HZheW
         lVqp6LAQU758CHyf543NOECtuSUQZqw5oM4fSHg8mvErxsp1sk2OnRW2fDS071RVK461
         C+t4Qy7d3fYkHo8au3K4oVI2tseMVOiNjSvxXJ21NnwI4rq4tydfXIoW3c+DhRSx1oiU
         E3ZowNhVxKwTqapafUVjFneo4kLNZtJinVQcfgA2sLlhMgTCIkSU4zLGjS2u3M1MI0yJ
         J6tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuiKZSG+jTOVqBip4pvKTr9uqBe0gzSJaUCfABkm8Lz9INNnYqCwMuhnvrigrou7iT1qGK86cAHIx3d7V4pz39eSBZysLNQRdoxLQ=
X-Gm-Message-State: AOJu0Yw6B/0xTKN6yMxbxSA2+X4lxIhWPXBLEoHtVLuUp676bngI9kPq
	pYlMHYjLbRTPWK93tuyGR08HL6AKpGYRb7sAirK9Gd1K1Jxa7TyssDFStkjW/fiozlTXp0ciLia
	IY/sUSm212OtfJlxzUjcJ2sJcPqcawIV2WEeMGw==
X-Google-Smtp-Source: 
 AGHT+IFBoGLGnRCfXUTT6MkmXv5tkb/vW4wlOs2DaIN1mKJ7KPlKywflPDae5tbSNQuiVC2G0raN2IzC+x3zhZJMYtQ=
X-Received: by 2002:a05:6214:4606:b0:6b0:77fb:8f16 with SMTP id
 6a1803df08f44-6b191778bdbmr10576316d6.21.1718179382867; Wed, 12 Jun 2024
 01:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
 <1ea92ff0-7e2d-4a9f-bef4-d50fc93b86e6@kernel.org>
In-Reply-To: <1ea92ff0-7e2d-4a9f-bef4-d50fc93b86e6@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 10:02:51 +0200
Message-ID: 
 <CAG+cZ07jpi0dobjf8JYt263qqy1tYWAvzsV9cgKaAW05mBoCeQ@mail.gmail.com>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TDQMZTLVBSTL3EFEU3HUIU2ZS52Y55DP
X-Message-ID-Hash: TDQMZTLVBSTL3EFEU3HUIU2ZS52Y55DP
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDQMZTLVBSTL3EFEU3HUIU2ZS52Y55DP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 11, 2024 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I do not see my comment about DAI being addressed.
Were you asking if it's a DAI? yes it is.

--=20
Piotr Wojtaszczyk
Timesys

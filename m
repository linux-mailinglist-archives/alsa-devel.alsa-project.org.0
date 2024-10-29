Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E369DFC01
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A2FEF51;
	Mon,  2 Dec 2024 09:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A2FEF51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128623;
	bh=s8ICCB1ndrAwqFDOOlN8qqnJbuT2kDYjcgv4kgdkEQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PmDtpUofmVzxrR6tkjAaJEgZX/yqSUUK0iGP3fBuvX8IOXE3bfJfMKpHeO8RQ5Cr4
	 QXFOH4uo8byRY+PbjVmCiy8Miz3t/TTzzZ0yk17/uiCDubh4acGYuSR0hVjjh0QtoF
	 Ds+4DgBuKmMnr9wdVjrg7POusCmSfWghCZFHbI6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3C90F805C9; Mon,  2 Dec 2024 09:36:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 292D3F805D9;
	Mon,  2 Dec 2024 09:36:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B083FF80269; Tue, 29 Oct 2024 17:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5E2FF800E5
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 17:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E2FF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metux.net header.i=lkml@metux.net header.a=rsa-sha256
 header.s=s1-ionos header.b=YaCUw65c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=metux.net;
	s=s1-ionos; t=1730218681; x=1730823481; i=lkml@metux.net;
	bh=s8ICCB1ndrAwqFDOOlN8qqnJbuT2kDYjcgv4kgdkEQw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YaCUw65crEamAG54/dYVtLM+LELDPQl5m0uGpmBVHyFvp4micU5kET41FLvCjsbL
	 ShWF0uizVKuFVKx+9yxKXOvBDtyBTwCP8QTyB1PoLUQY9E747RHV3MZTUZ9iRnYeQ
	 g9JvekfhwgYs3hMEhvTkMQLRtOStLudHicUnRTc4oPJIOUYtdBGRDPy5e6busii8F
	 2x2NgCeSIVZFTuYK43+YG7TotdB+h91TGAyQq3ZbdnhjIPDRwFSmEKYNozViIR8pM
	 KJrpw3pupzfd0Orfcw7VfoeFpbkF0iM55WsVzEZFkxPUIXD7sTE24vYVOubAfAhaK
	 wbkzWy1IIAU6rkq1Ww==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.1.178] ([95.114.51.66]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MlwFp-1tWfD146RX-00noSl; Tue, 29 Oct 2024 17:18:01 +0100
Message-ID: <b025774a-adf6-443f-b795-bb138c490c2b@metux.net>
Date: Tue, 29 Oct 2024 17:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Add support for stacked and parallel memories
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 tudor.ambarus@linaro.org, michael@walle.cc, broonie@kernel.org,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 miquel.raynal@bootlin.com, robh@kernel.org, conor+dt@kernel.org,
 krzk+dt@kernel.org
Cc: venkatesh.abbarapu@amd.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, git@amd.com, amitrkcian2002@gmail.com,
 beanhuo@micron.com
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
Content-Language: tl
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dwvfylsTjwAH4eJidgjy8sPKZZbC//piTgB7ryMHLjLGbo/2jWS
 FP+bZxQjGOSNoVzXvEEOHtjruPH80I05RxMR01+r92ZXLe1VI9R8Q0YyOIMIISCUlRUqNPH
 a5JYl2plm1y8kmDSqHRWNIu2o08XLOdfSUgkpNFyeAAd16g5zFinXRyXaWEWXDi86DwYhfN
 qg2OP71cb3tS/2GN96BCA==
UI-OutboundReport: notjunk:1;M01:P0:AbFpCT1ZrOk=;KlFITnYubcqW0rMhep9Y89XI00w
 p/I60IbPm+UDiEIXbJo9G9u1mGfayeLF8nqOfsG2WIyDXCBEioF2kj82erI1LJFyEI82ZKjeh
 Esf2RAUcVApHBHcHFMWmoRdNUc1jZgbLjcwMyHkHFpeyhxrGpWWe0v/eq24D6jhj9FvdKCzwX
 uX41d1U7gEvXAiWNiAR9qJ18QER8zJccCbpXntOwnXf0nZKy8Vi5842j9nX1ZrNIR7WZLB1bT
 OQuKIq5yxMZglVvOhrhh1ug0khvnnnlLv6OBE04jVj6URINSgw7P3SySwkQtomwaq32Kt7gEm
 P7R/++gdBsmEcNGtCITs70gCbLzBuNoaNVKYe5v55e/SC+xxhG/DhVl/Y2rIyd4J2aJc78VtP
 AeiL/xr0NBmdf71/RWVOrob+uRMYijeYVONTkaXN+4sYoCC0rj4N4LGU6KBvxDqk+g3OI5r/0
 u361BegVAmjrB+rZeZuqLGHnV82JmuJCpgfLOSE/r33JK9X9JIN0R6xSmd5IiCgYojVb+x2H2
 ba8e+B4UFcJM+tN/Hby40hw1snIKiAermXXXFqZ1q2M0M0dQ1UXRDpZADx3yYjlHA6lRzdw1/
 TPIrnZ/xjmxXAEzaE3AC8gK/WtZCO2hls4a6sUSipQTp4eQFlCXuMEe9Owc6QMCCLf91VFvXm
 8L3g9BnZyje0e//q2Wm07165vDmLqic83VTAcAednceoVkF9Xp0ppTi6KvoYTbSR5rSzRG/n5
 j+bSO0M4rmYM4+pW/CSSRTH1FfZd6D/CA==
X-MailFrom: lkml@metux.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4YGZQTZ4KJMQFUFQXHQS4ZSEFCZTO2TA
X-Message-ID-Hash: 4YGZQTZ4KJMQFUFQXHQS4ZSEFCZTO2TA
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:36:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YGZQTZ4KJMQFUFQXHQS4ZSEFCZTO2TA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26.10.24 09:53, Amit Kumar Mahapatra wrote:

Hi,


<snip>

> Stacked:
> Flashes share the same SPI bus, but different CS line, controller driver
> asserts the CS of the flash to which it needs to communicate. Stacked mo=
de
> is a software abstraction rather than a controller feature or capability=
.
> At any given time, the controller communicates with one of the two
> connected flash devices, as determined by the requested address and data
> length. If an operation starts on one flash and ends on the other, the
> core needs to split it into two separate operations and adjust the data
> length accordingly.
>
> Parallel(Multi-CS):
> Both the flashes have their separate SPI bus, CS of both the flashes wil=
l
> be asserted/de-asserted at the same time. In this mode data will be spli=
t
> across both the flashes by enabling the STRIPE setting in the controller=
.
> Parallel mode is a controller feature where if the STRIPE bit is set the=
n
> the controller internally handles the data split during data write to th=
e
> flashes and while reading data from the flash the controller internally
> merges data from both the flashes before writing to the controller FIFO.
> If STRIPE is not enabled, then same data will be sent to both the device=
s.
> In parallel mode both the flashes should be identical.

Interesting.

What's the practical use case ? Some kind of RAID directly on raw
flashes ? Could it help for protecting from a broken boot flash ?


=2D-mtx

=2D-
=2D--
Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt un=
d manipuliert
werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schl=C3=BCssel zu.
=2D--
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

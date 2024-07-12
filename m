Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB292FA70
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 14:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA5B857;
	Fri, 12 Jul 2024 14:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA5B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720788252;
	bh=VFfujqGL4wmufeMpy4TXsgO2rW52SRPoW3j+ev/iI60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYVOoQViQrYxLM4SQLq17WaI9C1srJM8cMI7PhKNiBCaBYtdBYM4I96EU2q3lmhTa
	 P0sZgh5LVomcZvWXAHZcLEz1i6ff0NwDMf41tbnrvGAfdcuzRGwWxNHJPXWbdlUxRj
	 uSBfTDw+AjreABYp0PPA1aqIeNorzpo2V+oqW4WA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5570F805AF; Fri, 12 Jul 2024 14:43:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA05F805AD;
	Fri, 12 Jul 2024 14:43:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2CAFF800FA; Fri, 12 Jul 2024 14:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CB42F800FA
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 14:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB42F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=V5PMfiYd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720787233;
	bh=4Vofh3nmGXbIRlscqKm0va6vapnmleNLgiTWfYE/btk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V5PMfiYdHjm+q2zhG//PSDhbZxYuVaB/yWMCbKSb7YOZfB+YWffV8XUiFqmdJ+g+g
	 /c6au7q5mVyEiJqj/pof4+FidWHw+Du77hF2RZBUglRFE//ThOFJQoTQqe6IUDIms0
	 EJtVxRE/YpKncLPLY3tEkgutqHapFx9r3ZbshogxWBeGW6TCDCrXR4R0Buv6MKHije
	 KTpMYbXdOCztwkqQk6lsuRJIWQqLg3eSog71GgUac4/5NigrRoqMUh20HyBAIopkIP
	 3nRohakxnY0DT2cFAWUh7IiAjkavAFL6SZk+7SHz47UD7rpIBs0rGhqqwLOIEu+Cdo
	 m8oeN6kVZK6ZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL9p73qQHz4x1V;
	Fri, 12 Jul 2024 22:27:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, Mark Brown
 <broonie@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin
 Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to
 get a channel from a phandle list
In-Reply-To: <9423930f-8cb8-4b31-927f-a93b1006fb18@cs-soprasteria.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
 <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
 <87a5ixkghq.fsf@mail.lhotse>
 <9423930f-8cb8-4b31-927f-a93b1006fb18@cs-soprasteria.com>
Date: Fri, 12 Jul 2024 22:27:11 +1000
Message-ID: <87v81a4wyo.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QGJHU7XZ2IXXD23Z35QTL6BAMKWVLSBW
X-Message-ID-Hash: QGJHU7XZ2IXXD23Z35QTL6BAMKWVLSBW
X-MailFrom: mpe@ellerman.id.au
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGJHU7XZ2IXXD23Z35QTL6BAMKWVLSBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LEROY Christophe <christophe.leroy2@cs-soprasteria.com> writes:
> Le 04/07/2024 =C3=A0 05:01, Michael Ellerman a =C3=A9crit=C2=A0:
>> Mark Brown <broonie@kernel.org> writes:
>>> On Mon, Jul 01, 2024 at 01:30:34PM +0200, Herve Codina wrote:
>>>> qmc_chan_get_byphandle() and the resource managed version retrieve a
>>>> channel from a simple phandle.
>>>>
>>>> Extend the API and introduce qmc_chan_get_byphandles_index() and the
>>>> resource managed version in order to retrieve a channel from a phandle
>>>> list using the provided index to identify the phandle in the list.
>>>
>>> These two PowerPC patches seem trivial enough and have got no response,
>>> unless someone objects I'll go ahead and apply them.
>>=20
>> Ack.
>>=20
>> MAINTAINERS says:
>>=20
>> FREESCALE QUICC ENGINE LIBRARY
>> M:      Qiang Zhao <qiang.zhao@nxp.com>
>> L:      linuxppc-dev@lists.ozlabs.org
>> S:      Maintained
>> F:      drivers/soc/fsl/qe/
>> F:      include/soc/fsl/qe/
>>=20
>> But I see no email from that address since January 2021:
>>=20
>>    https://lore.kernel.org/all/?q=3Df%3Aqiang.zhao%40nxp.com
>>=20
>> And actually drivers/soc/fsl was marked orphan in April, maybe this
>> should be also.
>>=20
>> Or does Herve want to take over maintaining it?
>
> We had some discussion about that in April, see=20
> https://lore.kernel.org/linuxppc-dev/20240219153016.ntltc76bphwrv6hn@skbu=
f/T/#mf6d4a5eef79e8eae7ae0456a2794c01e630a6756
>
> Herv=C3=A9 has some of our hardware for a limited period of time because =
he=20
> is doing some implementation for us, but he won't keep that hardware on=20
> the long run.
>
> I will send a patch to take over maintaining drivers/soc/fsl/

Thanks.

cheers

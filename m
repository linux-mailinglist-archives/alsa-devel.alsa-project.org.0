Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB663926DDF
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 05:04:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE40105F;
	Thu,  4 Jul 2024 05:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE40105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720062256;
	bh=OIA5yriB8wNlAP+DgoZyr3J7vXU9nqssuvqToMPG4J8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iIJJpSiVx3pmk3kLQZVlcGQBtkVu8QCrybjqH9IHdFbPxIqBaiX8yGSFMtPlCCPWU
	 MlGDowiJ6Le96wKnqLBRV8cdQZghgzevTagpDCqBu76FGBBOg6/BgQg+bkM81TmkY0
	 xXU6dIilxJHFYnFHtl0EyiSS0M7NSONvOIefeIVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8DE1F8061A; Thu,  4 Jul 2024 05:03:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87501F8061A;
	Thu,  4 Jul 2024 05:03:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91DBEF80272; Thu,  4 Jul 2024 05:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50935F8014C
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 05:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50935F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qEQFNE4Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720062084;
	bh=08bw283wAwwr7luwSNsiMYD2RxYSDrVcyBFIdCUHTU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qEQFNE4ZqbatHG2jCgJfbvRT5U3MXjSgFcHdWNSExucDaO+xTC6ajCfjBQBEh473K
	 o2ZiYZJ8Rcl7M4mmZMjT060YP63n6pT9gAQqS1a+3tAhMZBvcofU1I3XfJRyQ8Kr06
	 VwakH1YG7yl/sE3O39PqgWemBmuNi1Ri3bJt6JUUElW1MniL3EZlOh/qb1GFPOLAVf
	 CSUZLFfMv9B8v2EyPWKYQ9Il5h4kVXOjojbGmLowuHzTqJSr59FalJWTAirwvAaOPt
	 pshF6wQSVXuv9T6y0efx70UDLkYWE5Lzg0I3wSVzCH8MiY3/ZPDRMlIxHmAm+1dai+
	 CfurPAaIQYHKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WF1cy0mGQz4wxs;
	Thu,  4 Jul 2024 13:01:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mark Brown <broonie@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to
 get a channel from a phandle list
In-Reply-To: <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
 <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
Date: Thu, 04 Jul 2024 13:01:21 +1000
Message-ID: <87a5ixkghq.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: ZLHZPIF5VEZXTSFUVOFKESI5ISPMAPM4
X-Message-ID-Hash: ZLHZPIF5VEZXTSFUVOFKESI5ISPMAPM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLHZPIF5VEZXTSFUVOFKESI5ISPMAPM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mark Brown <broonie@kernel.org> writes:
> On Mon, Jul 01, 2024 at 01:30:34PM +0200, Herve Codina wrote:
>> qmc_chan_get_byphandle() and the resource managed version retrieve a
>> channel from a simple phandle.
>> 
>> Extend the API and introduce qmc_chan_get_byphandles_index() and the
>> resource managed version in order to retrieve a channel from a phandle
>> list using the provided index to identify the phandle in the list.
>
> These two PowerPC patches seem trivial enough and have got no response,
> unless someone objects I'll go ahead and apply them.

Ack.

MAINTAINERS says:

FREESCALE QUICC ENGINE LIBRARY
M:      Qiang Zhao <qiang.zhao@nxp.com>
L:      linuxppc-dev@lists.ozlabs.org
S:      Maintained
F:      drivers/soc/fsl/qe/
F:      include/soc/fsl/qe/

But I see no email from that address since January 2021:

  https://lore.kernel.org/all/?q=f%3Aqiang.zhao%40nxp.com

And actually drivers/soc/fsl was marked orphan in April, maybe this
should be also.

Or does Herve want to take over maintaining it?

cheers

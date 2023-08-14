Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F64D77BFCB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 20:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A48D827;
	Mon, 14 Aug 2023 20:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A48D827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692037722;
	bh=Jt+rPoxzrJg9otv2KBpZZWoKH+f7W2Q1+lOzA6Mb1aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G1Q02skeIVxqT1IuTqFq+StCWzlw+Cxof4ZB6veeJH02K6Cz8S0/r3WZLVfy3J9z0
	 PMsFJXXMjZOSQ5LpWgmA7JPS1G9m5hRVJutsGzIVp5QxpiAED271LBAqTCbjBmLncc
	 1P9lIy5K36qEhI3ViLt+YpWdRRIPNs9oZ5TgCHYk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A0BCF80549; Mon, 14 Aug 2023 20:27:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AC3EF80254;
	Mon, 14 Aug 2023 20:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AA37F8025F; Mon, 14 Aug 2023 20:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3180FF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 20:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3180FF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JlJXVyAl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5981C616B7;
	Mon, 14 Aug 2023 18:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD77C433C8;
	Mon, 14 Aug 2023 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692037631;
	bh=Jt+rPoxzrJg9otv2KBpZZWoKH+f7W2Q1+lOzA6Mb1aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlJXVyAl0W/HMNVYbzEFCdoL6HgJHwvT+o2L9MjPoUr16NPDivrDz7W2AnPX7ou6k
	 wVWno9oPsIZFysGiyUT+bsdck7XTwqS/6GZvULxmyusnX2Ja0punbcMs23H7NYeTO+
	 Q3oo5E8RG53i1d754Y3CLnI02XJ4cgbtgX34QSRfSCuaP/RWcrPl6hT5WaVXUVkQMB
	 JgEPFp1CDsvkMbKOhb9Ou890I6WlNwCoqwVGG36BCDluMwrWtx5gJ/QYqFijRzhXA1
	 wO6xmZK+PKheKs1Zj/xFtBaNRrDG/xDm9HU80DATPK7RefXq3KkurwODDknWHjONg5
	 GSE1LPCYHg09g==
Date: Mon, 14 Aug 2023 19:27:04 +0100
From: Mark Brown <broonie@kernel.org>
To: John Watts <contact@jookia.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: wlf,wm8782: Add max-rate property
Message-ID: <a7db4653-cb12-4f90-891c-5cf7270598bd@sirena.org.uk>
References: <20230810224930.3216717-1-contact@jookia.org>
 <20230810224930.3216717-4-contact@jookia.org>
 <ZNY+x/R8/T5ysPhy@finisterre.sirena.org.uk>
 <ZNZFB2-kBrpnMSn1@titan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/aJxk8MMdf/9RpDh"
Content-Disposition: inline
In-Reply-To: <ZNZFB2-kBrpnMSn1@titan>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: 5ZTGVO3QA4DJD5QKVZONNPJJF3QBLIH7
X-Message-ID-Hash: 5ZTGVO3QA4DJD5QKVZONNPJJF3QBLIH7
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZTGVO3QA4DJD5QKVZONNPJJF3QBLIH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/aJxk8MMdf/9RpDh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 12, 2023 at 12:26:15AM +1000, John Watts wrote:
> On Fri, Aug 11, 2023 at 02:59:35PM +0100, Mark Brown wrote:
> > On Fri, Aug 11, 2023 at 08:49:30AM +1000, John Watts wrote:

> > > + - max-rate    : max supported audio rate configured by FSAMPEN pin, defaults to 48000

> > This seems like a cumbersome and error prone way to configure this - why
> > not just have the binding specify the state of the pin?  That's just a
> > boolean high/low whereas this requires getting the rate right and then
> > having the driver validate it.

> Hi there, the pin is tristate, Z, 0 and 1. How would that be represented?

You'd have to define an enum for that but it does still feel like it
might be easier to work with since it's more direct.

--/aJxk8MMdf/9RpDh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTacfcACgkQJNaLcl1U
h9BXKwgAgSwKyeLPqTWs0T7jIJ1qzjNVtHtx9g/zqFqy1CMWB3obyrIoAkqQ1sZ2
U4O+KbXHmiwtcMnIiw/pgob0Of909XoX+sod5z8Vo/gDwF9rpKcxf30q07vr38Zg
4X0Y+BMPgQ8t6pXYw/7f6jzqdWr9NS/RiiTeBnhTg0rCJ69/0SOKhetiEBbYuOH/
VHx/VGQPuwkgczW6p72rzZp/92OUqbWufopBLgRZjCzvEl96EsoYImaeYqfKc+9r
Ww34k3led/5NINa7WcDiWjG2DJLsUZA8Jc9Wu3fL/hZGZrhvFx5OZmfCT3/V6DQd
Grc4VfsPpVjKok9G6ZXUHvaW7lFuhg==
=Us4P
-----END PGP SIGNATURE-----

--/aJxk8MMdf/9RpDh--

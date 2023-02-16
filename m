Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 611916997CA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:47:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2FC2E84;
	Thu, 16 Feb 2023 15:46:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2FC2E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676558859;
	bh=LCnYvIINjyxCa3G+TEGs6sBnENrcAhNBZIdvdQRNokM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QrNAiYIGpx1Xqq5BMQLn73CuzdFhuTq4VCieQuP0OkUSOQXe+mP+5hqi3wcRDTfzN
	 LSTi6sNKQ5+HuIvVZfhvyITemowBhm/6WuJmuPMHJm8W7je3do1D14oFV8+F4L00uJ
	 W2pUt1IEMSEFCT3TMkfZxF8oBshZCN7ahTm9v9TU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 079ECF800E4;
	Thu, 16 Feb 2023 15:46:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 540F3F80171; Thu, 16 Feb 2023 15:46:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CC68F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CC68F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dWikivDp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 83715B82845;
	Thu, 16 Feb 2023 14:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98418C433D2;
	Thu, 16 Feb 2023 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676558800;
	bh=LCnYvIINjyxCa3G+TEGs6sBnENrcAhNBZIdvdQRNokM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWikivDp9g3uqJMnhF5qkq9wSlzEUtynfuG1Py8cYJC4MBSyICywQ+WoX9BB+DvxX
	 s5KjPz6w8/VFI8UBwrD9wzm7IItOP9ei3SwC7c9X1LHl22BF2optDGqNESNad8gaJ4
	 3d8wujLi88RxAbY/ni8u+HAzbtvonJjG+2WfO9jzQx/iL5DCdZcKJKt8PYgqWKzl+r
	 bXJuB/cPvEt/4b6zYg17Ofhr6EzC7GM9z4s5AY9J+EDETJz+P/DM5oVm/4QDgrLFTG
	 c3EYCxCnY1Jlu8rcZcehKtLlzFC8BhJkX4N2ecPLeXrqcGma2/VoyUkl5HFm/5VWRC
	 1IzvqH7ImqfOQ==
Date: Thu, 16 Feb 2023 14:46:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Message-ID: <Y+5BzEJBaTn3twBH@sirena.org.uk>
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-3-claudiu.beznea@microchip.com>
 <485d74fe-bfb5-c55e-724f-304476624abd@linaro.org>
 <954cdf90-c41a-4e21-31e0-88a0baf26065@microchip.com>
 <fd2f372f-4a1c-72c0-574d-1d5ef99dbdbc@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TxVDayxViJvYQhLz"
Content-Disposition: inline
In-Reply-To: <fd2f372f-4a1c-72c0-574d-1d5ef99dbdbc@linaro.org>
X-Cookie: Serving suggestion.
Message-ID-Hash: D24A5KAD4DCZXREB4QVYVRM7L7AEIIIN
X-Message-ID-Hash: D24A5KAD4DCZXREB4QVYVRM7L7AEIIIN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Claudiu.Beznea@microchip.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lars@metafoo.de, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D24A5KAD4DCZXREB4QVYVRM7L7AEIIIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TxVDayxViJvYQhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 16, 2023 at 11:18:16AM +0100, Krzysztof Kozlowski wrote:
> On 16/02/2023 11:15, Claudiu.Beznea@microchip.com wrote:

> >>> +  microchip,startup-delay-us:
> >>> +    description: |
> >>> +      Specifies the delay in microseconds that needs to be applied after
> >>> +      enabling the PDMC microphones to avoid unwanted noise due to microphones
> >>> +      not being ready.

> >> Is this some hardware delay? Or OS? If OS, why Linux specific delay is
> >> put into DT?

> > It's the delay used in software workaround that IP needs to filter noises.

> Then this sounds like OS? Linux related properties usually do not belong
> to DT.

This is a hardware property, it's the time needed for the input
to settle.

--TxVDayxViJvYQhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuQcwACgkQJNaLcl1U
h9AmJQf/TgHpEIGKbPryBe3ZR4YcUQhPbFNTGdI63vitiShh+bX3JzzEnswt6j41
/RVENFOLuUfoh9viCWf/ulK9vT4YCfwsz2nZ1OHdFGkoJQ+loNNutpcgVUXUgmy/
YSBs3uvJv1OCTM+1pPfzyiMKLK/ycbwrEi7N/xL8SDSZyW0DKLJCJgw/yjGEDNvg
WYOi3VMr0Eo1SeJaPej+o8+BKHh63GBLvOwlMoMKT9YALS+pQtEAWdysVGfL4i1h
JKpQHC3o5DDRT7qgAVhRLD1w7I26PdJZUJVB4ADbrnWjFQpKyV0Nvi517eaBKeTO
mPTUYrEw348SwZ872VcV384YXSFffQ==
=Ijuf
-----END PGP SIGNATURE-----

--TxVDayxViJvYQhLz--

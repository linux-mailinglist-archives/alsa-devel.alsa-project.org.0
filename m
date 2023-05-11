Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB66FEB67
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 07:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6ACF69;
	Thu, 11 May 2023 07:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6ACF69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683784230;
	bh=41FTrPnypEF7pj2eKovVoKCpbnxQBhGz7lmHbXqy/K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s1eK6+rDklqXkANZX47PFgngkRGqZLIXaCX6VcmrKE/TCZOKX2RVB2p837vwqW7nR
	 SuawZQblS5RYbXn4kNFD1b9Ln6jYWhBGIjkQ/6i4s0ZzGL+fs+JzobBxe/5UTobJKJ
	 0QmAXfYONnODWzao+Tukbk7/evpKyvJ071Ed2lao=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7477EF802E8;
	Thu, 11 May 2023 07:49:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C9B6F80310; Thu, 11 May 2023 07:49:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3E6CF802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 07:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E6CF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ozwkUj0f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E46CA635B9;
	Thu, 11 May 2023 05:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F6CC433EF;
	Thu, 11 May 2023 05:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683784163;
	bh=41FTrPnypEF7pj2eKovVoKCpbnxQBhGz7lmHbXqy/K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozwkUj0fraJiNCsFZ4zXSVv9hxHJRSLMj5RTLxkvzcVNWUCW+iyfjs+UTojTQq1Ou
	 kpsVhWT5YyxZQSKC4983uNhgAEUmmNLrCYQkwCwtA2fspBEB3WA6LIyvxQWOx8Eiqk
	 x7wD50Qx2/lf+6ctabEoCewTb3uI/1m8sW0RazbrJQa1uiN69g/wRDjrYDJcDasQl7
	 Om9H2MEGeTIOWtlHjVu/pNGC9Vu1RursKkFcVywCUkzBgDu6XKhwri0rnP3nUGzD2e
	 YuDHr6ccuDLB36OTdhx9ktkZUQFjCmYnQ2jsKy9QHnHD9OuIneLGRrQeZEFWWvfBCq
	 SHxpXF6D8ejDA==
Date: Thu, 11 May 2023 14:49:00 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shenghao Ding <13916275206@139.com>, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
	navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com,
	Sam_Wu@wistron.com
Subject: Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Message-ID: <ZFyBzHWo3ORKAskX@finisterre.sirena.org.uk>
References: <20230508054512.719-1-13916275206@139.com>
 <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47a7kOxwYBW8LpQL"
Content-Disposition: inline
In-Reply-To: <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: LIFU25M2RQ43LI5KGKOFQGX27D6PAOH6
X-Message-ID-Hash: LIFU25M2RQ43LI5KGKOFQGX27D6PAOH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIFU25M2RQ43LI5KGKOFQGX27D6PAOH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--47a7kOxwYBW8LpQL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 10, 2023 at 09:04:26AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2023 07:45, Shenghao Ding wrote:

> >  - Submit together with tas2781 codec driver code

> Fix your patchset threading. I don't think it's possible to apply your one.

While it would be nice if things were fixed (if git send-email is being
used then passing all the patches to one git send-email command should
do the trick) it's not an insurmountable obstacle.

> > +  ti,audio-slots:
> > +    description:
> > +      Multiple tas2781s aggregate as one Audio Amp to support
> > +      multiple audio slots
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    maxItems: 4

> You said you can have here two addresses. You don't allow it, test it.

> Missing minItems, but...

> > +    items:
> > +      minimum: 0x38
> > +      maximum: 0x3f

> ... So these are fixed? No need to encode them in such case...

I'm not sure I understand your concern here, there's up to 4 possible
values from 0x38-0x3f which has more than 4 possible values.

--47a7kOxwYBW8LpQL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRcgcsACgkQJNaLcl1U
h9ABwAf/UGnEBEYwgTIBxNSeCc1i8G9It3B7G0r2531DWgIxGpaz5TefmjVPGWKr
YiW7aW0M/S/8RSGc9/BjXurgS8RrsHvXte03SNbCebMUl5USNKPDokSxuuVT4Hdi
hGdU1tcSgMKXG5zAegpQ3odlkRD/Xyy42vVv4xTnG67AZ2/7QgvudVDvNZXvKjky
+vYbi+PHuTQ5hgouUVQ7OiPzs8Thw5AbCRupqr5lxS5wuH02zISQ1rKAVG3kOuJP
ngITS9NSFVwU4kbbD/tMhhKqiqCZ2dYZsjWsojJasD9oTPw04u+dhpQxATVKkmlu
rkJmDSC/kC7stMcaelEucwU66jYVFA==
=Hau5
-----END PGP SIGNATURE-----

--47a7kOxwYBW8LpQL--

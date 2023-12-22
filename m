Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E540D81CC17
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 16:19:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ABC5DEC;
	Fri, 22 Dec 2023 16:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ABC5DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703258376;
	bh=wSsIkqxATYMa5UJxXgmid2Oll6OKz7mFJxJg/rL87ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KH6JOY9l1XAF67T94vhA3pmKSLHC3KkM5WLgAaf9DW7/idTwMspui1xJIW6Q23Rns
	 P+eRu6zV1KjPSzv4WR6U8h+70xwXdcN+tAu6Jg9JEZqewk/WmfOqlq/Szu4yrM6zFM
	 8GRvLChUaJipYfcf8gFgLwoJiON+Sxmq/ijbWz4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3DF7F80537; Fri, 22 Dec 2023 16:19:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69721F80563;
	Fri, 22 Dec 2023 16:19:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5CC6F8016E; Fri, 22 Dec 2023 16:19:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AA12F800D2
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 16:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA12F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aAfIdzz1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 234236153A;
	Fri, 22 Dec 2023 15:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A96C433C8;
	Fri, 22 Dec 2023 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703258345;
	bh=wSsIkqxATYMa5UJxXgmid2Oll6OKz7mFJxJg/rL87ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aAfIdzz1f4ffiiVuBpvEmy0hg1WYiPFOGaRWZYkq0tOIPEHfF0J1+GA0AWpOP0Ue5
	 vvh5qxkmZ9aQ/chvI3GkJAo4DdXlFR+scrjELUNoX2TzgOlUWIsUvMWM5tmTpduJBo
	 5aI4HCz1Xp3d1/CB1ksfcL8sOJ78AuKxxwniXWNP98ucDNEuCmZfLTfDunSt3PLKlc
	 VrNlkYspoP/yTUBV3cEDRP8+GGae/2kYooAbyg3FGkqg+JiF89W8B6dkvtH9QqsBoN
	 dpesWBP/br4b0TsNAR15mwcv0+vrmhJUgilejK7XnGEtH432gw66wDosnFsV7YC4oq
	 gHeceLtRddRRQ==
Date: Fri, 22 Dec 2023 15:18:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH 0/4] reset: gpio: ASoC: shared GPIO resets
Message-ID: <e3fa9582-bcf5-407a-9b17-783fd1453f2f@sirena.org.uk>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfx9Ht91O7Mwo0wc"
Content-Disposition: inline
In-Reply-To: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Familiarity breeds attempt.
Message-ID-Hash: UUBCHQKCDDCPGFUBS6XQTUGZ426Z37D3
X-Message-ID-Hash: UUBCHQKCDDCPGFUBS6XQTUGZ426Z37D3
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUBCHQKCDDCPGFUBS6XQTUGZ426Z37D3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cfx9Ht91O7Mwo0wc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 22, 2023 at 04:01:29PM +0100, Krzysztof Kozlowski wrote:

> I try to solve my case, hopefuly Chris' (2), partially Sean's (4) and maybe
> Hectors (5), using Rob's suggestion:

Hector's case wasn't an actual reset, it was a runtime power control, so
I'm not sure it'll fit there but otherwise this looks OK from an ASoC
point of view.

--cfx9Ht91O7Mwo0wc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWFqN8ACgkQJNaLcl1U
h9B9Dgf+J4td3JshFeqYWemOODB1NV3LYl68OZRErcrdtzvSKPeLBScAFOU0MfS+
9CDKWyHdbiMpAjlhUQ13E/kuMdjox9NMP4pNCJ7D4uxQrXbn5u+3R0wXGf5cZToM
B2La/7weV4yYnOPQ73uL5+5RRegYYa9jAYcaFN04Z/EBTbt2jg8lt40AuGW7bLVt
qb6Jr82C9YY5eenKxa/xIDDFGwP17i/uQh6jZ7DpI5RA0qS6hAQFmZGkgD8iTE+6
PEQdha8MDk5p5XajqQ+1ejDoTiuezdr81yXntBv6/PHd19mtUHL9qv5rOmtuGDcM
R+zkFrQmz7gHjj8uvg0nXqXSde7hog==
=7c2b
-----END PGP SIGNATURE-----

--cfx9Ht91O7Mwo0wc--

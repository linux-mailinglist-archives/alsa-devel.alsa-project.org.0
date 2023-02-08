Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81868F87E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 20:59:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85A382E;
	Wed,  8 Feb 2023 20:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85A382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675886356;
	bh=tRNavg/LIgAKd9vbMfES3i4G6zF8q2JGPv+1iHnxfQE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hqliwi439WjJUmQEbMPjTeYaxySrCiSklgh8NXLMX9rsUS4sQ3Ug5hrWq9/mQl7JR
	 AkdkHB1NNZhuceLim0GH6ij1zvt/QPHBk9+Ywe5MXqOOEjb2hlaBrRt8Lq4NBUXXbI
	 srC5+Yur5jj6Ax0c666YJ4J0SzyILhXOwrcn1u1A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9915F8010B;
	Wed,  8 Feb 2023 20:58:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F9AEF8012B; Wed,  8 Feb 2023 20:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8DE1F800E4
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 20:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8DE1F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qija1Yoc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E6C961798;
	Wed,  8 Feb 2023 19:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0675AC433D2;
	Wed,  8 Feb 2023 19:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675886292;
	bh=tRNavg/LIgAKd9vbMfES3i4G6zF8q2JGPv+1iHnxfQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qija1YocLLtQPH8kUkvQhotXNzK3awUCRJunJ8vd86FGg27ObcRv/J7PcMjnnGpj5
	 rq3So6bWDFgV0t1ZR6CJuu2aszapZ7lmU6c2RkFLsJNkszP1H8Jsap1zGd/x/WbB88
	 uB7d1HF9YFZEG7Q+O4XW1vta4/4UVxticd8sKzO+70pgUCndg5VrP3NL5u1NgF36hO
	 VX2k7R4vj2k1MY+9I4AKxt00e1n2LaR8zugbDTRR0RF509rxQLjLeVNqYX7oY9Utsj
	 Jpj7p4P86qsFxFrLaCAMvxETSDnjdHcgyV4B0gsTVgxnQhLzdwk96R9y2DP8bEKa3V
	 ifStorPxWnSww==
Date: Wed, 8 Feb 2023 19:58:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Message-ID: <Y+P+z8bpo9sBNOkU@sirena.org.uk>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
 <Y+PeR4EFfcVDbUfV@sirena.org.uk>
 <51e8e157-3f60-1731-a8ca-4a678c8eafd6@linaro.org>
 <Y+PlUtAmbl5TJq6z@sirena.org.uk>
 <c876f40a-2db5-eb50-9706-3147671ec4c5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yWn+MXqavpBjLzGe"
Content-Disposition: inline
In-Reply-To: <c876f40a-2db5-eb50-9706-3147671ec4c5@linaro.org>
X-Cookie: Walk softly and carry a megawatt laser.
Message-ID-Hash: T47FCNULDJYNEWFMSMASAQJCM3KK5L6C
X-Message-ID-Hash: T47FCNULDJYNEWFMSMASAQJCM3KK5L6C
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T47FCNULDJYNEWFMSMASAQJCM3KK5L6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yWn+MXqavpBjLzGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2023 at 08:37:22PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 19:09, Mark Brown wrote:

> >>> Are you *sure* they are grounded and not supplied from the LDOs?

> >> That's what I have on schematics (attached), if I got it right.

> > You'll notice that they've got decoupling caps on rather than being
> > grounded - there's an internal connection to the LDO output so if the
> > LDOs are in use that's all that's required, while if the LDOs are not in
> > use for some reason then an external supply is connected there.

> Yes, indeed, not grounded. I'll rephrase the commit. I also found few

Strictly the supplies are mandatory, it's just that the code was written
such that the default configuration is that they'll be provided by the
internal LDOs, with the DT having carried that on.

--yWn+MXqavpBjLzGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPj/s4ACgkQJNaLcl1U
h9BAbQf/fp2AzGnjgsAH67/NkCsxNZ7u/dBsQQzFc/jiy6YbG9swrncmAaXJbmzJ
DrXF49254VlCMpmQSM8V5k5sg7FdyWO0CFHQTj5i+vo5rccEjzuzw5c3WCqajpZt
Lbm+MFPCClCVyhm9Dvwk7Bs2asMdN2nhOc1fxPuMDYD7c/BDODYocjSSftFBhyy0
qFfUceF/MB/Cu6uGxpy5qA/9V2p4ih15WWgcWTs8ge6pUmWtkBVkOC7PfsaeUvVS
yWRW5FEn084Xp/Z9+ho+xID0yR4REtUI6qqOpHpY3N9+3TzSoPIzMd8QFIHiSk0E
wghAP39kdIgw47T8MCme16e6MbGgUw==
=P8zq
-----END PGP SIGNATURE-----

--yWn+MXqavpBjLzGe--

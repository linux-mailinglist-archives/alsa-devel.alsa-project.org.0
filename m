Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0142D72E118
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 13:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8CF220C;
	Tue, 13 Jun 2023 13:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8CF220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686654982;
	bh=sAj/ERKQE0tCZl9uMfMEEyfqrsGw28DDx99q885t3rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EP0jRHp4k8rYmuxr/QJERdz2J+VKXAVOdf+o82PENIxvaAQ7N9ga2i/GvBnaKFtIP
	 oo5gepZVE6OFf0bBXU2Dq/h7bVZjrSX5kFxNtjnhGC3ltoIlEz5BpydHUdCEV1zKqS
	 puRfnPN0Qwj4CAaUnKAWyDuKr6+4+l6enNKCiVwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E43FF80301; Tue, 13 Jun 2023 13:15:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15579F80132;
	Tue, 13 Jun 2023 13:15:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 403B8F80149; Tue, 13 Jun 2023 13:15:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F04AF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 13:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F04AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VN9JVYZH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A59F62D3A;
	Tue, 13 Jun 2023 11:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FA4C433D2;
	Tue, 13 Jun 2023 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686654900;
	bh=sAj/ERKQE0tCZl9uMfMEEyfqrsGw28DDx99q885t3rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VN9JVYZHbRV0mZUkEQ+jbRligdZU79mAnMzw7HTqGVNGdpCB/K1ue3jvwGm0X59XG
	 qe+OtwmIZjZ82v0ULnQHCrRDctm7tIZ6Jeo9xuVjaGGimEZd7mxoGyIk3Y40g5vPEE
	 VkvHpX6vTvZzaNFzidscwO39TdSQEbMpWo26g4G2byNCjALITIOhweDvcjUarZu8PM
	 CxmdGkQlwuwNEiR6KifpQv7cWUvUH/R1tsSR9WSPWimbJkcGyWQZen/XHmaSuGnWLm
	 6NHMWXiZEP+VFsw1c9G8r+fPzmxA/XKuyJEVb3c6JfRXTeki4n7pTKeLNrST5zM+D6
	 pfNM8k8uXw2Uw==
Date: Tue, 13 Jun 2023 12:14:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Message-ID: <6439325c-438d-4856-a0db-e71858cdb816@sirena.org.uk>
References: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y6t8z90gfqIpBNEf"
Content-Disposition: inline
In-Reply-To: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
X-Cookie: There was a phone call for you.
Message-ID-Hash: 6APA3SVACIZQEGFSMSATBGPIUXFLX3I2
X-Message-ID-Hash: 6APA3SVACIZQEGFSMSATBGPIUXFLX3I2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6APA3SVACIZQEGFSMSATBGPIUXFLX3I2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--y6t8z90gfqIpBNEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 08, 2023 at 10:15:47AM +0200, Alexander Stein wrote:
> Convert the binding to DT schema format.
> Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> clocks & clock-names = "mclk" is mandatory, it has been added to required
> properties as well. '#sound-dai-cells' is added for reference from
> simple-audio-card.

This doesn't apply against current code, please check and resend.

--y6t8z90gfqIpBNEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIT64ACgkQJNaLcl1U
h9BgCAf/Z/U6go8jFr2eUxPa/n/ehWr7i9WgW2ftDD35tuHVhDe9tUiHeTWnYnae
XQ3We6mh2bR4JAJhANfL/4VDBEtxArWKpFD0ptMzhHuZ/VTMPUSBrxGPhYzVcL8i
gxovWhKa0d7XGHVwNMkCPjZaDHotztyv8C1PyEOKLEMR+u5zZI/msTkjcG/S7MK+
JsdkA/8X0RBNu+LKLzPI9/qLTtUbsHph1izrDm0dnmSn1btZJnkMqdCNR5RXpCRj
L0AGx4yotUoSZGTr/wOvwJZwi8FWr8s6B5ig4imJ3V3KJRrcRSr2M+xEhu4OTNPg
arozOc1zFiuzl4vmXMZ8wZOvIQMWgA==
=fNEA
-----END PGP SIGNATURE-----

--y6t8z90gfqIpBNEf--

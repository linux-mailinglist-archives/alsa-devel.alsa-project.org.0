Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1A6B07DF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7CB617F0;
	Wed,  8 Mar 2023 14:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7CB617F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678280639;
	bh=x8A3q/wxd5DEV+ev4toYHG9IDX85FAj/ubBlRoLj+rw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQxWYf90IkGm0jXWNTg/wmsELiHPe9FrcMRLfR3MRBOjUDK9c2z8WgUmbjGZr+RoX
	 6qxDJAT29xs8pm4pK19W/Liy9/uUDCiJFnVITGNJ0KoaLJoY1h1OowJi0DIOJL6Y3q
	 j3DZrgEEfcDDhdLh2FDK9b8ONvcejdMqLAludikg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 063FAF80236;
	Wed,  8 Mar 2023 14:03:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB50BF8042F; Wed,  8 Mar 2023 14:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 173C4F800DF
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173C4F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VxQ78ea6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE45617A6;
	Wed,  8 Mar 2023 13:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAEBC433D2;
	Wed,  8 Mar 2023 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678280556;
	bh=x8A3q/wxd5DEV+ev4toYHG9IDX85FAj/ubBlRoLj+rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxQ78ea6I+OuV9L5hG5wgl8/LJYQDWgQhOsJViyJXBhzWDpaR6gkV/K0R5Lkt1+5P
	 93MtM8ZGLHlgG7jSBo4khLN3SOPOzsTQRW9WFri/rQ7+y+tc1FNgG5OdLhQc19hqJN
	 pCRtOXufu1/Bznv1fGpLpW28NeQo82hUmJrvH7KPSh/51iIVe/HRsXzGTMZBqVvi9H
	 3hJSg0LnQ6BDajF0cZ1gybgn50iTEHglNtGdPt0rKOaKoZfWWtxRBevtdEbrS0n1Yc
	 gRjUy8s0SEZENKmK7CTUIL5xTBs69RFrOBales9TfwTILFUQNrCKTf9NbXgMwuWENq
	 u40bB2B8KKyoQ==
Date: Wed, 8 Mar 2023 13:02:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: sound: nvidia,tegra-audio: add
 MAX9808x CODEC
Message-ID: <8c24e719-2ca8-4571-8d00-cc9d488d56ff@sirena.org.uk>
References: <20230308073502.5421-1-clamor95@gmail.com>
 <20230308073502.5421-8-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ay+UYMHLXfir5e0/"
Content-Disposition: inline
In-Reply-To: <20230308073502.5421-8-clamor95@gmail.com>
X-Cookie: Minnie Mouse is a slow maze learner.
Message-ID-Hash: MI3OSLD2FITUO7YCEVEDX3Y5LSEWITXK
X-Message-ID-Hash: MI3OSLD2FITUO7YCEVEDX3Y5LSEWITXK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MI3OSLD2FITUO7YCEVEDX3Y5LSEWITXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ay+UYMHLXfir5e0/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2023 at 09:35:01AM +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for MAX9808x CODEC.

This is adding a binding for a machine driver with these CODECs, not for
the CODEC itself.

--ay+UYMHLXfir5e0/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQIh2MACgkQJNaLcl1U
h9AnoQf+OpV1EbiGz6lefDAsEzUwcmFrYAkvKbhMSSQJK/tnDVX90PQPmPiL73dE
rVZ5+RmaRPRtj4jism7vnVrgpzF5YBSwOWNc8+cDLOR7tqqDxg2E/p6qMjiBemvi
kCWcaCb6PzRmkLSYdPBcqivC9gmbvD5eoMvrfMZkgmVXFbRoOIe2sdOpaTocmtgH
RQM6W1nKzKs1ApPEqoIw9cX601szP8lT9oCT7Zu0f2yhYXm/olE8c5yshCMBEPWx
dzLdZc/Rlq/5VUlrSHjdbRFNlzp7uQndVw1dP2LQot144rUnWea7YNTl2vzibRmn
lOX5dskV+Eob2wbmJ2AKPCO/QBeo8g==
=lQWu
-----END PGP SIGNATURE-----

--ay+UYMHLXfir5e0/--

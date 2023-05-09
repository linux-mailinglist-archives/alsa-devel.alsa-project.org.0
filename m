Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 246806FCD3B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 20:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63A15F58;
	Tue,  9 May 2023 20:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63A15F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683655584;
	bh=Tdj/22kgA8XkFoA986JPGYnfWwEcnwTjUAalnblqCYg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h06LfTh4GM74donBNR9AMdlBg1bSsGRh2fLlaknTgZNkLnwJ3bXs1E4QamHv7mSRw
	 BgaUA433wgICrsD0LZkhG82WED1c9UwZSXrV1nGyhwK1Kh3XoB+5U5OxNjAGHrJ8Gj
	 coHhw9F5oPEIjGvsdKZs9rUACTQfSSbDdyj9ls1c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B23F8032D;
	Tue,  9 May 2023 20:05:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 285BDF804B1; Tue,  9 May 2023 20:05:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FD00F80310
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 20:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD00F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tj8rEfD8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30429629BC;
	Tue,  9 May 2023 18:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB86C433EF;
	Tue,  9 May 2023 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683655521;
	bh=Tdj/22kgA8XkFoA986JPGYnfWwEcnwTjUAalnblqCYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tj8rEfD8bzoP3ENFKkSFpA1LpSIJGrsf+RXdNrYIADnUN+NMZGhCT2IEPRUyBPrja
	 eqxRN5d7VgGo0SC5AX6Lk0khulo2GSo8RLS8umt1fKU44FyknV8dUzIsIvx374hh06
	 0BMTJAP6QOSzEYMiEEZDLEtgxA1EL3cjqwKRNzxIt6h31s7Xfh2BI1+dVxMDywkLFR
	 umJTE/5AVlKQRBYOdSGi6KW4dFZP1YlUFhIpAa3TYIg3iCPFwrO0B+6gKnFS+0rhvv
	 hLSgQC1RNqvq5dHpzsKAbFrBarlyE8dY/BM7pQyk2oHXWEc7BuKxyBNOOLIJE0ntEC
	 iFd572OME5hsg==
Date: Tue, 9 May 2023 19:05:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <20230509-overheat-pliable-00d60523637e@spud>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cgSWW3RzfwlIKhhN"
Content-Disposition: inline
In-Reply-To: <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
Message-ID-Hash: Q4ZMTPBHPPNY23IOGBECZXBUYHROWN56
X-Message-ID-Hash: Q4ZMTPBHPPNY23IOGBECZXBUYHROWN56
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4ZMTPBHPPNY23IOGBECZXBUYHROWN56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cgSWW3RzfwlIKhhN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
> Hi Conor/Emil,
>=20
> DT overlay is used to describe combinations of VF2 and hat.
> Do you have any comments on this patch ?

Up to Emil :)

I seem to recall that he said at the linux-riscv sync-up call that we
have* that he was not in favour of overlays for hats like this.
I'll let him confirm that though, I might very well be misinterpreting or
misremembering what he said.

Cheers,
Conor.

* https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff2=
6bb3@palmer-ri-x1c9a/

--cgSWW3RzfwlIKhhN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFqLXAAKCRB4tDGHoIJi
0qBCAPsE8YwhVOhYQs79hkq8MKo8na1XocNJROiloe+mcYefYQEA354Svch8qplg
cy1NtrkXNW4PClswD2VNVAVe/IphjAc=
=UgFO
-----END PGP SIGNATURE-----

--cgSWW3RzfwlIKhhN--

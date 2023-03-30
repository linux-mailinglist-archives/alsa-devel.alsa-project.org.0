Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE326D09A6
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 17:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C421EF;
	Thu, 30 Mar 2023 17:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C421EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680190364;
	bh=zWpYYIuYTJgHtpRIFKGjq97qGd3ak9fMCXilbjSs6k8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pNBw3AvbJjEJnvC1j8y+50T52xUBo2XQroZ0uiGvA+wggpiHvVXSTzO2lDQnIqeea
	 RK9uMifeS90vVRCbaj0kzB3/5ybNZ3LDx5K/P/MNOKKCASvVdIbExnr7kOE3WhK+Jd
	 sqFfe6BtWEl47MOCJ4t6vqFfE0bdHHk3/XYFIOvs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22F2CF8021D;
	Thu, 30 Mar 2023 17:31:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECA39F80272; Thu, 30 Mar 2023 17:31:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2CF1F8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 17:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CF1F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CeZlAwWx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DD71FB82901;
	Thu, 30 Mar 2023 15:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F6C433A0;
	Thu, 30 Mar 2023 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680190295;
	bh=zWpYYIuYTJgHtpRIFKGjq97qGd3ak9fMCXilbjSs6k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeZlAwWxbJ/bSZ4un7FNN3IwfDFkF57yLnYL5VB3GqWTc+RtBL1ZbCJKgkCiCyhCe
	 W9bxnsrfYa3nY8YragtJajwGpLOlNq8xCJ1l6N5NW+wggEG2DHJN+mIHJi4BYBgAKi
	 X+3u/R3OTq8wo6QU2I82zI6SaRv2we2sUxJkjfTHyldFPo0uefwu6seN2mMgB/LWTN
	 lZ2HHx84EA4CQrTwxkVnV2r6HHpn4QGib1M01Jyr8EQTyF+xGTfknYGoRuej3EV4v4
	 CM90jK5JiAUGUPj40gfJQsD/wZjyqbdCQ7dOed1fdDTIvoUVFSQYUscQs+BAtuLdYh
	 xmrs4ZPpbL+TQ==
Date: Thu, 30 Mar 2023 16:31:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <0d108d6c-e892-418b-b9af-6c2dd133dd71@spud>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
 <af015701-f1ff-4b1e-9b1b-c635fc684ce6@spud>
 <2d5a8dae-73fd-b1f8-089e-041637d66b0d@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="524gvXDbAwMwRBbT"
Content-Disposition: inline
In-Reply-To: <2d5a8dae-73fd-b1f8-089e-041637d66b0d@starfivetech.com>
Message-ID-Hash: 5O3ZOUUQVY6LQCRJYU3ISNOMTSZ5KSWB
X-Message-ID-Hash: 5O3ZOUUQVY6LQCRJYU3ISNOMTSZ5KSWB
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5O3ZOUUQVY6LQCRJYU3ISNOMTSZ5KSWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--524gvXDbAwMwRBbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 11:16:08PM +0800, Walker Chen wrote:
> On 2023/3/30 15:58, Conor Dooley wrote:

> > Excuse me for not following here, but Walker, could you point me at
> > where in the schematic for the VisionFive 2 that this wm8960 actually
> > is?
> > I know ~nothing about audio, but good old Google tells me that this is a
> > dedicated codec chip and I was looking at [1] and could not easily find
> > it on the schematic.

> > 1 https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.p=
df

> The TDM need work together with external codec WM8960 by plugging the ras=
pberry pie
>  audio board into the 40-pin, which is found in sheet 21 of the schematic=
=2E Because the
>  40-pin of VisionFive2 is fully compatible with the pins of Raspberry pie=
 audio board.=20
>=20
> For more information of the audio board, you can take a look at the follo=
wing webpage:
> https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/
>=20
> The schematic of audio board:
> https://files.seeedstudio.com/wiki/MIC_HATv1.0_for_raspberrypi/src/ReSpea=
ker%202-Mics%20Pi%20HAT_SCH.pdf

Ahh, I feared that this was the case. If it's not on the board, then it
shouldn't be in the dts (and certainly nothing should be in
jh7110.dtsi!).
I suppose this should be a dt-overlay, but I don't know anything about
the upstream infrastructure for those. Nor do I know what is permitted
in terms of overlays.

Thanks,
Conor.

--524gvXDbAwMwRBbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCWrTgAKCRB4tDGHoIJi
0thyAP9IOF81Os1a6pA5/JU5Af3gbxCn4Cc3tX9CYpHYnbRm9gD/VG+H1kKtvfr1
pLpzYaEOOfN3raDJEzVDTJIcLmCSJwg=
=ORTa
-----END PGP SIGNATURE-----

--524gvXDbAwMwRBbT--

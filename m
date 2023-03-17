Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B56BEE27
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3470EF2;
	Fri, 17 Mar 2023 17:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3470EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679070467;
	bh=n+6H66wvmHVetszVipZwJ8WpSZp/LWO/rZfwt6G25D4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RnuJzm8tw45pbErR86GE/iYb/rX0B3zfLLCC+KjfcKNgrSmwmGbpDuutBGCvObZrD
	 85XyDm9OX2ObETbchf9mBUoXRmZQstYp8R8qg3viK+iGtIgs3uzEIxwTwguMeqGmKT
	 mmkDE8XDx2Okk81WxixYzgU77O029zCEDFBNS0ug=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E51F8032D;
	Fri, 17 Mar 2023 17:26:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3CAF80423; Fri, 17 Mar 2023 17:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54A0AF80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A0AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W3T+CEbN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6BDA9B82640;
	Fri, 17 Mar 2023 16:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4C1C433EF;
	Fri, 17 Mar 2023 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679070405;
	bh=n+6H66wvmHVetszVipZwJ8WpSZp/LWO/rZfwt6G25D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3T+CEbN1PPJHBZvsg+M2JGn9hwQhMaV7u4JlGn8ATJPIGNSNoH2gcKCAaevsenJ/
	 nHLPy+/URBOzBEGc+2dlvuPHhmQ29c09ByDVS3EYpviQ26uQf7w1vXa17H1Sqstevk
	 LUs5tG53uG3ShI645HN2CTjS07Z5HrX0JYJP8dnmSDFzlx7wgYrXef4Hv2X+eVisXR
	 NcegmW6Fp8RYKTHOlo3Fal06gCIN3rgHzBAU1lCHnQhuY5uvGjfBgckpxLlEUN0ezX
	 qUyzdo0oPIqsBP/x3tnehYRd3eZy1TVFdFj62BbdJIzyFMxSfg7die6JFlMRLnpqFh
	 c/UFTVCrDo1ig==
Date: Fri, 17 Mar 2023 16:26:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
 <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="caemCzIw84yTLOE0"
Content-Disposition: inline
In-Reply-To: <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
Message-ID-Hash: 3TXXCW25SACXI6CC6AAZMCTZJEQFI6BT
X-Message-ID-Hash: 3TXXCW25SACXI6CC6AAZMCTZJEQFI6BT
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TXXCW25SACXI6CC6AAZMCTZJEQFI6BT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--caemCzIw84yTLOE0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 04:54:47PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2023 11:21, Cristian Ciocaltea wrote:
> > On 3/17/23 10:31, Krzysztof Kozlowski wrote:
> >> On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> >>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> >>> dma-names properties") documented dma-names property to handle Allwin=
er
> >>> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which=
 is
> >>> the reverse of what a different board expects:
> >>>
> >>>    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expe=
cted
> >>>
> >>> A quick and incomplete check shows the inconsistency is present in ma=
ny
> >>> other DT files:
> >>
> >> Why not fixing the DTS? The properties should have fixed order.
> >=20
> > I was initially concerned about the risk of a potential ABI breakage,=
=20
> > but I think that's not really a problem since dma-names is not directly=
=20
> > accessed in the driver and DT Kernel API doesn't rely on a particular o=
rder.
> >=20
> > If there are no objections, I would switch the order in the binding to=
=20
> > tx->rx, since that's what most of the DTS use, and fix the remaining on=
es.
>=20
> Since we added the order recently, I rather assume it is the correct or
> preferred one.

IIRC I checked around the other serial bindings & there was not a
consistent order that all serial bindings used, so I picked the order that
was used across the various allwinner boards that do use dma-names.

Before changing dts files, it's probably a good idea to make sure that
the dma-names are not used somewhere outside of Linux.

Cheers,
Conor.

--caemCzIw84yTLOE0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBSUvAAKCRB4tDGHoIJi
0jtIAQC5YztceqmIGvPluC63a+GsGjGCM2eYgc2qAXbbyfbI0gD8DjessEmSarDl
+RuYj2SLZeX7nSQSHyucSUpd/ty+qAw=
=iCfE
-----END PGP SIGNATURE-----

--caemCzIw84yTLOE0--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11E70E2D4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 19:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0C01EC;
	Tue, 23 May 2023 19:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0C01EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684863609;
	bh=vDGswodSlrzYhuB+jhwOgA8e4UY+ICmFArxjHAa0lQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VDE50Cguozs97SuNy8IxuwtxV+2nxIswBbWHtwfo5NkfRAHSny1SfXorSxo5TghKN
	 SoMtgUMsUYgzsJtl0CRs1iot9ft9j7Q5I0n5wKSTbloCP2D58+dD4Byk+0+0JXVC79
	 0ofVQa/HU5mgpzjGTZVS1mhaGeIkeh4WtlrvUOpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EFB5F80549; Tue, 23 May 2023 19:39:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F3DDF80249;
	Tue, 23 May 2023 19:39:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66E4F8024E; Tue, 23 May 2023 19:39:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 946E8F80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 19:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946E8F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cmb+eJFL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A73362C62;
	Tue, 23 May 2023 17:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E02C433EF;
	Tue, 23 May 2023 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684863544;
	bh=vDGswodSlrzYhuB+jhwOgA8e4UY+ICmFArxjHAa0lQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cmb+eJFLMLRCNos+XdtkEaiFGCeaU44cLSIk5Rf4y1wm+t0VUptmbLHY77jOzC+Il
	 VeEilcHZvfBC3BB9Kl2IjxuacFnQt61SWpCmEIhVaJOK2eUAVxEbLhRDv4EKML9E10
	 JdaYnosTUuxBCcfJWlnfJyMdGEOaijz0BEl18CBXI1s+bs2WDX8QxcaUt4swgmUn/1
	 Zf92mTTUJiERQ1KRrWPW98LbSXU6Y/DjQvlNk/N1cwdVB25eQsU7NsHbXjcNBsxxHQ
	 EOGYNRvBzOtmOw37wH1t7lMKdyxzIxNKL5jJ8dJ6/dqUXmt4BIFTsiVSWJuuRM/ZJF
	 nMScmsVvuY5Eg==
Date: Tue, 23 May 2023 18:38:59 +0100
From: Conor Dooley <conor@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Cc: conor+dt@kernel.org, broonie@kernel.org, support.opensource@diasemi.com,
	lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Message-ID: <20230523-rush-impurity-0d3cfe7f166b@spud>
References: <20230523161821.4260-1-David.Rau.opensource@dm.renesas.com>
 <20230523161821.4260-2-David.Rau.opensource@dm.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CepHPvTd7JkTVbr9"
Content-Disposition: inline
In-Reply-To: <20230523161821.4260-2-David.Rau.opensource@dm.renesas.com>
Message-ID-Hash: POTGAZTMRHJVI7BDG5A4WALQRBK3UV7Q
X-Message-ID-Hash: POTGAZTMRHJVI7BDG5A4WALQRBK3UV7Q
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POTGAZTMRHJVI7BDG5A4WALQRBK3UV7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CepHPvTd7JkTVbr9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 04:18:19PM +0000, David Rau wrote:
> - Convert Dialog DA7219 bindings to DT schema format.
> - Remove unused `dlg,ldo-lvl` property.
>=20
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>

The conversion seems fair enough to me. Apologies for the messing around
on V(N-1).
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--CepHPvTd7JkTVbr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGz6MwAKCRB4tDGHoIJi
0oMQAQCy3qP/6zmjCiNVVw646qB02mnLHzktE//bUWaF1ktUBQEAuTGeu/BKC/89
cKwAnnEUJBVgTBYf2szP0dezn1R78gs=
=riwd
-----END PGP SIGNATURE-----

--CepHPvTd7JkTVbr9--

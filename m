Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881057C6747
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 09:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE1F829;
	Thu, 12 Oct 2023 09:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE1F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697097461;
	bh=n3VSQiFq6Q28AHURyKUO5YxPBRJMKLHPwmkblx/NFUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XCa4TfAH6w9ZCk4VSenW7hk1ACV395bLIJLPvZ5MPOhMIicjQ4wSHm9BtlRs6hhN6
	 NqjV5H7UnS7CYNyktIR0w60DUPJ8t3GUhdw0Vt+67lsYvNPtz3TzCshqD5JYNpmH8B
	 ElBblRTjxqVgJ5VD1G6WDNK4NdI7jzukaEJGZunU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E09FF802E8; Thu, 12 Oct 2023 09:56:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2616CF8027B;
	Thu, 12 Oct 2023 09:56:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1046DF802BE; Thu, 12 Oct 2023 09:54:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70031F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 09:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70031F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S7mpTQpV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 41D6BB8234E;
	Thu, 12 Oct 2023 07:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F5CC433C8;
	Thu, 12 Oct 2023 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697097231;
	bh=n3VSQiFq6Q28AHURyKUO5YxPBRJMKLHPwmkblx/NFUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7mpTQpV5tZexzkiL4KFqQZTLpKcgmhiU2rTNTl1Xpyh3lOFTMYLxjgjC+UtssTHx
	 c9OZ7joHTieHBjxE6lannJFafW7W67ka+BV1w4lIAEh9zx1HGUSfUzNKginVHgTrX/
	 njsJcCs4AAtm+v7X0W/AZJf+tj7zQcAQskT4SQYQll+3WTMEWOWwAMgFlC0FVTPZJa
	 2fZm1axV6SOAz8EF+xVuIpSBe2FBsLYQXtjzT9D7Adb5eC0hsXa2XItzYr58bTqrxB
	 61xxUZwuUJ+Xgqmhxo+stiQZMq6l/JVRWW8W9n77ngZ87QmJS1+kqmFDy7+TBmJvl0
	 mRl+ho5etvyvg==
Date: Thu, 12 Oct 2023 08:53:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <20231012-storage-directory-548905001d10@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
 <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9egIwhgDDkTdU46k"
Content-Disposition: inline
In-Reply-To: <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: MN6BIQF2B6ETADFEZQQ5FMPX54BWZI73
X-Message-ID-Hash: MN6BIQF2B6ETADFEZQQ5FMPX54BWZI73
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MN6BIQF2B6ETADFEZQQ5FMPX54BWZI73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9egIwhgDDkTdU46k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Oct 12, 2023 at 01:32:13AM +0000, Kuninori Morimoto wrote:
> This patch adds ch-maps property to enable handling CPU:Codec =3D N:M
> connection.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yam=
l b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 60b5e3fd1115..3c4b331e8498 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -19,6 +19,8 @@ definitions:
>      properties:
>        mclk-fs:
>          $ref: simple-card.yaml#/definitions/mclk-fs
> +      ch-maps:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

Most of what I said on the last version applies here too. Only the
s/_/-/ was done. Is there a reason you ignored those comments?

Thanks,
Conor.

> =20
>    endpoint-base:
>      allOf:
> --=20
> 2.25.1
>

--9egIwhgDDkTdU46k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSemCwAKCRB4tDGHoIJi
0lemAQCcSizIzimECsychf+NhlIoiAvbXqoY2FcFd3aIDzFM9QD+PU/TLsXytIo0
ricXxSdVEd+6plSq1c3d529uEXYLuAA=
=W9mk
-----END PGP SIGNATURE-----

--9egIwhgDDkTdU46k--

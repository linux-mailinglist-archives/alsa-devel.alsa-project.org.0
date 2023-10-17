Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4077CC030
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 12:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0704184A;
	Tue, 17 Oct 2023 12:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0704184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697537289;
	bh=unab/tp++OH6BDxky/RYyhrmconOIGNcMkY+KpclhEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VwBQAXqT1bOn9iFxtk9YCf+vRest1l/bO1ZZTT1QpFx4hL1MR7qzSJV3XIKmzKckB
	 t7YnkG4rerfa04SWFRUndqub0YlFTMriVciqw4EnjFDg5jBBZPsfXK2YWX+5NwdYPR
	 AqghvupBUMge+qIU2nJDmIA01YhGcYAu5hyDMFHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C22E8F8024E; Tue, 17 Oct 2023 12:07:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 720E6F8024E;
	Tue, 17 Oct 2023 12:07:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D334F8025F; Tue, 17 Oct 2023 12:07:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 476A0F8019B
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 12:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476A0F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E4WmtQmU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 90AD6B81D2A;
	Tue, 17 Oct 2023 10:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D62C433C7;
	Tue, 17 Oct 2023 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697537228;
	bh=unab/tp++OH6BDxky/RYyhrmconOIGNcMkY+KpclhEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4WmtQmUWFJIgYknJY0NRJKhKxhjNR8lR+Ak5diE4ogCPDkdpGj3eh6qsbEOC2MII
	 LKSeNGWP/ZSeIPi0cJHTEXW8v2kgVknhw6YwSQWE9zz9MsB30eMQORkNGHgELifT3p
	 qSxJhO7MiB7bdIOGMRLcmlbbyYReKT2ZMigNd42x5G41Xe9x5xetsIdjHeWYAG3Y5O
	 Mz8bq5sAw2qFLCw/9t/xBdrbB/8BiYO+Yx3Z/bmQM/HjsB3HGRraR3N9QiPau7Qa7Y
	 wnR/riMcnV8VZEht3FXTvyAfBJ1ARmycyfls0hxzbzYyTG4DsDMGULpBhCeb/biHIX
	 Dq1rEcWrn7/pw==
Date: Tue, 17 Oct 2023 11:07:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <20231017-mutation-perfume-cae0484e8e32@spud>
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
 <87ttqrwdmw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d2oUw/7aLluqa6Wn"
Content-Disposition: inline
In-Reply-To: <87ttqrwdmw.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 3KHRUE3OQR7FG5YNH5I6HZDZCLVSN7XS
X-Message-ID-Hash: 3KHRUE3OQR7FG5YNH5I6HZDZCLVSN7XS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KHRUE3OQR7FG5YNH5I6HZDZCLVSN7XS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--d2oUw/7aLluqa6Wn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Oct 16, 2023 at 01:37:59AM +0000, Kuninori Morimoto wrote:
> This patch adds ch-maps property to enable handling CPU:Codec =3D N:M
> connection.

Please avoid sending new versions before the discussion on existing
patches have been resolved. I replied on the v1 again just a few moments
ago.

Cheers,
Conor.

>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml       | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yam=
l b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 60b5e3fd1115..1f7005356efb 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -19,7 +19,13 @@ definitions:
>      properties:
>        mclk-fs:
>          $ref: simple-card.yaml#/definitions/mclk-fs
> -
> +      ch-maps:
> +        description: It indicates how CPU / Codec DAIs are related if nu=
mber of CPU(N) / Codec(M)
> +          DAIs were not same in one dai-link. ch-maps is not needed if t=
he numbers were 1:M or N:1
> +          or N=3DM. If N <=3D M case, ch-maps indicates connection from =
CPU, if N > M case,ch-maps
> +          indicates connection from Codec.
> +          ${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dts=
i is good sample.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>    endpoint-base:
>      allOf:
>        - $ref: /schemas/graph.yaml#/$defs/endpoint-base
> --=20
> 2.25.1
>=20

--d2oUw/7aLluqa6Wn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS5cyAAKCRB4tDGHoIJi
0mcrAP9kKyPPw1LoXQK+C30x0UAwOmDjRTP06e8CkqKdOYtGNgEA87yUFJKcjFFq
hsjgzXdGG7rVO3pvSyfPPeqmbw2x/gY=
=N/af
-----END PGP SIGNATURE-----

--d2oUw/7aLluqa6Wn--

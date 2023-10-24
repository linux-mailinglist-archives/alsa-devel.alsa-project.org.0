Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA77D5652
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 17:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 480C8857;
	Tue, 24 Oct 2023 17:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 480C8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698161361;
	bh=J35XI7bU6ttNBm3hM0waZBN2we9c9svXeBc2p+k4H9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NcEEpFk4DUQsJTDW4hnRBn/jsRkvFoBzyn2k0ihdhMEHXQ8s07Vy09Umc/pqrWmN3
	 /WEUU/BMfPr++BHjqyJgH/mAXdXJpxplVjm2pXx717AXeYy0QZck8hFCr2Py9ezTCt
	 omJEl5qq6cMrZvsttQDgwM4DUO4YgpH2PdEnpM9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE534F80571; Tue, 24 Oct 2023 17:28:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA1AF80537;
	Tue, 24 Oct 2023 17:28:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E1BF80564; Tue, 24 Oct 2023 17:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13DCEF80165
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 17:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DCEF80165
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BkB48Xno
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F2DACE2F98;
	Tue, 24 Oct 2023 15:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB84C433CD;
	Tue, 24 Oct 2023 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698161292;
	bh=J35XI7bU6ttNBm3hM0waZBN2we9c9svXeBc2p+k4H9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkB48XnoWs2ey2uivlhZks/pojihi622gzSH62ordG0xCGflHilX95W9BWOVaQXuW
	 PnNSp32/SpxIi9mnU88SIKTGaO7DNWiaA5NBUGC60F8EuozGeRqVhM3/NOMBQ224bp
	 0BXrCdrzfc9KdXIcf+pZwp7q1MvWD+AqJXaUU7V5HAd5n02oH1OsDkakaBBfK65Yed
	 LB0uG8mWx9vKoFgEgzVSHpyzsoPTYOUrzC+f/BHCE3T6WMgabgiJuhZ3yzEJT9JB/H
	 oUKpngsPDge0ti2IYdrCgjuJ7DDzwi5FVNlRPeHnlEma/PsgtU+f0O09+/2TBS0EKC
	 8PTApXU/sGfkg==
Date: Tue, 24 Oct 2023 16:28:07 +0100
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
Subject: Re: [PATCH v5 5/5] dt-bindings: audio-graph-port: add ch-map-idx
 property
Message-ID: <20231024-preheated-parasail-34d75ee63244@spud>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
 <87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
 <20231023-security-tadpole-8b4fd45a96da@spud>
 <87v8axj698.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YUL/vMUZS2IBektD"
Content-Disposition: inline
In-Reply-To: <87v8axj698.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: ZUUKBXAF5SY2D6NTW4MWZTTMH5RKWR6F
X-Message-ID-Hash: ZUUKBXAF5SY2D6NTW4MWZTTMH5RKWR6F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUUKBXAF5SY2D6NTW4MWZTTMH5RKWR6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YUL/vMUZS2IBektD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 10:58:28PM +0000, Kuninori Morimoto wrote:
>=20
> Hi Conor
>=20
>=20
> > > +          CPU(N) / Codec(M) DAIs were not same in one dai-link. ch-m=
ap-idx is not needed if the
> > > +          numbers were 1:M or N:1 or N=3DM. see soc.h::[dai_link->ch=
_maps Image sample] and
> >=20
> > Again, relying on header files in an operating system to explain the
> > property is not a runner. You need to explain how to populate this
> > property in an operating system independent manner.
>=20
> Sample is not mandatory here, I will remove Linux header pointer from her=
e in v6.

Please don't just remove the reference to the header file, and actually
explain the property instead.

--YUL/vMUZS2IBektD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTfihwAKCRB4tDGHoIJi
0gnGAQDjJrIPJFfPXJhNbXUnGmwE+Ux4CrILw2zypNCCQa3y5gD8DyfHso0kybag
nnlxu3KYGrJ8akSqwxUc9hgzGmmEWQY=
=DTMj
-----END PGP SIGNATURE-----

--YUL/vMUZS2IBektD--

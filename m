Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D17D564E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 17:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1211DA;
	Tue, 24 Oct 2023 17:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1211DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698161320;
	bh=GNUAyYjOwu8BN9znMTpBdiid662FC5xPlLGOISKRyuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OoMxXZeU3HdV1rpsNBuS8cb+Zh/QimeMO8fH8POoPmhovwzrFsLjZKv1WVdQ52Gzo
	 TgtRLYq3FymejDfccxuU4wG/i6aReRvQfnhoJuivlTE0X+vZrfkLxfEdm4+yItE31c
	 jBmf+RIQSIHAmRQlf9oKm2K3VBMsOTL+nQ889k+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63442F80557; Tue, 24 Oct 2023 17:27:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C21F80157;
	Tue, 24 Oct 2023 17:27:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7530BF80165; Tue, 24 Oct 2023 17:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0338F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 17:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0338F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rMuK4XqK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A20ACE2F1F;
	Tue, 24 Oct 2023 15:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687A8C433C8;
	Tue, 24 Oct 2023 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698161254;
	bh=GNUAyYjOwu8BN9znMTpBdiid662FC5xPlLGOISKRyuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMuK4XqKXsWW4BL29we5LHshgIvMU47LumSprYnjnO7QM/Ty6ZxhNsz/4YSvd3PfK
	 RYtCYuo1Bwjj1yRpuZulzYHB08HmnCKHDDmL9TZRNEQM5egydZ2UWVUNsGGzuFvkad
	 rM0uq+WwrtrFmEHZcXKTJlN40++IusDOGj9wEWIIf45pWftWp8p79T7DSseTuSSuNc
	 Xd0jxvDwnFRu0JQq49yXpsHiag/mgLAICb9sgeW2CGb8DvmeqEbNLy891l1bTKrpeX
	 rIKeiJqsB/gxJsKVA4QdBXO07XuGytQl6KTLxlmeqDO38KshOXQWXmUANXDv/YbG5w
	 ytZB11/Frf1iA==
Date: Tue, 24 Oct 2023 16:27:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] dt-bindings: audio-graph-port: add ch-map-idx
 property
Message-ID: <20231024-tug-marbled-3302a66e4894@spud>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
 <87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
 <20231023-security-tadpole-8b4fd45a96da@spud>
 <4565f60c-ee6b-442a-b509-e54e60cf77ae@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bYioqNurgkFRQ2WJ"
Content-Disposition: inline
In-Reply-To: <4565f60c-ee6b-442a-b509-e54e60cf77ae@sirena.org.uk>
Message-ID-Hash: 2W44G6QGNB4Q2FG3YZOMZQXGKU5T7IA7
X-Message-ID-Hash: 2W44G6QGNB4Q2FG3YZOMZQXGKU5T7IA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2W44G6QGNB4Q2FG3YZOMZQXGKU5T7IA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bYioqNurgkFRQ2WJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 07:47:09PM +0100, Mark Brown wrote:
> On Mon, Oct 23, 2023 at 05:50:42PM +0100, Conor Dooley wrote:
> > On Mon, Oct 23, 2023 at 05:36:09AM +0000, Kuninori Morimoto wrote:
>=20
> > > +      ch-map-idx:
>=20
> > I would rather this be spelt out as "channel-map-index" - although I
> > don't know if that is the best name for the property, as it seems very
> > tied to a single operating systems variable names.
> > I'll leave it to Mark as to whether there is a less linux implementation
> > coupled name for this property.
>=20
> It's not particularly Linux coupled, this is a fairly general concept.

You'd know better than I, it just seemed like a rip from the variable
name :)

--bYioqNurgkFRQ2WJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTfiYQAKCRB4tDGHoIJi
0po1AQDzQ1Ix+8CUzjK5P7kN8kloRru5wiZyhFfBdKKjoQ03IwD/Rbxt1Smgw+GW
Er4FJl/82tD2s7rixz1KaEJKay0Nawg=
=p/xh
-----END PGP SIGNATURE-----

--bYioqNurgkFRQ2WJ--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9C7A03DC
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 14:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C234A83A;
	Thu, 14 Sep 2023 14:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C234A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694694598;
	bh=xHKtOblAJ+TjizZ7g42dcTLocB/MyJ7b3jI0CXmyonQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SusmnLNGEs0J3s+7ng1AUjQasYfg3+b9TzZ2QkJqMsygakNDsKz0dndw0etGT4HXP
	 LAbQEALLWUqBCnjdAkFIUMtRWwZhCgqhbS8IyO02QjcjGPw9krzJr8yjl3S9EiyApl
	 vxkIMwbrzmqCE6QqDElf/TIaFTxbyelQn/Jm1mTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD00F80431; Thu, 14 Sep 2023 14:28:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC772F80212;
	Thu, 14 Sep 2023 14:28:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B22DEF80425; Thu, 14 Sep 2023 14:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB937F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 14:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB937F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RTVFHKaI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7770EB82835;
	Thu, 14 Sep 2023 12:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92F6C433C9;
	Thu, 14 Sep 2023 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694694499;
	bh=xHKtOblAJ+TjizZ7g42dcTLocB/MyJ7b3jI0CXmyonQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTVFHKaIFpqJ5QWqPCvwLmh0Suaar6M3nHgE6yc38G3EGAo+IXbqNwQzfgW9O+cuv
	 tIy1GOOQ8rfI2cOo31CULpAF/n259soEthsrDUSVWrea3iHYC7Pk6bx/vzL/ffAH3W
	 ARAdZSEvB8aRLd+C9Hbb63lFuIfNgOtaMfr1AICamUDa+wcXTtVtahI5Fv9OiTbuDO
	 AI1n8P/vk/IDNBg8mI0BiGnCEM0GVQpy/2UMQP43dwTf4jKk83BdnBYvzso4mHk5vr
	 nLF6AExbSMwty4ITCJvsCVc+izsPqZamY3bGkBCFMh8NHfA1XiSgkuXDhj8Za3ueDE
	 SdTkdhub5obdA==
Date: Thu, 14 Sep 2023 13:28:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	"S.j. Wang" <shengjiu.wang@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Why is there no SND_SOC_DAIFMT_TDM bit?
Message-ID: <9e22b43a-bc43-4fef-9992-02469b4820df@sirena.org.uk>
References: 
 <CAEnQRZAHXy7U4Y=J1wyktA5O6CJB+6M-BBD6O=yjTgPcbjHLkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AKD7X2bd+Deqtzme"
Content-Disposition: inline
In-Reply-To: 
 <CAEnQRZAHXy7U4Y=J1wyktA5O6CJB+6M-BBD6O=yjTgPcbjHLkw@mail.gmail.com>
X-Cookie: Do clones have navels?
Message-ID-Hash: ZZ3SIA3KASMBNJRZJ4HF7RDHRK6IZYP3
X-Message-ID-Hash: ZZ3SIA3KASMBNJRZJ4HF7RDHRK6IZYP3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZ3SIA3KASMBNJRZJ4HF7RDHRK6IZYP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--AKD7X2bd+Deqtzme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 14, 2023 at 02:59:23PM +0300, Daniel Baluta wrote:

> I wonder why there is no SND_SOC_DAIFMT_TDM format although there
> actual codecs supporting TDM.

> Most of the drivers I see use SND_SOC_DAIFMT_DSP_A or SND_SOC_DAIFMT_DSP_B
> to signal that the format used is TDM.

They're orthogonal things - as you say you can mix TDM with either DSP A
or DSP B style clocking, and there are devices which support TDM with
I2S style clocking too.  They'll put all the left channels sequentially
under the left side of the I2S clock and all the right channels
sequentially under the right side.  The DAI format says what the clocks
look like, the TDM configuration is about how many channels of what
width are being clocked out.

--AKD7X2bd+Deqtzme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUC/F0ACgkQJNaLcl1U
h9DUkgf/TbwldfurL606qUPlMvCtvDDiHAE+Ddbkt6f2SzsKAuQtx6mz7uV0hWKU
AOlHhk3CmpqzNm3mfkHpc0xcGETzVhfWB6c9pARg05IV3uIXfBnzpMqqHAh4/9Cc
bsKPUYNVG1PXhFglxzF89R7kSVro8BreZSHmBEg9IRo+jzKhL79G7lSixUbxnL4a
h+xgg+nOnNUuwPaCazDL5UoITCG2dtu8yzAMep8Vz8J/K7YILZ0vwnnUVjm7P+0H
MNMPg1nwR4H8dDwMSQPCLlBnIdRtaQvbpJBau8jPzg5F+bIiUUsokqNwbB5nHqms
Kt4db7iCGYVL+fxvQ6JGP/1doRvMmA==
=7byp
-----END PGP SIGNATURE-----

--AKD7X2bd+Deqtzme--

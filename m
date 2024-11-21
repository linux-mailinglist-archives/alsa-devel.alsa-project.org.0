Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9E9D4E3D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2024 15:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0534E1930;
	Thu, 21 Nov 2024 15:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0534E1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732197840;
	bh=EqoX93a7SSSutDSrjFHpMZeVK/vypQ6MnjJTLZXO/IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cn3u3HeDLOqQyws8VDu7eTpwvTk7AbxEXxnV6NODEXXm6hYZjuaLrbBO2aJ6//BAX
	 VPezfUa8+AZbzefwUTXS1E+xaZppRnjhaWqbjdBAmpsjYrIXHMzkUY7jLiPkNe9tDe
	 smJCqoLqYYf/WcT77ghlMY8rYQQnX9uQOWVgcD8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E701EF805B2; Thu, 21 Nov 2024 15:03:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F194F805AB;
	Thu, 21 Nov 2024 15:03:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CA38F80533; Thu, 21 Nov 2024 15:03:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C639F80134
	for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2024 15:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C639F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pW1jKepJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD70B5C579B;
	Thu, 21 Nov 2024 14:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C56C4CED0;
	Thu, 21 Nov 2024 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732197788;
	bh=EqoX93a7SSSutDSrjFHpMZeVK/vypQ6MnjJTLZXO/IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1jKepJgOpBBBEEItFDTaXkV9FaIP2tlsyxiTZWrMQ/M3SXodJdqtyVipI9mepc3
	 1BfUi2k94k+W8epnfmcIt5APqxW5//gHUvzgiEKQu1oIVcAmABsCSlRYUHPXFjMXM9
	 2EcPgCTYH2MckodRKgshyh0Ex8AarCVNx6YXjkgIGSLmsEfuqJgjpFPbMOxjux6Xlm
	 jk9srdRE9XX6fmmeWNBylz4eQn1HX1+uBHgxH55gXmBcUL7HH/4UDNzA9FFZO+dn8d
	 sR4MnLdWouSihaOX60ni0lccvUgFeUagbbVALjHdjskbFYBDnl4mS7kq7rEEIpfLde
	 ljd5HLRZusgyg==
Date: Thu, 21 Nov 2024 14:03:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
Message-ID: <387c84aa-dab1-44ca-8d42-bc19abc79434@sirena.org.uk>
References: <20241117232100.23760-1-spasswolf@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BVF4aMiMiHWSAYi5"
Content-Disposition: inline
In-Reply-To: <20241117232100.23760-1-spasswolf@web.de>
X-Cookie: Remember the... the... uhh.....
Message-ID-Hash: AKHJG627S2AQYSVDKPPH57BXUWDSJ2IA
X-Message-ID-Hash: AKHJG627S2AQYSVDKPPH57BXUWDSJ2IA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKHJG627S2AQYSVDKPPH57BXUWDSJ2IA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BVF4aMiMiHWSAYi5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 12:20:58AM +0100, Bert Karwatzki wrote:
> Since commit a78a42fb48b8 the second argument of apq8016_dai_init() has
> to be an lpass id returned by qdsp6_dai_get_lpass_id().

This breaks the build:

/build/stage/linux/sound/soc/qcom/apq8016_sbc.c: In function =E2=80=98apq80=
16_sbc_dai_in
it=E2=80=99:
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c:153:38: error: implicit dec=
larat
ion of function =E2=80=98qdsp6_dai_get_lpass_id=E2=80=99 [-Werror=3Dimplici=
t-function-declaration]
  153 |         return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai=
));
      |                                      ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c: At top level:
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c:165:12: error: static decla=
ratio
n of =E2=80=98qdsp6_dai_get_lpass_id=E2=80=99 follows non-static declaration
  165 | static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
      |            ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/qcom/apq8016_sbc.c:153:38: note: previous impl=
icit=20
declaration of =E2=80=98qdsp6_dai_get_lpass_id=E2=80=99 with type =E2=80=98=
int()=E2=80=99
  153 |         return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai=
));
      |                                      ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

--BVF4aMiMiHWSAYi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmc/PZYACgkQJNaLcl1U
h9D/Swf/d78eojqXzZ5VOkYr+QjU1ZK0Dbvd72wJ41o23kHzspDvY5OCw/NIU1RP
OGkyFIDnLqEsJ6bNy05h7HdR5gGNDzYBHN+DsvVpGstCmVIZ8JRC3R/Iwym9e8th
tMvCj/I9tsezLwOa9esB5gvQDjLNLKrt/DPyI2ORKEnoS0G1xWwoA0gvldD0iwNa
fIz71HhzFfGCwDqTGIwhqnfggnnNLLYONsiocDIaWIHMWcQzznRuy7kKM8IRgUaS
cDVQt7QFGInhOpIE7mAH5iPq797YnQ05pen+hoGV8DQsGvfkFAZIrhgA/KcyTWrt
PojNfqnAOvOLurJzoA11kK+hvDzaNg==
=LL8L
-----END PGP SIGNATURE-----

--BVF4aMiMiHWSAYi5--

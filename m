Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BD753F83
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 18:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329C1AE8;
	Fri, 14 Jul 2023 18:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329C1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689350875;
	bh=0x+6yru7lLFD4oe/5xE3srvk0BbNmPu9/UtbnyNKzSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PziccddCMDslfMzNk8nvidSC+SB1CDw6YqN8aDeIwNf2HxtMBmp6H6X34Kd0BXooc
	 EmFbGEGwNFUtgmvNKt2qM/+7Xy7r2fRNduuuBOHWI8P5exSqOcvAGksEZGs9FLEYvn
	 C5VfCLomaXBfqGa0HgcxuwpT9+h1Mg8xJYC4Wyto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 575F3F8024E; Fri, 14 Jul 2023 18:07:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F92F80236;
	Fri, 14 Jul 2023 18:07:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05D33F80249; Fri, 14 Jul 2023 18:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ED4EF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 18:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ED4EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aUBrwV7u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F3DC61D51;
	Fri, 14 Jul 2023 16:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB194C433C7;
	Fri, 14 Jul 2023 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689350811;
	bh=0x+6yru7lLFD4oe/5xE3srvk0BbNmPu9/UtbnyNKzSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUBrwV7uKVAe66TiCaKxa0wIoEurA8bk3LYNDaybwI++zH8g+dE3FB+WD6YR17QM5
	 eCyQz919iQ15+59uNo11VtTVRARayKfuCX7FusgeAz8ZqD586CVbiFuyQFzj1ZFVe8
	 DN1imlnjNX/Htbtkn87nwGWUzV0KDvVV2a+egHp3Xc4Ja4bQ6UWPOXAhT6uvcXLaf9
	 5sZu81HJ32CHiSGbmQRNFaF3X42dDZUo6oTJ9QC29pI0okmu5TWHvDYdxMgGQxfWK4
	 fgV69tVzyxq20w20aVSOmBNzUbq2YDxRBRBpQuadH3RCMzWO8EPQxZqyVEjuGxa8Fi
	 /M1AtsrXUKulA==
Date: Fri, 14 Jul 2023 17:06:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com, zhuning@everest-semi.com
Subject: Re: [PATCH v1 2/5] ASoC: codecs: ES8326: Change Hp_detect and
 volatile reg function
Message-ID: <8ce0b387-e522-430b-b9e8-58ad9efa2505@sirena.org.uk>
References: <20230714032453.3334-1-zhuning0077@gmail.com>
 <20230714032453.3334-2-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="523nnTeaBAVqI2UH"
Content-Disposition: inline
In-Reply-To: <20230714032453.3334-2-zhuning0077@gmail.com>
X-Cookie: Madness takes its toll.
Message-ID-Hash: KLXSPTZ7JZDRXJIRFW7G5PBEEYHTPZFI
X-Message-ID-Hash: KLXSPTZ7JZDRXJIRFW7G5PBEEYHTPZFI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLXSPTZ7JZDRXJIRFW7G5PBEEYHTPZFI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--523nnTeaBAVqI2UH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:24:50AM +0800, Zhu Ning wrote:
> The old register naming method is confusing. The reg 0x57 decides
> the default headset hardware connection type, and the reg 0xfb is
> the headset detection status register, which changes during headset
> insertion. Change the name to ES8326_HPDET_TYPE and ES8326_HPDET_STA.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/codecs/es8326.c: In function =E2=80=98es8326_r=
esume=E2=80=99:
/build/stage/linux/sound/soc/codecs/es8326.c:659:38: error: =E2=80=98ES8326=
_HP_DET=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98ES8326_HP_OFF=E2=80=99?
  659 |         regmap_write(es8326->regmap, ES8326_HP_DET,
      |                                      ^~~~~~~~~~~~~
      |                                      ES8326_HP_OFF

--523nnTeaBAVqI2UH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSxcpUACgkQJNaLcl1U
h9B1Pwf+MnqK7SRQhWPXDXwOBUnxWZmR8H8iIZrWm8ac4IPzWPC/NNcbsObZaM8z
6cMh5qvmsRqYifXvybU9FlKc9K+9UslRLGq/NYeeEhp4EqK4kEZKB9Zz/oLSqsn5
yRKmAHmG59/3OkdFj2uofsWN0fyQYAa0Z3L9KPdnh0/e05CfS52yjEVyN5VrD0BK
ReKXLdE99CK4iouCjlcr7mdiAxZzppypYgYItGt7I3pMKVNuP9dTaSnYPc3JBguv
Jx//H92MhmGF62o5XqhCbFZGQ7I830CgvOTIg0673wivljLC0E7mP1XRJyL8ynVu
w+tuts3rRGLzlmYMivLawY8doY248g==
=pMjR
-----END PGP SIGNATURE-----

--523nnTeaBAVqI2UH--

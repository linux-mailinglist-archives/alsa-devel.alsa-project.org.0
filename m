Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876685204E3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:59:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE2E16D7;
	Mon,  9 May 2022 20:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE2E16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652122765;
	bh=ICjgh2SHUAfsGyKVspdhXwxyeTpLD0tJ1XV/0qJNQgE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BhrhwvSDgKb9bnQOB4RxcX7LzU8QV5c0c1x9dUNARByZK0xe/2vJVMbNSCWcI3nWt
	 r1Z9+I8EOdiBsU8XElaUfNnsOLMG8kAXKtMQC5M6Cs6/LtE2Eiqj3IUtlJKjDZ2inl
	 mLLIE1VQdZH21p5kBGuiLiud6s6YGxbRZO3i2mI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D865F804A9;
	Mon,  9 May 2022 20:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AC1F8047B; Mon,  9 May 2022 20:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C375AF8025D
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C375AF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cNOfUt66"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3D420CE1B0B;
 Mon,  9 May 2022 18:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70CFC385B8;
 Mon,  9 May 2022 18:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652122691;
 bh=ICjgh2SHUAfsGyKVspdhXwxyeTpLD0tJ1XV/0qJNQgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNOfUt66xaeB9Y2OieOzu+BQCMSPIV/o++Q5uNjXXxOojRb/2rqrD3qCl/8GGhLme
 5PlW3HJImr989z4mRU7QMmV9LiewWaF5y7dwYyx/QCMAZW6DthHimUk72B9J4511Zy
 WZTLc0SuSP+HuRDnWvmjcAVIFNvhXrJZcL+kr1v2nt3uE5bvk77F+CzG8PcSVAiHS9
 ndIgjQsAQDIcTPurHpY8UVc4ru68mDkI1hsAsUOlntkZawahJEYsjkhv0/hXyraBqz
 0AqI5h3DlQFMz8agBSVk/tonMQCA7dBYiTn/jqkQ49wHDIrJGTfWNhbP/Q3c6nDz8+
 SUOMymOk6L5kQ==
Date: Mon, 9 May 2022 19:58:05 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] Revert "ASoC: dt-bindings: mediatek: mt8192: Add
 i2s-share properties"
Message-ID: <YnlkPTUqcoRk0pNv@sirena.org.uk>
References: <20220509185625.580811-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GjheQb+H4dAxuUfA"
Content-Disposition: inline
In-Reply-To: <20220509185625.580811-1-nfraprado@collabora.com>
X-Cookie: Boycott meat -- suck your thumb.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--GjheQb+H4dAxuUfA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 02:56:25PM -0400, N=EDcolas F. R. A. Prado wrote:
> This reverts commit e056cf4341ae3f856f1e38da02b27cb04de4c69b. The commit
> was merged while the property name and definition were still being
> discussed. Revert the commit for now and a follow up commit will re-add
> the property after it is further discussed and reviewed.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--GjheQb+H4dAxuUfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5ZDwACgkQJNaLcl1U
h9BBOwf8DEntKvg1X9xyFzUILjpwaenS8uKLDQGKJ8FH2tF11PeS9kYPLUbP9twY
qWF7VO5OYA4wPhBnLf5Ivc2fNWgr0so+LCY4scCEQMxsn9udS+FfRTlBAPx2kfPj
GwrnQtj59gWQrt/9dbe4RZ1JNcPU471ghlaXqPacg+wNQRqcRVdcPtAn4G9uBHxm
rYPBGIcCyMV1hKtPAGfirZ7F6Py1G/DFCKAvXC/huj9nFWsvNOb5uiFnkXZDTlQX
OooS9UNpAbe5uNG91MoRx8lBxHLc6WNnDwFxUVcF5O234cIRI6uNm25qlYQTzgD6
MJOe9k1CWfsum8VGBztL5mYqwi/IQg==
=/Syt
-----END PGP SIGNATURE-----

--GjheQb+H4dAxuUfA--

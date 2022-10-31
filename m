Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38094613778
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 14:10:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3EB71675;
	Mon, 31 Oct 2022 14:09:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3EB71675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667221842;
	bh=x05963W2dqV1bExHNBIDhn9obN9+F+LJRKzghxQaRuY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7r/zmapuSEEI7MjJZW0fK12529HS8hy3R/ylfZutAHCwAXTFObQdguL/gQA7KiyR
	 m7zHBROTBi2O59e/zwwK5Yiyi6tQjbLj3+Z/0xPvEeFqkbkygpuEkx4YoV4fMWifbJ
	 iMxIahY9tbTHMzpBMSwHi6XsHZ6QqlNA1jw1T96Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEA9F800CC;
	Mon, 31 Oct 2022 14:09:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9308BF80163; Mon, 31 Oct 2022 14:09:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735F0F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 14:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735F0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M4g3CXaE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6CF6611DF;
 Mon, 31 Oct 2022 13:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9419C433C1;
 Mon, 31 Oct 2022 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667221774;
 bh=x05963W2dqV1bExHNBIDhn9obN9+F+LJRKzghxQaRuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M4g3CXaEsNQBhg8iIvVgpXM8DkacbUwkl83NkQROkfOq3JuqL+rfKxK0UiiTMOfeh
 dNgp3wTBPdN9WtyC5j751jwProCMXL8w5CvHo4tVbOicLzRA/NGTw8Ve4B84m5Y6KP
 VpdyQd2iyxfCG1K05yoaQMElNNuNfbu9LLW+rZM/z8G/UK/3RZ7V33ZET3FRVq/MKA
 ajD/Q4ZZoc1KdDHVdy81KmXJ4ccf74lF9NjvxprZ9ZmSrMa8BeJoJskEW8BGx4FvcC
 zW/LWE2R2LEi99Ywph5E6DHa3tMbdanKay8R9Gt3HuaiUuTt27VfC7BW2Gacx5pC5H
 VxCh/5ebL3Axw==
Date: Mon, 31 Oct 2022 13:09:28 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Message-ID: <Y1/JCN+mtlT0r/rw@sirena.org.uk>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-7-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lwPxwuBKxUgXsGLF"
Content-Disposition: inline
In-Reply-To: <20221028205540.3197304-7-nfraprado@collabora.com>
X-Cookie: Sign here without admitting guilt.
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@collabora.com,
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


--lwPxwuBKxUgXsGLF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 04:55:38PM -0400, N=EDcolas F. R. A. Prado wrote:

> @@ -35,6 +35,8 @@ const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] =
=3D {
>  	"AVDD",
>  	"MICVDD",
>  	"VBAT",
> +	"dbvdd",
> +	"ldo1-in",

Why are we making these inconsistent in style with the other supplies?

--lwPxwuBKxUgXsGLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNfyQcACgkQJNaLcl1U
h9DdQQf9GAk+mEXiS/YEqRmvTdmMbShtgqvY01OdsBpTaWe4fXM9SjrNTht/RbZe
K6HW3Aer75TA64p5n/AZaBf9EcnYk0leRuIgILguybyzxASIpOUeozpR1Skvdzlr
1Hi5ztBMD1GrqFRxRV9XZ9HDuy/jL8x4uunbzmEd4x7oVf3KBbdXqPaoCQZylmUh
rp057jbeyXJztV1F1Gpf4YXW+UhTX9jtvpakHlfxJ64d3ihgQsiXSLpsNs0exxvU
LCahhb0BudeFj9m0Eow4UTfJljCH/xJ8i/Q2g/kyKzifNgLqkZY/RyMYX0WLdHgH
MBCPXKh1aRU+sn4lC83eD3JmRJKTxQ==
=UmuG
-----END PGP SIGNATURE-----

--lwPxwuBKxUgXsGLF--

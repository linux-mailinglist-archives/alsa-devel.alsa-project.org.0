Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB734400D6
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 18:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FA01690;
	Fri, 29 Oct 2021 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FA01690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635526762;
	bh=Su9vVSviobYVjYObOCBEe73TcGXWuppnwITxt73nSf8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXOCqz3z4E2waETeGCjRH7SUyap1siYzvtPl0k/GhPg6wl1lJwgKDc5kPPHJfiezZ
	 qY3i5Zm4wiOeT1cytRxGt9OnDQA+/yneCc1l0JxaQ4OxVRBIUgIGKaCPgxoKbHJQg1
	 KyYHzyTCkLlgpQWuLTt1EcgGe5Pj8D0eLK3pDD+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1FEF800F4;
	Fri, 29 Oct 2021 18:58:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 063ADF800F4; Fri, 29 Oct 2021 18:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD9C6F800F4
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 18:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD9C6F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OiJMNRwT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00B5060E8B;
 Fri, 29 Oct 2021 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635526669;
 bh=Su9vVSviobYVjYObOCBEe73TcGXWuppnwITxt73nSf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OiJMNRwTxy7TtwQvyW++op3MucoWFCDDO3IMRhqz/oqUlVRo7P7fGyId2IOHS6keC
 oeOR0pAalcKXLWbTReztyvIDld5jL4S8erPghdklD5p358ZtyjvbT5arJp7+k3f7G6
 x8nGhyNHUE/8ZOS6uTQyu1An1BDpdP4ihsAJsF/tC1UuocgdmgKKYNoJdfCzifqb4j
 u6Nmg8MTUQsoPBiGZFYRB9U/ONvqL8jNun2THPa2fUJpZqUfi9o/+6I3s04/yLWrtH
 CiGHV30HjvLkDxW+KuFvYBul76atwxcdJsrPISRFShGTBWeGkg+Wn7xV3J36A3GJRI
 E7JGhkWwq67yQ==
Date: Fri, 29 Oct 2021 17:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH v4 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
Message-ID: <YXwoB7FtRw0AzgcD@sirena.org.uk>
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-2-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L+FynStKYfLi0cU9"
Content-Disposition: inline
In-Reply-To: <20211028135737.8625-2-yc.hung@mediatek.com>
X-Cookie: QED.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--L+FynStKYfLi0cU9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 09:57:36PM +0800, YC Hung wrote:
> Add adsp clock on/off support on mt8195 platform.
>=20
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
=2Ecom>
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> ---
>  sound/soc/sof/mediatek/adsp_helper.h       |   2 +-

This doesn't apply against current code, there's no such file upstream.
Please check and resend.

--L+FynStKYfLi0cU9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF8KAYACgkQJNaLcl1U
h9AoVAf+Lla83sRtVKTqKOk679LT17XuZlBpgOt3NtPFIbvAv9dQFo6vZbhSPUfv
FNFch9494hJbje4GQNsx+/P8YBAu8B8KT1L9mvI2xfE+R1ififzxOa8KFibsE4ee
kOaEBLq5sK5K4ujyPS9F6/fq5bih/0+C5YgBJtWYhW4/HwPL2eSp+U/cbLX7hUCV
Y6WZRE3jA3UDHCl/nTSz9EZAg2BExYI3zDrEINWf26Fs+8rwx/q6y88UQofl0WBK
kdelvP0X9dFsxgV8T3wug4bRTgfGezFAen3rkQG6I1tliMMb4XO2tvCUQlSyV3zS
h0KJSKLReUXZNM9ANMySrqQWAFF9wA==
=slFG
-----END PGP SIGNATURE-----

--L+FynStKYfLi0cU9--

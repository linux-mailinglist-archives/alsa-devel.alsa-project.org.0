Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFC44567A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 16:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849431684;
	Thu,  4 Nov 2021 16:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849431684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636040439;
	bh=33691hjBX9cadGoNuJzUiBoacTbjKNGx8fgHdxnQIQw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5ZP3oBGL647Zli6LgIiu1VoN4hocY9t+9x54ivKxQp+zwi04dzgoelKt7I8z5ZDp
	 un/9Jqxje/2pnHJjPUiukTqqdjvPq1pMMGWuNL8fvmxm+qgzGyepWgBDrQJi1MIZl4
	 cqAyAorsIM8lMQGnXIKKowz66VJlCgmf+27E8Euo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A1CF80229;
	Thu,  4 Nov 2021 16:39:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6C15F8025D; Thu,  4 Nov 2021 16:39:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43322F80148
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 16:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43322F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NBp55FzK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2109610FD;
 Thu,  4 Nov 2021 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636040349;
 bh=33691hjBX9cadGoNuJzUiBoacTbjKNGx8fgHdxnQIQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBp55FzKYxropmUNncWTfpvAEjPc/Yu8oqJK2u3YOsk5m/En/j7Bpm+EP3D7MKN3t
 yQR8Hq7NEYxbZdyB0vj0BxYacEjwI1oT8GCQ0apH3XudV1TIhYef54Dd4q6E6MZVaW
 gvylekx8Cts46ms8jezMX80mEeJhXX34EMUO6PNBMMiPbKlyWtjyzPq3aqDPmf4EP1
 ityBueCMVcwFsPI0/xsXzuiTu3Lvrm2zLX5syOP/bWZ6/BbZZys0M/9Jw4U1Yt285W
 5JqfDrYERFsWks5bOSxaXR1own0RBt5X4JfQ5gRlmqKxhSoVaVICXnUzIbNUOzpoAw
 vvslMfivQEspg==
Date: Thu, 4 Nov 2021 15:39:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
Message-ID: <YYP+l7tMofYoB+aC@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c/fvPxmf2qWNcw9j"
Content-Disposition: inline
In-Reply-To: <20211103100040.11933-4-trevor.wu@mediatek.com>
X-Cookie: Motorized vehicles only.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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


--c/fvPxmf2qWNcw9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2021 at 06:00:39PM +0800, Trevor Wu wrote:
> Because we will add DSP support, an new machine driver for the same
> board is required. BE and codec configuration will use the same code
> when machine driver is designed for the same board.

I don't follow why the DSP support requires a new driver?  Shouldn't all
systems with the DSP present be using it?

--c/fvPxmf2qWNcw9j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGD/pYACgkQJNaLcl1U
h9BAqgf/Us8BcF+vWFc8NQqr1anc/z5wXrFIw7io61z4wr+ALcAiqTXbLnt7KKse
vtZMFvaxL3V/QbElufEk96G8jEXIrjYRuLAubtVQDl0a3LAtlQ8Se2ynhzu2Ib12
Rf8pihv2OkEOM8Cj11mnLnokKBRQPj/CeloGdaE0xvVqlrO+ymOTdXZ8luP69uI5
kCIYGzh3zlGA8G/aT88Doxmc9T5mgCoj9eu35oxN3h05bf4/h5kN77JHL6eiK5op
h3Xb2ql5Kaok5XZ1R4ZSbc6DhTY8xtsmfBkR7wZwPkmpXyXU9H4FTQXqib55VyXA
q5NZy4f9SyI9MoQnUgLHSiijyH5mQA==
=N3h7
-----END PGP SIGNATURE-----

--c/fvPxmf2qWNcw9j--

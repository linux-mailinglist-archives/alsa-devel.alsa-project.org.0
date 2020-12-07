Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE712D1098
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 13:33:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E09CF1737;
	Mon,  7 Dec 2020 13:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E09CF1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607344407;
	bh=ulIWSf4fu0+15UAYDWnox9feOF++im/0KyFh/WPgyL8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bMcCxeB6/uLlVPFB7zyBjeYNg9Qc7uq63IfHolscgFnP5oI8YvmD+CRHH1tcjDB2K
	 s/708NKUODtISdD8S+xhbi4jQQsg7Oby208093kpWPiNuLYm8XPFto8LnXlWAKyRZu
	 kN9QrVJX/IavBCPCTCBIcFkM48bc3ntBMYqdSUdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5A94F8010A;
	Mon,  7 Dec 2020 13:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D04BF8020D; Mon,  7 Dec 2020 13:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4CEDF8010A
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 13:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CEDF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WGKKjDz4"
Date: Mon, 7 Dec 2020 12:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607344298;
 bh=ulIWSf4fu0+15UAYDWnox9feOF++im/0KyFh/WPgyL8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGKKjDz4bvE/H1goWqMdH74Vdm9C+N+78Q8HLgaCX+L91VkwYRKARNpCtSkM4H74M
 jh/DtsrNfJXeZUF/RUbvq+/GQdVFD7QaqjP2zUSS2DOJkweCqBbXw8WlBtZVMKmewn
 F5p4h6Vs0Bi6qhRvxOeOHjwWMvdR7R5mWiWI7r/T4dKqMOzVQS6NIEbdAC4mbwEqHs
 4afPuls5Efdf/ngfEa2IZKA3v8MKCHHVo42X7+9INGwtzvirwsJ0KM8o5q7LK9A1yC
 cvMwvje+8xslOTIhZ1C9WuPwggAPp596Szi2RWi6g5QVts/R1pqQTZhKVjU3UgN/q2
 eIgGqsCrdkEJA==
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
Message-ID: <20201207123131.GB5694@sirena.org.uk>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
X-Cookie: Absinthe makes the tart grow fonder.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com
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


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 07, 2020 at 10:22:38AM +0530, Sameer Pujar wrote:

> > [1/3] ASoC: dt-bindings: tegra: Add graph bindings
> >        (no commit info)
> > [2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
> >        (no commit info)
> > [3/3] ASoC: tegra: Add audio graph based card driver
> >        (no commit info)

> I don't see above patches in linux-next yet. Should I wait some more time
> for this to appear?

No, this was sent by a b4 bug - notice the "no commit info" there, they
weren't applied.

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/OIKMACgkQJNaLcl1U
h9Bergf/R2n7B5AV+c3qA138O8l+XMSdm7bZ8noJM7ZoaPj/A1jX9Br56e38tOjq
QfofOwv/rAGQG82FVgB9rPGHZRFzz3kvQwb35JO1eQV+TLbSOnGkYFpC28buXymj
SGYm9ncc7OeN30WV4e3NymMTcOFe8ggwR05zMzc6amXV2163NQl1sN64tlkKbFSA
yAcctZJeDD5B3TlcILu+yZp5SidHHV7gdk57QDd+A3Ut6sggbj9EBcQamZsKUmkJ
LwQPdeqesq/WJqs33a3sFL1xDXMLwISR7isCX/6CRO1cd6evcivRf+Wmcgr7k0MJ
6yR+VP1OIr+ecpxbGAm4CMYD++Cntw==
=r0dO
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

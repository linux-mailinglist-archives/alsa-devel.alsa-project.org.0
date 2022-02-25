Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7BF4C4E45
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:05:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD5F1949;
	Fri, 25 Feb 2022 20:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD5F1949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645815915;
	bh=FGWX3tQZnONYjuyTlSiJH7HJYvm5zOr5BDZ3J1C2Wes=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oekXLfC2M5dzT9u9tKnXssfFa09brCpq4K6ypUADtOe/hdGj+qbmue+hSvMscHOHG
	 dFuNA9bpB9EOqjfxtDylLzB0ee1fVOm3y/IeCSUAP6WuiX7+QiaL6iiXRoGPbbShO1
	 KZZ0eXLcAzh0hZj6niu/ZLccz7zq75sj42W6fS2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB2EF80159;
	Fri, 25 Feb 2022 20:04:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 505EEF80132; Fri, 25 Feb 2022 20:04:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E886F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E886F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dj2vm/bN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7100AB83302;
 Fri, 25 Feb 2022 19:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30B1C340EF;
 Fri, 25 Feb 2022 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645815842;
 bh=FGWX3tQZnONYjuyTlSiJH7HJYvm5zOr5BDZ3J1C2Wes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dj2vm/bN8/N3qyj/MzHC90dNLqhySp1xFAMpQ6QerZyaQ9pYEDE/iNolqnQmxLWTr
 ExJRIHEvC+BTFSU/sdUngmmUcAugcnk3ITDvzeMcscGXTfrIJC4kT0XiBH2i6f1PVa
 7FH18zczyJS5BVH4esgd65zDkFxylrUpsuWyvTpdXtd6a58VlhG04NE1NdzpjYBisb
 DDaeC/IxB8CZMykaEMcT2FakrtTPAvGf/R7TskUtiWW8IvLtbiOBWUVMuH9svEXTxm
 ychUkEyzrWCbrFNKhJbCoIpOaJ5LSV2sc4QKy+Pdmza/4saMDFbmXcI5Dfa96b4ln/
 brYFOW/WJ9GVg==
Date: Fri, 25 Feb 2022 19:03:56 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/9] ASoC: amd: vg: fix for pm resume callback
 sequence
Message-ID: <YhkoHJKRuD/ZIM5+@sirena.org.uk>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
 <164570533555.1194769.3668536221336070255.b4-ty@kernel.org>
 <d4b3f072-198b-0656-0b0c-134ccbac0d58@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MYKvWGQhoA7WrGZ+"
Content-Disposition: inline
In-Reply-To: <d4b3f072-198b-0656-0b0c-134ccbac0d58@amd.com>
X-Cookie: I smell a wumpus.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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


--MYKvWGQhoA7WrGZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 26, 2022 at 12:02:53AM +0530, Mukunda,Vijendar wrote:
> On 2/24/22 5:52 PM, Mark Brown wrote:

> > [1/9] ASoC: amd: vg: fix for pm resume callback sequence
> >       (no commit info)

> This patch hasn't been applied to tree.
> Should I re-send the patch ?

There were some issues reported by 0day that should be fixed but yes,
please resend with those fixed.

--MYKvWGQhoA7WrGZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIZKBsACgkQJNaLcl1U
h9CaWwf+JhRhuK7lBTxTjMMpjUpDrVmgxMex8heMiXlRwpYaIR2zc6qmT/1EowKh
40mD7/EYjgXkVgyOCL0+uO2f/QbbJioJEEWgA5h6AorB+v+cFMXGF1rSb55St/1a
grQm5GUlzBTz0vhod/yMBd2YcCqn8pttKdFYsduAU6WTCc4Y/VDPqVaVZZab8AH+
j+tAl78QAcpWg49fiG+T6OTPXaxway/fGehaoY0U/ZpZXLOvfC15HLldgSKS/t5K
ZJVa/0KB4DJCGNIbQtgONHNob9WuHfbwnWH7ilEMVgvO4Krr0JrmJCrWn6A8HXos
Q2II9wSxh/R/7V2x+PC5pc1wv8ww3g==
=OrUe
-----END PGP SIGNATURE-----

--MYKvWGQhoA7WrGZ+--

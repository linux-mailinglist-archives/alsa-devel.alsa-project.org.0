Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CB47EF55
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 15:04:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82F0117DE;
	Fri, 24 Dec 2021 15:03:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82F0117DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640354687;
	bh=hK8fa6cRDsrkwlVMrS+4FGDDSpxP5rBcfnLDIk/SbPw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrBfCbsMjuIMsPl0rGt7TnOHIG8EgWUKmoK8yqV0rHxCWGrUFlf626CGsyyjtjVd4
	 Z7FMhPlb0uO4EHjg7b4xTlBF7IV0udDXzDcBFH8Hwt7FWpf9iNmfqKmHgmal2fETla
	 S29RGG5QzNFA0xWile3riouZw74o7sley08mkz8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DECDAF8013F;
	Fri, 24 Dec 2021 15:03:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92783F800FF; Fri, 24 Dec 2021 15:03:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C28EF80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 15:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C28EF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tdcvfeu/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C23CB81082;
 Fri, 24 Dec 2021 14:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC10C36AE5;
 Fri, 24 Dec 2021 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640354608;
 bh=hK8fa6cRDsrkwlVMrS+4FGDDSpxP5rBcfnLDIk/SbPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tdcvfeu/Y8443O7Qo0NIPTGPDJ+a4youRSBm2Rt/vUafDTiLRt4mzanIMMHOe6xHQ
 GHx7+z2RaJ6fUn0kfem6sFdywW57uCgzbdXcdJkgus0N/gJK0lAT7YYZwYWgi7gM+1
 bXKt/j1hjrq95ZjIjXUGE7A7vA5uoCxLcw1ISrRgwviLwpkjQvPa9kh8NjTK7uoVUH
 YQOpXe9pFKkNgeSAxvCEuP5SVlEnSHMr8VcR8zSjB9vApMX6+29PgRVw2eD5u7k8FT
 bpC2OxHFN+ubra88C3YzDGQh+I3zoR5LY3wQFmqrShRcdFogmNuQF8roMO6+HTtWZZ
 IIC8dhL24vL9A==
Date: Fri, 24 Dec 2021 14:03:21 +0000
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] sound:soc:remove unneeded variable
Message-ID: <YcXTKTREgewfX9bJ@sirena.org.uk>
References: <20211209015707.409870-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dlC+KfgP4Eal8+6F"
Content-Disposition: inline
In-Reply-To: <20211209015707.409870-1-chi.minghao@zte.com.cn>
X-Cookie: Time and tide wait for no man.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 srivasam@codeaurora.org, lkp@intel.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, chi.minghao@zte.com.cn,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, pulehui@huawei.com,
 Zeal Robot <zealci@zte.com.cm>, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


--dlC+KfgP4Eal8+6F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 01:57:07AM +0000, cgel.zte@gmail.com wrote:
> From: chiminghao <chi.minghao@zte.com.cn>
>=20
> return value form directly instead of
> taking this in another redundant variable.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dlC+KfgP4Eal8+6F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHF0ygACgkQJNaLcl1U
h9CixAf/ZcaKYZRi/L5ncPwFD6FR1S3oma/laZ5y3FcRBOYoQz2SRTi9MncvcNeN
L5dzc8qwJU+Q8jYXKyAK6UAni4gaQnqDlnCGX8Nya6mR5gV9aFD4G6zjZjf46ZGy
JL7k1tlD9+B1eIa1EkyDU/SuD/I6tr0eRI3cTNIymZPu89Zl92gC4LJ6nlzh5mRy
PD9lqLR5vYA6OD+iWpKm2S/sCU8oG6wh6AdAleVY9pYrvRV9djrHa2jNqPYvNPpY
j+p4sQLaz02BPGQrZPO0Y7GvuWJeB5L21jxiQ3de29tLao2rB+XaLad47cQXtsSf
GE4aVlkQeVEn5N7G6vAQjTsYS5Mczw==
=41gK
-----END PGP SIGNATURE-----

--dlC+KfgP4Eal8+6F--

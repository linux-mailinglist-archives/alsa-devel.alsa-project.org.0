Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F537A4E8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 12:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35CB17B7;
	Tue, 11 May 2021 12:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35CB17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620729997;
	bh=i1DOv+Mhp1oNF7Zq3P1l8wWaBsd1kPSHQTK219dAcnw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaxv6FNKbPRFZAzOlpW07UtFcrBCvjnp/p7OIxiJRgyJAlxr/7+rJO7jW/8CH3kn5
	 Dz1WeJhJgzGoCy4t0599LSDN4QI4Mt3nDaE4aMTE7AErfk9Ler3rRc8NVefF/1q9to
	 zUAfU/GzZEYuNtDBnkEu67WUxGqLZzs4qpJQx1Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4405AF8016B;
	Tue, 11 May 2021 12:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62BC1F80163; Tue, 11 May 2021 12:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03468F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 12:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03468F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E0GsHKLL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A4086192C;
 Tue, 11 May 2021 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620729897;
 bh=i1DOv+Mhp1oNF7Zq3P1l8wWaBsd1kPSHQTK219dAcnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0GsHKLLlQx+/HUuLdFc1RvnZeibnrPhC7WcsWBOq2nQwnNyLzhWY+2dSbvJf70gC
 hsKVPZeASAf3QEDwkCHcwxbeTymtUD/fZUinN5Ds4syAuN5cBkT017W4RugxvrEfPi
 DGfvrwm4OkOb69nuOxzw8dtYY/ka1iVzVyM52/8HXWmf1C+CWxYRowp5XqqRr9J2fu
 z1MXCvU8uKASM+gzSPPZwE2aqM6BxlnqvPcC4a4OE1/u/RM0x1GbgOmKH5JSbRRWYy
 +YJcS90HBtI42oRM9ADZ+aFHNvLe5TA5nBXkjE7SRR/rTimzyPhgyhdT0xkRZ/kNrD
 YMM3YvEiTNHAw==
Date: Tue, 11 May 2021 11:44:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire/ASoC: add leading zeroes in peripheral device
 name
Message-ID: <20210511104418.GG4496@sirena.org.uk>
References: <20210511060137.29856-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline
In-Reply-To: <20210511060137.29856-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, vkoul@kernel.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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


--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 02:01:37PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> We recently added leading zeroes in dev_dbg() messages but forgot to
> do the same for the peripheral device name. Adding leading zeroes
> makes it easier to read manufacturer ID and part ID, e.g.:

Acked-by: Mark Brown <broonie@kernel.org>

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCaYAEACgkQJNaLcl1U
h9A9PQf9GxmcPe+vgFlr6JcfKL+2qC5EWADMO0W7l0JTdMEuY58BRW3fwbqm2bFu
XuGRzHr1ChlW6Ths1ZbKq3xxJur8/qxXUIIS3CzNSNc5H1QeJmILZppQL7DipvHo
bFnituIXXR4Aa2imqG6Zcogp5eDurHVjF8vTfPZNaJySnkUJLasVDsivh3YhZPP3
7cJVoAC/tV7jRaVZvljyX7QTH9lO+3ymSnAqCyp8lUORuVPbzYU90YGYwkbPBTAw
99f8ddtC2Ih22bKl/XOJI5EHykwrW2/TWpfH9PpRQ3oWILTlF5+5GaI4N5rIaBrm
4Fs1DWR5MScqBVNZQAzy2zxR/wjqiw==
=2b/5
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--

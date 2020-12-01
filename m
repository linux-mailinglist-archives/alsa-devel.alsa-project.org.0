Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0408D2CA1E1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 12:57:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70642174F;
	Tue,  1 Dec 2020 12:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70642174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606823820;
	bh=UXTodn20vM340ET6hxCExdQHpdca76oa7j/yUKECCdA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZHfEKtZxqMUn7F2qf2URaN8gKTliyleAPu1VhuNwTIAD3esmdrP6uKRpRCs97aiv
	 nnPba9ou08HDqrOI9QG5ZL7Jh0IFTgpgg9UUNRhmiUABCPR1qpYwsixCevlR/zQ6YP
	 Bp49lmVSL2k9q+HMTWCKZSlTNcTNVZ9xaIhril9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 907ECF80254;
	Tue,  1 Dec 2020 12:55:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91435F8016D; Tue,  1 Dec 2020 12:55:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15EFF80158
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 12:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15EFF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XqE9vgq/"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1695320770;
 Tue,  1 Dec 2020 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606823711;
 bh=UXTodn20vM340ET6hxCExdQHpdca76oa7j/yUKECCdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqE9vgq/wcYIFSfm8Ip9dxz93DKxhJIfFjYBdC3vhTJndwV3HIASRIG0SD+zHMT7+
 AjlIGO9Qkfcs2qn8O8GSGH+Scv9dUnn3Je2t2RANf8/Yzk/8PUsjy9pvHoHA3E/i0x
 kt3h8LJy/507OzFiOMBSS7ho/6YqMvvrFGUQZiCI=
Date: Tue, 1 Dec 2020 11:54:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 2/5] regmap/SoundWire: sdw: add support for SoundWire
 1.2 MBQ
Message-ID: <20201201115442.GA5239@sirena.org.uk>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
 <20201130144020.19757-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20201130144020.19757-3-yung-chuan.liao@linux.intel.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, vkoul@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2020 at 10:40:17PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The SoundWire 1.1 specification only allowed for reads and writes of
> bytes. The SoundWire 1.2 specification adds a new capability to
> transfer "Multi-Byte Quantities" (MBQ) across the bus. The transfers
> still happens one-byte-at-a-time, but the update is atomic.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GLwEACgkQJNaLcl1U
h9A7LQf8C0cXx47sMtn4yjZCjODupEpGS4PJHRdbPVB7s0rRyQQLboBoL+HFcZF0
CWnUBsnOZozy5gLNZw8X/kxCYmxyeReAHyHa2LP2GaP8KDfw0mWfDFRAewsnjMLq
2Ip6nyo3BdNs0V1p9OnlfJFwwUgzrS1x3iep1giFQ7E/6vTDyRatYbgyVaIhbDaW
gG1MvJr5JhpC96EryoKYQom+ed3dWFjCgSZDc6gUQ9aDXPw8/sscDFnzfN2ZW7ZX
W26nbEc7tKU1SLnh9LSevxZk/zE3k5LVNx86fgsd4CbJ6du7BB5tHiEV+Iy8+tFA
HVXqBlYg5rObHac/Y2NtasWW5uNHfQ==
=3cHO
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

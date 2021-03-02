Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB145329F17
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 13:46:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5512616E9;
	Tue,  2 Mar 2021 13:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5512616E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614689181;
	bh=MRUH84/DjXayEDduSRCfeYm7nkt8wSOG6x7wj5e0Oik=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cu90lc6N8/RFPlZC96LRRqaSPj2a+t7rOi8WFvLXHh/huUrbyCHjVdcLbJlCXfHVv
	 W0PC7aTJ3mR36NWqYM1JQWMPcfP/+dse6ewPTwnUImgP/RjgZicRFgJ+vgW5AJ6R8c
	 FZrYZkEMqbDDeVVCf+H0oqJS2k6WL9yQ10nHOlH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B675BF80227;
	Tue,  2 Mar 2021 13:44:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31659F80269; Tue,  2 Mar 2021 13:44:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B020BF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 13:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B020BF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pjLixKXe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 243AF61606;
 Tue,  2 Mar 2021 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614689084;
 bh=MRUH84/DjXayEDduSRCfeYm7nkt8wSOG6x7wj5e0Oik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pjLixKXeCm9gZrPwfeo1xaKpDZ6hlL0WJL1Dn7naVdvmRXzwhShtEK8GfI+5bdbYB
 WnolIFaJOT9oYpkBx1IS6XE9tQP7Rl7nVRf+KEW2WSI3IDc+GUmfkWv8kA9+IOulTy
 sCDl+vs0SvL0AvBuVVQXfb+KworxLo79fZq/GXGR8HF0eAYrXJKUxfSoU92vXiZuMs
 JeqeDIQLIqzp6FbMhkp+iMq2pY0Rptc7NejFB2TTTLe+/1/CyzoiHunKYWvdFtKBzW
 Ij6+WFpKRxwm2jhp0bFWyfDUmHHLIHe1rHkOlz51mfR7zWHyk3lM6KC9hWPXqoaZ38
 el89sVjgKpq2w==
Date: Tue, 2 Mar 2021 12:43:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
Message-ID: <20210302124338.GB4522@sirena.org.uk>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, vkoul@kernel.org, arnd@arndb.de
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


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 06:31:18PM -0600, Pierre-Louis Bossart wrote:
> In January, Intel kbuild bot and Arnd Bergmann reported multiple
> issues with randconfig. This patchset builds on Arnd's suggestions to

Acked-by: Mark Brown <broonie@kernel.org>

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+MvkACgkQJNaLcl1U
h9BTAAf/QN6BOaPFMrUENBiCv9ms6IJC+dN5symXrL4r640Tqc9X3EjpvQDAFfDc
ku/CuHtWYWrpLmMG0ixtG+Nk62xI6Af8o6OhEtD4ul10YbwPPR13dX21o6iAL8Hz
uYaKFLxXTOTZy5dDgZaLUohkbftubYXiXxxb1cw51RzHkZNSUXo7HjdrmoOdMJ06
BODhU1qMCRlwFOXHTgbyyRp+IFc5qcSxpk+3M257VZL2LHnrDrIGsHCu3YhPsmdd
py+0pcZmWlXUMX2F6/9USci19/iuiTaGf1tBnBqnoX6MPJ5wgeOfnGqGmwf9s+eP
tln+BkyBvLVpgYGk+U32vfXoAdUYGg==
=BsL4
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--

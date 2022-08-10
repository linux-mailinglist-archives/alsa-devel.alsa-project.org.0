Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90C58ED9A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 15:51:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C8EA857;
	Wed, 10 Aug 2022 15:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C8EA857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660139477;
	bh=HFiCWY24vHA6gAIoM9LvCikWbleOBSOBbAj6d3rUP6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGLJ8RENr+l+o3rTLN7XiMljX/mzsnOAc3UJ7D0mq6CrL1+M2nwwOM/eDceHyx/0v
	 AVQVr0MTZ2H8+kI7h26WqPFF7jf1cYdSL94IHb1xb1534J4LPhSrPL/CGW+TB3aMBu
	 52tlVgbbjK+tSqD1IDYVr/+IkKn2bw1fEbUwE+J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C95F80240;
	Wed, 10 Aug 2022 15:50:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A227F800FB; Wed, 10 Aug 2022 15:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2363CF800FB
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 15:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2363CF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q0V5q/3X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AEC46142C;
 Wed, 10 Aug 2022 13:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D7FC433D6;
 Wed, 10 Aug 2022 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660139411;
 bh=HFiCWY24vHA6gAIoM9LvCikWbleOBSOBbAj6d3rUP6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q0V5q/3XLp3BlxT3sMvY0Nc5le1bNxYgptk8qWoS8vuvyMm0UavEC+sfNYN4gHB4B
 j4uWhFsNwWbmERxOJzMP46L+UYglTGBTKfkexfnXPyTNZg4ZQWDanapJdMz/qemqZp
 n+bZU1bSbKhMaZJVQ37Rec88JqhJ6xdMOYhzy6B7oQsEElCBQWwJkOiAnWOP3UmvT4
 AJSlJaOOCG6/pz5BqGOZ8/YuK/k78qOGa28JZcg5EALy0ZmUsbc1Imd4vlc9rQ/2UN
 aBz5J88Ze4p8C8LSnIgKxM8GZ+KKeBKuBi6jsT5QC73qWpCjtN2noJ7kmyBvfd4dCc
 zgXnN8TPiLnwg==
Date: Wed, 10 Aug 2022 14:50:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Simplify clk_get() usage
Message-ID: <YvO3ip3LPw2QhADB@sirena.org.uk>
References: <55e59c4792d64ff6336fcaa85ec15590553e9d63.1659903516.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8f7/N4iM6yxDc5OG"
Content-Disposition: inline
In-Reply-To: <55e59c4792d64ff6336fcaa85ec15590553e9d63.1659903516.git.christophe.jaillet@wanadoo.fr>
X-Cookie: First pull up, then pull down.
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sriram Periyasamy <sriramx.periyasamy@intel.com>, linux-kernel@vger.kernel.org
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


--8f7/N4iM6yxDc5OG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 07, 2022 at 10:18:54PM +0200, Christophe JAILLET wrote:
> If clk_get() returns -ENOENT, there is no need to defer the driver, -ENOENT
> will be returned the same for each retries.
> So, return the error code directly instead of -EPROBE_DEFER.

Are you *sure* that this is the case on Intel platforms where we don't
have a full firmware description for clocks and therefore can't identify
cases where we expect a clock to at some point to become available.

--8f7/N4iM6yxDc5OG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzt4kACgkQJNaLcl1U
h9CnPAf+JlNwgdYGY4MFDqefm1yqyuquLmEMVZPRqXlVvL9fv6ZEmm0uO+qzFLxo
dtb3FM4z4O+JKX4LZyWC1h+PpOVDJuAvLZlSRlgGg69J/tUxlRSFNgdVgPIlOSYg
COvC+whBTH2YI1fQ0lxMQznUs+HJ2OEAU4we794TmenrkSf+xiExyWu8XQ/4ncwi
LmUdCP1+uvy1qz5b+NJx+EizRT3ywpk1qvjIcInGVA1ztx1Fh4EXz5OXNQFUqGK4
5sx0ixFWxjuuS0mZvDJHFW8mZpiMkhf10lE8HfhIrrDA07beSZKcPRSVsAnFPyKK
PT7th+4gOUAw7tgszFTRTLj1r3XADA==
=rC/L
-----END PGP SIGNATURE-----

--8f7/N4iM6yxDc5OG--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB620B451
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jun 2020 17:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC1A168F;
	Fri, 26 Jun 2020 17:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC1A168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593184694;
	bh=GuoB/W+zvtjdbgZiBd3AqIE7OXS5XW+E8sUCRKZw5DU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQh8L16QiNWPH3SqDuky0l7iyXYrD7gqoYLVxrmliFu3X7ToCV2nUgbsgkuixO6PV
	 rKsitmGj65RojgQq3mwCJGJwW6mwg7x95WcJMsaqEaW+xbvbo69h4IFU+Dv3ZCDAuw
	 cbQ23h+N/3o2Dx/r4Vy4PqDe3TPce+NLLf8zoJmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B716F800F1;
	Fri, 26 Jun 2020 17:16:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52F13F8015B; Fri, 26 Jun 2020 17:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A556FF80096
 for <alsa-devel@alsa-project.org>; Fri, 26 Jun 2020 17:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A556FF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0rj3Zx26"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BD3C20702;
 Fri, 26 Jun 2020 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593184584;
 bh=GuoB/W+zvtjdbgZiBd3AqIE7OXS5XW+E8sUCRKZw5DU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0rj3Zx26/fdablCW5niVQmxceFaGulmb7z2Ct6UgE3YyXdqSuu5vBcIzmz9l6V3+T
 0SNLFck/i55yd79ZffcefR/6fsji1Xdn9D2+EjSZX5cVAY9PXDi8dGqUjBKH2AGri/
 9OxXuZJVfq6Qk8n8bSyVin43Y6zoT8DXDX1bWuR0=
Date: Fri, 26 Jun 2020 16:16:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 16/17] ASoC: Intel: sdw_max98373: add card_late_probe
 support
Message-ID: <20200626151622.GG5289@sirena.org.uk>
References: <20200625192652.4365-1-pierre-louis.bossart@linux.intel.com>
 <20200626143732.GA34281@sirena.org.uk>
 <2ca5ecb6-8827-458a-4db2-4232818a6841@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline
In-Reply-To: <2ca5ecb6-8827-458a-4db2-4232818a6841@linux.intel.com>
X-Cookie: You can't get there from here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>
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


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2020 at 09:52:41AM -0500, Pierre-Louis Bossart wrote:
> On 6/26/20 9:37 AM, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Not sure what happened here, I always apply the patches on your latest
> branch in a separate tree, then re-extract them and recheck. maybe an email
> glitch, SMTP was behaving yesterday?

You didn't thread a bunch of patches in your series yesterday, if there
were dependencies within the series they may have been disrupted.

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72EUUACgkQJNaLcl1U
h9B+Zgf+Jb+voLJdj8AM1qYyDEY/xmchy6nXHZgBYi8LxCT/xsemWrgQb9aBNApo
E2f3WG7Lx9EAs6VEhk9G1uNjNy9fydovaIMSFYkytPVyENOwzo3p6hcbZhgbvXom
1yavcKpZTEhe4kxFNA7954WZPKudcp0NaI0mweI83D1NQ2PLV+QHsv3Dfd3ErCXo
XAEkx6OutUG2MmqzcvtgvQ8T1GiidZsArIpX03Xe7mBpuIUTO5X4VA9lkyvFNS+R
BPGhTagNzUspYu3dQutxsEZPHv2hNCRa2qJCd9DGehnKbzl9PfiJHorXK7nT85A5
j8KBGEjN8sZgncV+Un2mWjNBAqbDNA==
=P6aE
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--

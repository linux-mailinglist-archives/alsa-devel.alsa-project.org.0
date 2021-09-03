Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 906103FFE34
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 12:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B8CD17E7;
	Fri,  3 Sep 2021 12:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B8CD17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630664993;
	bh=ALG3HBZ9tMQQ6qp3LSaDocNel4wVrD8EJq5572zXA88=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkvdtDwMwB/70foDSrApBn5l4G9mTsyGo3b+kYAoCTUOgt6lU22zdrA+tYe8szKSY
	 XzPEYayN2dy99UBTUdRaQIEvFsT9qbbWhfveSijUQaKMBE/peooGSTummehCQCnxyl
	 b6wnZZbVHGkk8aqRTH9UGQTRVQNUSN49YJiDpGtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E68F8020D;
	Fri,  3 Sep 2021 12:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25B94F80254; Fri,  3 Sep 2021 12:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04926F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04926F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U5uCWSMT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0A9F60F42;
 Fri,  3 Sep 2021 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630664891;
 bh=ALG3HBZ9tMQQ6qp3LSaDocNel4wVrD8EJq5572zXA88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5uCWSMTuLZKnKr3JueXqz5npeRN/+ZOf3V533ybH4gOlXF1Y0jVY8wwL//GJ8PGZ
 ngu5lPk7yfnl7JPeIji789+vVpbLNweKtHrzJdvHpe5aFdxgwVy9Z392lUjiN3JTY+
 /zE8YTn08AkW0YgKvPHeCI5igSRlsoxv7Padu+5pTdQRdzaJ7+f3ZK8PFfNpla43TQ
 3K6yO3zPfxX8fNQ186yYGmBvFsW1YwlmfPurwH3hsp9KyjR8GMtp7DLAaT/aq7XrBK
 jVc+PL4ehUksCkuhNrI3icy0TGfATyMXcmGz62ZCtqnjM9NgBfajjWk0sdY3wPjli5
 Hy6zeHzLFWgeQ==
Date: Fri, 3 Sep 2021 11:27:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH for-5.15 v3] ASoC: Intel: boards: Fix
 CONFIG_SND_SOC_SDW_MOCKUP select
Message-ID: <20210903102738.GB4932@sirena.org.uk>
References: <20210802212409.3207648-1-nathan@kernel.org>
 <20210902181217.2958966-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline
In-Reply-To: <20210902181217.2958966-1-nathan@kernel.org>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 02, 2021 at 11:12:18AM -0700, Nathan Chancellor wrote:
> When CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH is enabled without
> CONFIG_EXPERT, there is a Kconfig warning about unmet dependencies:

To repeat what I already said in this thread: the reason this will have
got buried last time is that you sent the prior version in reply to an
old thread.  This new version has also been sent in reply to an old
thread which almost had the same effect.  Please stop doing that, and
also please pay attention to feedback.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEx+JkACgkQJNaLcl1U
h9Darwf/dMsP3sJkQI3zmuNnqYAH3Su2md52c3Q8zXiu6wWBT0JpJknJxExFVYFU
mpeCrDO3SsDPVkp+96ou9pIsEEtFY+cFb3bjI/jw3OLfM58bhuJHa9RmK6ysgGDy
3MM5VbZ0qKNMVEHJxSZvvPTFIWTg8ka07H77y7wzhAmByKEnRxMcRHoz/rGkp9dA
3Bv2o9gXcNTeIV+pi/f7rPvqPOhFmcgEtDfwVfG+xroYbVA6Qc9kmuOiq0tOgr1q
2a0g4/zmlo+iGdA/O0+vXZpvH3a+pPKBW34td9d/J5BDZjn7SFevEcJiDGfinlOb
4KJpG9My+1VJxwp/YXclvV8JER8sAQ==
=KVUM
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--

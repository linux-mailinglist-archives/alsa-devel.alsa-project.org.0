Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15132A342
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 16:06:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D7AA1741;
	Tue,  2 Mar 2021 16:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D7AA1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614697586;
	bh=D2cyfvpUXUio94bxcdjhiNolTKjbUbMLkqgoVoxYUU8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvArcN1+boEATE0VkUiT6cRoISlQ33q1TnSYb4kn9f1wBmeolJc8n3fUgK29aB2sq
	 JOmRyjB+4bKR/hGzwuUA+B3+gFSYJeYHCDy/PegP04uoEAfDN3VdyJWg+Hp17QEC0M
	 2lROEmh9T+dVt75mSMLiOfEx57o/2E46rR0gxn/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FFA4F80227;
	Tue,  2 Mar 2021 16:04:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B7EAF80269; Tue,  2 Mar 2021 16:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C011DF8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 16:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C011DF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SU6siTkK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DF5264F2D;
 Tue,  2 Mar 2021 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614697484;
 bh=D2cyfvpUXUio94bxcdjhiNolTKjbUbMLkqgoVoxYUU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SU6siTkKaDvEiITAmmEA/unDR2nsnlqcHHTEea8ZxBdlIhh1+RI3MzkIc84uVQuum
 0vEaWJk4bnG1oRANxTbU8hXLsu7KU9VYRGkcay6BA2J9GcgrLHgQTjFymtyKx+JEbp
 8/7QkKFs+deB2ZvunNWy2fWBKwS00f6E+QnppWk11ELEBuf4CmzSpW40t7UqlqUSj/
 wli2/aVo25XCa2xyvek7piMXyF+cP8WotrDR1P0IflIWTuUOzmlCjOnIhKT1WraHiC
 6FYle8NsXKBLKTFjrCStKPQkzn8TZG5vAo8UarPr6ck4NDQ8PO0K7IKdrAisaCDENB
 NYyuJVndZxIrg==
Date: Tue, 2 Mar 2021 15:03:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
Message-ID: <20210302150337.GG4522@sirena.org.uk>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <s5htuptfyae.wl-tiwai@suse.de> <YD5IChh6Xubim//Q@vkoul-mobl>
 <s5hk0qpfwfo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline
In-Reply-To: <s5hk0qpfwfo.wl-tiwai@suse.de>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vinod Koul <vkoul@kernel.org>, arnd@arndb.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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


--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 03:43:23PM +0100, Takashi Iwai wrote:

> Mark, Vinod, feel free to pull from:
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-sdw-kconfig/fixes

$ git pull git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-sdw-kconfig/fixes
fatal: Couldn't find remote ref tags/sound-sdw-kconfig/fixes

forgot to push?

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+U8gACgkQJNaLcl1U
h9BpSQf7BHcH4ngEsIq/LTn/F94J45+NCPy+a5j3TPP6kdCEl7llMjHpRb89tVxD
fpj6sHYtTVg0u8ZKunFPgvbdbaNhjG/64LLQzbxxX96NMMFd8tBKCgSCzklehE9K
OCsQ1DDRMRbEHW5DF9a40DrOMmtcwNOqgF27qxcyhnVgcCFSiG/u4hBGSzsSGv/5
WX4aseiCW7KH2KTA0mCANxju6HHX1oa6HJs+9nDG8UpDdaWSY4DqI2i66VFLcGGm
AXTl+eCQyobINi/x0wsNgPxLyc7yyQerPp46r3ZCwikjDK1vlMWWP6D4PdgfV1Ie
mLC88IrBSQZy6v0/+3+Qfl2Cliy6lQ==
=Ltk0
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--

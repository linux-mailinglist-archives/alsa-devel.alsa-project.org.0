Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 473723E4801
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 16:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF41165D;
	Mon,  9 Aug 2021 16:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF41165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628520865;
	bh=xV/SErFyYsqlSf589SZoN8qb7Gf4IrSNiG53m5VhWSs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNUOgJ4NPuU71QDh27zP5r8Pn+GSN8Hb0xh/lawQ50WB3CgX3kJ7OxFl+hsxjHpbE
	 FpVzLkm/j7uK3mWbJumKC2+iPpmEBoKOi3vk//k4Ou4eo2WJAB9zb49M7iwb6YqnM8
	 zhNWjO4bbdjC4szpA8GpEWEpJYUJGOrrmL2j3YkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B124F8032D;
	Mon,  9 Aug 2021 16:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 413B0F802D2; Mon,  9 Aug 2021 16:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBEC1F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 16:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBEC1F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AgM/eB4D"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 021496101D;
 Mon,  9 Aug 2021 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628520767;
 bh=xV/SErFyYsqlSf589SZoN8qb7Gf4IrSNiG53m5VhWSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AgM/eB4DEZPfF3dnR/x1sTluxCzwbIhyWqLWyQZPr1IjMuAW+lJrvRTfalxNhm6J1
 EnH4R5C6COcvF2WrF4lLCua1zu4s0umSkr74I9P9pjgUqlc8rE7XoAjNiG002sAqOu
 8sHIfvXWG+b8h+yRGyA3boJK4Z5Fm7MlB72uZ9DRudoNCYi0VvLTZmz81MdgnQ8TRH
 pLNUE3F3Qd2m5K/LwS/m9DNFKpChKOJMjMwIEoihA1v2B1WzGcmD7S5C2O+nGzvJ2k
 i8L05O81soj4SHPu/7hZaqDoTbuRLfFeMmALLoVAVn0lu4X/k7WfhXSEspqC+Gcwr0
 TcfBqcLGx4sdg==
Date: Mon, 9 Aug 2021 15:52:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
Message-ID: <20210809145230.GD4866@sirena.org.uk>
References: <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
 <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
 <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
 <YQ07BVDyPD1Vb4R8@matsya>
 <a40644ba-bee7-0fc2-93e5-b1746ecda938@linux.intel.com>
 <YRCozWNtypjnTp0b@matsya> <s5hy29bnkqh.wl-tiwai@suse.de>
 <acef4e19-dd85-a079-341b-4b26b45c8efb@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <acef4e19-dd85-a079-341b-4b26b45c8efb@linux.intel.com>
X-Cookie: Flattery will get you everywhere.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Liao, Bard" <bard.liao@intel.com>
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


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 09:26:51AM -0500, Pierre-Louis Bossart wrote:

> >>> For Intel machine drivers, all BE dailinks use
> >>> .no_pcm = 1 (explicit setting)
> >>> .nonatomic = 0 (implicit).
> >>
> >> that was my question, how is it implicit?
> >> Should be explicitly set, right?

> implicit behavior with C, if you don't set a field its value is zero...

Only for things declared static.

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmERQS0ACgkQJNaLcl1U
h9AfwAf/cw9Ibkn4vluExONfpHhoWeXmQekzly7luUYf0nbVVvFtonUpAeUsVEj4
WXeQhwnZ0jMEVrF2f+779AWKHnZyubzjh5L8hK+AoEUvU19pv4QRtWS5mDUF5QF+
FapDrxehDGyTQRlpRC9btMIli+xb4EhjR7GKiY9cK/gcL2ZhxZCaMkLLvyQ64BjC
WJWn2K71OoQV0ohMgLgAbM/bNV/5lDZZIF7uCVHic+kla9hm+dkEXJNU/3MFB6ed
w4QUSJANHI+IlUJSz5c+hOuQuOI8jPObdiKusjvqYKTEW4Y5pvWFC7AoNrVT4gvI
UuATlzLEptw+uBNwLf8zA6Ozid7pmg==
=GnTI
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--

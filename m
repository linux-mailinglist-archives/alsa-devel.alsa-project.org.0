Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ACD4DE049
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 18:51:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E111767;
	Fri, 18 Mar 2022 18:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E111767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647625876;
	bh=50PBucF3zO+C3He1MByP3a6uyE/52lCZgw6JQS8sX4A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6e2lfkdBtB20NfCxqzF3nSM5d0IXgX5O1Lm0Mxdwy6vCdSqf4VAjf1nJipir90aF
	 hOb56YGIZG5bFs0Y4OvsChXTs0fPaIpwf0FlvCuEBAFCkGtnwKa04vfEqzIpB8IdEP
	 vuUpxM5Ll9emA2XFInim8C/5rvgPvSM6HcYVOfLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECEEF80121;
	Fri, 18 Mar 2022 18:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD111F8026A; Fri, 18 Mar 2022 18:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EC39F80124;
 Fri, 18 Mar 2022 18:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC39F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JO8UvdXr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D716BB824F5;
 Fri, 18 Mar 2022 17:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC4BC340E8;
 Fri, 18 Mar 2022 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647625801;
 bh=50PBucF3zO+C3He1MByP3a6uyE/52lCZgw6JQS8sX4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JO8UvdXrx/8XikzNeZ+pN54l4wv2y7djZxlnhZIpaPqx6kj8TNRbkbyIWWeXJn/i8
 kWce4J3jhFEAW7jql5Kf3LyoBvkhNRlULRG8vqFIakfn+gW8NpeoN7WiREF7YvQgRm
 1Gfte7MltB9uzADqRjERDHkKTzvITfKh/iFV+var+Rq6zad0ciZH97vL9q4JrUWaPX
 PfSuwZD5mHT0YXFbQF5zlWgcozimU6vxtRGQcNhXpUXE8jj7cm75FJ+AwpPCDzAszA
 LKCMMYVBipb3VoVF/uceUBY5xC3ZrVz+hol3CCXHtj90hMnx9T/OW534TDnYJtCrmP
 dX0BdSVovhFRw==
Date: Fri, 18 Mar 2022 17:49:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
Message-ID: <YjTGQ7IAcoGKQDul@sirena.org.uk>
References: <20220318071233.GB29472@kili>
 <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
 <1049c2410500a3a9ed97f83b5e41e89a74102c96.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SQ2FmoRmZfuAitaO"
Content-Disposition: inline
In-Reply-To: <1049c2410500a3a9ed97f83b5e41e89a74102c96.camel@linux.intel.com>
X-Cookie: laser, n.:
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, sound-open-firmware@alsa-project.org
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


--SQ2FmoRmZfuAitaO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 09:14:55AM -0700, Ranjani Sridharan wrote:
> On Fri, 2022-03-18 at 09:42 -0500, Pierre-Louis Bossart wrote:

> > This part will be removed in follow-up patches, likely the reason
> > why=20
> > this problem was missed.

> Both these problems are address in the series I posted yesterday.
> Particularly patches 16 and 18.

OK, I've got that patch series queued already so I'll skip these for
now.

--SQ2FmoRmZfuAitaO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI0xkIACgkQJNaLcl1U
h9CCewf/WRBGQBF9JWbnRaHy34OpciHnqfuv18kO2kRjPVrteLbR+XxXlsRrtLCL
TXbdI+ICdc0pRtNoLO5dC4RQN2iAPhJ/mxlYa+uzuHBis/qO2Twd1hYNasdDG8VJ
Qx/9TtAkILApwH2YdV5grYvwe1+6EAEIHM8+Cg1lpyf6DZfhUtTiJwfKSso9k6/h
FlgdGYN3SHFva49ydIsCLjaMUa35Tw1egt4zJf7T9xMBYviAj2hTf2b4UShrbWVW
0k96nOTC5w0GNxnb8eA1JMtv2tXb3HjwsiC0R7muMwtn+ezHJfyAHj8cxvLBHPRL
nIN8QH3JeaivDCpaCQSTaR97W44COg==
=+Qia
-----END PGP SIGNATURE-----

--SQ2FmoRmZfuAitaO--

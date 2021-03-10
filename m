Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201D333DDA
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E551774;
	Wed, 10 Mar 2021 14:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E551774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615382779;
	bh=3YEROOanQFhwri64Wf39ydWpxMlU6FxhJmhx5ERcPxg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRwFGfelRTCrj3U768sUGzB3+cifGMCGjjLI/Xg0pbN3ZmScyJSLaZ95G0Ud7KYGj
	 RqN2bblasF8md+lqL3icb/AQ22VUagJWj1FIKXPPiEl9sS4tPG/5jHeMPfafvurML8
	 5ViVnJM5kCJ/tCeG3XMwg1hU1zQS5orZvdwicq0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CB4DF80217;
	Wed, 10 Mar 2021 14:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A91EF8020D; Wed, 10 Mar 2021 14:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE525F8016C
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE525F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PS8PlXwq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7886F64FF3;
 Wed, 10 Mar 2021 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615382716;
 bh=3YEROOanQFhwri64Wf39ydWpxMlU6FxhJmhx5ERcPxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PS8PlXwqn9tn4bLkN+PaIjd7KVPLlOCG0IC4NjGgEHDo0XXhnh6p26sOc4HfkTU4W
 hGemk5Ql/keQ/hMy251dQgRtHacmUvsWY08AYDmWq4MKcjEyllNTMQd86tpk+XsRqm
 NBArS2O79NvDKFbJVS9hVVhFhR4Oxe1E3TRXffunAcUyXJZNezV+nZj72/cfZB9p1c
 Am0MLIVH3iXRpwQPt9S0R+aB5UiWMOFf4ihAf2SY2Yr0YbEtJpj3LpwvFTj6wju0tG
 RgQduI//kqFx9ioCRTc0pZWg+v9z2icltjyaFSGVX9ZqWRCYQlYPFeH6yDCauB8CSF
 x0Yqo3QRSRWyQ==
Date: Wed, 10 Mar 2021 13:24:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH v2] ASoC: wm8960: Remove bitclk relax condition in
 wm8960_configure_sysclk
Message-ID: <20210310132404.GB4746@sirena.org.uk>
References: <1615341642-3797-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <1615341642-3797-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, patches@opensource.cirrus.com, gustavoars@kernel.org,
 tiwai@suse.com, daniel.baluta@nxp.com, linux-kernel@vger.kernel.org
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


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 10:00:42AM +0800, Shengjiu Wang wrote:

> changes in resend v2
> - Add acked-by Charles

Please don't resend for acks, it just makes for more noise.

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBIyHMACgkQJNaLcl1U
h9Bw0Qf/Yh9VvCk6GMlhz0L0JzyvLqDcnIIJ38Zv/dUcvEMq416SGcrsZzgT+gHK
uKdC2H6qJqAqP9Ko86isNFhesN0Ep5th+ymYthtsDtf3rme/b3purNQepuR8E27r
Y7AkyOj+GLo69WTwlYmvVZzEzJYMIzcuL0DOh0VURQsSp0q2wOPrFk7dOcAxYx8X
2EmSKwKR21pwnkWo/BQUmVmY/rNirii/m6n/1Ytj6flqnQz6HOHkksrMEYcPv4/V
ERQ4f73bpkyo+9ofh/14DYQ+mVcd4sz4gov8kE9lKMkG5jeFLwqurBx+nVUrBT1r
peHrYo1wWVkIftvHScO2FV/JdBt/Og==
=XEXn
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

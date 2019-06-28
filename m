Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA35A0DC
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 18:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FD501680;
	Fri, 28 Jun 2019 18:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FD501680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561739448;
	bh=h8TcNdT+tGL2AyaqBbdK6gTKP5iJIhnHSn2grljbsL0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfGzKE3jvHZh7+4Jspbi7/5NBYfpczkr5Pb0IG8xLHPhQLq37zydbUwUZx+6gqT9R
	 5/emu6MQnSvEpHB5vK1XdJooI0dRDcp/rMkfW33qdyGnW9PdykS+8PmFP3tG7U+mIN
	 tMH93N1pQj+EIjbgWKMvjRRLETj8EFYXySmvwdKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82BBCF8972F;
	Fri, 28 Jun 2019 18:28:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE805F896CB; Fri, 28 Jun 2019 18:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90957F80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90957F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="P3xnOTbN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fe2L8MimnvzMzBb8uCNFNyiJYjDWOeA661PwCyF0ndA=; b=P3xnOTbNoa/TWV3Pzo9qMUek3
 wa0k2e9/Brbur6u1orzHUYwWo6RLHYFeE2uLw/LVkkqXyoxVKtBltTQaO+TtBuXSKr01uHS4NgpSc
 SEWvIVY9nrxGxkzL+l7r/5Od4Ug2YR6hlqF3f5T+HJCG4XJ5OkxhkP4ey0pepBIwWJ0GQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hgtjO-00075J-R7; Fri, 28 Jun 2019 16:28:10 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1F003440046; Fri, 28 Jun 2019 11:52:30 +0100 (BST)
Date: Fri, 28 Jun 2019 11:52:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190628105229.GF5379@sirena.org.uk>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87sgsnfjge.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBnvfuZDbnvbmqAavh9DAbA_EeRc6OuH6OOiR1WB4zUrg@mail.gmail.com>
 <8761d853-2b3f-7b26-0073-05d0c3ce1362@linux.intel.com>
 <87d0iytqi8.wl-kuninori.morimoto.gx@renesas.com>
 <288441e7-eaa7-8005-4026-97c31125375b@linux.intel.com>
 <87blyirz3j.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87blyirz3j.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You need not be present to win.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Baluta <daniel.baluta@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, paul.olaru@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH v2 116/146] ASoC: sof: use modern dai_link
 style
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
Content-Type: multipart/mixed; boundary="===============6233075968095917821=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6233075968095917821==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
Content-Disposition: inline


--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2019 at 03:43:47PM +0900, Kuninori Morimoto wrote:

> Originally "Platform" component is for "DMA" transfer
> (But I'm not sure detail. It had been exist when I started to work for ALSA SoC...)
> But in many SoC, "CPU" component is doing it.
> Some SoC needs special "Platform" in my understanding.

Right, most systems needed a separate driver for DMA historically - they
still do but for a lot of them it's now done less visibly by the
dmaengine integration.

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0V8WsACgkQJNaLcl1U
h9Cd0gf/T04+KAAwA25BjlRZzu/+apWZ1sB1mUsOgy4LpiuX4E60Z5RNhh1xMZvD
ax/GTp7n8ZwU0ERND3jTtkyaFhCc1pNNFBdr0MU+2Er3hymrlXnrTK9DcELm05mW
+WXta28oyebItyy5WfI410ym9InuD2P+pkBX3gc+wMOxIYOyQy/c1QJoZWZre0uR
CbrFpfOr47XXwKGhlDi7RK0tg7rm40NbUbvPEIpXf0STA+zhkYRUeyuMVZIa6fQ0
KeAFrszGLbgPJM/KY8BbcN19CqZkMcErrg7erJhnmFsLqwQKxDSuKgRUsKybJZWh
sCV8qMgwLKB2/AefBhX5O2857fEg+w==
=HwUX
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--

--===============6233075968095917821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6233075968095917821==--

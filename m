Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76181122B06
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDD45165E;
	Tue, 17 Dec 2019 13:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDD45165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576584901;
	bh=FpHikItqJLXGAChT3QI5wyql4x0GRGPboAYdu1/G+fE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fk4B1Yyh8CIG0P0DjS7u4Nd9IfOomEKu1WEv/XZUsuuBwhLzdQb1a302alO2EDw+C
	 3V0B2zcgeiPq92VATRPO0ojJDQwJrMmXfydjv0ZFBs8S0JtEmscHnuUj4E+ajHUSt6
	 djLcjmR6tQkCMuT+BnddiduXHKkhGz+xO8K9cLRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1239EF80234;
	Tue, 17 Dec 2019 13:13:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05731F80234; Tue, 17 Dec 2019 13:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BC0FBF80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0FBF80100
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1C2A31B;
 Tue, 17 Dec 2019 04:13:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4115E3F6CF;
 Tue, 17 Dec 2019 04:13:10 -0800 (PST)
Date: Tue, 17 Dec 2019 12:13:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191217121308.GC4755@sirena.org.uk>
References: <87woavhhfi.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w7hhds.wl-kuninori.morimoto.gx@renesas.com>
 <01e4157a-d4b7-8bb2-d3bf-957d47e3e5f9@linux.intel.com>
 <87lfrbhajp.wl-kuninori.morimoto.gx@renesas.com>
 <87k16vh8d6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87k16vh8d6.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Thufir's a Harkonnen now.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 6/6] ASoC: soc-core: add
 snd_soc_stream_stop()
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
Content-Type: multipart/mixed; boundary="===============3698058327420521183=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3698058327420521183==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2019 at 01:41:09PM +0900, Kuninori Morimoto wrote:

> I noticed that soc_compr_free_fe(), dpcm_fe_dai_shutdown() are directly
> calling SND_SOC_DAPM_STREAM_STOP without caring pmdown time / delayed wor=
k.
> Can we use snd_soc_dapm_stream_stop() for these, too ?

That does seem like an oversight... =20

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl34xlMACgkQJNaLcl1U
h9CQhgf/V8qcdr3BlqNgZhgfHubmb7zaheCpaW8lUhqB/XdJ5RgYXxoEgo8ZSmfg
mhBxMk1g/bQ7F5mme8bTkLLdvF7BQjCtphNWPocfV8zOpazfX/GUD2G3VCcs8qjx
8FLiP7KN1mFEQMe9SpC000AMTVosBO2tWUfx9HfIC3PBfBLvrBs4fDYc7QGEcav6
rrH7yxpczaMFZeS7/362OtrFSV1f4BQS3hqwIJdeodFQYF21tkzye7QOxVkRvrhP
HCn8idOhoETJ8SR4x5KTW3izUe8HFSxi7pqQ3vfmd3UI5v2ls60GUsJ/CrfC/V6J
5LGIzPiBbPqUPYpfOQYQHm/nwSnrSA==
=zeQp
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--

--===============3698058327420521183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3698058327420521183==--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57657D6DB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 00:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5611868;
	Fri, 22 Jul 2022 00:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5611868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658442273;
	bh=TrB5avJPHQv7ufvHADTIZZvo91GC5AxaOs1zsVkqqRs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vETAOiohD04eG8jyICMZNXB8rWNdM6CDSL5MpZexhhqwdbDQaYPUKBOLKAZX+Ztvb
	 io4KmE5Cai+3Z9msZzxcowQJL9b5nqnevsOPFX/0HUHUpyLdCdzCxZd4xPY3s9V9SY
	 20yLtn7W89lfORcxuy684JAdd4Kulx/nkL60Fw1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4964FF80256;
	Fri, 22 Jul 2022 00:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD36BF8016D; Fri, 22 Jul 2022 00:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA5CF80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 00:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA5CF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t3rXYzNR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8E3A61C61;
 Thu, 21 Jul 2022 22:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3EAC3411E;
 Thu, 21 Jul 2022 22:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658442202;
 bh=TrB5avJPHQv7ufvHADTIZZvo91GC5AxaOs1zsVkqqRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t3rXYzNRTUxaXTideEL6S9A4SKopKTHLjPGekT3xIymzjxElMt/XAVJMSouh8Y5x+
 7DVRHw3lahyjN/iOQ1SLqT6SEniI0zzBzL7aQEBPMOErH4oO0cp9F/J51iSdU+TGSa
 U4jHBcNtWXch1y6P6AQ4Tll8gxqngYksCbcVWi6Cn0OfseUb/roQOYijH2rxtUDM7J
 yXyAGfx7gQkGnZu7RSbE4vUtUofjviM9fXY6nfMcSRsRTFfLTAx4+5KIvdinRubrZI
 +j9Q/o5x9B5F2yTASLcnXvjIxT1jGR3YCf0gQMfxl309MXe0279D7hZg28JJx/4mx4
 yI6JtSD5jiOlA==
Date: Thu, 21 Jul 2022 23:23:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 3/5] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Message-ID: <YtnR05hxiWNKOGoC@sirena.org.uk>
References: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
 <20220721062043.3016985-3-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w/c1cvUq36ZEZHgE"
Content-Disposition: inline
In-Reply-To: <20220721062043.3016985-3-venkataprasad.potturu@amd.com>
X-Cookie: Linux is obsolete
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
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


--w/c1cvUq36ZEZHgE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 11:50:35AM +0530, Venkata Prasad Potturu wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>=20
> We are currently allocating acp_stream during pcm_open and saving
> it in static array corresponds to array index calculated based on
> cpu dai->driver id. This approach will fail if we have single dai
> linked to multiple pcm device as we will have same dai->driver id
> or array index for multiple pcm open. Initialize new linked list
> stream_list to store opened pcm stream info dynamically.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/amd/acp/acp-platform.c: In function =E2=80=98i=
2s_irq_handler=E2=80=99:
/build/stage/linux/sound/soc/amd/acp/acp-platform.c:108:31: error: =E2=80=
=98struct acp_dev_data=E2=80=99 has no member named =E2=80=98stream=E2=80=99
  108 |                 stream =3D adata->stream[i];
      |                               ^~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/amd/=
acp/acp-platform.o] Error 1

--w/c1cvUq36ZEZHgE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZ0dMACgkQJNaLcl1U
h9A8gwf/fL6DbtvOtKpgGASfHBvRvfVnyGcb4t2YHbwtZTMnfB3M5vvhcARidz6E
z7OCU5ds6THN+zdyGcm5+z54vHpfdw1xW4MzRiz2zuUdviLPk+op/8FdiTFsuty3
hEqhv67RHBuvBOHQx1dB4CErspqEaL9+9jX+r5JtLQFyj2isoNGiont3x6I3M1FP
E/zkne2SyW/Hz466bTPewSdoiYMe5BTDIN6y4qqYiFLWd3wWPWFMMe+Hdv/WkYaX
CcbsgGy95KfyD6QYjr8AzyCDeu7WDEbs5HuXeCpIaa4JjHZ48ES8Eg1jDy3AlJcy
+HnorlsJYlXPqpDtIPhqiwhd+iM+4A==
=BIrc
-----END PGP SIGNATURE-----

--w/c1cvUq36ZEZHgE--

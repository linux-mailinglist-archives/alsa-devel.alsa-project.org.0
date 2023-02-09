Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D931E690BDB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 15:33:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72C7AE9;
	Thu,  9 Feb 2023 15:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72C7AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675953194;
	bh=ygTFga20HK6R/IHSWBx+L6XIycNYcDIL48e+pVyu5g4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hhUxgXvFC4gAH9DYVioTe+ccpk2o5gGmskpojsOLl2ik36r/QkusnrfN93eSQLiRg
	 6gjHXux1urTa+F0nwWH3dQGX2LqGbrv12nDSZiVRLe9QlmEb6TuMu/17XeqKr2e7f6
	 K2W0fXfhVliK+V3wgkgechtPEzN229U9kxty3Uus=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02224F800B8;
	Thu,  9 Feb 2023 15:32:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A99F800E4; Thu,  9 Feb 2023 15:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D53CF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 15:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D53CF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ss0bN4mW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34C9A61997;
	Thu,  9 Feb 2023 14:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EDEC4339B;
	Thu,  9 Feb 2023 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675953129;
	bh=ygTFga20HK6R/IHSWBx+L6XIycNYcDIL48e+pVyu5g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ss0bN4mWcetvdXVhBzlcEViEd2hlp31AqVrENtG+3YoQXKElGlHH/ePAFWbV8yFqI
	 Z/eYejWy0yXZ+FMNEUnR+TDVKVJGXLtRcDizVC92nWfBI9dmpd2sfg4EoeiLi7z5IG
	 uAnB5LoIOwePTyyS09R/OW5p01ojhWJF3Vmhw004Jn7qytKHnnX5ls4T0ydJ49wWSx
	 paiTeGI6hSkrK2OpfsxkEUFu7i//k9fTqkJqu86E/HyjZl51IKLQW+gjO1nSygErXx
	 EldUCvfS54IcXO25++Q0ejiz3ci24/xaQPk1Y9annG/Aue8YElV2z7lMEqtqqEWw8r
	 9bAssus5Kf6Qg==
Date: Thu, 9 Feb 2023 14:32:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yiqun <zhangyiqun@phytium.com.cn>
Subject: Re: [PATCH] ALSA: hda: remove redundant variable in
 snd_hdac_stream_start()
Message-ID: <Y+UD4yg2cgsucnlZ@sirena.org.uk>
References: <20230209121723.14328-1-zhangyiqun@phytium.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3NpgXB+aZuWRLp8s"
Content-Disposition: inline
In-Reply-To: <20230209121723.14328-1-zhangyiqun@phytium.com.cn>
X-Cookie: Anger is momentary madness.
Message-ID-Hash: LCTHZNDDSHU5R2YQXDEWF4GWG4GFKW2P
X-Message-ID-Hash: LCTHZNDDSHU5R2YQXDEWF4GWG4GFKW2P
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com, kuninori.morimoto.gx@renesas.com,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCTHZNDDSHU5R2YQXDEWF4GWG4GFKW2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3NpgXB+aZuWRLp8s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2023 at 08:17:23PM +0800, Zhang Yiqun wrote:
> This 2nd variables are all set as true in treewide. So I think
> it can be removed for easy understanding.

Acked-by: Mark Brown <broonie@kernel.org>

--3NpgXB+aZuWRLp8s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPlA+IACgkQJNaLcl1U
h9DVtAf+NTyg8/Upf2huOBExZDpwZ9hASDithXXMiu7yd5HUHCDLIwOJZsfLFUty
COWRiRIxZMjcXwHirN9WIWG7wRolzLScWjtRQlvfv7fQ0CLNLCHqUAlCa2AgGtsk
GBS93uCsCQm6Bg1uMIReTx22tuq1nzYA4PAJsXAw8fEqY3asmoW7aTy5orUBrhWB
GIrNVVBnrrP0tt+0WT+biSslsBxkVmDvGO0ibhn0MQ2IOXCN8FUb2XvXHVnFFt0Z
nfwm+dilzdfqpmmAQLdQarCALr8L/swJBZoa2CY+iEazSGS1/u2eu3fSHQiA/ctG
3yhact4FH88Z+zuUTWB4Bczu0nYqMw==
=gHhW
-----END PGP SIGNATURE-----

--3NpgXB+aZuWRLp8s--

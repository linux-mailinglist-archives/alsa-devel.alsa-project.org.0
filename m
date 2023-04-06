Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811BB6D9E7C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C61F47;
	Thu,  6 Apr 2023 19:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C61F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680801612;
	bh=5wEo7wb4lf6D3CBmOO/BiTA1OEchx0YI0jC8V1lfeCo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SwjpA3D9dAP5i6ZdYI59efz0fKCMwofcHHwoD/X9SYLRKemxK7axtOHz8ViW6SCQA
	 9+EhmPtMlLLHXQQJ+iXaYvO4xkzdq72MWjn1+1btSEKN9LIvMA2FiNryG7WqnnU2II
	 J7eh12Xac8ntykDzuIvQskfLSnfdqwa9dcUnS77A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC36F80171;
	Thu,  6 Apr 2023 19:19:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C51E3F80246; Thu,  6 Apr 2023 19:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEF43F8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF43F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=avwxXu8w
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E7E26428B;
	Thu,  6 Apr 2023 17:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B952C433EF;
	Thu,  6 Apr 2023 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680801548;
	bh=5wEo7wb4lf6D3CBmOO/BiTA1OEchx0YI0jC8V1lfeCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avwxXu8wQLQZcGLrjbGdUZMPnJwXhLa7VAT2SpoRUus+DPaufFxTTk6T5HHXZf5AU
	 EAxBtG7cStYxG+fOqOcUhQjJp+z+yT8U4iBgK/zgB6mshjof6x/sucIf4Y3spvrnsb
	 r/n+oBKO4DAQRA4Rjupx9FnSAS1ZQMIXjmAF12gQ3dDCDiyrahaYKT3j/f1pAR0jT8
	 UdLacyy6OZlQgsuVwLY0Hi0Ey/rCIunLHLGKkKA08J5UTsiwX9LvEhSoP4NIzcA6Sl
	 HFqqpIAIkqjiVwiMZdjvYJx0JNjIbIpWxirx5WQgaVTWAxe9PA+/QZQHs4kJc107yR
	 i/lcUBfUyhLMQ==
Date: Thu, 6 Apr 2023 18:19:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Use no_reply calls for TX
Message-ID: <a4145eda-3ff4-4ed0-8a57-fea8c358833b@sirena.org.uk>
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
 <20230406155026.18723-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EnVva6DvPYW7ekNI"
Content-Disposition: inline
In-Reply-To: <20230406155026.18723-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
Message-ID-Hash: FVQNDLGF6MM5H7ZNPMNCP3ZZJZFWZPEH
X-Message-ID-Hash: FVQNDLGF6MM5H7ZNPMNCP3ZZJZFWZPEH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, tiwai@suse.de,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVQNDLGF6MM5H7ZNPMNCP3ZZJZFWZPEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EnVva6DvPYW7ekNI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 10:50:26AM -0500, Pierre-Louis Bossart wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
>=20
> Convert all existing calls that pass "NULL, 0" for reply data to the new
> no_reply calls. Also convert any calls that pass in data but don't
> actually parse the result.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/sof/compress.c: In function =E2=80=98sof_compr=
_set_params=E2=80=99:
/build/stage/linux/sound/soc/sof/compress.c:238:46: error: =E2=80=98ipc_par=
ams_reply=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98sof_ipc_pcm_params_reply=E2=80=99?
  238 |                                              ipc_params_reply.posn_=
offset);
      |                                              ^~~~~~~~~~~~~~~~
      |                                              sof_ipc_pcm_params_rep=
ly
/build/stage/linux/sound/soc/sof/compress.c:238:46: note: each undeclared i=
dentifier is reported only once for each function it appears in

--EnVva6DvPYW7ekNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQu/wYACgkQJNaLcl1U
h9CnCQf+Mi8U4AODNhOng+iV6VEmTdD0RxxUdLmpnVaabfRK8RdPv5ShsadDmZIh
8qENI//zr91yDvnGXlnZZ1tH8mCnZ4boMWEiWCowFi2UoB6Qdo+7IvEebDQmHTUe
s8iQkySc9KFijjnPQ7axSjfuVuoI3Bly006xGjZiOJnFRHPsSyQQ9HgxnRhGgfzv
dovJhO8MBdFk1b59+NQrjltbECbIuD6R6i761C5LJDpUHrLAoctBq3yQ+oKSaNDJ
3OAEksyGcsA2YPCj42qdt/8FPPL9Rc1vEnnA7fsxNqTA8QNDDL/SSmENNPavAtpa
1JpO2916Mf7ZG+i2meIwGLZwgNmrAA==
=+abd
-----END PGP SIGNATURE-----

--EnVva6DvPYW7ekNI--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65B98BCF1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CF39850;
	Tue,  1 Oct 2024 14:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CF39850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727787529;
	bh=QyEZfHdMYJ+lGcIcvHz3IB8FoqlRl1lML5exUpqUBTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZeXsA6LHXeD458kDYqERsEGyhgcdaPcQT6XVlwH/J2HTOv9CRhhrqyQAB/+aA2Ivo
	 xT1mdTZXxx0D6AO5O/sao+p9S63/Nmm78gBDvE9uvZcsblrJbc1DGh7XnIQs2sGsHv
	 wmL4olP8+1GClvNp5GCrk8MF5zKWLU/Ser69fhqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65725F80580; Tue,  1 Oct 2024 14:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A77F805AC;
	Tue,  1 Oct 2024 14:58:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 063A2F80517; Tue,  1 Oct 2024 14:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19B49F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 14:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B49F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q3jqfhjh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F99F5C53FD;
	Tue,  1 Oct 2024 12:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B902C4CEC6;
	Tue,  1 Oct 2024 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787486;
	bh=QyEZfHdMYJ+lGcIcvHz3IB8FoqlRl1lML5exUpqUBTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3jqfhjhJyToS+rPzZEqV2DJHGWKizZqhHmzKQuND2eWzdqfwlCiEcnOC/smQGWQf
	 xCxKLd07nggWaurz38kUUdZHDyk3A+M6jVagcA7hvkUJP9J11iCirRhkYcfXGA9+l8
	 b4qdhP3wrEyBCFp446b+WBxr5UkZz1Vs133zl+CP/a0XXg8HtjBjNbXXUX3RnEk1zz
	 TFTurWbtXnpmAk76Gp9i1lt+djTnXrwIx0vqUDsIEWXyIAnYHhC6P0RbVEhgjUcRez
	 IBIYsagFf3KlFaijPENMZcVHYQ74vQWpHD14jes0b4HWXzd43+9F6Q+Zn+CfU3vpVo
	 cSQKhfHvoeEuQ==
Date: Tue, 1 Oct 2024 13:58:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Zichen Xie <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Message-ID: <1b8a5949-2501-4501-b722-137fcf122cf6@sirena.org.uk>
References: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
 <cf8e2da5-818d-4783-a3c4-bb6aa62088f2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/cGtRaFPuIMQKWOf"
Content-Disposition: inline
In-Reply-To: <cf8e2da5-818d-4783-a3c4-bb6aa62088f2@web.de>
X-Cookie: Even a hawk is an eagle among crows.
Message-ID-Hash: 4ND56B7MEXH2YYD6IKUS2S7LFTSQRSC7
X-Message-ID-Hash: 4ND56B7MEXH2YYD6IKUS2S7LFTSQRSC7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ND56B7MEXH2YYD6IKUS2S7LFTSQRSC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/cGtRaFPuIMQKWOf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 02:48:54PM +0200, Markus Elfring wrote:

> > Your description and patch looks good to me.

> Interesting =E2=80=9Cview=E2=80=9D =E2=80=A6

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--/cGtRaFPuIMQKWOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb78dgACgkQJNaLcl1U
h9Ae2gf/SjdwIbpI6k7ZUnbe4dgp9xn/Piq0S4chNNyqq3t0wy+zWAyUwLRjL5Y5
+nWCk3X0qImHgisbz6Z0m+4CA3a5voxCYUVtHCMFVljfydvNve5AzxDFQsYhDWub
nBgHEqiceARe+qyhYooXEnrgeAC0LWU8J+7tXt/ylrIgo14rlGZQSiEw36DeynCG
tOpBI7eXSjfTJFwn3Q3+o7tA05cI1A2JP5IOcjp2KD6rXqSBg5DzhnZPwH6VGz9w
gQvhnVBft5ZIXqy+GZPy7dJqnKINZxivNGgnxnV7D7/812hBNDMriEvMQHJtLpe+
9MqYln6QlWgAyy7xethxx5A46RPpYg==
=kNGb
-----END PGP SIGNATURE-----

--/cGtRaFPuIMQKWOf--

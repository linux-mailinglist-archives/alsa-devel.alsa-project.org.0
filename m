Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD9992EA1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7012B828;
	Mon,  7 Oct 2024 16:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7012B828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728310596;
	bh=3qD+O+1xzIs6q1p8HC+OxtflwSCDotmRykzLnbi1GN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WMgt8nIzczouXhyRo+8IsKVJy1jueu/Zj4ukiAxMyQIqYeC1YO5ilJrvO25zocURF
	 5Itl3va2wbPoXzhkoaYAKpP5EzCqtNlwSGlayVEF5yvTG4QV8TsA3tXp++mnvPjtoi
	 IrpcHvslYFMKV/Nd+quxb+y7PVKN0MEp2XGJvWu0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1902F805BB; Mon,  7 Oct 2024 16:16:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD452F805B0;
	Mon,  7 Oct 2024 16:16:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD2DBF80528; Mon,  7 Oct 2024 16:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFBB3F8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 16:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBB3F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=szdMgXzi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93BEF5C5757;
	Mon,  7 Oct 2024 14:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C138FC4CEC6;
	Mon,  7 Oct 2024 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728310555;
	bh=3qD+O+1xzIs6q1p8HC+OxtflwSCDotmRykzLnbi1GN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szdMgXzikN+bR54b3MvHNJnGyR26KH24dNATMHRHRHy+LT2a+ub9a0/ROx5liqzB/
	 XHWZ75o9QeDCCw9xYTCcxex2wnClosRC4A0g5exxj0Nhdx9JF1ScVihAiapBTEToXV
	 w9OkYJm5YKii8hDyhJYyiIj4k7Uo+0M0SM4+O1wK+V2hzOx0B4mbK3wpVWfXnPcylr
	 PFUaevfgiRY2629C9DkdhPNuiEtYKFTecqTPJ6AlnuBAng7IMQyv0/+vfJAxjPcMqv
	 FK0Cag24V8XoXdhQd+neLGzXMm/KhWU40nrg3uRKpbw1X8ZxDIsAEL3BcqQZLqgdAW
	 Y5883jWkAdWXw==
Date: Mon, 7 Oct 2024 15:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [v3?] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <ZwPszt6b5ZzAkskz@finisterre.sirena.org.uk>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
 <bc2f9291-c91d-4e46-bfa9-573eea6a67c2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6mD5aEE6D1/oRxA"
Content-Disposition: inline
In-Reply-To: <bc2f9291-c91d-4e46-bfa9-573eea6a67c2@web.de>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: GJRUIOAP7KZWWAZQLL4CZCV6S2RULHBN
X-Message-ID-Hash: GJRUIOAP7KZWWAZQLL4CZCV6S2RULHBN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJRUIOAP7KZWWAZQLL4CZCV6S2RULHBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--B6mD5aEE6D1/oRxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 03:40:21PM +0200, Markus Elfring wrote:

> * How do you think about to reconsider the version numbers
>   a bit more?
>=20
> * Would you like to mention the repeated adjustment of
>   the patch subject?
>=20
> * Can a duplicate marker line be replaced by a blank line?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--B6mD5aEE6D1/oRxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcD7M4ACgkQJNaLcl1U
h9CFiAf/V5OjgX/m7bDwCQgaPh8iQoD0Z/LMA6OfjNapjpGiIjXiHTnyl4+joeRF
XZWhKsmHJQ8m2Cm/N73q98LdMxh49L4ocqv+R0V0p8wRBA0K+w409dSIKvrVMMF8
mBnNAtuqAnzZGzdXWmh8CEuRRj+D7F9bC7rFrappGop4KIJoswGPkRT5XZwAANKK
P7QW5dwgHMwi90bYR+cIF3R1mKinWnzDEJenxRyGiD1jhvW4zyoshNZ5fbsZSF1O
RfdTos0jJvJoFQ3mIe5Z8deCL9eCqW+clErOZ3gSEP5zXMuPnsKyLmhEqs7a1oS+
Oc9ykkgdRC+fn899c+ALAhcckcaLlQ==
=JWCO
-----END PGP SIGNATURE-----

--B6mD5aEE6D1/oRxA--

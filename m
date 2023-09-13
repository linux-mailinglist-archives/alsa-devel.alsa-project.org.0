Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4979F2C0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 22:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C48AE9;
	Wed, 13 Sep 2023 22:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C48AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694636310;
	bh=M+j7rn5GrWqgMuMsrcHc8RTxO4ikec0wXlNMIlkvy8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rcJUIr/KiFIhfDGhUZLYF7qckhvdyLy3wxrTFA172K3QBz4t3cLNXogOhpo0NIBqc
	 9cHE07U2CISIuVG6ddwrv51ZWZ3hmiD8jeXjzmjSs8Pyo+xBvs0NhtSEztHfAeuhxL
	 ZB71eQ7NSM8SVLtzYYtGjP3UUDAx580WdW1QdU/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E914F80552; Wed, 13 Sep 2023 22:17:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7AFDF8007C;
	Wed, 13 Sep 2023 22:17:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 445E2F80425; Wed, 13 Sep 2023 22:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F2D6F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 22:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F2D6F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SEDkoiTi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1647EB82684;
	Wed, 13 Sep 2023 20:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03724C433C7;
	Wed, 13 Sep 2023 20:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694636220;
	bh=M+j7rn5GrWqgMuMsrcHc8RTxO4ikec0wXlNMIlkvy8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEDkoiTi4SuUbpZP9OO/EsW7aUHn82Tw/LZZ64sBCVadJXAu0s5XoIyr+w9eJelk1
	 4lYmexpyzwZnQ5S3jAuLImjr9VWpuW32pqJDA5WAcPZtZIRz9oeFBgxBhwEFXXQQo3
	 8PbWJ7bDo+crEMmLQHpawadtlw2NvWIerLrEqIjHASxNjnbAOy2jy2Nrq4vu4lWtAC
	 um1C2AjXW87MVlTIr/g752Ug7/6f9LOojl27WgIHIgSM1A2+1FogIYG77RErJUQlPT
	 UClxZwy6P6DahB7um/PIWLJM+ONNO0ZzoJt6xAwoYenYwvXJ05chRfimUPPY9nWjwr
	 6dSYuHCoGIhzg==
Date: Wed, 13 Sep 2023 21:16:30 +0100
From: Mark Brown <broonie@kernel.org>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Min-Hua Chen <minhuadotchen@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Thierry Reding <treding@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC PATCH v2 2/2] ALSA: core: split control primitives out of
 snd_card
Message-ID: <cea06f2d-4c75-4d1a-bdd7-a2635d1acc08@sirena.org.uk>
References: <20230913200846.1894258-1-cujomalainey@chromium.org>
 <20230913200846.1894258-3-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WkxBmfVXGsajyvCV"
Content-Disposition: inline
In-Reply-To: <20230913200846.1894258-3-cujomalainey@chromium.org>
X-Cookie: Use extra care when cleaning on stairs.
Message-ID-Hash: YZZWEZD4QBUYZ6XZDIDQXDEPKV56SMCX
X-Message-ID-Hash: YZZWEZD4QBUYZ6XZDIDQXDEPKV56SMCX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZZWEZD4QBUYZ6XZDIDQXDEPKV56SMCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--WkxBmfVXGsajyvCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 01:07:44PM -0700, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
>=20
> Having two kobj in the same struct is broken at its core. This splits
> card_dev from ctl_dev so they can properly refcount and release on their
> own schedules without the workaround of having them being just a
> pointer.

Acked-by: Mark Brown <broonie@kernel.org>

> Change-Id: Iecc91a116dfcb5a6364c7e6bdf993949e8542ca1

Please don't put change IDs in upstream submissions (or put them after
the --- so they get dropped on application like b4 does in cover
letters, it might be good to look at improving the tooling around
gerritt to support that since it seems like a pretty good comprimise
which would reduce friction).

--WkxBmfVXGsajyvCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUCGJ4ACgkQJNaLcl1U
h9CD0Qf+NviyW1yL7fb9CKCbuT2LFkD5q603M6UwZYWWmdSVtdla9+UEHa9R44Hp
aJdTLySZCXkl4SB5m0tN9eROwMpci1t6LXNWD+lU03PBhHBOklLfyYWzwjuawZml
imhxUoB1M9MY1XczOPfqkWCMuo37yimYBSFxKtuqcV/21/kGufgobtGM7wu+AyjW
RDFcD9a5yMsXA4IExe2aromfxdkViaT8F1ks3rtityRf4G227JruBmf+fIMguehh
vImMB7TL9ADzHBUy4WBC49l+HdqE4+a/2hA5GKrLZ0zqZkPhYjMx0+OQ9e57Ayce
Y1GE5yKK+pp/lpZ2gg0xgwkf6J6mqA==
=aotP
-----END PGP SIGNATURE-----

--WkxBmfVXGsajyvCV--

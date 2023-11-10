Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACE7E7D22
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 15:48:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA6086C1;
	Fri, 10 Nov 2023 15:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA6086C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699627702;
	bh=taIYNXkDXaK1HHt+InlvyAC+3ixvRvN2jMNzoadkFGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SYhZpnCfQSFo64McmTlEiqlVE4ndAEdoaJE15w8JZt9LjgrrnHoHcllw7TuJ3bK5S
	 t9+4eZIoL6YCqHQPeK8FVs0Im60bZYtFuhDSXOXwmcJP6vdFC3rlRJwAc7sm5ReqsW
	 bRstG7RKwqeaBINmLDSzYJA+cgxdqMKjkPMkQofw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F65F80166; Fri, 10 Nov 2023 15:47:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D29D7F80152;
	Fri, 10 Nov 2023 15:47:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D54F80100; Fri, 10 Nov 2023 15:47:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45D30F80100
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 15:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45D30F80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1Smx-0007Pv-TJ; Fri, 10 Nov 2023 15:47:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1Sms-0082mL-3F; Fri, 10 Nov 2023 15:47:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1Smr-00GmoR-Q0; Fri, 10 Nov 2023 15:47:09 +0100
Date: Fri, 10 Nov 2023 15:47:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
	Richard.Gong@amd.com, posteuca@mutex.one,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: amd: acp: add pm ops support for renoir
 platform Add pm ops for renoir platform.
Message-ID: <20231110144709.33z7qdl3dvb6pjkj@pengutronix.de>
References: <20231110125214.2127139-1-Syed.SabaKareem@amd.com>
 <20231110125214.2127139-2-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z2bq2xkeirl6malp"
Content-Disposition: inline
In-Reply-To: <20231110125214.2127139-2-Syed.SabaKareem@amd.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: RSQHIPZOJHOLM3RJ7NIYCPI5XPFMOI37
X-Message-ID-Hash: RSQHIPZOJHOLM3RJ7NIYCPI5XPFMOI37
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSQHIPZOJHOLM3RJ7NIYCPI5XPFMOI37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--z2bq2xkeirl6malp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the subject should be deduplicated.

On Fri, Nov 10, 2023 at 06:22:10PM +0530, Syed Saba Kareem wrote:
> +static int __maybe_unused rn_pcm_resume(struct device *dev)

If you use DEFINE_SIMPLE_DEV_PM_OPS below, you can drop the
__maybe_unused here.

> +{
> [...]
> +}
> +
> +static const struct dev_pm_ops rn_dma_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, rn_pcm_resume)
> +};
> +
>  static struct platform_driver renoir_driver =3D {
>  	.probe =3D renoir_audio_probe,
>  	.remove_new =3D renoir_audio_remove,
>  	.driver =3D {
>  		.name =3D "acp_asoc_renoir",
> +		.pm =3D &rn_dma_pm_ops,
>  	},
>  };

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--z2bq2xkeirl6malp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVOQmwACgkQj4D7WH0S
/k4H3Af9F+zM48KYYJ2LhyGdAwCIXHLLHtID1xORRtoppL1DvdGdGIgLxMNGil1D
KKIElxqjCLkwI7z7pUpD3VrPIA3RVr8QkwUNebuNYCu/FeYVq/iq10xPCTyJ9XOB
LeX920bHa8cELvuyZmdwo5fvTxVZYTEos+/gl9uYs7ZWOszPEmUug2+UXoaW+Xr7
VIMVDIDX0+A9oPd/3LVzqMLerKQ+xTywlsJHKBn7jZ27Mty+EntVnwiJU3g1POXF
1E1bAD4H2jxfQIF9CVoy8LX/6FgegHNX3jb8yaGYNSHKxOUYH4PZcAZ6rZDHCyFm
5MW4QdZtuwxF8q5WxzTMUECjPP35FA==
=Gcu+
-----END PGP SIGNATURE-----

--z2bq2xkeirl6malp--

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0179520F2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 19:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A204823CC;
	Wed, 14 Aug 2024 19:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A204823CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723655936;
	bh=rEu6m51mLJsHkqucNBcJN52s3Hg6hddb6JHwXoo14DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oQ3ZwTGHaKa/1i9aHyY2mTRoAB4frspTbh9gInncfzWiO0wsrEyOS1mVevty2/235
	 DeznCPy9Wbl4SauZhjhcE8MaBnfyDvHxvND8jodwhTwq3tg0gVNwr3h7dvsFD3Pofq
	 GpopB9J1ehLfU2O3q1Tc+THLlWR+jrwNr588ezdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70153F805B2; Wed, 14 Aug 2024 19:18:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C79F805AF;
	Wed, 14 Aug 2024 19:18:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FE04F80423; Wed, 14 Aug 2024 19:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF2FDF800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 19:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF2FDF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HX0XUif2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A427D61B3B;
	Wed, 14 Aug 2024 17:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D792C116B1;
	Wed, 14 Aug 2024 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655869;
	bh=rEu6m51mLJsHkqucNBcJN52s3Hg6hddb6JHwXoo14DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX0XUif2hk6qIfYgBbAgNWpnkg2Dw79rOq1FwuSNt565wB2DozWNVihe5nxgx5MI5
	 /QE40/IiQ6Vuj0TQlv37+ICQZmbYjAxhAqgh0jPedSbqra8pdx2201iy30Y7oIkEBJ
	 f1503gFLBO1xDTwP1MsxMoDT4XxLnoM8GKBONT0SjiDBU23dS0Q3H8HvIAI3ExuFum
	 dWOxMSJ/EMAILVRIgDZgTalVPXpRm8XyDq2zrV1dCiEitot4djogaPg4DGs++YJNqJ
	 az2LKk8+OF3y7HWGQDB09aLV/btb3gDguHfXlqPU4WA04ZXvmBtK+3XJ+spgxCT6fz
	 wcLguZYUd4IpQ==
Date: Wed, 14 Aug 2024 18:17:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?B?IkFtYWRldXN6IFPFgmF3acWEc2tpIg==?=
 <amadeuszx.slawinski@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
	Jonathan Corbet <corbet@lwn.net>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
	imx@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 4/4] ASoC: Intel: sof_sdw: use playback/capture_only
 flags
Message-ID: <ee24e5e3-06e6-4b74-bdbc-2127ca3f181e@sirena.org.uk>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
 <877cd3lmid.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HvPVidfg2tXyw8uc"
Content-Disposition: inline
In-Reply-To: <877cd3lmid.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Disks travel in packs.
Message-ID-Hash: HVI37WTLCWJ6X55CZ4J67GUCVUQOSDLG
X-Message-ID-Hash: HVI37WTLCWJ6X55CZ4J67GUCVUQOSDLG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVI37WTLCWJ6X55CZ4J67GUCVUQOSDLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HvPVidfg2tXyw8uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 01:03:07AM +0000, Kuninori Morimoto wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> Prepare for removal of dpcm_playback and dpcm_capture flags in
> dailinks.

This seems like it needs a rebase against my current tree.

--HvPVidfg2tXyw8uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma85rIACgkQJNaLcl1U
h9BNpwf/R/W2jVheMM7Go8zARx5qE9ZAxy04R0yuJIsXG9C42Qyw/FnB0k9GMFY5
vf3an9eEz6BQD5f6P6XZtqVzkugi9vqxI780U1xY1M7+FLqGmrGho6owrVZTirvP
wU1zMfj/KP5uXD5L3bLdirMAtr42gdV37iMetexlscKe/ldia8BLlxj+33FPbqU5
zXZ7wt0ywVjJ8tRIqBqJ2i30kw7BLuh0nsEdEVrESTxHJExY/iMRJh3MnjGGvo73
UKhTKqkaypgB0xqP+8uQs8Q3YIZD4l9xqmAB7NmihOPsIPTE8zqpUid1f63gh7jq
gi4ZnZChkxWlvL7qOVO73UpVl/L7hw==
=4IqZ
-----END PGP SIGNATURE-----

--HvPVidfg2tXyw8uc--

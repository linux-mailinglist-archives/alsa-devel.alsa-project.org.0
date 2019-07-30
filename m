Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0A7AAD0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 16:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38CCA17CA;
	Tue, 30 Jul 2019 16:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38CCA17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564496463;
	bh=BSNlOKQZr/aOF+T5hyWVQVTELxgLtWSDkUmaXGzr9+g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tvxuL4eb8GMqriQJ13VOqHdHYUdIwgZKyhXM/gKh87rRde18fd9yWAxZmCmqWwJ0K
	 9iac1TV+Fomxc9NzPApL+YYe1SiAxi9VbzyauLjnR9pTXZlrtuWFRMAw3TKP5CjWKU
	 uw9Je1mWsXEMLwpFdStrQ6mDi4d43QrCgHDWYwfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3D86F804CA;
	Tue, 30 Jul 2019 16:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 469E8F804CC; Tue, 30 Jul 2019 16:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1BEF80482
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1BEF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GX29Id9G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UlNNdsBx6Baw2fuddPCcOCkY2XtucT+E1ZdJLnPYjRk=; b=GX29Id9GIy648eX4mkkvrZCNR
 +K+KQOYmAhU03++KERmWLtllkU8sxhtlPCsUVzpmy049izlwm+6drN6ph7qMOO4fX8scf48WEmyn2
 Hh3wcxcIEjS+rlotusZoUCGNzfSxtQHnkRzJN5itUrCtKXV4KGf1Hj1gv7UQ85TaO6ir4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsSyW-0007is-5f; Tue, 30 Jul 2019 14:19:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 607C42742CB5; Tue, 30 Jul 2019 15:19:35 +0100 (BST)
Date: Tue, 30 Jul 2019 15:19:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730141935.GF4264@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190730120937.16271-4-thomas.preston@codethink.co.uk>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
	diagnostic routine
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
Content-Type: multipart/mixed; boundary="===============3369682559639835337=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3369682559639835337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8JPrznbw0YAQ/KXy"
Content-Disposition: inline


--8JPrznbw0YAQ/KXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 01:09:37PM +0100, Thomas Preston wrote:

> +	struct dentry *debugfs;
> +	struct mutex diagnostic_mutex;
> +};

It is unclear what this mutex usefully protects, it only gets taken when
writing to the debugfs file to trigger this diagnostic mode but doesn't
do anything to control interactions with any other code path in the
driver.

> +static int run_turn_on_diagnostic(struct tda7802_priv *tda7802, u8 *status)
> +{
> +	struct device *dev = &tda7802->i2c->dev;
> +	int err_status, err;
> +	unsigned int val;
> +	u8 state[NUM_IB];

> +	/* We must wait 20ms for device to settle, otherwise diagnostics will
> +	 * not start and regmap poll will timeout.
> +	 */
> +	msleep(DIAGNOSTIC_SETTLE_MS);

The comment and define might go out of sync...

> +	err = regmap_bulk_read(tda7802->regmap, TDA7802_DB1, status, 4);
> +	if (err < 0) {
> +		dev_err(dev, "Could not read channel status, %d\n", err);
> +		goto diagnostic_restore;
> +	}

...but here we use a magic number for the array size :(

> +static int tda7802_diagnostic_show(struct seq_file *f, void *p)
> +{
> +	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);

We neither use nor free buf?

> +static int tda7802_probe(struct snd_soc_component *component)
> +{
> +	struct tda7802_priv *tda7802 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = &tda7802->i2c->dev;
> +	int err;

Why is this done at the component level?

--8JPrznbw0YAQ/KXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AUfYACgkQJNaLcl1U
h9BW0wf+PaVQnb5XffJ21Ypo9xRgaGWwcL6bpKaVDfNRL94hrZz1wDnFe0ZbKzEY
hIOheUHZJdsf65s/VqhPR6hprJoLCHtcEcnGVcT0ghx2rkyYEM0DrTZIZ/BzzD8I
dCbzuqE3Zh3JjiBrLup0wTyeeEFwP9/z9mmVZCfy5jOcErgm+TObJYq/kPsu1bXv
txX1/W1cPk3+FuPxa2DZC9AFW2Lxv0VnQ0PgBeUwaOI/5ykbFyN51boKVLXFKh6H
FsEA0Y8qQ2OhufKK4pZnqip4RAgzPa+8DkV1cWaABjlgI+ECI0/sEcXD63MOx3cS
oovWVqTESFF8RhUnU/HXI7WswbziRg==
=GUqM
-----END PGP SIGNATURE-----

--8JPrznbw0YAQ/KXy--

--===============3369682559639835337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3369682559639835337==--

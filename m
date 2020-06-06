Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F21F079A
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jun 2020 17:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EC8845;
	Sat,  6 Jun 2020 17:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EC8845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591457579;
	bh=zalNykzbu7M8VZ8ak1apJ6gpqqJX1HFCYVttRrQ8jXQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lzmh8pqRUmi6Ydkb2kZ33pMmVMglTzIullUyw5dq5wu0NKBuSdQ2rj60NBCEurWrr
	 vKn+RcmZXuUqnNO+GXhMeQlZwFsZEm/7qb16q3na/rQHPAGwivZkp9AwFqQiail0BJ
	 IU7O3MqFdNMNt3S2JArZIWg/TiCxxsfkr3nBQMVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83AFEF80108;
	Sat,  6 Jun 2020 17:31:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 813B6F8023F; Sat,  6 Jun 2020 17:31:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A25CCF80108
 for <alsa-devel@alsa-project.org>; Sat,  6 Jun 2020 17:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25CCF80108
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CD6821C0BD2; Sat,  6 Jun 2020 17:31:04 +0200 (CEST)
Date: Sat, 6 Jun 2020 17:31:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: [PATCH] soc/meson: add missing free_irq() in error path
Message-ID: <20200606153103.GA17905@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
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


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

free_irq() is missing in case of error, fix that.

Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 2e9b56b29d31..b2e867113226 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -249,7 +249,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *compone=
nt,
 	/* Enable pclk to access registers and clock the fifo ip */
 	ret =3D clk_prepare_enable(fifo->pclk);
 	if (ret)
-		return ret;
+		goto free_irq;
=20
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
@@ -269,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *compon=
ent,
 	/* Take memory arbitror out of reset */
 	ret =3D reset_control_deassert(fifo->arb);
 	if (ret)
-		clk_disable_unprepare(fifo->pclk);
+		goto free_clk;
+
+	return 0;
=20
+free_clk:
+	clk_disable_unprepare(fifo->pclk);
+free_irq:
+	free_irq(fifo->irq, ss);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7btrcACgkQMOfwapXb+vJ51wCdFIey2vjfzhnWLuSj7KK518uE
1BgAn3bsVTxHs8pdwxUTDu7T0dLdrWBj
=0D1B
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

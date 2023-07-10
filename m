Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C5E74F0DA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:57:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCAAEBF;
	Tue, 11 Jul 2023 15:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCAAEBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083832;
	bh=VPTEizabFSZ5pWBD9Da/azVVHh+XymCvwh7DuMw32L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bYSGLTo795/Hl3VZMlCCTUPFwkleSOTaQ0R+qofrDAe3Jcjgxi6mrIIRiH9lfgq2z
	 My5xQ9YwLhCV8CXDolHcaot1nKuL/MWmRHMqH1v6/3MGhXYXMOXoWm5Dp710utA/e1
	 mCZPkWXqoMMf86CkGiyi8mF8sqJzxqTl7Rd3iink=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A7AF80617; Tue, 11 Jul 2023 15:52:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D90FF8062D;
	Tue, 11 Jul 2023 15:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE8BF80249; Mon, 10 Jul 2023 18:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D95C3F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 18:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D95C3F80093
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qItIz-0006h7-IH; Mon, 10 Jul 2023 18:00:05 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 0B1351ED16C;
	Mon, 10 Jul 2023 15:59:56 +0000 (UTC)
Date: Mon, 10 Jul 2023 17:59:55 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 09/15] spi: Use struct_size() helper
Message-ID: <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkfcsps3yw5kjzrk"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-MailFrom: mkl@pengutronix.de
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: TQHHOIRLUJ4KJRMPURSIR6MHR4XYPS6D
X-Message-ID-Hash: TQHHOIRLUJ4KJRMPURSIR6MHR4XYPS6D
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQHHOIRLUJ4KJRMPURSIR6MHR4XYPS6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fkfcsps3yw5kjzrk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10.07.2023 18:49:26, Andy Shevchenko wrote:
> Prefer struct_size() over open-coded versions.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/spi/spi.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index c9479badf38c..9fb8efb068c6 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -17,6 +17,7 @@
>  #include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
> +#include <linux/overflow.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/smp.h>
> @@ -1095,6 +1096,8 @@ struct spi_transfer {
>   * @state: for use by whichever driver currently owns the message
>   * @resources: for resource management when the spi message is processed
>   * @prepared: spi_prepare_message was called for the this message
> + * @t: for use with spi_message_alloc() when message and transfers have
> + *	been allocated together
>   *
>   * A @spi_message is used to execute an atomic sequence of data transfer=
s,
>   * each represented by a struct spi_transfer.  The sequence is "atomic"
> @@ -1147,6 +1150,9 @@ struct spi_message {
> =20
>  	/* List of spi_res reources when the spi message is processed */
>  	struct list_head        resources;
> +
> +	/* For embedding transfers into the memory of the message */
> +	struct spi_transfer	t[];

You might want to use the DECLARE_FLEX_ARRAY helper here.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fkfcsps3yw5kjzrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmSsKvgACgkQvlAcSiqK
BOgtxwf/Yz15ymm8GOJJtFmUerpE4jpOZcNfOw1mDTpDDgDH+8CXkQfj2uE13kRU
xmZmpKSAMlsxxmOIGsv8VL18I9YKzWY9wk4vu5oovzx44NHON+6ivyODkaJdH2w9
kOVb4XiHGF0bhFsC3TJ4HZSUlG3EbFNnc0nuj/IvF6VEoldwbjSR6R5ZR6+EX47u
h77RsJnmXXbOKbOseq0nlPxZYkFSR03Hzey7BMzmHYQ93COdGDhQqI0kNbwrkD5F
qpdpYHa26+CLsV+iBftiTk/C49nxRM0cvs4xqUDaZU1rzd2tlbhN28dsuGJ8zQL1
T+7Bl7/j5IRqJUJiKB8YUQNVj2KrOg==
=a9WN
-----END PGP SIGNATURE-----

--fkfcsps3yw5kjzrk--

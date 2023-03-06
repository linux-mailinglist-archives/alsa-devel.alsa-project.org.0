Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5CB6ACED4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 21:05:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB7F11A4;
	Mon,  6 Mar 2023 21:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB7F11A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678133116;
	bh=2I7EUrvC/Bn/30xCJCpwoC3G2EM1fASqw7te6nVyGto=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FETML3qesYVfVbQVtTDJbFc03OwTVt9k5bqYDNYCjU7h37nYe+ByHiMMeeGn+jsYB
	 HvGZN0lkmX2oP1k8V+Ggjdt3am3D8cEhIveJh3DI1M5Y03JSewdgn4jWjvLAQCvvII
	 2bcfucDE2MFduissATo/rKtvzuLxm9ZUtz5igbwE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9107DF80236;
	Mon,  6 Mar 2023 21:04:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F2C0F8042F; Mon,  6 Mar 2023 21:01:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83B27F800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 21:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B27F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o6hZefnQ
Received: by mail-pl1-x62f.google.com with SMTP id p20so11668689plw.13
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Mar 2023 12:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678132856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uXR1hBuNmG/TwC91AeVvsW1UVH/MwkAfhUSEnuvNaoY=;
        b=o6hZefnQYEnFw3COvoTdyyoXo9Zv4P0LTShB301lkw0/gGr+x1ou0XeYCSdcXXLXoz
         Ie/lwSIsRhh9vBh4c56fFPeCbh1Mg/u0f+SLHuOsNnA01L3iQxuD6tKvCodPDyUeqcUA
         ipzyAtvRXWR1nR5U0W8m7xh6fPIYtpAYIZVYRkCJb0GTxixFtDSEeec8W6O4TIR9SFvb
         8TyLwk+heXtYmzhntJcZ54SphmylZPrikYFa1PRdJ8V5j+VefclzJKcG1hcN/EBRiJ2z
         A5LjdstbOHhVHAVRXA7o2dTcBNuVBc27QoVtU1tjX+Yepbtmilj428R4Os2Xd6WiLWnA
         Of4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678132856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXR1hBuNmG/TwC91AeVvsW1UVH/MwkAfhUSEnuvNaoY=;
        b=GiZfv05e0Zwzunu78zAGa5ciz9xYRMYviisnpaInpQYLkPXqO3Fj1ZolzUWufBCNx6
         OYGKoo0e+FkHvI/KojMrehn+avwUdQ5ZImU+WzQUtkdnjtQQGQYSBiNVO1FQ0iRJ1l6j
         gHDQufx/63tC+DJoSRD/+5/IAbzqYV5bCveNi3jX0FPPXFB5CkPoKyHG0OsA1OI27Ban
         TX9mrrImUHduo9CdJSonRiFLvBUHWov4VWrtEZyQ4oJNYDLogjitYsplB8yfbQvmYuTO
         bB0vb0/+7Jnh+w+nDJXHS/W//CbkmnH4Ib/R0nQN5DBt3MgFZFlc6ghGIo+5bpAh1bqH
         jGeg==
X-Gm-Message-State: AO0yUKXqRrj2d1LfqStH40JOb7Xp+4ZLUiSCXSqBcKBl1VNza+SW72gE
	SUFPXPAO6n8m2QuEc79lfN4Au2COal5wLwzNCBQ=
X-Google-Smtp-Source: 
 AK7set/DxZtiZhO+z+A0Is7yokDniYYkETavBEcleYa7IPSvIEQBIV7zty9Y+UWe1CWFM73JZ5CBgh34wQSFC4iK+eg=
X-Received: by 2002:a17:90a:5993:b0:233:b520:1544 with SMTP id
 l19-20020a17090a599300b00233b5201544mr6625621pji.0.1678132856231; Mon, 06 Mar
 2023 12:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 6 Mar 2023 21:00:44 +0100
Message-ID: 
 <CAOiHx=nmsAh3ADL3s0eZKpEZJqCB_POi=8YjfxrHYLEbjRfwHg@mail.gmail.com>
Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: jonas.gorski@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2W4OUZRHGU4YSXPA7O7N4QUFOTJBEZU7
X-Message-ID-Hash: 2W4OUZRHGU4YSXPA7O7N4QUFOTJBEZU7
X-Mailman-Approved-At: Mon, 06 Mar 2023 20:04:21 +0000
CC: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, Sanju.Mehta@amd.com, chin-ting_kuo@aspeedtech.com,
 clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org,
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com, tiwai@suse.com,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
 oss@buserror.net, windhl@126.com, yangyingliang@huawei.com,
 william.zhang@broadcom.com, kursad.oney@broadcom.com,
 anand.gore@broadcom.com, rafal@milecki.pl, git@amd.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
 andrew@aj.id.au, radu_nicolae.pirea@upb.ro, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2W4OUZRHGU4YSXPA7O7N4QUFOTJBEZU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Mon, 6 Mar 2023 at 18:26, Amit Kumar Mahapatra
<amit.kumar-mahapatra@amd.com> wrote:
>
> For supporting multiple CS the SPI device need to be aware of all the CS
> values. So, the "chip_select" member in the spi_device structure is now an
> array that holds all the CS values.
>
> spi_device structure now has a "cs_index_mask" member. This acts as an
> index to the chip_select array. If nth bit of spi->cs_index_mask is set
> then the driver would assert spi->chip_select[n].
>
> In parallel mode all the chip selects are asserted/de-asserted
> simultaneously and each byte of data is stored in both devices, the even
> bits in one, the odd bits in the other. The split is automatically handled
> by the GQSPI controller. The GQSPI controller supports a maximum of two
> flashes connected in parallel mode. A "multi-cs-cap" flag is added in the
> spi controntroller data, through ctlr->multi-cs-cap the spi core will make
> sure that the controller is capable of handling multiple chip selects at
> once.
>
> For supporting multiple CS via GPIO the cs_gpiod member of the spi_device
> structure is now an array that holds the gpio descriptor for each
> chipselect.
>
> Multi CS support using GPIO is not tested due to unavailability of
> necessary hardware setup.
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/spi/spi.c       | 213 +++++++++++++++++++++++++++-------------
>  include/linux/spi/spi.h |  34 +++++--
>  2 files changed, 173 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 5866bf5813a4..8ec7f58fa111 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -613,7 +613,8 @@ static int spi_dev_check(struct device *dev, void *data)
>         struct spi_device *new_spi = data;
>
>         if (spi->controller == new_spi->controller &&
> -           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0))
> +           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0) &&
> +           spi_get_chipselect(spi, 1) == spi_get_chipselect(new_spi, 1))
>                 return -EBUSY;

This will only reject new devices if both chip selects are identical,
but not if they only share one, e.g. CS 1 + 2 vs 1 + 3, or 1 + 2 vs
only 2, or if the order is different (1 + 2 vs 2 + 1 - haven't read
the code too close to know if this is allowed/possible).

Regards,
Jonas

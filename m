Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6DF6B676E
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Mar 2023 16:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4740513B5;
	Sun, 12 Mar 2023 16:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4740513B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678634051;
	bh=nxjIZb2lDBuKK2G4lNzbnKP45y5UoeG95pRVo5INiRE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P8ghISBlPz2zKaOn//1nN+OX8XzjllEQt9OQgC+ZM5QmRYPwclThnb3mDYhhnGQy6
	 hCa7toVA2YJPAzhg1xllfm0z4azgIyaGy0lWBbppRasidsj48CnlqIAAyx0osS1TYw
	 pYqcKJOYaxScKQTuEkwLoHXaIdKEBEww+38UVGWg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D02AF80527;
	Sun, 12 Mar 2023 16:12:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ED9AF8042F; Sat, 11 Mar 2023 22:17:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SPF_TEMPERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CD48F800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 22:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD48F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bvzKGPqJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B27C4B80B4A;
	Sat, 11 Mar 2023 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B025C433A8;
	Sat, 11 Mar 2023 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678569432;
	bh=nxjIZb2lDBuKK2G4lNzbnKP45y5UoeG95pRVo5INiRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bvzKGPqJVg2bAaBl8LvuSNq4FE4F8OHaj0dxY1RmvBRvrUteeh49EnCBFgpLpsimi
	 X9QjmQX5ru5ARgvQanZf4uxwTdtbSXJBvWNRv/d86I7owOd9TPANApjMIEt8UOom/V
	 rlpKM3DSWdmGVC5sTOOGKI7C35EJY3xqnU9SQBlbwRy+sPkyfeO2xcIoXPdhr3KG5S
	 maSO5XBX1iOLzTj27xMUWw1Z5Arz1xysQ8bAZkDXGqorBZ3q1BRVnKovYh/ImB0NqZ
	 5jPOxe6cAx/K/KlowItsOB1tQgOaqn0wX00B/jAga6Qsnzqoh25kwlapaLa6EQAQNP
	 eT/NzyqjKOROw==
From: Mark Brown <broonie@kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jic23@kernel.org, pratyush@kernel.org, Sanju.Mehta@amd.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com,
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com,
 linus.walleij@linaro.org, daniel@zonque.org, haojian.zhuang@gmail.com,
 robert.jarzmik@free.fr, agross@kernel.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org,
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org,
 kvalo@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
 tiwai@suse.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, oss@buserror.net, windhl@126.com,
 yangyingliang@huawei.com, william.zhang@broadcom.com,
 kursad.oney@broadcom.com, jonas.gorski@gmail.com, anand.gore@broadcom.com,
 rafal@milecki.pl, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH V6 00/15] Add support for stacked/parallel
 memories
Message-Id: <167856940280.964268.10660159170818600511.b4-ty@kernel.org>
Date: Sat, 11 Mar 2023 21:16:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: JOX2CYT7YYNSL75XNCXQCT2VEY6C75X6
X-Message-ID-Hash: JOX2CYT7YYNSL75XNCXQCT2VEY6C75X6
X-Mailman-Approved-At: Sun, 12 Mar 2023 15:12:33 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOX2CYT7YYNSL75XNCXQCT2VEY6C75X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Mar 2023 23:02:02 +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.
> 
> This patch series updated the spi-nor, spi core and the spi drivers
> to add stacked and parallel memories support.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[01/15] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 9e264f3f85a56cc109cc2d6010a48aa89d5c1ff1
[02/15] net: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 25fd0550d9b9c92288a17fb7d605cdcdb4a65a64
[03/15] iio: imu: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 0183f81fce154ae1d4df2bb28d22ad6612317148
[04/15] mtd: devices: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 0817bcef53e4e3df23c023eddaa2b35b7288400e
[05/15] staging: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: caa9d3475b1c5566f0272273c147cc9b72f2be28
[06/15] platform/x86: serial-multi-instantiate: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: e20451f44ca33ec40422e9868775e117ef2da935
[07/15] powerpc/83xx/mpc832x_rdb: Replace all spi->chip_select references with function call
        commit: 3aba06a9fee04f6fefa9df71d3ee27dd4c464ad5
[08/15] ALSA: hda: cs35l41: Replace all spi->chip_select references with function call
        commit: 06b5e53c8b2b016e06a53ab6f01006ca7bbfa5df

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


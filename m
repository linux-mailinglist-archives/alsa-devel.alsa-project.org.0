Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A66B4892
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 16:04:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9D818D1;
	Fri, 10 Mar 2023 16:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9D818D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678460641;
	bh=4nO6S7AVKJRkqUospk0gd3rr/UVmqm229W5wXjOFSqU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XvR87ExLo7zNNFvVwPE1Az5WGnDZ61isfT4iFyg+N9U4NIC6YRDD94YDD8rglQ4sJ
	 n1ppsy/znzi376aMEtTSeX36phQXo62vmj6YVDl/PRcP27AmO2XofpugSCTOkpdB9d
	 JJCWb2UoSNsKL5huHwYnc+nEB+G/XdjdfGZ2268E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D0BFF8051B;
	Fri, 10 Mar 2023 16:02:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C89ACF8042F; Fri, 10 Mar 2023 16:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84795F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 16:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84795F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aInGjzrM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 860FCB822E7;
	Fri, 10 Mar 2023 15:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80517C4339C;
	Fri, 10 Mar 2023 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678460558;
	bh=4nO6S7AVKJRkqUospk0gd3rr/UVmqm229W5wXjOFSqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aInGjzrM0pCcji/YZ458YXHR90uLPoDBXPhufKIlVHPF1oUYsOmmdDfPDnJnymjPS
	 UPCWykKdDBlosBZCTOoGVn1OSgobEzk1joCjc06+G+rntnOlyY6vaCPAOyp6Nn8qJb
	 ofguEF1TwOAv6Lt3moUg6h3+E2KyIBflz/HUM+Ri5+Kfr+c3Q2+t8dlY/8rblXzje6
	 A9Yp1H0hHnQZ+EA53Xt5Nn4qbBr3IUp98y/Vfv6i3vS+GnuM9L4Rbn52MHYDbM82ak
	 cUMUvchz4BPKuQ9NDxqgrhy0LPbQTFjZINV6ndYWXuUJZTO+8AREyTxD9PQzz9PThO
	 ghTAnWA/kFlqw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20221213112851.89212-1-claudiu.beznea@microchip.com>
References: <20221213112851.89212-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 0/4] ASoC: microchip: power saving features and
 cleanups
Message-Id: <167846055521.924369.14328317678015706144.b4-ty@kernel.org>
Date: Fri, 10 Mar 2023 15:02:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: JY7IO3XQDUSE4GNKLXLPXSY5BQPTWLLP
X-Message-ID-Hash: JY7IO3XQDUSE4GNKLXLPXSY5BQPTWLLP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JY7IO3XQDUSE4GNKLXLPXSY5BQPTWLLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Dec 2022 13:28:47 +0200, Claudiu Beznea wrote:
> The following series adds runtime PM and suspend to RAM features for
> mchp-pdmc driver.
> 
> Along with it 2 cleanup patches were added:
> - patch 1/4: use vendor,device.yaml file format for Microchip AT91 ASoC
>   bindings
> - patch 4/4: use FIELD_PREP() in mchp-spdiftx.c
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: microchip: use proper naming syntax
      (no commit info)
[2/4] ASoC: mchp-pdmc: use runtime pm for clock power saving
      (no commit info)
[3/4] ASoC: mchp-pdmc: add support for suspend to RAM
      (no commit info)
[4/4] ASoC: mchp-spdiftx: use FIELD_PREP() where possible
      commit: 28ce5698456ab53540093836c6fee15119cf1821

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


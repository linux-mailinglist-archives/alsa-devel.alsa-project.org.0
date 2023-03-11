Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104726B5EA9
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 18:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F9EB1631;
	Sat, 11 Mar 2023 18:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F9EB1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678555227;
	bh=Xjh3wk7o+LHEFty4gqGN/nReXay+Bh8f9wzC52SXd8I=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oBff7s8iSm6pCo4k/6ZhHiopt65VuHhFvIHjhhQxUgOFWQDlGtRz94L0k4utOIBOI
	 8Md2ibSYEQJDxTGS9yDUlB4Gh8APZ7AfYzh9k2UXMgt0VYaVKLAz9zUuq87shj0s5J
	 rK1Y2gceUV068xGG6+vsNBHzhTUA4TwRn/OQk5Ns=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E97FF80236;
	Sat, 11 Mar 2023 18:19:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD45F80431; Sat, 11 Mar 2023 18:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BACF2F800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 18:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BACF2F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f1USAqYP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6D872CE01B9;
	Sat, 11 Mar 2023 17:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACB8C433EF;
	Sat, 11 Mar 2023 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678555160;
	bh=Xjh3wk7o+LHEFty4gqGN/nReXay+Bh8f9wzC52SXd8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f1USAqYP/WZKfWOMPPzlqNRuH6dR85MoHXKJAOkHhJlDyVC2Y46EFZKo2PaYhoQe/
	 5ohqtnDj7HFtBOmCGuON1EvaAcYttVUYk2/w68eOv+dtJGdvJ7zUdFNclV1XRzfC/m
	 efbuFaqK6qQc1CQWgS2bp51kXD5H3CGwvNNrr/L7nqRDccXnbRr2KORsIqzHv+81tR
	 hQ9iYMZoNa0BHq7Ndtr7fNrIvrfXmkQf23fvYJrokU00lnRKjRfgyb1dwGygPyknk7
	 rfHYBhD1WBLyOgOHoqQVwyEl89Ituwd0rijouTsYeRK0qb5qovaQjBgaXzUClAY+Ra
	 PvfewW1M/Jsjw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>
In-Reply-To: <20230310144732.1546328-1-robh@kernel.org>
References: <20230310144732.1546328-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_present() for testing DT
 property presence
Message-Id: <167855515541.950365.6616901508065986731.b4-ty@kernel.org>
Date: Sat, 11 Mar 2023 17:19:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: VU27O3HKKBHJWSC5NXEZYR6CDEVQ2XOP
X-Message-ID-Hash: VU27O3HKKBHJWSC5NXEZYR6CDEVQ2XOP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VU27O3HKKBHJWSC5NXEZYR6CDEVQ2XOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Mar 2023 08:47:31 -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_property_present() for testing DT property presence
      commit: 1e108e60a44a924e3666fa2a10b53f6c31522856

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


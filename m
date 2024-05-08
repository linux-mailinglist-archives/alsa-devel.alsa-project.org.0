Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3628BF4AD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 04:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7562741;
	Wed,  8 May 2024 04:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7562741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715136072;
	bh=/3khDWZQ/GtML+FhSHCXGuNu/t+fIBx0N0zULUWpjWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LPF1z6UGfmu8lTaeS55Xe0KWUyq0JJl6XlWmP+de9/WZeBU+kXuAbc3LMHtm+OpuW
	 GOv5M9HeVO2cwCku3Tju0Oo7AQDpjavNnRiDxMPDsNflNJ4AaVQ1MquyWOqrJWWeFj
	 uMVoG7siz9M7gBTHy/rHIUx2544ryAouiWy8r3dw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1182BF80563; Wed,  8 May 2024 04:40:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F413F805A1;
	Wed,  8 May 2024 04:40:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86F3EF8049C; Wed,  8 May 2024 04:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0D7AF8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 04:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D7AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uC9nO7qw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D36C861A7F;
	Wed,  8 May 2024 02:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02724C2BBFC;
	Wed,  8 May 2024 02:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715135939;
	bh=/3khDWZQ/GtML+FhSHCXGuNu/t+fIBx0N0zULUWpjWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uC9nO7qwz/RZe+qVeAYA5qg8DRX2OHooEZGkUg+YOiFYZbymhIt5OYrroDkvwZHx+
	 rloiSSzfzkpfR3JH7MYR+nwgB19ILcw3crrUVKTntXNt13ThipsAWyeevB2r2yv6e4
	 5UcJx3pXdyw//cVj268GeKVZeeXlC8CscMEFYHrvrAsHMAGXLZQj4qiDjiJa6/msly
	 chVJr5LgPieHOEt1Z6CDmFMIZNYKLXUkYS08rHdms6UNqleqnU+9MAV5ZdML0t7FUe
	 4rh/5pt8ZbvdIsh9pgfWDTw1ynQIxfxgYcl1bu+Kl0Fem7Stn0h55Di594V579dsht
	 8SgBQFV9z+Mbg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
In-Reply-To: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
References: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: Constify static snd_pcm_hardware
Message-Id: <171513593429.1997870.7721601606737894887.b4-ty@kernel.org>
Date: Wed, 08 May 2024 11:38:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: FODZETPQM57VUYR77UCDERTBSUBMH3ZE
X-Message-ID-Hash: FODZETPQM57VUYR77UCDERTBSUBMH3ZE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FODZETPQM57VUYR77UCDERTBSUBMH3ZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Apr 2024 13:48:45 +0200, Krzysztof Kozlowski wrote:
> No dependencies.
> 
> Static 'struct snd_pcm_hardware' is not modified by few drivers and its
> copy is passed to the core, so it can be made const for increased code
> safety.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Constify static snd_pcm_hardware
      commit: e6fa3509cb32df373b15212a99f69a6595efd1c3
[2/4] ASoC: fsl: Constify static snd_pcm_hardware
      commit: ed90156037659473ee95eafe3f72d8498e5384ff
[3/4] ASoC: meson: Constify static snd_pcm_hardware
      commit: 7b5ce9f0c52a5885d34d46bba62e9eaedc3dd459
[4/4] ASoC: uniphier: Constify static snd_pcm_hardware
      commit: 74a15fabd271d0fd82ceecbbfa1b98ea0a4709dd

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


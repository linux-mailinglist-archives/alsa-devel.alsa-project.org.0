Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB689BD5AD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2024 20:08:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1591514E3;
	Tue,  5 Nov 2024 20:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1591514E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730833695;
	bh=bJBfX6qg8hW2kBjNewIsOi+0CyauUekBnlmZQZpbsPM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TJdK7IMYyGUjaM9Usq1trRr4J18bNvXnRYoyxQiXlBJTH/EareF+45lLkMIJc6MR9
	 6jpXpyizQrLDbo2XAFEaVcPs/tqCXbHKR7/mwdmDWMkdrWzFD1RnbQfHgj8/aueyfg
	 0RnZ2uucWafjjiugWFaC2pHJBduJf02l3UszLEZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9823F805D7; Tue,  5 Nov 2024 20:07:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A44F805DA;
	Tue,  5 Nov 2024 20:07:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45EFBF805C0; Tue,  5 Nov 2024 20:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C549BF800D2
	for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2024 20:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C549BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ws5ZPOhU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC9785C54A5;
	Tue,  5 Nov 2024 19:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96663C4CED1;
	Tue,  5 Nov 2024 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833648;
	bh=bJBfX6qg8hW2kBjNewIsOi+0CyauUekBnlmZQZpbsPM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ws5ZPOhUGS4BGBhjO58bXkSAOXZlJVSOeX1WL46YI1g7J7+uu0SjVJCcOPQXlZCzJ
	 0HIHMEf3qI/TWOANCPJDa48EtIsYCWbGMV8ziP1C9N2vuTwgV3IRBCOPhTtPThjzTr
	 PCE3I+wiIQipirKQ01UEni4wshs1YoeyCDYH0Hkg0fXBPQvZukoZuE4OsvFjoqKfdT
	 AZITUrcU1TglWZUMHI8LR0Tn3GLs49h2ZQpaanmBKdspvAhhxMMeL8Jq0iQJncDgZf
	 Jqlsol00dy+q11CuOVcc7dg03m1ZL4P9h5qmFlxzIbgk8Lk3/o+CdteMFPwB2nQyuH
	 6IFhmanLMkR+g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/8] ASoC: cleasnup rtd and its ID
Message-Id: <173083364434.105724.3803415580036211483.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 19:07:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: IKVHVHKVCGZCDGWOIHVVA2J67KLQNOHL
X-Message-ID-Hash: IKVHVHKVCGZCDGWOIHVVA2J67KLQNOHL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKVHVHKVCGZCDGWOIHVVA2J67KLQNOHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Oct 2024 01:28:10 +0000, Kuninori Morimoto wrote:
> rtd has own ID, but it is naming "num" for it. The naming is confusable.
> This patch rename it to "id".
> And many functions request both "rtd" and its "id" as function parameter,
> but rtd itself has rtd->id. This patch cleanup it.
> 
> And, Qcom driver want to use irregular rtd ID because of its topology,
> and thus, soc-core need irregular calculation. I'm not sure why only Qcom
> needs such calculation, but this patch also cleanup it.
> But I guess we want to cleanup is not soc-core but Qcom side (?)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: rename rtd->num to rtd->id
      commit: 40e47e2db6864aa053a62477bd71a16be9dd4066
[2/8] ASoC: fsl: switch to use rtd->id from rtd->num
      commit: eae33f737c7a929d92b559fe1a1002d597b7b903
[3/8] ASoC: meson: switch to use rtd->id from rtd->num
      commit: b19f75df8fa9f8d4aa8b5886dca0f2d832a76baa
[4/8] ASoC: sh: switch to use rtd->id from rtd->num
      commit: 970a874b76d09d6a5880e8832e572850cfcb4008
[5/8] ASoC: generic: switch to use rtd->id from rtd->num
      commit: 742e622db67efc32affb5893fdcc0149f374533e
[6/8] ASoC: remove rtd->num
      commit: c59db5ed233a19f6aadd086fb89149ec5f6fa855
[7/8] ASoC: soc-core: do rtd->id trick at snd_soc_add_pcm_runtime()
      commit: cb18cd26039f5cdecb0ac53fb447b6f0859f3d1c
[8/8] ASoC: cleanup function parameter for rtd and its id
      commit: 8b12da9a18f4dd53e4b3a7393829a555e84f073c

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206FA6C1FBA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:32:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35D21DE;
	Mon, 20 Mar 2023 19:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35D21DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679337175;
	bh=UX0KNBrfaHWjg27sM+jbAaSTv4YTjtaGVwsG4hFjvOo=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FnzdaAA8FJuhgAbXZUsvYLTk2y5JPX8m0UpBYpNSwcj2UYsHNE9V862I4122JnILf
	 M2y4xgS4dlwCxG4gCdJNKsQSsBksECfT8sU6Mg/XROHx9V8rUHoJTuNvY66TCgiNy6
	 NnP7fj47y1KwA2DOFqP32FTBjgXtO4MgFPJTcjMM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAF19F80254;
	Mon, 20 Mar 2023 19:32:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86299F802E8; Mon, 20 Mar 2023 19:31:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60E90F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 19:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E90F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gKknHFPc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1160B8108F;
	Mon, 20 Mar 2023 18:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F56C433EF;
	Mon, 20 Mar 2023 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337106;
	bh=UX0KNBrfaHWjg27sM+jbAaSTv4YTjtaGVwsG4hFjvOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gKknHFPcLo78NnBNJVeeZKcUzj8MRPZY8qxbRLHQW22jfEyhQLFgVJS1SFP8WepUE
	 rSQXKxzoSCLrfjZjufMNQzGzTBRO+E2x7w3sBpb0gzaB2BCBHo6197kKyTGiP7CyCX
	 fsSFnNfudxnPxJ0v2lDDXAiIYMyNbj+SV/y1AOfVmsbvFzBA4rzr37EqcTmD4SppmO
	 rWpv9IS1xSqOydS0av20N01i/OmTyABTIC7nS22408X3RXVl7AmvLhgoBBgTqG3RhY
	 kjESvV0/k+kbdfV/zKx6/vgkc+Uk3RJfGkBE5/4VyDaFLuY9h41AYS9g+MzkbH9x+u
	 hSz4YO/zKfbmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Fix sound on ASUS Transformers
Message-Id: <167933710348.198283.16107220354236772396.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:31:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: UJBGURDGQVLDOJUE6WH67ZBWQNN53S2X
X-Message-ID-Hash: UJBGURDGQVLDOJUE6WH67ZBWQNN53S2X
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJBGURDGQVLDOJUE6WH67ZBWQNN53S2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Mar 2023 09:34:54 +0200, Svyatoslav Ryhel wrote:
> - add quirk for headset detection used by some T30 devices
>   (ASUS Transformers, LG Optimus 4X HD and Vu);
> - add RT5631 and MAX9808x machine drivers
> - update bindings
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] dt-bindings: sound: nvidia,tegra-audio-common: add coupled-mic-hp-detect property
      commit: 2a7a8ebe85e1fa7e929f6f986a61f10321093c43
[2/8] ASoC: tegra: Support coupled mic-hp detection
      commit: eb0b8481c2e03a5ae01f6bea60b42109bd12b6fe
[4/8] dt-bindings: sound: nvidia,tegra-audio: add RT5631 CODEC
      commit: 2060c9b8ae2a1f6abec483709f4209b6e3602b89
[5/8] ASoC: tegra: Support RT5631 by machine driver
      commit: 44b2fc2edb61e956885b4305bddaaec7f05d93d2
[7/8] dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
      commit: 85a375fe8df906b2701346e03e71501e6861a75a
[8/8] ASoC: tegra: Support MAX9808x by machine driver
      commit: d007a87bd7d181854b53b3e7fcbcf66c4bef86b2

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


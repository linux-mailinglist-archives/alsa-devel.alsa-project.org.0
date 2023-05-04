Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC556F650B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 08:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD481816;
	Thu,  4 May 2023 08:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD481816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683181870;
	bh=DGzMu0UR7qN4Ii9z2Wd1dG3vUxw/CpUhnj22tEjzdSM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQhlkIR8+0v4Phxk99uuJ8oz12STx14+mqOgWpfqHBFFD0SzMyNotrtPD4qF3kb0C
	 zfJshat+mLaTgJCN+ezt4tQ4ct0LQky6OFnjHd9ycnbD/moA034/K6XzKKp+U8Ay6r
	 kAPeT7gYSSm7bYovsgYCVCIOlqExSmfIpxrome3M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 244ECF80542;
	Thu,  4 May 2023 08:29:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B650FF804B1; Thu,  4 May 2023 05:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FROM_ADDR_WS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD500F8032B
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 05:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD500F8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nQHO35IK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE8816312D;
	Thu,  4 May 2023 03:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF4FC433D2;
	Thu,  4 May 2023 03:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683170435;
	bh=DGzMu0UR7qN4Ii9z2Wd1dG3vUxw/CpUhnj22tEjzdSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nQHO35IKqfq0O1z7tvOkFLvPe5PPBdb+YauC4JNw1vFpdhubxuUcfC6jA5bMYptKQ
	 CMduH4nTVm6JUn0s2Cw7/eHoavnGLROwRsrhwU0ofi4cyP+UEr7OWoloYV9Yzc1nbu
	 yaqS1fYcoZueseLSFUWpsvtZcuaMVdE+GzU+dDjkdxleDl4G8KDlRd0+tOp5Yt4G/L
	 EOu8ZPWSZQh5jHuWgfxBqzWswIe6plBYJGTWdYMAZtR9bkV1Fx8rJp0u2axojPDmKU
	 prfeSGkBBBdolEl9aBeCC7tuRQXsrjGRnnlqDpr4CEbi7FKXUtuxbGUz9owY1G+dXl
	 153LCFv7y4+fA==
From: Mark@alsa-project.org, Brown@alsa-project.org,
	broonie@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503144102.242240-1-krzysztof.kozlowski@linaro.org>
References: <20230503144102.242240-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: wcd938x: fix accessing regmap on
 unattached devices
Message-Id: <168317043288.151112.17600562636595871953.b4-ty@kernel.org>
Date: Thu, 04 May 2023 12:20:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D2ZV6MMHEFCAV5BILG4HSZNO5DDRVHHR
X-Message-ID-Hash: D2ZV6MMHEFCAV5BILG4HSZNO5DDRVHHR
X-Mailman-Approved-At: Thu, 04 May 2023 06:29:39 +0000
CC: stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Patrick Lai <quic_plai@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2ZV6MMHEFCAV5BILG4HSZNO5DDRVHHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 May 2023 16:41:02 +0200, Krzysztof Kozlowski wrote:
> The WCD938x comes with three devices on two Linux drivers:
> 1. RX Soundwire device (wcd938x-sdw.c driver),
> 2. TX Soundwire device, which is used to access devices via regmap (also
>    wcd938x-sdw.c driver),
> 3. platform device (wcd938x.c driver) - glue and component master,
>    actually having most of the code using TX Soundwire device regmap.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix accessing regmap on unattached devices
      commit: 84822215acd15bd86a7759a835271e63bba83a7b

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


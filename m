Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1AB74A064
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 17:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4060483E;
	Thu,  6 Jul 2023 17:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4060483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688655941;
	bh=QB/NVgqudtKMYDSKl52FwcM9ZO7WuIvYj3VPAY1XOWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KE+dJoZPw3NNFhR1DdIHk0mTu7CfnV8Qdz4iDWwF6x6Qgjx+X8EnVPgJjK5fBDRgF
	 FjKu13qDIYeksEz5DrJJdX85f1mqIRYPrwv4XnqfoePsXUC3K6HqcS/kqKj3ATxt1J
	 cxOyEDV1tEO1Kkbocr7dyPCGrO7pY/5/vvla0xP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A110AF80548; Thu,  6 Jul 2023 17:04:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EEEF80548;
	Thu,  6 Jul 2023 17:04:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA93CF80124; Thu,  6 Jul 2023 17:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E9BEF80100
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 17:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9BEF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AiWsV1UZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C7F7608CC;
	Thu,  6 Jul 2023 15:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFEFC433C7;
	Thu,  6 Jul 2023 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688655828;
	bh=QB/NVgqudtKMYDSKl52FwcM9ZO7WuIvYj3VPAY1XOWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AiWsV1UZe9nYCN1oDnixoZcs0hFazd+ZK1PSvjsd3n5kNzYtnByc0DXBGHgh4KUEi
	 5JnekE9PK6XsVl9I8+HQBg8C57ee+/8qGHzqZE4EnX7htiRoiReapNrT7JjqsdSNFN
	 6jDDUoDVtZa0MQg1kIjFRyNyNSL0uPDF3Elib10PMk3RlniaHmRUicSP53KXVNw5IU
	 wcJNaS+XVS6+iUVxx2Zo7j23nG68FJgnxZ6OHGVoeozQm2EMPL5uCoL+qPFkRoK08z
	 qHs6NvbclGxHZqoi/zFr5dsb3HsjtZiks3mfXngDeNNgeuQShDktnh/Afnl7Q98YO/
	 LSo7PRBAxr9Kw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
Message-Id: <168865582683.36989.12106598121832751013.b4-ty@kernel.org>
Date: Thu, 06 Jul 2023 16:03:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 5332H4IM6BSC3AKECZOF4V5JBI7DD3S2
X-Message-ID-Hash: 5332H4IM6BSC3AKECZOF4V5JBI7DD3S2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5332H4IM6BSC3AKECZOF4V5JBI7DD3S2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 13:57:23 +0100, Srinivas Kandagatla wrote:
> dB range for HPHL and HPHR gains are from +6dB to -30dB in steps of
> 1.5dB with register values range from 0 to 24.
> 
> Current code maps these dB ranges incorrectly, fix them to allow proper
> volume setting.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
      commit: c03226ba15fe3c42d13907ec7d8536396602557b

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


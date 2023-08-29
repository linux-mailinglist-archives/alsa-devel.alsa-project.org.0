Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7C78CCB0
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 21:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F851E9;
	Tue, 29 Aug 2023 21:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F851E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693336398;
	bh=Zhedh8PAzSNPe4tiegHKDd4Vg+y78P6BVknH0uInuZc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dbOOzUefTbicbBnkvN5DgxzZ8ICzYmwB+l9gfgBZ96XdtteLR3IXusrw4kNYh5m4r
	 THpYFnnTAIb1dG7LKSZigliP7/sB98Mv/zbCsFDQHiGp7pKaw/GG6+aGE0gJWC2jWH
	 KR+fmNNOTK3gVNySLXDT8Lmx/hFPvu4L2UdbhlXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78A32F80236; Tue, 29 Aug 2023 21:12:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1973F80005;
	Tue, 29 Aug 2023 21:12:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A16F5F80155; Tue, 29 Aug 2023 21:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA139F80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 21:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA139F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u4qhLUK4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6508A61802;
	Tue, 29 Aug 2023 19:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23CBC433C8;
	Tue, 29 Aug 2023 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693336336;
	bh=Zhedh8PAzSNPe4tiegHKDd4Vg+y78P6BVknH0uInuZc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=u4qhLUK4QQxgMN5Em2HOi/x+A+hTZM+tmUx8Fw4CpwEkpi63VpfndpkPKSsUpZwH7
	 +pPMqIJvEP3pjoB/gjZvPqlwJZ617m7mv0KDvGm6X18IIwI4gB1ag+7uMnKnIPKuPS
	 KHTWmxYq7E6DJyIWVhRxLx4DjP3bTa2suHCF31XPjS9//cDwSZlL3eMXu/3vhr9p+z
	 JtrcLC13twMHEeKxsDV48mWwsRUSOgpYqn2tlP1l45ujggsEFGHrcmIjfVo+Y28SAA
	 WXI6A6ISpAjx4VQI+NPWOvQ00ZpGbpA7heyXLNLZO0W7uq6kXHt29QO68qkHlGz056
	 /CSI+S3p1Rrqw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230828132316.190386-1-krzysztof.kozlowski@linaro.org>
References: <20230828132316.190386-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd93xx: fix object added to multiple
 drivers
Message-Id: <169333633189.3145573.6095959163890886616.b4-ty@kernel.org>
Date: Tue, 29 Aug 2023 20:12:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: QMW5ZONU3BPCUQVDFNSIQ34QCA5AP6BO
X-Message-ID-Hash: QMW5ZONU3BPCUQVDFNSIQ34QCA5AP6BO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMW5ZONU3BPCUQVDFNSIQ34QCA5AP6BO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 15:23:16 +0200, Krzysztof Kozlowski wrote:
> Three Qualcomm audio codecs (WCD9355, WCD934x and WCD938x) use the same
> object file wcd-clsh-v2.o leading to warnings:
> 
>   Makefile: wcd-clsh-v2.o is added to multiple modules: snd-soc-wcd9335 snd-soc-wcd934x snd-soc-wcd938x
> 
> Convert the wcd-clsh-v2.o to a module to solve it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd93xx: fix object added to multiple drivers
      commit: 11b0b802f8e38d48ca74d520028add81263f003e

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


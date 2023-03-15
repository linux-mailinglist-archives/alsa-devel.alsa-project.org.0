Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C26BB51E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:48:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6571253;
	Wed, 15 Mar 2023 14:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6571253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678888127;
	bh=SbeGpheoaIH+3SHeZqV2seC5XyA53aIcklBW6utJOhc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qfi+wXalfUks9LpgHEeIdzDJzb+u3GStUszI0JRm4QINek2yyfafAEh3HuHsz8h5G
	 bTuXAtLrG6SrlSBJGxR1wHTB/AkzaCDnR1SShFTvN++0rSlUe5vNj/zZfoVnuGf5iL
	 ifiGTIQU/M3iFKIzJhFyAMhDfApFpbjEtZY0DkJg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B604F8032D;
	Wed, 15 Mar 2023 14:47:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66165F80423; Wed, 15 Mar 2023 14:47:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CBD1F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBD1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QKPE5sYv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2647061D90;
	Wed, 15 Mar 2023 13:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8FAC433EF;
	Wed, 15 Mar 2023 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678888069;
	bh=SbeGpheoaIH+3SHeZqV2seC5XyA53aIcklBW6utJOhc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QKPE5sYvdi64orFsHFqoGpw48cXbVJ5GgV/C61EV5vDdNa89OKJ5iXPj5tGIzAALP
	 22M2r0RQRl5PlJVU0st+tEv873qOmbppjmfx1yndsJMBubOD9D+tf6NbDZcR8/Hvqn
	 lFgKeHXqMDTevpLn+gDAuvBR8T2pBqX3fmzFO0Zy+6/+C7OobfDx+LL9vxEm18Hk0/
	 DJTwNGMRjXo1N/T5s25FVBjixMOLxCvWDQ0WcXf6jskdC7MySCRBWYtFkNBHKS3FTV
	 +XenpdoOPrXiGRZiD2OTK1WjXf2H4pVMIZboixtXbaHAPx96TeOkXP8scUNvkw/iQB
	 HBdlhWMSZdtUA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: 
 <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
References: 
 <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: rsnd: Update example
Message-Id: <167888806765.29884.1943433797878845928.b4-ty@kernel.org>
Date: Wed, 15 Mar 2023 13:47:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: I3LRU4JBMQDUL46LFBHOPGJLM57FTZKE
X-Message-ID-Hash: I3LRU4JBMQDUL46LFBHOPGJLM57FTZKE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3LRU4JBMQDUL46LFBHOPGJLM57FTZKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Mar 2023 11:48:59 +0100, Geert Uytterhoeven wrote:
> Miscellaneous updates to make the example match reality:
>   - Correct SSI resource region size,
>   - Complete half-conversion to new-style CPG/MSSR bindings,
>   - Add missing power-domains, resets, and reset-names properties,
>   - Use interrupt binding definitions instead of hardcoded numbers,
>   - Correct interrupt flags,
>   - Drop double blank line.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas: rsnd: Update example
      commit: ff750f8e9464e368fc92941553c9c385644ebfc1

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


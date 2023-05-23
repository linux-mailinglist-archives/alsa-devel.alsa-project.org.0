Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811B70E79C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9C0206;
	Tue, 23 May 2023 23:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9C0206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878306;
	bh=aMl8XSo6MAGNcouj2r0VodRBmRxEH/7FWMSr7kUooIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ALGKKqy/uwqwpwgUEWKXKDBzxyrWeesZJ8wErqKHH7rTfqr06oa0ZOkQSfBzJU8po
	 FJyA3x073C8eHJmQN4UpiEfcEhHSabY0pjBUeV3ZgmkBkkP4oXGFXXi5YnI7RMxSVZ
	 6foc7oTlVtO0l9WevfoqvjFmiy3KIwwZ/fsmHnK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81A00F80542; Tue, 23 May 2023 23:44:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F5DF80249;
	Tue, 23 May 2023 23:44:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C40F6F8026A; Tue, 23 May 2023 23:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2FB9F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FB9F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tjSA5U+N
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCB99625BD;
	Tue, 23 May 2023 21:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D798FC433D2;
	Tue, 23 May 2023 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684878245;
	bh=aMl8XSo6MAGNcouj2r0VodRBmRxEH/7FWMSr7kUooIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tjSA5U+NoSiz6ZoJmbQJK45dwGsdDMEhNmzvUZaejH8oRc2vJlqaDRTZUflFch0rd
	 DnWr9fz+bio2zkQHI3MY1gpw+qbTpkQ2rgcPF5c5F5AfaBBbQiaU0jny6DtFW7Z/KO
	 nQQvwBCemNOgUPPwpBu6VLMnCTjllEH/TKAhxGbkDSrWfJTFpeu8zuKVEMJg1tcrAo
	 U9JqoAbRAITAfxrmx7AhMdVY1ocNyav7ZhgVyaSDg8VgIJDQCSWFokDkvahFvNgWdu
	 U/xYu/ULg5ZsaJQN0i+MuiKcIr9kgucz0bPYjNNxUqzZxs7gpu5eehmGBlrikH/AjJ
	 q/AfUqIMRvTsw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: bicycle.tsai@mediatek.com, ting-fang.hou@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230508071532.21665-1-trevor.wu@mediatek.com>
References: <20230508071532.21665-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/4] ASoC: mt6359: kselftest fix and driver extension
Message-Id: <168487824257.297010.16948141699377522681.b4-ty@kernel.org>
Date: Tue, 23 May 2023 22:44:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: Z5543WGLFOUMS4BIJYPYAHD6T6KSKS4M
X-Message-ID-Hash: Z5543WGLFOUMS4BIJYPYAHD6T6KSKS4M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5543WGLFOUMS4BIJYPYAHD6T6KSKS4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 May 2023 15:15:28 +0800, Trevor Wu wrote:
> The patch series includes a kselftest fix and changes for extending
> driver capability to support more use cases.
> 
> Trevor Wu (4):
>   ASoC: mediatek: mt6359: add supply for MTKAIF
>   ASoC: mediatek: mt6359: fix kselftest error of playback gain
>   ASoC: mediatek: mt6359: add mtkaif gpio setting
>   ASoC: mediatek: mt6359: update route for lineout mux
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt6359: add supply for MTKAIF
      commit: 1a3eb4bb9826fd317358113ca048ed60184c6442
[2/4] ASoC: mediatek: mt6359: fix kselftest error of playback gain
      commit: acd4d219798769a6c1080bcfa7953e165dd8d681
[3/4] ASoC: mediatek: mt6359: add mtkaif gpio setting
      commit: 24f398e74ba0a53bc95421f7eb139f4dc0207bb2
[4/4] ASoC: mediatek: mt6359: update route for lineout mux
      commit: 104ce27bcbfb204001a300498aa192235bd0836f

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


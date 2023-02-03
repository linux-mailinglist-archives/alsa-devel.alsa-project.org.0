Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FC689C6C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F9B844;
	Fri,  3 Feb 2023 15:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F9B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436327;
	bh=HBW7gQQhXYjcv51yj9Mg8t0xqUMKWXdcmuW5/POrA4I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Rnb+OUjPWrTcHwNV3qwpSuegcCx6CAlpdJkqArA4Al9CZQaEG3MoWa1wjfTBGEslX
	 Ji1cU4BljIQFcgXBrzcxojxk0uvBjVW+u814PjOj7WicTCG4iiRhBmB9Kj8XIjlRFs
	 2XKuGh9icql7ipzahTaI+mCY8HXo8K6DZ1VzALGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD18F80567;
	Fri,  3 Feb 2023 15:56:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6CF4F80543; Fri,  3 Feb 2023 15:56:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A333F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 15:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A333F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rJ69gpF9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7FFC61F65;
 Fri,  3 Feb 2023 14:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF24C433A0;
 Fri,  3 Feb 2023 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436174;
 bh=HBW7gQQhXYjcv51yj9Mg8t0xqUMKWXdcmuW5/POrA4I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rJ69gpF9aipo4mKw2c/YxbUOTxC9hSsdzvi2N6dixE54ys38FTHnMDle5M9hPbvBr
 8X5xuBSYak2+bVBIEVqZVuA58z4qW6MOLZ3m0i0u7JxXMpL2ELo/TUQIr+5+h58ZJr
 JyWfj8hkOSE/FQuVgomrX2FA31hdMIwSuXIvzo9gAnGyXQdIhw4Ep6U411acOtIxOa
 Co4G1BXvJv89u/mItFYOI+nl1N53XLiDnONGLE1iPbP1xPYr2ZBJKwJ6YWu3F/ljL0
 GeW23JfwFjhz4kIpzLgplML4md+fwK2pGF++KLkRLPnw0ycYVR2zUfK92ZJCkA94FF
 VhSGrgIpOMXoQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20230202103704.15626-1-trevor.wu@mediatek.com>
References: <20230202103704.15626-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove etdm dead code
Message-Id: <167543617210.928818.16034479848573995520.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 error27@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 02 Feb 2023 18:37:04 +0800, Trevor Wu wrote:
> Some Smatch static checker warning like below was found.
> 
> sound/soc/mediatek/mt8188/mt8188-dai-etdm.c:2487
> mt8188_dai_etdm_parse_of()
> warn: 'ret' returned from snprintf() might be larger than 48
> 
>     2479         for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
>     2480                 dai_id = ETDM_TO_DAI_ID(i);
>     2481                 etdm_data = afe_priv->dai_priv[dai_id];
>     2482
>     2483                 ret = snprintf(prop, sizeof(prop),
>     2484                                "mediatek,%s-multi-pin-mode",
>     2485                                of_afe_etdms[i].name);
>     2486                 if (ret < 0) {
> --> 2487                         dev_err(afe->dev, "%s snprintf
> err=%d\n",
>     2488
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: remove etdm dead code
      commit: 66b9e94cb7783d3c632e2c1b436b26ece8c14e5d

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


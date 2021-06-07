Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FA39E710
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 21:03:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E321696;
	Mon,  7 Jun 2021 21:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E321696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623092583;
	bh=J8w8KAlkN7B4v37ixjZzDlO3BVXLqJksW6PfS1AlNMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUDOXjoHwjhE8qBSAa6rAopwljA66H8ixXXCf77jwvw93MP3I6ZlKKD0PzrOspLGc
	 diI2BQMZzXW3TP/uZdApy761l++QW1AZBM0VPy0Kj2vJ6F7mae5VlFWuWHNIgNNTGT
	 3+cXJQg6OxQQrZMtI8W3algmUQLAYLt1A58Xjqzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4331FF802DF;
	Mon,  7 Jun 2021 21:01:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE29F80212; Mon,  7 Jun 2021 21:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80C72F800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 21:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80C72F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MbqBrLia"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8981561153;
 Mon,  7 Jun 2021 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623092475;
 bh=J8w8KAlkN7B4v37ixjZzDlO3BVXLqJksW6PfS1AlNMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbqBrLiaFtOjM5nM0sAJzJwZCFu/MaOlOdAIn3cWltJ726PIWgT3d1uvVPe4qlCFK
 ffHm4O5Uw7dYS/f/npPXuJ6Dd/lNTyXHl8yCsI7o8oTj4dprr8d6aAgiZEXtXwXGMb
 E93GBfcyH3lFVi/ebmQQbYs8DyFEdg3cX8Ak4JHTdtJwjt8DbG6w5DdfeuscW+C4Le
 9a5bVuPxrP/k+zdthrAOsIyDxSIolEv0fOpCYYDpUotEgijtP9zGsFKHDJdd8CXlej
 aOmcNtsgBIrzuMpGSbvxT5/JgoWHgYSKu7wqT5xGGB35SHzRZPZ/RnCh+0GiHhLvMa
 digfLxflhTjQw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/7] ASoC: adds new .auto_selectable_formats support
Date: Mon,  7 Jun 2021 20:00:45 +0100
Message-Id: <162309220524.30523.199749382291258220.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87k0nkncaw.wl-kuninori.morimoto.gx@renesas.com>
References: <87k0nkncaw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27 May 2021 11:24:55 +0900, Kuninori Morimoto wrote:
> These are v3 of "ASoC: adds new .get_fmt support",
> but renamed Subject.
> 
> This is a little bit challenging patch-set.
> The idea/code is almost same as v1 / v2.
> v3 has "priority" support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: soc-core: move snd_soc_runtime_set_dai_fmt() to upside
      commit: 4d1a98b5f1abaad0ba7177fdb389a9f78584bc3a
[2/7] ASoC: soc-core: add snd_soc_runtime_get_dai_fmt()
      commit: ba9e82a1c8919340bee0dd7f7cafb8749810aabe
[3/7] ASoC: ak4613: add .auto_selectable_formats support
      commit: c50f381afcab30125e43258bba9316054c4ddfac
[4/7] ASoC: pcm3168a: add .auto_selectable_formats support
      commit: bea63e8bbe3326c3e2d5540edc90a7cd2ef1ee9a
[5/7] ASoC: rsnd: add .auto_selectable_formats support
      commit: 0292176522566fff8db524e38ffd0cb28398b736
[6/7] ASoC: fsi: add .auto_selectable_formats support
      commit: af69f47df1fb494e6d8050e0111dfc7d75079fd6
[7/7] ASoC: hdmi-codec: add .auto_selectable_formats support
      commit: 68d8b7ba360f01babe56887f37a679e981833bb7

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

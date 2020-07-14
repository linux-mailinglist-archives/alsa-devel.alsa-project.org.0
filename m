Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25321F789
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F601673;
	Tue, 14 Jul 2020 18:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F601673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594744989;
	bh=+GOzeB54xEa7lMeGQHJTOUR99xtA63/cUSv3UD0Fw4c=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSU0muuogo7N9+E5sPk+D6wgZXsd1OQuzNbIMRYsiPF+bKd/KasTyneN2XBzGulcS
	 BV1jXorE71Y6EY99BE48wl7IpVbE9zold1Y5GXtxk/Mb6pZGPOJPb2mVTZ6cYsmadv
	 m//SHP2PmedkJ7vf5AtplvvF/RuCORlO8VxSAi5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07861F802DC;
	Tue, 14 Jul 2020 18:40:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77CF8F801F2; Tue, 14 Jul 2020 18:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FA9F801F2
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FA9F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JxcWdKn4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03A9222518;
 Tue, 14 Jul 2020 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594744796;
 bh=+GOzeB54xEa7lMeGQHJTOUR99xtA63/cUSv3UD0Fw4c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JxcWdKn49A5w00FT/ft7dy8N6E3ZwvYF8oqk58svxy8aGVg29TU06Zehss2gAVKWJ
 NbIhWq3uKwUmPJyp2YDRV/xNCuRofGObXSYfFVdx8JaLOz/+d0wDRFHF/IcLjKt2mb
 lg+2yQFJmLJ8sEPHYbP5lhoBP7EbeQ8/RmA7xfDo=
Date: Tue, 14 Jul 2020 17:39:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r1tg3swv.wl-kuninori.morimoto.gx@renesas.com>
References: <87r1tg3swv.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: sh: remove discriminatory terms
Message-Id: <159474477217.998.15107372479126412038.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 13 Jul 2020 14:07:43 +0900, Kuninori Morimoto wrote:
> rsnd / fsi are using discriminatory terms.
> This patch-set removes it as much as possible.
> But, because DMA related API function name, it still exists.
> I hope all these are removed someday.
> 
> Kuninori Morimoto (3):
>   ASoC: rsnd: don't use discriminatory terms for function names
>   ASoC: rsnd: don't use discriminatory terms for comment
>   ASoC: fsi: don't use discriminatory terms for comment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rsnd: don't use discriminatory terms for function names
      commit: 25b384b8eabb65bc6546dc2e98e93816dd734a52
[2/3] ASoC: rsnd: don't use discriminatory terms for comment
      commit: f7c7a24b7d0c94f7f0fdaac08c25772e152bfed1
[3/3] ASoC: fsi: don't use discriminatory terms for comment
      commit: cf01245db89922e4ec2404aaf527ca3d567c4e5e

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

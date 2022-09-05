Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF45AD6B1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:39:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A37164F;
	Mon,  5 Sep 2022 17:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A37164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662392393;
	bh=2eTMf9jyjQuoeYXCnEFux0RJ/4pdijWknLgbDxhEujM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITeclwKgtOhroQBqoM4UPox38TmCbfIs2kQvSCwsxxcBZbThX8u8OpGPOnFW36XlB
	 fPWxIiFjndC2D4WPTyiXBCXIQ/7KSMCsgQet+fzwv8Bn0kVJ6kB3KrVMQRM+1LabtC
	 y6DbJjcayWRUblFNG5hVCnJahF1JjK6aYANYtezo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40892F8032D;
	Mon,  5 Sep 2022 17:38:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC20F80238; Mon,  5 Sep 2022 17:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F56DF800E8
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 17:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F56DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mG2ZO4yl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F898B811DD;
 Mon,  5 Sep 2022 15:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB93C433C1;
 Mon,  5 Sep 2022 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662392327;
 bh=2eTMf9jyjQuoeYXCnEFux0RJ/4pdijWknLgbDxhEujM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mG2ZO4ylWm/pMZw4/U0rGYjzwcG6pak8jcTjRVG6rfBE+uhvCAK4Rguf3Kli+BlLg
 89CUNn5gdyv1jtgePKMQ35cKYMQNmkfK71+UbnDcGxuApM9CPuQPQR+nmKrWOPgemk
 VbGC1LpHc3fq4mG3qpoNko4xe0zb4QnFoLrLwX+/D6/xmLmaAECf+ALX8bkyJ9FIn2
 tzBtfTngdRML/feq40WsZ2HLFq4pQkYJkoWY0MEYfFHUmjQ/W9iCsSYSqqQ9q2kDZR
 9J/oafHO315ZhXG0mIhChkKUyVhPq/Ca9TjnyTondXpV4hFd4A9BCfCZPlK2h/E+bS
 tEXQ8wSA6HWSw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: soc-pcm.c: random cleanup
Message-Id: <166239232634.736206.7347915789291842646.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Tue, 30 Aug 2022 03:16:35 +0000, Kuninori Morimoto wrote:
> These are not related, but random cleanup patches for soc-pcm.c
> 
> Kuninori Morimoto (3):
>   ASoC: soc-pcm.c: remove unnecessary codec2codec_close_delayed_work()
>   ASoC: soc-pcm.c: add soc_pcm_ret()
>   ASoC: soc-pcm.c: check fe condition at out of loop
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc-pcm.c: remove unnecessary codec2codec_close_delayed_work()
      commit: 10d5d8cbf6268e612bacac29c0beef489d3c1398
[2/3] ASoC: soc-pcm.c: add soc_pcm_ret()
      commit: 041107289c5cebb0693a55c432ab50862a450476
[3/3] ASoC: soc-pcm.c: check fe condition at out of loop
      commit: 6932b20d4f41dc01dc58c0afb335e688575c7d54

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

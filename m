Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D964606C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 18:39:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52CE217F7;
	Wed,  7 Dec 2022 18:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52CE217F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670434744;
	bh=+TAgcM6IIYThNuWu5Z8xJ21gWH+pc54KBLLLvEE45RA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOqIjRBG3x0OAQGtQ9MZ/atyOonKkJM/jM/565PLia4F/c/OR22nxR1HMpZZV/kZU
	 tzVUMlmEwx7p8sedGAM/2wqT/kWvRd8bZH2OmxO/GljnWkdiO8PfxNCohfW/QGEmpe
	 yi3kdKSpnsTvSBrwcNCy4iUy/0jWlcYu0muV9pPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB99F80526;
	Wed,  7 Dec 2022 18:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 595D5F8021D; Wed,  7 Dec 2022 18:37:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3FAF800EE
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 18:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3FAF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="isPBUwl2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0D1BB81FE8;
 Wed,  7 Dec 2022 17:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E70C433D6;
 Wed,  7 Dec 2022 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670434653;
 bh=+TAgcM6IIYThNuWu5Z8xJ21gWH+pc54KBLLLvEE45RA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=isPBUwl2Ju/UVzfGtYAKkxwNPPwFpmJE3oCHrA26OsUcqIkciWVz8PH9K3MSY44Wq
 ZkqfK4jONyvmo/ZOc9mPdzuTLB6HkTvs3wiRUyn5wbOWQnlbs358SeVeXQVuPzghoa
 jytxQK4pEMnB2IZyEH/bBFyb2OAvZ5lp5rmtMkNuz4BUHqbcT+YLXchNy4jk1+HPjB
 2Voekic0yQdH4S5RQYA+R5rlzSmPI4hkRPT6Gk/8KmCBUEyXPXBB8aSjdP6pHcgpkc
 LOUyhbQJDtypzTq5n77+GkWW/ZcSadz++57N79sF0IZpNPzRxDIjZ+Fd7fDG0VYQoz
 FrP3WPYlvDLvQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Wang Yufen <wangyufen@huawei.com>
In-Reply-To: <1670228127-13835-1-git-send-email-wangyufen@huawei.com>
References: <1670228127-13835-1-git-send-email-wangyufen@huawei.com>
Subject: Re: [PATCH] ASoC: audio-graph-card: fix refcount leak of cpu_ep in
 __graph_for_each_link()
Message-Id: <167043465144.393374.778239377734908576.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
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

On Mon, 05 Dec 2022 16:15:27 +0800, Wang Yufen wrote:
> The of_get_next_child() returns a node with refcount incremented, and
> decrements the refcount of prev. So in the error path of the while loop,
> of_node_put() needs be called for cpu_ep.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
      commit: 8ab2d12c726f0fde0692fa5d81d8019b3dcd62d0

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

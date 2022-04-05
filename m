Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263D4F297E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1621813;
	Tue,  5 Apr 2022 11:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1621813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151282;
	bh=Fzz3ascwScSN8mlgX8AOFuaHlsRdXJCzGKE041uMtYo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UM9kCh54cxVEL5vmYisqt1NPUcU54CgfAW4ht2cHRzSTizDoElFg+IggYkgbu51BY
	 FjUYezFpQkSjLx2LfIwK95+ZlLZpq9Aczpo0K5pQmxi0UZMdjc8cJGKLeCX/DCcfl2
	 3UKcLKueFV8yJFYsYHZldrx6WGFgaacAv6v1IAO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7698AF8053C;
	Tue,  5 Apr 2022 11:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54A1FF8053E; Tue,  5 Apr 2022 11:31:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B755FF8053B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B755FF8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sO1+eaDG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C89BB81CBD;
 Tue,  5 Apr 2022 09:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984E1C385A4;
 Tue,  5 Apr 2022 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151084;
 bh=Fzz3ascwScSN8mlgX8AOFuaHlsRdXJCzGKE041uMtYo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sO1+eaDGwua4hTwxsxWvwQ4f9PWir/mw48Nu5p/k7OyC6gmrvDP7lBnwF26eLUenH
 jfTfrQ5J/fLHjSaBEVrKDonwR9/M/NQDyihJIxaYf90frnR2KGF3kh0133LJxoKxnl
 rkwuSapewEPukF55NcBd7yNegPZdodUzzybuLVpAD0V5IuQymM1e+BJ96bj77VvxKv
 MAfbAedBidV7QuIggcgG8TEo/2CdqSZ97cn8CmHYJw8hjsSUZ7wCHemNSspUcV6YVa
 y3/dtTe3HYOc7GvBbNT/Cj1OItEF9L5+q8xwf+DBvWaCqb37ZPyPxkTt6RLOqdQ+I/
 0/aG2LQwVKxJQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, xiam0nd.tong@gmail.com, perex@perex.cz, lgirdwood@gmail.com
In-Reply-To: <20220329012134.9375-1-xiam0nd.tong@gmail.com>
References: <20220329012134.9375-1-xiam0nd.tong@gmail.com>
Subject: Re: [PATCH v2] soc: soc-dapm: fix two incorrect uses of list iterator
Message-Id: <164915108235.276574.3850661736822524747.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Tue, 29 Mar 2022 09:21:34 +0800, Xiaomeng Tong wrote:
> These two bug are here:
> 	list_for_each_entry_safe_continue(w, n, list,
> 					power_list);
> 	list_for_each_entry_safe_continue(w, n, list,
> 					power_list);
> 
> After the list_for_each_entry_safe_continue() exits, the list iterator
> will always be a bogus pointer which point to an invalid struct objdect
> containing HEAD member. The funciton poniter 'w->event' will be a
> invalid value which can lead to a control-flow hijack if the 'w' can be
> controlled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] soc: soc-dapm: fix two incorrect uses of list iterator
      commit: f730a46b931d894816af34a0ff8e4ad51565b39f

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

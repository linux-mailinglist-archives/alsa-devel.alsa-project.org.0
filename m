Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E0452A78A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 18:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F097AAE9;
	Tue, 17 May 2022 18:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F097AAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652803276;
	bh=HhBecZ0/0C++sVEsHjpIv1pbIB0KELfp5GVr+V5tmag=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mawJnCkb/wrr7obtqaTYNvZ2s+B70/JvykTQ8VYuzJKcDL4Jxil5lbEziIyhIwIl5
	 +6N3vw8+HTr7VrM2bRpZjMc8DqazHEPK+O57Tv/y78Y49Gtr2F+E6UCBJFNmOLh/sR
	 A4lVp+q9LJLQ2XOLQ4DARCANlHGTdwJMvp0mUZK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70830F8051F;
	Tue, 17 May 2022 17:59:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D539F80423; Tue, 17 May 2022 17:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C2EFF801D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 17:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C2EFF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DxItctP5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6E7EB81AB2;
 Tue, 17 May 2022 15:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB2FC34116;
 Tue, 17 May 2022 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803170;
 bh=HhBecZ0/0C++sVEsHjpIv1pbIB0KELfp5GVr+V5tmag=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=DxItctP5gYRBhGRnJYuIlPvB+JbtsBMJ0TnVwULf86ngLiQ9TJRpgqOb2Zomc8zxE
 bveWrVURMhsqD4oLrADLkO6FEOlXltAniwgUzlo/L+ythhY07hNVYlbZXtRl88Hmi1
 0Pd0m4zMBzvzGomRuwdm4x8EtTBJ217AhJ7MHaForkNM3yGuFtlC/Av61OFIhGpNpt
 9nQoaJt5JXRfS3tRqe3q4QXEYnPN0lByjdL4aDXhUhXk2l3zFiI31b+qtJX63UVMwv
 ccaOnO3vgwGpfx/i6HNcxL84ki9IGEmSuF7B9RNTcs5jdeYbxzYuqb2JxCzwHJFL0m
 hx2bRbcsIMTOg==
From: Mark Brown <broonie@kernel.org>
To: linma@zju.edu.cn, tiwai@suse.com, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220516092035.28283-1-linma@zju.edu.cn>
References: <20220516092035.28283-1-linma@zju.edu.cn>
Subject: Re: [PATCH v0] ASoC: rt5645: Fix errorenous cleanup order
Message-Id: <165280316877.1635268.8412157029649432133.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 16 May 2022 17:20:35 +0800, Lin Ma wrote:
> There is a logic error when removing rt5645 device as the function
> rt5645_i2c_remove() first cancel the &rt5645->jack_detect_work and
> delete the &rt5645->btn_check_timer latter. However, since the timer
> handler rt5645_btn_check_callback() will re-queue the jack_detect_work,
> this cleanup order is buggy.
> 
> That is, once the del_timer_sync in rt5645_i2c_remove is concurrently
> run with the rt5645_btn_check_callback, the canceled jack_detect_work
> will be rescheduled again, leading to possible use-after-free.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5645: Fix errorenous cleanup order
      commit: 2def44d3aec59e38d2701c568d65540783f90f2f

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

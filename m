Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FC68C042
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:37:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36211DB;
	Mon,  6 Feb 2023 15:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36211DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675694268;
	bh=nTY8sKhJB1bjGQ0iOiBjQUEA0vT3H8gc99+No3TROzI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GSqYzpA8C6Mq/omVzdtmuSUyEkvmXgBmJwAxEEwn3NzfAtuaSr6IyhHvYqYpz+7PO
	 vbVg2+GvLUzBoiC4IgebIMjb5iSsBaZ2OdgLXSqWIM6kCaciJq2VEPi3UlElitGQki
	 DRU2RaTnNRbmgf6kMqqqfh/bthAgnztfyFqAOZxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C8EF804FB;
	Mon,  6 Feb 2023 15:36:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AEEDF804FB; Mon,  6 Feb 2023 15:36:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E532CF800F5
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E532CF800F5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ozChjcG2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F372BB811AB;
 Mon,  6 Feb 2023 14:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAE5C433EF;
 Mon,  6 Feb 2023 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675694196;
 bh=nTY8sKhJB1bjGQ0iOiBjQUEA0vT3H8gc99+No3TROzI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ozChjcG2/QL1D8LvTg3RxVTexij9GkMUrnlMzj+2qnYQvDyez+oliTgTdU8aE3mKp
 kWObJbISjFyfwUXHMhYlp2aGpZd5CoIlWOqK3H+NrncNE0xc7/65iqDhoOiHUV0Rz7
 VuNcl+5w3nCaizpg+1JjeVtBqiRlCNN9yY/szE1HM+gvR9OxMxyiz1AnX7TgbIr63z
 wSiP1pAdMX93crgGe0aamjkMgfDQ6ZIwuxZd6NCkQwWYm+57nDuLhiCrCQX8bomQeH
 +WHGs6sR76DPQVh7l/dC0ObWCkH8hE4o0f4f4LwpXu8yS414sxbjCgcAsFn7nwT9Ow
 ks0SXUtwEowrw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 liweilei@awinic.com, colin.i.king@gmail.com, wangweidong.a@awinic.com, 
 zhaolei@awinic.com, Tom Rix <trix@redhat.com>
In-Reply-To: <20230205015733.1721009-1-trix@redhat.com>
References: <20230205015733.1721009-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: codecs: aw88395: initialize cur_scene_id to 0
Message-Id: <167569419441.112200.7737939979688207071.b4-ty@kernel.org>
Date: Mon, 06 Feb 2023 14:36:34 +0000
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 04 Feb 2023 17:57:33 -0800, Tom Rix wrote:
> cppcheck reports
> sound/soc/codecs/aw88395/aw88395_lib.c:789:6: error: Uninitialized variable: cur_scene_id [uninitvar]
>  if (cur_scene_id == 0) {
>      ^
> 
> Passing a garbage value to aw_dev_parse_data_by_sec_type_v1() will cause a crash
> when the value is used as an array index.  This check assumes cur_scene_id is
> initialized to 0, so initialize it to 0.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88395: initialize cur_scene_id to 0
      commit: 983272a2a223de59dbb4cb189aa4d02d7156d209

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


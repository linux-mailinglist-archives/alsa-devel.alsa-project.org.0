Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50BA57C0B3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 01:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8052E1689;
	Thu, 21 Jul 2022 01:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8052E1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658358804;
	bh=6N20nPdhA7cnmw52vxGg/h4TChKXuAhehp5uDE59jhE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mo0EE6dxNNs4vV+rJzUyJOeOKw9ijzdlq5NK1lKAAwgVYpjg7fsz7BnWNOk5snJEr
	 goUY1LlyU7SPNy+Uv5MDjhAy3N5vYJvtmlM/gWw7cozQstZgu93lsLh5uyaA5cJIBI
	 XGCtf+Rlnkg4kX0dxKb1fXjVlX27zrpM7kGK+4xU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11076F80169;
	Thu, 21 Jul 2022 01:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CB51F80169; Thu, 21 Jul 2022 01:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F2D4F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 01:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2D4F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PAFLOnrE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F8E861DDB;
 Wed, 20 Jul 2022 23:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10EBC341CB;
 Wed, 20 Jul 2022 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658358734;
 bh=6N20nPdhA7cnmw52vxGg/h4TChKXuAhehp5uDE59jhE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PAFLOnrEYcKNA7X1l0qNhgHjwOoeKuzb/P0c5qte7N83yajlp+eC4TPPzf1ImYhTS
 5JOMmxQnyfmU5EpuedCdh1uhIkXWVDvQ9V1ln/k0s//iFvFopIa6hWTkoyK6JCyvPf
 dBgznJXPSr5601YiE77uvWPpQBfpfJoljMKMh5fCEiD/xkO2/MT3oE/nceU/G7S8qb
 qHnZJbYV905jSdlUyrgiBTx9rECv7HG8Dq2zN4cNsj679KLiSG1WCWZU8tQ8YDsurj
 B60Yv8iR2Gz/0ztdcG/nmMsMAzKoGn6+W0/0TuVuya+hl2oKrkjvNAKeYKswx0cigT
 te3x4lsoeZYXg==
From: Mark Brown <broonie@kernel.org>
To: amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20220720125115.1785426-1-amadeuszx.slawinski@linux.intel.com>
References: <20220720125115.1785426-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Makefile: Fix simultaneous build of KUNIT tests
Message-Id: <165835873241.1007579.14996903345532143350.b4-ty@kernel.org>
Date: Thu, 21 Jul 2022 00:12:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

On Wed, 20 Jul 2022 14:51:15 +0200, Amadeusz Sławiński wrote:
> Using obj-$() := instead of obj-$() += leads to the latter assignment
> overwriting earlier value. Fix this by using incremental assignment to
> add additional objects to build.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Makefile: Fix simultaneous build of KUNIT tests
      commit: f4d92d9757e6b0adf24d227e414dac867555c9e2

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

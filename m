Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A063F4FB5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 19:41:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7EE315F2;
	Mon, 23 Aug 2021 19:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7EE315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629740459;
	bh=UXnNHkFeN/p+xqSUECWduniuXcpbEWrX/A1QqlSuOrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5OGEOmWXr5mou4BC/tnuwOTZHEi3zXbnsGr5fomG9KGS8GOpm9WFoKGWmIAdwKAR
	 wzKDkbqUlIQ/HT/vfpFs14Ge2FrqFKZWNXchN3B7mazoNUbRjT6ANIY17BXo1ZJeFt
	 sWGWenR1z/4XqnG4IbAdE8A6+/9uxH6ufZ1ueLGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DFE2F804E5;
	Mon, 23 Aug 2021 19:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CAB0F804E5; Mon, 23 Aug 2021 19:38:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4203F8032D
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 19:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4203F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DUlmL6bh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B33116136F;
 Mon, 23 Aug 2021 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629740318;
 bh=UXnNHkFeN/p+xqSUECWduniuXcpbEWrX/A1QqlSuOrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DUlmL6bheXuV+VtotecexpIwTdVdsTeftL2Ye4Xeh8eMhLMyzqz0C4oqZSUopW/Kt
 82HhKvlYFR3lqOOIhVSIFRzC71Yz2QFB8BqkXYSk7qXfYoOKMGdruak0IpcTwDTFpN
 zCGGAGdyOCYqAJJeF7QZHCC7f+rUbyY5UzEhm1t3nl3wGjxddKl0/6jDyblPzuqS2o
 sCPuTVMqM0gAqv9bXuf3bL7n3Yti7N8SDzbsX0IpV9RMZIBDEyINHlzc4t/xvSPtuT
 BceTkw9oyBFEj4CfLZqc+gpbQNKdmMWkEeN3kq2F+8xPJJlmx2935MBBXfRLfwIwyH
 GJsvnx9QQYGUg==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: rt1015: remove possible unused variable `bclk_ms'
Date: Mon, 23 Aug 2021 18:37:56 +0100
Message-Id: <162973996482.3102.13387246849297551756.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823153323.1297723-1-tzungbi@google.com>
References: <20210823153323.1297723-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel test robot <lkp@intel.com>
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

On Mon, 23 Aug 2021 23:33:23 +0800, Tzung-Bi Shih wrote:
> bclk_ms is possible unused by using the given config (see [1]).
> 
> sound/soc/codecs/rt1015.c:724:2: warning: Value stored to 'bclk_ms' is
> never read [clang-analyzer-deadcode.DeadStores]
>            bclk_ms = frame_size > 32;
>            ^         ~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: remove possible unused variable `bclk_ms'
      commit: d019403a777e9978767d0551fa55f624baf7df09

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

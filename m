Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483420B457
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jun 2020 17:19:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1DE1694;
	Fri, 26 Jun 2020 17:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1DE1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593184741;
	bh=VCCv3WZha5nq/ifJBdt6Z+ml7Q7oXQ0N9/j7lQcV4Sw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mtX9sHfhNNAbT2a8LzM9fOUZmPfrbEG29AU8WoZ7mmmJW1Q4snRah+S/R24IDdfDQ
	 BsoRzzDBXVAu7ag+sWkNqK4N4qcH+OeSDLhL8ixP9jAu3nL0+SZ4/q5+7vxnahV98X
	 IhlGJY0B6arW4NxtZFpN9fauvB7Q2V3RPzuczn2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE1CF80096;
	Fri, 26 Jun 2020 17:16:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D59ECF801F2; Fri, 26 Jun 2020 17:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 581CCF80162
 for <alsa-devel@alsa-project.org>; Fri, 26 Jun 2020 17:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 581CCF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qc5vAHMA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C6B120706;
 Fri, 26 Jun 2020 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593184604;
 bh=VCCv3WZha5nq/ifJBdt6Z+ml7Q7oXQ0N9/j7lQcV4Sw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qc5vAHMAavilB67XwgvGFK7EOSnvozWIbNZobtgs8AluSkBYLmCGBLR9aYg5Y9BCy
 3ztf9jUuMJ7Th9ZBkHAdymBHFLB+C2HXVyzFNFh0iyU6qkvJSnpaOnv8RTRiCryTUO
 i5dVq4w5q6gAS7W6eHW9IjcyS0vJPbXZmc22y6L0=
Date: Fri, 26 Jun 2020 16:16:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Colton Lewis <colton.w.lewis@protonmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200626053953.68797-1-colton.w.lewis@protonmail.com>
References: <4574918.31r3eYUQgx@laptop.coltonlewis.name>
 <db6d3b05-33c1-91b9-d0b4-c5063ebafcae@linux.intel.com>
 <20200626053953.68797-1-colton.w.lewis@protonmail.com>
Subject: Re: [PATCH] snd/soc: correct trivial kernel-doc inconsistency
Message-Id: <159318459767.2904.6358910559273286763.b4-ty@kernel.org>
Cc: tiwai@suse.de, lgirwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

On Fri, 26 Jun 2020 05:40:24 +0000, Colton Lewis wrote:
> Silence documentation build warning by correcting kernel-doc comment
> for snd_soc_runtime_action.
> 
> ./sound/soc/soc-pcm.c:220: warning: Function parameter or member 'action' not described in 'snd_soc_runtime_action'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] snd/soc: correct trivial kernel-doc inconsistency
      commit: b6d6e9ea8fb9d477f07e6e4ad8b8a38a47f6870e

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

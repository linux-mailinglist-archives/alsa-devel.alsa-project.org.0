Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87654F5FD0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81BFB1701;
	Wed,  6 Apr 2022 15:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81BFB1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649251818;
	bh=n/JgBGkv76rAadiPYeLsGzGK5LmEb9eNvnNd99U9w1g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uc4ft0fuCpbAyD9EL3Fe8Lrww68g1F3ptj6Y+3rPVueOWhnbk/2Fq85icv+Pi3vdj
	 IYuS0mgv6Ve4r5DO1DHawkkACKLI6LeO0RuAe89rIOW4ZWBCzHOdtbeMoj9Sz6CVRv
	 x1VXWqGGSXt30nZgOuhqUiW0DWjsZ/0oj/EMGlvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD9CF804C3;
	Wed,  6 Apr 2022 15:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D27F80516; Wed,  6 Apr 2022 15:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9909F800D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9909F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qfzJNddM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22E41B823BC;
 Wed,  6 Apr 2022 13:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80402C385A3;
 Wed,  6 Apr 2022 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251722;
 bh=n/JgBGkv76rAadiPYeLsGzGK5LmEb9eNvnNd99U9w1g=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=qfzJNddMgQFeTdBNzMoi2OmmWw+A0vNEwfyJ8pC7/lh+AwHChiI3qM3gZRvkTric6
 d/u6k/0vFIc0+csVlI8bNUfzsEcD/pvYbFFviln8iQV4py7OH5TK+/QIM/TsirH0bv
 r1afq22WYMBmbefQqcL/nCsSr0kH3Z3G8Y+dIamOlCW9b4JE+XLTqe9Yn9gFzRmsiv
 d728gKV/FivyBeA5zr4AZB7m7wQa63qee8YDyIujufG7xEWfYV6HCb7r5H/9awI4AO
 A80Ga7MYFp8tYQbUefK9E85bXJaHKmKU6/mGlwdzb01YGG9pcuPtZKunFGtK7no2xE
 BInV5rIg3+2og==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, tiwai@suse.com, linmq006@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, srinivas.kandagatla@linaro.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220403115239.30140-1-linmq006@gmail.com>
References: <20220403115239.30140-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: msm8916-wcd-digital: Check failure for
 devm_snd_soc_register_component
Message-Id: <164925172124.83821.13118805516714327451.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:41 +0100
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

On Sun, 3 Apr 2022 11:52:39 +0000, Miaoqian Lin wrote:
> devm_snd_soc_register_component() may fails, we should check the error
> and do the corresponding error handling.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: msm8916-wcd-digital: Check failure for devm_snd_soc_register_component
      commit: e927b05f3cc20de87f6b7d912a5bbe556931caca

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

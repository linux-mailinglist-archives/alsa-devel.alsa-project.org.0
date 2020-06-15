Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA611F9B81
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 17:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD271665;
	Mon, 15 Jun 2020 17:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD271665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592233690;
	bh=iQxR19VvnbxFvIXIUb0hXUuSs206NScmeWUhnXmjM9M=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FURYD0e4JqRMHpRZUWp1BEpk1NMziaGha9mat+FUtLuOoSQ09RqQVtwh0xcDeoIyZ
	 ueba9KGIDae8umuxsJN6dPU/1TdQvM4HMvgLQG5GXymu1600+0/+z9y00cLUOGQkXq
	 FvLLHYY/5yTIvuhHv0LLgH4xpFYVq7YXDvDr6TGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAAEF802A7;
	Mon, 15 Jun 2020 17:05:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 278DAF8013E; Mon, 15 Jun 2020 17:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E6FFF8013E
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 17:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E6FFF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IHNPQmqX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4962520739;
 Mon, 15 Jun 2020 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592233537;
 bh=iQxR19VvnbxFvIXIUb0hXUuSs206NScmeWUhnXmjM9M=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=IHNPQmqX1tGZkLo5Ha6lNSoK2zKTaLBn3QCA8GwvAGOwBfH+xUM1xb0Krd0TuKkJV
 PsVYgYjiPqcHDNVfD5OHLLMmEQ3qeAsWcj+DuLqLNCOH2mOfq26+g/uCK8rBxTLtKz
 aAUKTiqPJg7c82OFgzYsPdXy3pvWHEkc5tOnv5xE=
Date: Mon, 15 Jun 2020 16:05:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200612123711.29130-1-srinivas.kandagatla@linaro.org>
References: <20200612123711.29130-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoc: q6afe: add support to get port direction
Message-Id: <159223353044.8967.4267093488191293280.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 John Stultz <john.stultz@linaro.org>
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

On Fri, 12 Jun 2020 13:37:10 +0100, Srinivas Kandagatla wrote:
> This patch adds support to q6afe_is_rx_port() to get direction
> of DSP BE dai port, this is useful for setting dailink
> directions correctly.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoc: q6afe: add support to get port direction
      commit: 4a95737440d426e93441d49d11abf4c6526d4666
[2/2] ASoC: qcom: common: set correct directions for dailinks
      commit: a2120089251f1fe221305e88df99af16f940e236

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

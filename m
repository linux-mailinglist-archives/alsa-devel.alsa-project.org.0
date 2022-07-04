Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6799565A85
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6DD83E;
	Mon,  4 Jul 2022 17:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6DD83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656950379;
	bh=MO8VLmEsa10TXb0niZfJ37gMR3mLm6mkIOg+GspfIJA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ev462Z9csLBiGaWttCmVKO/jdYlLmSqJxHgeWKSN2hAa5UyA/0OThdVb/ITXIFm+9
	 e6yfOxJX5Y13SPdu+c3Gpjz19biMDE05TdwXEY7HjWukYnRvBKRhND++Lm/NddTEMG
	 8T0528VdG+2d70+ygUIqpV3S5FjBC5m0VeaKumhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 390DFF80542;
	Mon,  4 Jul 2022 17:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A99FFF800ED; Mon,  4 Jul 2022 17:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 800D7F800ED
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 800D7F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iwY0sEmK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D698B8114B;
 Mon,  4 Jul 2022 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8477C341C7;
 Mon,  4 Jul 2022 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656950269;
 bh=MO8VLmEsa10TXb0niZfJ37gMR3mLm6mkIOg+GspfIJA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=iwY0sEmKe6l8I24UGOESMbwBXEomOqlj9/ht+9Fq5tKtOy13c8eEe3HtLgan6AsVU
 2aCUoUL+gDEQYgf04dSO+TeGuOrdMQAIO/pKq7cYqaS/SYWqvc+lNRegjcWB4aljdD
 vwyeTNHIf17NSlo0TQ54pGjfYSP9PV4HYHIhOtiTC+l6AzSiCcrQc3v3Jjof4CRTCS
 5TJFg8Vp8CdECL/55XezlpOh/ig12E7LXfmcZBoGnn5eXG21XNkp3t9oHkbRWYrV6b
 wp2lQ12sexh0MBQ7moKBAK+dUP+wF6XJn8toYCWrQD3v1KAdjlhP3ilRycAoTtWtXb
 pSkB5LdpYTWTQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, windhl@126.com,
 linmq006@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz,
 tiwai@suse.com
In-Reply-To: <20220702020109.263980-1-windhl@126.com>
References: <20220702020109.263980-1-windhl@126.com>
Subject: Re: [PATCH] sound: qcom: Fix missing of_node_put() in
 asoc_qcom_lpass_cpu_platform_probe()
Message-Id: <165695026753.481068.539030675339287717.b4-ty@kernel.org>
Date: Mon, 04 Jul 2022 16:57:47 +0100
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

On Sat, 2 Jul 2022 10:01:09 +0800, Liang He wrote:
> We should call of_node_put() for the reference 'dsp_of_node' returned by
> of_parse_phandle() which will increase the refcount.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: qcom: Fix missing of_node_put() in asoc_qcom_lpass_cpu_platform_probe()
      commit: f507c0c67dac57d2bcd5dcae4b6139b0305d8957

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

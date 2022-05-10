Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803E521CFC
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 16:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC0818F1;
	Tue, 10 May 2022 16:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC0818F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652194243;
	bh=okWehPSv94o5n4/YHnWsmeTik2HBIjXblj7tJPWDO9E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lb5T2NKuV+zMAukc2b08nc2i3j+eKjBrP0stz2HQcKDbALZ8VLxanGdcsOOXQGtjZ
	 gzBB1F9fapDjMI8WNYgNbKGk7EXhzq6O3Lb6tWtFWcw657/GpHnUJw4Xrmh+ieHjg1
	 Nta46mXAuKxNz1ZszAke9qqKTfvbA/DjK3wGg3Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439E7F804BD;
	Tue, 10 May 2022 16:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15D6F8019D; Tue, 10 May 2022 16:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A8DF8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A8DF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t1SxeHdp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E7F661976;
 Tue, 10 May 2022 14:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43120C385A6;
 Tue, 10 May 2022 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652194174;
 bh=okWehPSv94o5n4/YHnWsmeTik2HBIjXblj7tJPWDO9E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=t1SxeHdp7fQWC9lw9euzejlkdo37j7bMZVQAqq6jmXaUhqFbk4GkvQ5QjwxGzYmbs
 cCIAKfAM0tpqpEpqA+GHIiC3DsaQBYnQekmQctwNx0OvP6jsUj3S8AL4OCmjAZD1Zb
 zVccDEt4TFv3t5ci7d+G7qPcint0YWkIMm7XRljq59e8WUPV72vqKZVdTH93os0mgw
 ME7Saj6J6c2hpxBhDV8nXLXH2I8Bm8vY+b5AqZ4MAEPuqTsZe3FpxFNYDgkM/kIkQL
 TsU+oe8eDEQEW03XmGau/8vqaS1rSwkVAPUpPBKgJ9ccxRUlJTxSJVviLw5yhA8kb0
 TYECMedw9XmNQ==
From: Mark Brown <broonie@kernel.org>
To: yangyingliang@huawei.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220510124749.2663874-1-yangyingliang@huawei.com>
References: <20220510124749.2663874-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: samsung: spdif: remove unnecessary check of
 mem_res
Message-Id: <165219417300.388769.4515467081124288900.b4-ty@kernel.org>
Date: Tue, 10 May 2022 15:49:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: krzysztof.kozlowski@linaro.org, lgirdwood@gmail.com
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

On Tue, 10 May 2022 20:47:49 +0800, Yang Yingliang wrote:
> The resource is checked in probe function, so there is
> no need do this check in remove function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: spdif: remove unnecessary check of mem_res
      commit: 9d62ba94266be3ddc864348a4df7e54f5562f0d5

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

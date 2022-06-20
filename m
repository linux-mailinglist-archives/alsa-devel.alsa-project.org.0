Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503FB551A83
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 15:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8CA216D5;
	Mon, 20 Jun 2022 15:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8CA216D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655730493;
	bh=HHDQX3NlnZLPN1fa0iK8DZnWO6BfR1zyzteOcjoiVi0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHJm9OdfhgVIRqGXvgI81pTHc3pdbnScyGuvKPR7WK8T27ySS4rIOIkIvZyiQh+0d
	 yQfuJv3QmatiNum7JiBQaEDSFneG9idYZni+joo9miZY4Fw2dcYrnCZT7dq+t2S600
	 CilUysE3KAh2o3Sq+PkZr+nsJIcloxgvApKbVQaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E606F800CB;
	Mon, 20 Jun 2022 15:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FBB5F804D2; Mon, 20 Jun 2022 15:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7C56F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 15:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7C56F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jDPIXvHQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C8B061555;
 Mon, 20 Jun 2022 13:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51062C3411C;
 Mon, 20 Jun 2022 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655730420;
 bh=HHDQX3NlnZLPN1fa0iK8DZnWO6BfR1zyzteOcjoiVi0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jDPIXvHQX18UEYQlx4HNpijY7v08HdK6Z59LniMV9r6zv5YWWaYLYW5omi0xo5tNJ
 52P7pJC3yL817qJOTzi74pG3W7u4Z/7jXhpc7DWmoDsN9qbXbqyTomZp6cfw4YnywO
 EEJVxNjLTLRMQN1V6UoboeIjDmsV+CROjfZe5DP4TwrNJfEc1JJyN/B/a8C5ko9XrT
 X2HCWjphlXV+qI2lCAcoWuJ2G5xfQFw5n/cWypFAuQMewZSrAx+kcJS7vXd0I21Vf7
 M2GPQ3hYyJyz19+E5VOD6xwj2Y5LOg5cKW4cpIgMPfILwACbm/v91EaCZjFutI8SUj
 E5RWkgbTxPEgA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
In-Reply-To: <20220617210230.7685-1-srinivas.kandagatla@linaro.org>
References: <20220617210230.7685-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: update ASoC Qualcomm maintainer email-id
Message-Id: <165573041905.667528.13097598599735683089.b4-ty@kernel.org>
Date: Mon, 20 Jun 2022 14:06:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com
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

On Fri, 17 Jun 2022 14:02:30 -0700, Srinivas Kandagatla wrote:
> Update Banajit's email address from codeaurora.org to quicinc.com, as
> codeaurora.org is not in use anymore.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: update ASoC Qualcomm maintainer email-id
      commit: ad9894ac6cc1c1f7c36451d508d69f6ba677834a

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

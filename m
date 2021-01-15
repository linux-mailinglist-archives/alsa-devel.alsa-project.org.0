Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927FD2F8425
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 19:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24E3B17FA;
	Fri, 15 Jan 2021 19:21:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24E3B17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610734931;
	bh=Qh5LMHea6iPvxBJvzMNldDED2n75eq5O/wUJoTO3pCM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzRo2WHp8Y0N6kIKJBKtRJMvyn9pZJgpouBbVp3D4fuJjRbY/mXkMtyhadNUSEVLE
	 koSW08A/lqVUn5wifo5dbqrfzlvO58bHJBX4dwQGc8zHVpVxopFu9PQp2MHzJXYIMS
	 B4QEBQo/eXIAE+Evo0gQmqmM0ZmbK4ThFMWD6BU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 146BDF8026B;
	Fri, 15 Jan 2021 19:19:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1050EF8026B; Fri, 15 Jan 2021 19:19:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF5DF8026B
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 19:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF5DF8026B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J8PnzQUv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 816D523A5A;
 Fri, 15 Jan 2021 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734782;
 bh=Qh5LMHea6iPvxBJvzMNldDED2n75eq5O/wUJoTO3pCM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=J8PnzQUvOyTok8zcKdRpmYHXxddHq8PKlQMrAZ2xekPVT1fvLkdrYLKm7F7CxKo82
 AzISDLAmwKMdISVJoA4/qeKo0Fv38yU6UPgIBvkfAjySAE3GkU4eSThlMdW9jl7occ
 WlAtOjQrhaYxxCAdpCkK5+9UFhFaO6Rw9bN7WPXgW96HeDWPnZPMYD8slXyvuixZgq
 IqaaQT2TARu8RarntQ7zn/sw9SM0VuTF+jRy6ZMTin1er4GtbzLJF0voy6itfU2SbR
 N8Us0AwUp4JRtUhPwxBoJ8Z7zJXo/O2qaSvBJwMak5TJ3RNVwneJG5Uh5RKllYLRrD
 5foDuBrUMbCrw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210115165520.6023-1-srinivas.kandagatla@linaro.org>
References: <20210115165520.6023-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: update maintainers of qcom audio
Message-Id: <161073473698.12268.8770023938274455760.b4-ty@kernel.org>
Date: Fri, 15 Jan 2021 18:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: plai@codeaurora.org, bgoswami@codeaurora.org, alsa-devel@alsa-project.org
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

On Fri, 15 Jan 2021 16:55:19 +0000, Srinivas Kandagatla wrote:
> Add myself as maintainer of qcom audio drivers, as Patrick
> has very little time to look at the patches.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] MAINTAINERS: update maintainers of qcom audio
      commit: 9b268be3adbb410cc1a857477b638a71258891a8
[2/2] MAINTAINERS: update qcom ASoC drivers list
      commit: 7505c06dabb5e814bda610c8d83338544f15db45

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20233DBE0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 19:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667911920;
	Tue, 16 Mar 2021 19:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667911920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917718;
	bh=HoSgMtiIiSAkVpHOLGFLlZiBQhF3CTEX630pkOg0tF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHmZXw2l/3HXCwwGcKn/UKexffCOH2Tr2aKv7LrnGE4KTjAsjR/7UBoVZOdsdLZO5
	 tDJ1fxW+1RtPQiH2R2ZmK+l3k1bWXJUmR2Amf1zjeDp2iu6tq/0y0eEPHFULN67OBc
	 TIou9YztYeREYLqW2+eBa80Qz3vlrCVJcuFAven8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33F9BF8032B;
	Tue, 16 Mar 2021 19:00:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36036F8026A; Tue, 16 Mar 2021 19:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E08F5F80156
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 19:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E08F5F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oPFo3HEm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87EEA65133;
 Tue, 16 Mar 2021 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917604;
 bh=HoSgMtiIiSAkVpHOLGFLlZiBQhF3CTEX630pkOg0tF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oPFo3HEmTj7fXwVlPAbg2/67boHFQ5fn1riyjzHQVTcmIIJrMvgNBFL7gMO3M/3gk
 OhqnVkWUr+LxO1vWgXl56pTnORZXAzS9SBHed9ZnJVw3uHxKvzIx5MtJeBGY2AObkB
 NlB9edqAUyhPMwjlRdYk653y+ScwnxxDQxSwhoechPZlTpdHXCL5UD8KgPuCgtsjKd
 JjqIlm+yajsnVIjEup91KXVa8fD5P75eo7POnhMqVL7FJCG6tu5RzVUVM92re0+iCL
 0HKUT8AL0T/w3ZwcBBE2QYiKp643CctO1emtQ7vYaG2ecAy2GlVqZkSAaQ6xIex1Uk
 QbCD9IE5jc9NQ==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz,
 timur@kernel.org, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: fsl_spdif: use snd_ctl_boolean_mono_info
Date: Tue, 16 Mar 2021 17:59:43 +0000
Message-Id: <161591744696.13544.5081763572355349115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615887736-31217-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615887736-31217-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Tue, 16 Mar 2021 17:42:16 +0800, Shengjiu Wang wrote:
> Remove redundant code and use snd_ctl_boolean_mono_info
> instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: use snd_ctl_boolean_mono_info
      commit: 6ad864ed6ac50f11a6d8575fda79991cca8f245c

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

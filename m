Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC0216E94
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8903311C;
	Tue,  7 Jul 2020 16:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8903311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594131609;
	bh=zLDKUUlf41eWXCK1+gWKFdhUhVl9kP8CIgS7oLy2LgQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iN7HYJ0wG0oZttvQlRBDlPA/fT8xbUXJvHJgMB60RWvsIbqzL17EvBqwh8I/ANaJC
	 /dgxU6EDtGZ4xUksr8smvwtZ/HZp97rjNk+8L2tYBM8+mnFzz5fBLFjox0m6zzoyH0
	 9fg8EXo12fT6ufz8PfnPBssxS+EhZYr0mEjj/Yd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDDA8F8011F;
	Tue,  7 Jul 2020 16:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 115A8F8025A; Tue,  7 Jul 2020 16:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 104E6F80216
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 104E6F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1Wek/USV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 102E9206E2;
 Tue,  7 Jul 2020 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594131439;
 bh=zLDKUUlf41eWXCK1+gWKFdhUhVl9kP8CIgS7oLy2LgQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1Wek/USVv1i9/Nl1ZMFAk2avBAKGHTALhNkHzitHtYxwzH8Hcz7fBE7hExire+9ie
 fmqnV+aK0o+I2VaPduFIO4qT36rbdl2OPHzemUXIuGeqEHHOqhjk35+6L6BJK1QaWb
 B1TLufBEBcHc6Xf75wrhuMbg1ooEs9CeHynR1YXY=
Date: Tue, 07 Jul 2020 15:17:15 +0100
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, Yi Wang <wang.yi59@zte.com.cn>
In-Reply-To: <1594122467-11615-1-git-send-email-wang.yi59@zte.com.cn>
References: <1594122467-11615-1-git-send-email-wang.yi59@zte.com.cn>
Subject: Re: [PATCH] ASoC: fsl: mpc8610_hpcd: Add missing of_node_put()
Message-Id: <159413142467.34737.7662746319065846773.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, wang.liang82@zte.com.cn,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, xue.zhihong@zte.com.cn,
 festevam@gmail.com, Liao Pingfang <liao.pingfang@zte.com.cn>
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

On Tue, 7 Jul 2020 19:47:47 +0800, Yi Wang wrote:
> After finishing using device node got from of_find_compatible_node(),
> of_node_put() needs to be called.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: mpc8610_hpcd: Add missing of_node_put()
      commit: a5911ac5790acaf98c929b826b3f7b4a438f9759

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

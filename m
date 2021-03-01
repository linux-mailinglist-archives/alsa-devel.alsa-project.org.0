Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D332953E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:38:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22721695;
	Tue,  2 Mar 2021 00:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22721695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614641899;
	bh=U9KY075uL17cHjLwoFUiLbiSiP9SqIwNSTnM/y5bLxk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDbiLxbkPNdae5fAS+YCJsbqMi31btT7lXrYx7f82h+ckX7SFuEzLQrklvMdh49dy
	 hqVF3F8+qETnt8x7NH+LxkAjgFry1Geu5KbYF4Xa4/qcE3oRxEkK5cAHUZXHfyfgWq
	 AK/cAYx3wdkjUG6ofq+0cf99H6ksYKTodsdLf7mM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93095F802E3;
	Tue,  2 Mar 2021 00:36:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0AB2F802E2; Tue,  2 Mar 2021 00:36:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11163F8010B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11163F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="soAfoHz2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A464460C40;
 Mon,  1 Mar 2021 23:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641758;
 bh=U9KY075uL17cHjLwoFUiLbiSiP9SqIwNSTnM/y5bLxk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=soAfoHz23udT1nihIMXVoEl/L77zt8KvJoAzKKCODuzbMEu5IT+OVgyt1x+5Yq8wf
 K3cGs2JDA+ujba5QtnvOnPyL/Pc5pzjyTqPOVQ/hwzO9Pbh/69aEVgyZy/HjVMGagr
 Hl8ucZXw1YB7hI0UHumWDI4B6Y8FjdCKdRKERrCQtSdZHnhNWg6dw731UnIJ2Z+N7T
 PMUpSxHZLzHv2BagWK2BhxHeO9eek1Sj3qNT6mCR8bRUwlKbjea1Gs9ymNMXg6Ik2d
 ftxJvJyeNJHYflPEMbIv3KdCXmkZEKeOcU1Z+zIOc9fFeLMH31xit6If68+8bn5Snt
 bZaUK2DF9P3lg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com,
 festevam@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1613983220-5373-1-git-send-email-shengjiu.wang@nxp.com>
References: <1613983220-5373-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add pm qos cpu latency support
Message-Id: <161464168098.31144.7601836731718414126.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 22 Feb 2021 16:40:20 +0800, Shengjiu Wang wrote:
> On SoCs such as i.MX7ULP, cpuidle has some levels which
> may disable system/bus clocks, so need to add pm_qos to
> prevent cpuidle from entering low level idles and make sure
> system/bus clocks are enabled when sai is active.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add pm qos cpu latency support
      commit: 6d85d770c171972c0f33f74b84bf0fedc111e89f

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

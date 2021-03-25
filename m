Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907F34985A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:39:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6FA31678;
	Thu, 25 Mar 2021 18:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6FA31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616693958;
	bh=PJ9dVJr7pQ/MariBpR/ysWqCzzmoHrXzyyOPgE1CF84=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfUfxuHKMViB8Y5bLPG7tsLcNJ95k5yhbVh4wk46c54KRaRSNQR3R5ix3tpCtsCro
	 lkONYYOxBT+fx2/fICh6XcLbmBRCcEUNeft+TEoHVEjgi2WlraOB3PG+8Hno22wTPq
	 9mhcaKq/CL/xp1rwy6HN0tlpUQadNNDJoOQLAhy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09128F80279;
	Thu, 25 Mar 2021 18:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B66E1F8026D; Thu, 25 Mar 2021 18:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA286F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA286F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O7S/kZB9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6460E61A2A;
 Thu, 25 Mar 2021 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693849;
 bh=PJ9dVJr7pQ/MariBpR/ysWqCzzmoHrXzyyOPgE1CF84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O7S/kZB93c1aJU1F+QBupLtIyCZnuk+7MVZT2MbMXeMGvCvzmDk5ML+uVkDy9z4gZ
 zqkujwYKF0Vba6jrJ6bkJrHnBKCgjlZ4xBNxC25T4Js3pD3MC71EKdhqLA0PGOH+9G
 wLQmRJsOnTikkZKwNMXT8jGOMluA4s8jfCV/IhdbyPM2H7TN37IODBkQW1t9DLGGFT
 2DYBe3sv1QE3uedC+F4TN5vc+g0R+OXEYqyyeGQXXH1ExRj6+go+f6MqGYadxvLRy3
 5afzf3f7oakStOssj1h/jAclKkVdfWKizgz5SrATRX17fW1vLNIzukFy71FKpbVgIf
 +/bt8IzqQQJXg==
From: Mark Brown <broonie@kernel.org>
To: guennadi.liakhovetski@linux.intel.com, tiwai@suse.com, perex@perex.cz,
 rander.wang@linux.intel.com, Ryan Lee <ryans.lee@maximintegrated.com>,
 pierre-louis.bossart@linux.intel.com, yong.zhi@intel.com,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 judyhsiao@google.com, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, vkoul@kernel.org
Subject: Re: [PATCH 1/3] ASoC:codec:max98373: Changed amp shutdown register as
 volatile
Date: Thu, 25 Mar 2021 17:37:04 +0000
Message-Id: <161669370551.41585.8831978780154143601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
References: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, ryan.lee.maxim@gmail.com
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

On Wed, 24 Mar 2021 20:35:53 -0700, Ryan Lee wrote:
> 0x20FF(amp global enable) register was defined as non-volatile,
> but it is not. Overheating, overcurrent can cause amp shutdown
> in hardware.
> 'regmap_write' compare register readback value before writing
> to avoid same value writing. 'regmap_read' just read cache
> not actual hardware value for the non-volatile register.
> When amp is internally shutdown by some reason, next 'AMP ON'
> command can be ignored because regmap think amp is already ON.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC:codec:max98373: Changed amp shutdown register as volatile
      commit: a23f9099ff1541f15704e96b784d3846d2a4483d
[2/3] ASoC:codec:max98373: Added 30ms turn on/off time delay
      commit: 3a27875e91fb9c29de436199d20b33f9413aea77
[3/3] ASoC:codec:max98373: Added controls for autorestart config
      commit: 7a0d884986f3693aca8a2dc4e1b31d35c508542e

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

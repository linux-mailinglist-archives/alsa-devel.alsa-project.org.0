Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE23F091B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 18:28:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B00E16A6;
	Wed, 18 Aug 2021 18:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B00E16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629304110;
	bh=6acFwTMZIC6gk0x6yoAGFSCVjV5LISXXZQTTQAHwKxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FzaU2sN9jSkJEptmIYWNYdw/MTjj5BYUYY4RL4cSbPe6+tzuv5Lz3xdECzkoyIMvS
	 WykuRNsHcFqIIEHuc6nWytaxExpb+okcrh2kv6vfmHDFEDcB3W1x65cFFxnq4UOlWh
	 bbhJ3FhUwtwl9DdzdAu+Db+m1ENsZetHoVHk0RCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ADEEF80163;
	Wed, 18 Aug 2021 18:27:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA33BF80249; Wed, 18 Aug 2021 18:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FE0CF80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 18:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE0CF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hj41TU7k"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B6D610CB;
 Wed, 18 Aug 2021 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629304021;
 bh=6acFwTMZIC6gk0x6yoAGFSCVjV5LISXXZQTTQAHwKxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hj41TU7kRliPxrAO5KkTX+iNLT3ONSLN3tmUyUUwGkQzp/k5Z5RKGT5oJHHkJNvbQ
 DQVOua9uo/QANQZGqFMr5798Mm28kGLlDcOKM4QwwIi0vEjAhFCbuI3uu+U15MuzZa
 462pDek0YTmlB2lI+wWlU9r4y7qB6/8Gyy2GgQo2iU8PZhbvVdni5dBEUjSliipc0o
 RAsDzmwvQSWSV0VIiDpLVcAv5Xi/etOGCw/ow3tzWp65T+m5SjXz8vyEBq8cJsnDlR
 dAxomcM0jWyJCWdYzDaU+YZ+bAJ8nUCri1EMQwHGYp9aZoFAa82N1RzQUJOpKrlCOj
 P6NqyraEZbKCg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, timur@kernel.org, alsa-devel@alsa-project.org,
 perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Check -EPROBE_DEFER for getting clocks
Date: Wed, 18 Aug 2021 17:26:32 +0100
Message-Id: <162930349966.11010.7849823203473029819.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1629266614-6942-1-git-send-email-shengjiu.wang@nxp.com>
References: <1629266614-6942-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Wed, 18 Aug 2021 14:03:34 +0800, Shengjiu Wang wrote:
> The devm_clk_get() may return -EPROBE_DEFER, then clocks
> will be assigned to NULL wrongly. As the clocks are
> optional so we can use devm_clk_get_optional() instead of
> devm_clk_get().
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Check -EPROBE_DEFER for getting clocks
      commit: 2fbbcffea5b6adbfe90ffc842a6b3eb2d7e381ed

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

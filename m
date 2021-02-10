Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B73703170FD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:16:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4367A16E5;
	Wed, 10 Feb 2021 21:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4367A16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988160;
	bh=A1kfeid37u/WoghoCf3KlbXDtZBhqUtPSmHssGj2l1o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tf31htTSAPQ48PNzAoLHim2QL7qP9/s+VIzpoAw5FaIK4yWXtlNUNuKrhVU17Wo/K
	 vyXQb+eO2+OfyTPEbYiEm8mOMyZ7jc60tQ9V6DOJ9mujupNf6yNWbSMeIG8p0BOpuC
	 PBprbk4RpKzm3iSATj0YA9RVsHf/smm8wsAEmtp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9319BF802DB;
	Wed, 10 Feb 2021 21:12:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00359F802E3; Wed, 10 Feb 2021 21:12:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 872B7F802DB
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 872B7F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gWRI06Lb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A75E64E35;
 Wed, 10 Feb 2021 20:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612987971;
 bh=A1kfeid37u/WoghoCf3KlbXDtZBhqUtPSmHssGj2l1o=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=gWRI06LbIY4Y9owVVJzg+VEE5MbfUNK7IQFZkaXaHcItOAwZ2owqix+ohjZ9x3T7k
 ueQ+MlvYznZKJqradn9SF8QN38BE50uqid03xxx7jwPyMEZe30/4e95zDwhgM0N/GQ
 jYo0YDNqgnj8qOULqF3Yrk2lMtaA7gGbjeI//QqsEL/9LQYKXiygfumARn4jppoDus
 BvVm8Vhj4NXzZTmjmwGFLxpQNW7ej9xfMGZzX5tz+PZf8IWYzpALOGIrfXb+t6Mphx
 BMUW0PC9gwY4cMnwDrtNv6UmqrOpwauJ7wvWd6xj8i+LU4pjfRS920PrqVWkGEK2SL
 4+tg5bONLdifg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
In-Reply-To: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
References: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: soc-pcm: change error message to debug message
Message-Id: <161298789619.5497.10810235891247531439.b4-ty@kernel.org>
Date: Wed, 10 Feb 2021 20:11:36 +0000
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

On Mon, 8 Feb 2021 16:12:45 +0800, Shengjiu Wang wrote:
> This log message should be a debug message, because it
> doesn't return directly but continue next loop.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: change error message to debug message
      commit: b6eabd247db8bb2d013fb9a9451ecb04a44ee58f

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

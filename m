Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBD53FC44
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04ECC1A23;
	Tue,  7 Jun 2022 12:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04ECC1A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599091;
	bh=0uRi5AygOJF8wFte85uPBtML5MIurAVx8GIng0l1rPw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vt/BV6XRF7VxH5Yg5CBMCqxzrWdOJkcQXIBTCWB0kcypKIjUkzm/o1X7jp6yoF67r
	 DqIh5qqAViSbgZm4ftAj3cKISajwhjUjzs+5j6XVdY3kRwN4kJBEv5D8A0J5YEToAu
	 BvcigVDcPYluD+QPi9fqIhu+LD7XYSDPU5cmAqF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F7ECF805C6;
	Tue,  7 Jun 2022 12:46:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B7CF805BF; Tue,  7 Jun 2022 12:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFFA7F805BD
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFFA7F805BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CNg/3HYB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04BB5614B1;
 Tue,  7 Jun 2022 10:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34997C385A5;
 Tue,  7 Jun 2022 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598759;
 bh=0uRi5AygOJF8wFte85uPBtML5MIurAVx8GIng0l1rPw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CNg/3HYBuWH0xSTAlaR0iyGxBLR8sDaT0h98abdvBLl34mSFFON8VLeIAJQ0W5jlq
 ybSOaxBG0N+CTBL3YupQWAY+hvw+i32ScNLLneXn/3rSrha1UjncnB0N3dsv2CpWPW
 QW0Yox/0URd13q21N1YOcBrg1EY60VUGy/u6uvcqByqgwydt1ximlRU3YE7sNECofY
 D+ROxG4Qw01wU6o+AVMGRh/2f+2rODaOl+UjsvMo67ewPHEAXPGgkyHBcPAmePFvC1
 Vd5eFkw7AiHNc3o18Ugj6HITBpw7sIJVJvAmnMqClf73uYoBQ9Db+caUiPDJ2Vm0Ng
 QG3OpNCOmsoUA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org,
 david.rhodes@cirrus.com, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220602092921.3302713-1-broonie@kernel.org>
References: <20220602092921.3302713-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Clarify snd_soc_info_volsw_sx()
Message-Id: <165459875793.301808.7809608397113113152.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On Thu, 2 Jun 2022 11:29:20 +0200, Mark Brown wrote:
> Currently snd_soc_info_volsw_sx() is implemented indirectly, wrapping
> snd_soc_info_volsw() and modifying the values it sets up rather than
> directly setting up the values reported to userspace. This makes it much
> harder to follow what the intended behaviour of these controls is. Let's
> rewrite the function to be self contained with a clarifying comment at the
> top in an effort to help maintainability.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Clarify snd_soc_info_volsw_sx()
      commit: 99b5c107506c728b8a7d25742cf13f6c9c89d6ea

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7E5425F52
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C9561607;
	Thu,  7 Oct 2021 23:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C9561607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642873;
	bh=/Tv2AJXNqG1K6AaAZPNmFslYpyfGUUUZMyM5Sy8SveY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lcOBlGxRWIDp8B/sHmIPrz58+Sn3CqhVczrnr9WX8l3Jy/++elFuxTVhWdLTo5odl
	 U4Ng/Atu29FJC92d+mmpm/Xx/MSV/9P8IbZhPqEzmuyh6M56dW5AhlacS+cDCzaJKQ
	 r6hFVTo/LQhZTM9zL0SKd2ZeQpf8N1uJR+67nWes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0572DF804FC;
	Thu,  7 Oct 2021 23:38:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B199F804FF; Thu,  7 Oct 2021 23:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C26EF804E5
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C26EF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sxlGx/Sv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B15B60EBD;
 Thu,  7 Oct 2021 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642678;
 bh=/Tv2AJXNqG1K6AaAZPNmFslYpyfGUUUZMyM5Sy8SveY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sxlGx/Sv2YvZQnVG+HzczGEHYz2Ton2qegauJXIS2DxykvYzBQe2reeOV2lgScYt3
 ovbqfzzDtbn+N0Z+SYzERV/oRrGfqsvaNuV55DNF8aFHqYsEV+6oSEL0Ayb4yTi/qL
 pVpQMBrDy6TyYJR2HvOmPQImJ2jy9Z9bZ0ER0xOCurmB2Vwk7XUNfhmimdnwFqClPU
 6tqdb10JUJZ85ye5eMUBIeKCHpnlm+b9MidUU1NijiB53gD8UJ2cRrXVq0uJ8/TSsZ
 9ZSmFhoqtikyrI+65cP6LsVZLQkcgRehU/zXJR1oAUOeGNSi9W0QMqNKkngMVSBgM5
 hk0fVwU4l0okQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: pipelines: Harmonize all functions to use
 struct snd_sof_dev
Date: Thu,  7 Oct 2021 22:37:29 +0100
Message-Id: <163364264607.649699.12990451160699048118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006111651.10027-1-peter.ujfalusi@linux.intel.com>
References: <20211006111651.10027-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Wed, 6 Oct 2021 14:16:51 +0300, Peter Ujfalusi wrote:
> First thing the pipelines function which have "struct device *dev" as
> parameter do is:
> struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> 
> and in all cases the passed dev is actually coming from sdev->dev.
> 
> Skip this steps and pass directly the sdev to all pipelines related
> functions as few of them already does this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pipelines: Harmonize all functions to use struct snd_sof_dev
      commit: d8a15e5fcae132dc6a44847535ce355f6fba46f8

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

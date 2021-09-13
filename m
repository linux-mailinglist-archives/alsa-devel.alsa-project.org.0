Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84040899A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 12:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ABE61607;
	Mon, 13 Sep 2021 12:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ABE61607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530623;
	bh=tKQWpIPTy4lxr6dSc2Ayo1QK0ohn61kDqZmLY/SLYgw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWP4EB+P7mJD9CF3AKRXBwrQTgxHFdrvfUzIfgPCMzvvxrJWtutDl7HNAxAjf0LWh
	 oFr1jUdTq1qwps+4fJojZ4j79SQj0Pn09apP58Rd5RKvzz/INTTSOfVRD1sULV0ss8
	 ovIzgxd063+XhL9A9u5yxd84IAqlPR7BIQhqWYEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D780F804EC;
	Mon, 13 Sep 2021 12:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFECEF804E7; Mon, 13 Sep 2021 12:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31B38F804D9
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B38F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pcF50JiO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E11196108B;
 Mon, 13 Sep 2021 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530482;
 bh=tKQWpIPTy4lxr6dSc2Ayo1QK0ohn61kDqZmLY/SLYgw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pcF50JiOIeSXy91rEQR5IOYcqzSFje/R8jm1I7bcU07pusM9DMuSNtyzwIwz8JsEb
 wkmPhy/JXr1ZxS/ViJAhA0mDRXiUcDSZOASkJ0Uug0HdmnS3oLEhatlzNLvcW++qvL
 xEoFsFwQ+IHbvldx98TSxRwr+0tHRqKxG8TQaCXlpXAhyKMZIqFMw7MbS26xPK5IQd
 vo1qUT21afTOE3wZMnBSbdSTYGNUpqFVmq19jGJtd20STbklC2jyK39f/yMyoWNHpm
 1ifeJrzQ6TAtzO0QfZNC2FhTWjjLz3ldl04jmzTqqESMR+O6zPAdMf8LpYCLgdbYtG
 L/xZhlDI5yhTQ==
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
Date: Mon, 13 Sep 2021 11:53:17 +0100
Message-Id: <163152996584.45703.5307076711708280854.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210906101208.11585-1-jack.yu@realtek.com>
References: <20210906101208.11585-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Mon, 6 Sep 2021 18:12:08 +0800, Jack Yu wrote:
> Add i2s reference control for rt1011 amp.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1011: add i2s reference control for rt1011
      commit: 87f40af26c26233b060767f3e7cff5e54647cf2b

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

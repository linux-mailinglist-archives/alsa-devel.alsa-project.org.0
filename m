Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AA4FE761
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 19:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D080189A;
	Tue, 12 Apr 2022 19:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D080189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649785237;
	bh=HD2LcDKvmyG1fX0S/usHPsdJIssyypdemdstvg2vvdw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2vK3YBXzgAR7UqpXmV2rcZNwnMQEEp5rLA0klfO5U3R8CCSQuCJIPM9fc3/Um7SS
	 xGxLlU82KfY4TP3svB3ja3c673IHjSG/YpESDYIjuTUehmQyYMkrldmNj9AlZiLR6t
	 CI85yFf0n715b2Gg9wtpAWGI6Qf3xl29B0gKNn7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A33B0F8052E;
	Tue, 12 Apr 2022 19:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A35CF80527; Tue, 12 Apr 2022 19:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F1BDF8051A
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 19:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F1BDF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gqoXRvUi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 523FFB81F61;
 Tue, 12 Apr 2022 17:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F98C385A5;
 Tue, 12 Apr 2022 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649785098;
 bh=HD2LcDKvmyG1fX0S/usHPsdJIssyypdemdstvg2vvdw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gqoXRvUimZcFcceovn2J+Rf0GqMz1odxtZPMaghx4ByR0cKWfTWG5VEM2QrVeBYH1
 npd9mnieADkXqady/jsxlCiUZNyO3H1Fb8/8MIVfRg58BELqI/sFUv6e80KNj3f/ln
 YGDdmdqlVQilOFekgWKjXfw/XYyjj0gQENx6LwaD2HeyY8Ty8MEagMBL1g1giCdRhg
 BLPA7o6y6XTBh743y7nn8IJlBCze24QHMaWADOrpBKh7SZ/VhLNzhKeWz05rwi9+Ed
 wJkuwyvditcl0ucOyA+bG6E43tHGpppAk+5hOoV4X9ymQjf1kdT8gP3bXSveDJc4Wx
 ltUG7WEEPRamQ==
From: Mark Brown <broonie@kernel.org>
To: mchehab@kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <cover.1649357263.git.mchehab@kernel.org>
References: <cover.1649357263.git.mchehab@kernel.org>
Subject: Re: [PATCH v5 0/4] Make headphone work on Huawei Matebook D15
Message-Id: <164978509553.404572.15488518886546999478.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 18:38:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, hdegoede@redhat.com,
 yung-chuan.liao@linux.intel.com
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

On Thu, 7 Apr 2022 20:49:55 +0200, Mauro Carvalho Chehab wrote:
> Huawei Matebook D15 uses two different GPIOs are used to control the output:
> 
> 	- gpio0 controls the speaker output;
> 	- gpio1 controls the headphone output.
> 
> Changing both at the same time cause spurious events that are mis-interpreted
> as input events, causing troubles on apps. So, a delay is needed before turning
> on such gpios.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_es8336: simplify speaker gpio naming
      commit: 890a4087a6c2045911b5002566d1528f710cd723
[2/4] ASoC: Intel: sof_es8336: support a separate gpio to control headphone
      commit: 6e1ff1459e0086312e61c2d1ff8b74395a082fcb
[3/4] ASoC: Intel: sof_es8336: add a quirk for headset at mic1 port
      commit: 7c7bb2a059b226ebadb14ce07460f6357023d56c
[4/4] ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook D15
      commit: c7cb4717f641db68e8117635bfcf62a9c27dc8d3

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

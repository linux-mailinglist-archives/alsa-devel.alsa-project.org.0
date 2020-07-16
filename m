Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C326E222F98
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6142B166C;
	Fri, 17 Jul 2020 02:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6142B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944091;
	bh=aELeuDsG4IY2ptyNPTOY+HaVRZce7/9sRpGlxA+LYKA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKzVC5Z29vfgsvRoVDR5cKXd5AKRzNJDjqwRkZZAdhnWSLB8igCTql97Y/H1QV39D
	 U5iih1H5955baTjEIJz8umH9TOLW63bwXZsjwb7y2hkS+uXYQYS2dU+N3bAHW5ZW49
	 8Tt8FH8iiTbXwsD5PHkH0WE8UQyOXy33VVZt/WJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2558EF802E8;
	Fri, 17 Jul 2020 01:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C725F802C3; Fri, 17 Jul 2020 01:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 719BDF8027B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 719BDF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gAZ+uyuR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E2C920760;
 Thu, 16 Jul 2020 23:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943842;
 bh=aELeuDsG4IY2ptyNPTOY+HaVRZce7/9sRpGlxA+LYKA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gAZ+uyuRpnmBVpS5fO5WGexMX7v6Xn2G4g/SHVKCoixrcqdhxAMrw+wSKz8WOFP6R
 qSjJyOn3QUg58rEjTij3UtF3MqOcdgSA/v/jNwLBLAeycnvGvSnBxez4TuS0BxanrP
 yG5VvutjwIM2IKUdosZMA1DGujmJoJ2eKj6HxX4M=
Date: Fri, 17 Jul 2020 00:57:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, lgirdwood@gmail.com
In-Reply-To: <20200716030123.27122-1-oder_chiou@realtek.com>
References: <20200716030123.27122-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: Report the button event in the headset type
 only
Message-Id: <159494380522.42174.10990228154241696852.b4-ty@kernel.org>
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Thu, 16 Jul 2020 11:01:23 +0800, Oder Chiou wrote:
> The irq work will be manipulated by resume function, and it will report
> the wrong jack type while the jack type is headphone in the button event.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Report the button event in the headset type only
      commit: fe0a53044b4bce947045eadd7fa1adbc4685afab

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

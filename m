Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC42616FE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D11116A4;
	Tue,  8 Sep 2020 19:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D11116A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599585830;
	bh=FRrR/gm873YhEFtx/MNcIgfeGL7tH6eKVHNpb/jaGXc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DL9IC/a5C5Ls7CZyYs8KAdg9hVajFjD+Mi4qwJtoEcb4uV2yAaUM6NqZ8YmN1vhFz
	 eSegAUkxcL/GS1jmDrgaTPlzYz5t35yr9BHyxHt+UTaSljmtgg8YpIK2iKE2Cb6XHm
	 ub11scqtX4tE/R4VjaSci4VywyuUBz67Elj4Jt5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFA3F8029B;
	Tue,  8 Sep 2020 19:21:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30D49F802C3; Tue,  8 Sep 2020 19:21:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F493F8026F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F493F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fn3Kv+Em"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FA76206B5;
 Tue,  8 Sep 2020 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585674;
 bh=FRrR/gm873YhEFtx/MNcIgfeGL7tH6eKVHNpb/jaGXc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fn3Kv+EmHzWP8d/vhtTEA8W49k911Mm62NoROvnxuwg4OQZfAKuvGB3XI+OishuJW
 a+Hyc9jco9ni3lYWXg/rx/pXZglieAL+mr3K0XJZzKTCgo/1rrH4/N/YvMTHZ2icCc
 zLM8uSg49lPIHXkzE8oBzfImMlvxeYJDlnL3Rztk=
Date: Tue, 08 Sep 2020 18:20:30 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20200908113204.12012-1-peter.ujfalusi@ti.com>
References: <20200908113204.12012-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2] ASoC: ti: Kconfig: Allow the j721e machine driver to
 be used on K3 platform
Message-Id: <159958562064.16576.385341776960852845.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org
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

On Tue, 8 Sep 2020 14:32:04 +0300, Peter Ujfalusi wrote:
> The initial machine driver supports only j721e-cpb and the ivi addon, but
> other EVMs for different K3 SoC can have similar audio setup which can
> be supported by the driver with small or no modification.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: Kconfig: Allow the j721e machine driver to be used on K3 platform
      commit: 34ce41003bcbff8b20a30eb0938478b156e57a2d

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

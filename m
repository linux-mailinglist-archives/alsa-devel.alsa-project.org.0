Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE7292A79
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 17:31:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7407216FB;
	Mon, 19 Oct 2020 17:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7407216FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603121479;
	bh=BnYGr50OcLEGJPUKBBxaA6+WCjeux/4suQUJmQJG9y4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7oWFCHpQblY0RyKK8P6PshvcjjksMPPYCiDdWngFo8ogxOGKNVSbM549KXiHF0aY
	 U2MdvkrcYt58KDHjPdsf9LajTWtYfw3ql+u6NpO3uqLtrB2gs48Cl0gO12oOKbCVfk
	 zcLOFZ50qomotGmhyCeUFfarGT1+gzT8EJpU67gM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0789AF80264;
	Mon, 19 Oct 2020 17:29:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C0EEF80247; Mon, 19 Oct 2020 17:29:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6A14F801A3
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 17:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A14F801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="el6/GZIc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62AF32231B;
 Mon, 19 Oct 2020 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603121365;
 bh=BnYGr50OcLEGJPUKBBxaA6+WCjeux/4suQUJmQJG9y4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=el6/GZIcVBjTJG1TSj5t5pTA/RFwY8nYW8h51AN1wvMDGSxb/jjmpYbI0toQbW6+h
 25OHF+Nm3pKKOScAyih3XdWRaEDTV8Mw3SMgJy5MohoOxbhCH1xXA0J6HWxmxqYX4I
 ycYMGwCS2D02wveWE2Ng2YTVopl/SumBSU3KoAHo=
Date: Mon, 19 Oct 2020 16:29:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20201019044724.1601476-1-tzungbi@google.com>
References: <20201019044724.1601476-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183-da7219: fix DAPM paths for rt1015
Message-Id: <160312135572.55985.2663710685809756775.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 19 Oct 2020 12:47:24 +0800, Tzung-Bi Shih wrote:
> RT1015's output widget name is "SPO" instead of "Speaker".  Fixes it to
> use the correct names.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183-da7219: fix DAPM paths for rt1015
      commit: eb5a558705c7f63d06b4ddd072898b1ca894e053

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

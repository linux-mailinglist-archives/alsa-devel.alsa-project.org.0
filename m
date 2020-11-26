Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874002C5CDB
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:08:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F9D181F;
	Thu, 26 Nov 2020 21:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F9D181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606421314;
	bh=Wqwm9STBFzNnMy/CB+5wRkk6aIx+t9Lpuhu2scKh5Xc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QT4+yKTo9sXRGQI7GKESTeFOC8lDwoLpoK562cEpK3Ah9lkNwl7/75IocxXFuHMkY
	 GqJmjVNidFsv5rFLYx0kMLRTPSg6OtiTjXf+U540DEnWJIC0K2Noe5QkJn7hn+g2UH
	 FoCxqeShp1nlUeWeI6YceJSNnoxpBn2VswFJzZdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A654F804D8;
	Thu, 26 Nov 2020 21:06:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9617F804D6; Thu, 26 Nov 2020 21:06:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C9A8F804C3
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C9A8F804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JIYP54KJ"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27F3A221E9;
 Thu, 26 Nov 2020 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606421165;
 bh=Wqwm9STBFzNnMy/CB+5wRkk6aIx+t9Lpuhu2scKh5Xc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JIYP54KJCgcohFyO3pbrXUtpoy7JWFsw5+woTe/i7R8N0T79xefqqEe2hKC2O5syu
 ZpigwylXfdT3FyYhD471R1anAqwKpRj73RRM4urQDjmfR99pHwnMHeDd2FgB2Gs8+g
 ETQxD9YPjOCeu3FM48yBD2bzL0ZgZEkbSrzxDgb0=
Date: Thu, 26 Nov 2020 20:05:40 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, timur@kernel.org, perex@perex.cz, festevam@gmail.com,
 Xiubo.Lee@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com
In-Reply-To: <1606371293-29099-1-git-send-email-shengjiu.wang@nxp.com>
References: <1606371293-29099-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl: Fix config name of CONFIG_ARCH_MXC
Message-Id: <160642112480.9090.10420790643480941582.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Thu, 26 Nov 2020 14:14:53 +0800, Shengjiu Wang wrote:
> CONFIG_ARCH_MXC should be ARCH_MXC

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Fix config name of CONFIG_ARCH_MXC
      commit: c61d1142cfd45f58b63bf9d2d59523f91096e873

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

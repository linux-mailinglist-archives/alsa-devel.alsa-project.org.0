Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB024DB8D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6FF1732;
	Fri, 21 Aug 2020 18:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6FF1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598028176;
	bh=0Qa41WQlaYq/whDhAGtnEAcxJQQ+D6ScKD4SEYqiqdA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loCAxZAdFyHPkJYsUM+KZtUShZcKbDjPD6oU/ZvWf4Wy6K1pvJ/UAucHPraldA3DA
	 Dpq4m3KRxTd7X1YMsXrmLDr1CZInYcY25+BySBRfsP0anpifSCK9priGqdjrn+jBZa
	 3JG1vCR+mNOeuLXvRQXb3+P3tGDPU1KvxFEsI7S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2F0F80253;
	Fri, 21 Aug 2020 18:40:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29874F80253; Fri, 21 Aug 2020 18:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37B7DF800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B7DF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tFhKobVf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54B9620738;
 Fri, 21 Aug 2020 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598028014;
 bh=0Qa41WQlaYq/whDhAGtnEAcxJQQ+D6ScKD4SEYqiqdA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=tFhKobVfrzEG7yup28B6oQxCu0m22fBgl45+OOMhAm9D7nVDVZsOcc962F1Sz/OF4
 661BJ0vOFE/0lckXY67wn6Dev3Gxf4wID6Vj/z+CIK9DCpewVVcNRBKT1bc5iYurIQ
 c+K3prNzAP6vny8RTXe3CVki7na7i/iIm8KWIlFg=
Date: Fri, 21 Aug 2020 17:39:41 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20200820134542.8682-1-yung-chuan.liao@linux.intel.com>
References: <20200820134542.8682-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: add .exit callback function
Message-Id: <159802798181.25503.2778020961455268836.b4-ty@kernel.org>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

On Thu, 20 Aug 2020 21:45:42 +0800, Bard Liao wrote:
> We may allocate some resources in sof_sdw_codec_info .init function.
> Adding a corresponding .exit function can help to release these resources.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: sof_sdw: add .exit callback function
      commit: 751365035b4f360369ed6b0990283fd25d4ee32c

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

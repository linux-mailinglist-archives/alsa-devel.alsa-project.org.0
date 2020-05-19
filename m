Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4271DA001
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 20:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 073D31791;
	Tue, 19 May 2020 20:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 073D31791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589914318;
	bh=hYhLKTyLYVF17Qo0xM51fWzt8ALOPUds4/7KAuVkMSY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMqQOm8JmGRUbqvyZfu/PYuuN1vCyXr9XUpwB+/KEcvt5KTt7gsexsV7g+AT0B2t4
	 F+qxpfGFTD1EvDGZtnzI03dsL5I+rp5/9iLqfLGrvTViH3KQhfKFugZIQg0fM0mO0u
	 dnPCSpIh8IADvhPj8A1KleGFJXxHqjBbpQrOvc/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A35EF80110;
	Tue, 19 May 2020 20:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18469F801A3; Tue, 19 May 2020 20:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A693AF80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 20:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A693AF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f5421wRF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D30E720758;
 Tue, 19 May 2020 18:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589914206;
 bh=hYhLKTyLYVF17Qo0xM51fWzt8ALOPUds4/7KAuVkMSY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=f5421wRFsJH/4ozKSSVbpraDC5aZq2JkeyrHX7JS/4gZNS7B0y25/CP5AVE9A7C8h
 PHc/M4gL/i8IRyjdFs+b+80BbLAMSSzvdhHjW5WuMSfNYuWF6H7RaIUzSk5gEeBnoA
 0fdMGjneReEL7G1b6QPVmK8qL+e6c/bcnuz4Yj6Y=
Date: Tue, 19 May 2020 19:50:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de
In-Reply-To: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
References: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: fix kernel warning
Message-Id: <158991420371.37024.9299760374538804911.b4-ty@kernel.org>
Cc: Alexander.Deucher@amd.com, kbuild test robot <lkp@intel.com>
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

On Tue, 19 May 2020 22:34:20 +0800, Vijendar Mukunda wrote:
> Removed unused variable from code to fix the kernel warning.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/3] ASoC: amd: fix kernel warning
      commit: fdae433e5129c4ca87716de08fdcc0034d5aabc8
[2/3] ASoC: amd: refactoring dai_hw_params() callback
      commit: 19cc20bd644f7baf279671c0647ef79c36f259a3
[3/3] ASoC: amd: return error when acp de-init fails
      commit: ce5955866d971864a6cd8d012411ec96b048a696

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

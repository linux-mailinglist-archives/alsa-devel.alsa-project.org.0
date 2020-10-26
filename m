Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77640299B6C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CEA169A;
	Tue, 27 Oct 2020 00:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CEA169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756284;
	bh=BLWQdGveENT5XNgZCgOzbVEsd7JBaWFXeH+L88FYIEA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ads9b/1+i7KqPblGn3AxZva9I2we2gxDgxMMg7cz+wj9bXSgD6vtsXmk+sPsPpcjV
	 AtTqW4FYrwNaq8xvZsWcEKDCNVh+OQgeMap15MXYWPFqGxA7pKuK72IK36DrOTB77H
	 MODtQH7t+dbnUKReRR5TXym2u26AS54/zr04GUfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1685AF80516;
	Tue, 27 Oct 2020 00:46:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 681EBF80516; Tue, 27 Oct 2020 00:46:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DDB7F8025E
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDB7F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fRRUXQ87"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DADB220809;
 Mon, 26 Oct 2020 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755991;
 bh=BLWQdGveENT5XNgZCgOzbVEsd7JBaWFXeH+L88FYIEA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fRRUXQ87VQ35k5AiPOFfP5uCLFQRav0PIoxXOGXqlKUOm7tP9zt0x4BvNSGB2YZ4x
 dWhGaqR6H097WyeQhrKcdJm4Rzbkd/ro84VMFR91UWN9HjX0G5dqV81HSuO6iei6Ej
 726ncxBFzokKXyvuXsvMqLYklLuB7C5yoLT3vYLs=
Date: Mon, 26 Oct 2020 23:46:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20201015102703.24622-1-rf@opensource.cirrus.com>
References: <20201015102703.24622-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm5102: Use get_unaligned_be16() for dac_comp_coeff
Message-Id: <160375592347.31132.15459397417777380498.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Thu, 15 Oct 2020 11:27:03 +0100, Richard Fitzgerald wrote:
> Replace the two-step copy-and-convert in
> wm5102_out_comp_coeff_put() with get_unaligned_be16(). Apart from
> looking nicer, it avoids this sparse warning:
> 
> wm5102.c:687:35: sparse: sparse: cast to restricted __be16

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm5102: Use get_unaligned_be16() for dac_comp_coeff
      commit: 79405e3e5375875f8edc7dd6c1cf5376b1ded6e7

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

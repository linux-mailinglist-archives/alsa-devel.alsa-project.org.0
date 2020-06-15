Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB221FA4C0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C754166E;
	Tue, 16 Jun 2020 01:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C754166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264808;
	bh=UCuNGIhPR9O81kZqqZNtYkyqwE2c7AbQ3pLUmqDtC2E=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMCMxC9AIFHsIXaLbwzoBQt9WKRB2mosTMr0uxaKV1Q7TGZ2IvY6wvjO3irjST2O2
	 XINh8m6CWx+pbZ0f7yl2AHg3W6BnYxVR8gKrV2Lw0gNsLWL/3CLcnoBVHGlhGsWl7Z
	 13KLAloH5E2i3FhEX59etX370TzpkmO6PxNkBXII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D34F80306;
	Tue, 16 Jun 2020 01:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5284FF80305; Tue, 16 Jun 2020 01:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF5A0F802FD
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF5A0F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xYgDpm4b"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C335F20714;
 Mon, 15 Jun 2020 23:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264441;
 bh=UCuNGIhPR9O81kZqqZNtYkyqwE2c7AbQ3pLUmqDtC2E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xYgDpm4b6P+rMt7X/JcKnMx4xF2685o4FLheJeZKIUN423xk0rRBcLB/yQYTxCYws
 7FQ7xREdjd6o9Kj1ORo045npGxRlwizz6Ocm5Fm1xj9svCjH205nusuzPo88uKW1i9
 ShjsauaYQRDGBK8S0B8x8UF9e7yxUV1MGLhqVnjc=
Date: Tue, 16 Jun 2020 00:40:39 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, tglx@linutronix.de, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, info@metux.net,
 devicetree@vger.kernel.org, allison@lohutok.net
In-Reply-To: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
References: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: bindings: wm8960: Add property for headphone
 detection
Message-Id: <159226439190.27409.8588782902296111256.b4-ty@kernel.org>
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

On Wed, 3 Jun 2020 18:26:52 +0800, Shengjiu Wang wrote:
> Add two properties for headphone detection.
> 
> wlf,hp-cfg: A list of headphone jack detect configuration register values
> wlf,gpio-cfg: A list of GPIO configuration register values

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: bindings: wm8960: Add property for headphone detection
      commit: 6f1519a0ff5f1281c4c4d325d6f563a3ed208f7e
[2/2] ASoC: wm8960: Support headphone jack detection function
      commit: c9015a1723373f2c8f8ac994f59470f4fb852623

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

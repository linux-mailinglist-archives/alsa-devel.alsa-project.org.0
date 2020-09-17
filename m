Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7A26E4E5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E0CC1689;
	Thu, 17 Sep 2020 21:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E0CC1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369328;
	bh=P4cVWJU8Vy0KqO0qWa8CEv9MKWSQemRligTWGadOC1Y=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqU5eoyi/T6Gkm56PQTCMH7HdxFMp3am3jrtFGdKRWm6Z5pruixpxKhtpVEOqCqQh
	 d2bOkYArlYZFJzLYJrtJ1ndeWwUtCtNfuOGZhjWMn6Llb+Ta0eAGBCFcvpcmQ8qHzM
	 0FwHaBDWLtT/zziMmx+wwzgNUUgirCB7sbB9j4Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56D0CF802EA;
	Thu, 17 Sep 2020 20:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6530DF802F8; Thu, 17 Sep 2020 20:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD926F802EA
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD926F802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lW9r8afL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC9B521973;
 Thu, 17 Sep 2020 18:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369087;
 bh=P4cVWJU8Vy0KqO0qWa8CEv9MKWSQemRligTWGadOC1Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lW9r8afLTaOWjSq8T5o8+myt++LzeHQ4NyKuv7vowIG53OmtlCc0oITkYIXPt9gGm
 xYATJtxnubKHgP/JRhc1JbnILZiRi0kBR2/9KEuuYcdjWQKHYEkVLw5cYOQJSLiEBe
 FmaGF4jWq2BtFf50Xt35HSshq88Zmmi0ZJk3X5lM=
Date: Thu, 17 Sep 2020 19:57:17 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh+dt@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <1600178220-28973-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600178220-28973-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: ak4458: Add dsd-path property
Message-Id: <160036900934.20113.2210224805843126757.b4-ty@kernel.org>
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

On Tue, 15 Sep 2020 21:56:59 +0800, Shengjiu Wang wrote:
> Add "dsd-path" property, which is used for ak4497 codec
> to select the DSD input pin.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: ak4458: Add dsd-path property
      commit: fc50e26de9677206ae43a261ddc4181ed7e4af78
[2/2] ASoC: ak4458: Add DSD support for ak4458 and ak4497
      commit: 337d348b8399adf1a19c8d65f6407939b4743fc9

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

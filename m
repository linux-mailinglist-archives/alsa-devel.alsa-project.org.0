Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EA2ADB33
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 17:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775741743;
	Tue, 10 Nov 2020 17:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775741743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605024269;
	bh=ie3J/2MS7vjiEfSv1p0lPveL076A6s9sdaz+Gma5P0I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUZpELlO3fb+McFZCrfsE1giFSwOcAiaM5S8Gs/3alyMPBt3kofPQP3LbkUauvd6d
	 TbO+DdmHe/RQ7pcKzRLLVtHDVUh9fG1z61vN9QPPkLMaNYDRoMfqUWZQbNkeMIPjmr
	 wdjTe94Jl35f32odURGGDamp+662hAtPt0rxsZU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90472F804C2;
	Tue, 10 Nov 2020 17:02:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61D09F804BD; Tue, 10 Nov 2020 17:02:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B9EFF801D5
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 17:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B9EFF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1k015Roh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ACB3206E3;
 Tue, 10 Nov 2020 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605024160;
 bh=ie3J/2MS7vjiEfSv1p0lPveL076A6s9sdaz+Gma5P0I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1k015RohfC/Wu6QB7nZOjPM+lM2kV/rT9j6zbS0aDS5FqRmbbsxkxF+Bs0NZEZVrl
 vw9pKdZFgog48gHWXb+kUXXmdnswWO6E2S/afEmfkPywjmchiikFaYmO6CciHNK1AH
 qXfBaNaMZyJu9tLYvxCeOwyzUlYYqGPH4FI6e6z0=
Date: Tue, 10 Nov 2020 16:02:26 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Ajye Huang <ajye.huang@gmail.com>
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for SC7180
 sound card
Message-Id: <160502414080.45830.11882063016977646088.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, robh@kernel.org, alsa-devel@alsa-project.org,
 tzungbi@chromium.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, srinivas.kandagatla@linaro.org,
 Rohit kumar <rohitkr@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
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

On Fri, 6 Nov 2020 14:14:31 +0800, Ajye Huang wrote:
> Note:
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
> 
> v6:
> - Documentation: Addressed suggestions from Rob Herring.
>   - Define "maxItems: 1" in dmic-gpios property.
>   - Only keep one example and add dmic-gpios property in.
> v5:
> - Machine driver:
>   - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
>     detailed info at https://lore.kernel.org/patchwork/patch/1331087/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
      commit: 0e38d93493c7b11bc250113dd5b7b9d17ba8c54d
[2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
      commit: 3cfbf07c6d2779d24a6f5b999a91f400256b1d4e

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 097892B5522
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:37:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218E7177C;
	Tue, 17 Nov 2020 00:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218E7177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569835;
	bh=b5ELcT0j1+gXK/DBMCkE0hOgfeoQgXNezWmZaFt2BhQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=su55Qg9Z8attjEK3eFbRvyDkND1TtCE4KfCSym7YlwlKQXR7/ZEiNYH+G0sF4wZKw
	 BHt8tWYdTcGuXgJXsvJ9t+DqRFQYjD+8xVDCUgn7sfb+onQjpMlgoqDmbF1zXoF4zb
	 StMYG7QKKqjqr3Oar2Bz87LtXNDL7kImQxl9GfEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E3EFF804ED;
	Tue, 17 Nov 2020 00:33:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50052F804EC; Tue, 17 Nov 2020 00:33:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D2FF804E3
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D2FF804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xQmF8unb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBD95222E9;
 Mon, 16 Nov 2020 23:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569619;
 bh=b5ELcT0j1+gXK/DBMCkE0hOgfeoQgXNezWmZaFt2BhQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xQmF8unbBa604qPLYUQyT5DXD+nMaV8le+rEqJ2IR+RMK+uzA8n/7zPRe+EUYNddG
 6kpHyZoi6SHJ6pKvzuDdH0EbvkU7h3XPaLefc8dRfhI6fuuY+uJfd+5I6bZkUMQrL6
 9tEoxbuCPvZpWl532zBzmXdx6ogf+hya2Hd+RrWk=
Date: Mon, 16 Nov 2020 23:33:20 +0000
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, bgoswami@codeaurora.org,
 rohitkr@codeaurora.org, robh+dt@kernel.org, tiwai@suse.com, perex@perex.cz,
 plai@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 alsa-devel@alsa-project.org
In-Reply-To: <1605292702-25046-1-git-send-email-srivasam@codeaurora.org>
References: <1605292702-25046-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: sc7180: Register shutdown handler for lpass
 platform
Message-Id: <160556956527.29683.12943309254001939669.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

On Sat, 14 Nov 2020 00:08:22 +0530, Srinivasa Rao Mandadapu wrote:
> Register shutdown handler to stop sc7180 lpass platform driver
> and to disable audio clocks.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: Register shutdown handler for lpass platform
      commit: 60a973862f3c41bc8d4b7a74bd45eda220e248e8

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

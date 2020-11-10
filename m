Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2B2ADB3A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 17:05:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D481751;
	Tue, 10 Nov 2020 17:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D481751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605024316;
	bh=arSU7iObv5TKvnOj6naRt5mQLdMTSeyl4JneYSecfts=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVd5E/WmXhKe4x1htTlltLYQFV0f/RX6mOarKD0mQeBTYulsQu9I5LHcUSHasH2Lo
	 OyZ12t3pZxjBdnpmTLpHnwIpOda60A2Kde6Z5YFsT71tkOzFYa+RI6K1ik6hcV8wuQ
	 hkiu5fPsT9dtgJ7EIkRfM42PJI6HPPcVtbDP1d+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCDEF804CB;
	Tue, 10 Nov 2020 17:03:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 882CEF804CB; Tue, 10 Nov 2020 17:03:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44DC8F804CB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 17:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44DC8F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aoUlOLUo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DCED20829;
 Tue, 10 Nov 2020 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605024183;
 bh=arSU7iObv5TKvnOj6naRt5mQLdMTSeyl4JneYSecfts=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aoUlOLUo8fWOL4ebcQd9XF/ZfKTW4mTZ+5YkQb53YE2DJ76QTKZq09jrZtxsyfrtb
 Gne4/wjoyQfVjF7BwPMw+KFcqJr/dcs0xtV/rF8gsIEHK828Vir2rfMTmq4ViQw1pr
 CYm2jTOzaUiPEaOC2rll/wqA2TovOvW+4C3aB9ZY=
Date: Tue, 10 Nov 2020 16:02:49 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Ajye Huang <ajye.huang@gmail.com>
In-Reply-To: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 0/2] Modify documentation and machine driver for SC7180
 sound card
Message-Id: <160502414078.45830.11309600092998215198.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
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

On Mon, 28 Sep 2020 14:37:42 +0800, Ajye Huang wrote:
> Note:
> - This patch depends on this patch series
>  ASoC: qcom: dt-bindings: Add sc7180 machine bindings
>  https://patchwork.kernel.org/patch/11773221/
>  ASoC: qcom: sc7180: Add machine driver for sound card registration
>  https://patchwork.kernel.org/patch/11773223/
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
      (no commit info)
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

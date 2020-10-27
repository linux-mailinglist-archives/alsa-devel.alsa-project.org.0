Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06029CA74
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 21:41:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B2D16C7;
	Tue, 27 Oct 2020 21:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B2D16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603831277;
	bh=Dmex8B7MuY24WP9Gh+Qt7EKTYyT+ok3PmAB+LZ5455E=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lUd9tgITeHW/y5LsD4fobD5uULquhA9Xtz+cw0PgrW3zUKJ48CK27WPnvzPvBI2s3
	 ZwlU3XYyESU7TocB8NA0siYkJOWclFbVaxDsR++7U6+JmdmuB9RiwS5orJOKDjrgqb
	 EJkw++Jz3N9Uhsve4RGeZ0XlNBLUJHHpUxFBWz0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA7D3F80240;
	Tue, 27 Oct 2020 21:39:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10092F80086; Tue, 27 Oct 2020 21:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9EE0F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 21:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9EE0F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pb8K5NLu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BFC920791;
 Tue, 27 Oct 2020 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603831162;
 bh=Dmex8B7MuY24WP9Gh+Qt7EKTYyT+ok3PmAB+LZ5455E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Pb8K5NLuo1CeNsg3hnSHB+nEPtvOZeMqdLccL+x0KA1VpGfE7LILNC4AiHxE18l7V
 U3YRYef8o/DS+tFLTytH+8BOD5k9MJbcgSliBRrk7j2KbWHBy3oAzlATKVGFaxY588
 5DAxYRKvN/ptmgApJ3owaHOggN4oppAXTYsO8R7Q=
Date: Tue, 27 Oct 2020 20:39:16 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>
In-Reply-To: <20201027032234.1705835-1-cychiang@chromium.org>
References: <20201027032234.1705835-1-cychiang@chromium.org>
Subject: Re: [PATCH v12 0/2] Add documentation and machine driver for SC7180
 sound card
Message-Id: <160383115673.25818.3743728810770710217.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Tue, 27 Oct 2020 11:22:32 +0800, Cheng-Yi Chiang wrote:
> Note:
> - The machine driver patch is made by the collaboration of
>   Cheng-Yi Chiang <cychiang@chromium.org>
>   Rohit kumar <rohitkr@codeaurora.org>
>   Ajit Pandey <ajitp@codeaurora.org>
>   But Ajit has left codeaurora.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings
      commit: e158d2d83cab59ec7f4661548627ac171c797c9d
[2/2] ASoC: qcom: sc7180: Add machine driver for sound card registration
      commit: 9e3ecb5b16818abd0bc5f3997cf4d641a710f837

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

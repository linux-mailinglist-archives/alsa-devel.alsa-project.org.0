Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D82B0E3D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 20:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAD0184B;
	Thu, 12 Nov 2020 20:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAD0184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605210072;
	bh=IIC3z8DoJYS3m/UUHzXZzuwRZqJYxGm5s1nx2Q+3JhY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZ1kKXbNG0DnW9fWD90RQ7SeqL2rXs8x2EJV85WE+ik+PPew+VRx5QSIHhktFw7Xg
	 GvGFyrwZmVA+SXvQu4r7ONNgyJOOPhiXf5Koh2J46ULlhdzxwEWSfHuW1Kvi8f2J1s
	 aVZkOXjC7pFZL9HxllD582y1mB3FRiYIVqru7GV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A73E5F804BC;
	Thu, 12 Nov 2020 20:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A24F804B1; Thu, 12 Nov 2020 20:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B175F80290
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 20:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B175F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0K6FdYay"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D8A32223F;
 Thu, 12 Nov 2020 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605209930;
 bh=IIC3z8DoJYS3m/UUHzXZzuwRZqJYxGm5s1nx2Q+3JhY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0K6FdYayNjvTCAJ4CVqO3mOyTSzAHAxmGNXPS4J9kxN0T8fSB2JwSGthuw5ywbNEY
 dDIYo1ILzjWVZbiiHHVKQnm0mSrgtmZg15/jPpB52UbyCvYZH3FGXSNOCgrxlWjBc5
 TnGod5sXXG/3FodI7hxA/J9qjf38IVL+wauUk5xQ=
Date: Thu, 12 Nov 2020 19:38:35 +0000
From: Mark Brown <broonie@kernel.org>
To: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2 0/2] Support SC7180 sound card variation without headset
Message-Id: <160520990388.38586.14245119235842247312.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, tzungbi@chromium.org,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dianders@chromium.org, Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

On Thu, 12 Nov 2020 09:43:26 +0800, xuyuqing wrote:
> Use compatible string to let machine driver handle the case
> where ALC5682 headset codec is replaced with ADAU7002 dmic codec
> 
> xuyuqing (2):
>   ASoC: google: dt-bindings: add new compatible for sc7180-coachz
>   ASoC: qcom: sc7180: Add machine driver for sound card
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: google: dt-bindings: add new compatible for sc7180-coachz
      commit: 80e2b1208d87fc46b6980da99a173130082c7af4
[2/2] ASoC: qcom: sc7180: Modify machine driver for sound card
      commit: e936619b7ce784c808a8e2524f712a89ef245920

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF40B306242
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:41:29 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B550D17B6;
	Wed, 27 Jan 2021 18:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B550D17B6
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E651F804F3;
	Wed, 27 Jan 2021 18:15:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3759F804F2; Wed, 27 Jan 2021 18:15:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EADA6F804E7
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EADA6F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xbh0Cj2r"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95F3364DA6;
 Wed, 27 Jan 2021 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611767703;
 bh=Jwcav97hQHhQBoXQqSHH19U0iri8g3r7wuWgGbnyEyc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Xbh0Cj2rU2kVgw/qGpWIGxF3c0FVaTzje28tPlfWz4whBd4p0ot1XBusTKRnbtPV8
 hojCiP259Mt5Ix4G14IewiS/mNeqK0oF3C391uPlX8MGX2nAK43AUDcQgGxNQOrg+G
 2cpSiA1i0uEPkv55fCKt3ovZXDEvUn3z1/sABS+8s5y5nMAXY72EamupR52l4G7zJ6
 6HVd8trU+t4zEi0rUepYVbc6ewliAHaITEUBEZpl/7aUn1P55Bq2qw+MbkMzLi38U8
 d1IT8ViAJTZyO6WAwMZTeS2h5gB6YpYXowVfnw68LE3g/veuu0tY9lBFoMBj1lbGxa
 Q1etK/YOnN69g==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
In-Reply-To: <20210127134847.1143535-1-judyhsiao@chromium.org>
References: <20210127134847.1143535-1-judyhsiao@chromium.org>
Subject: Re: [PATCH] ASoC: max98373: Fixes a typo max98373_feedback_get
Message-Id: <161176762855.34530.12866385579369703713.b4-ty@kernel.org>
Date: Wed, 27 Jan 2021 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Judy Hsiao <judyhsiao@google.com>, cychiang@google.com,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, dianders@chromium.org, tzungbi@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 27 Jan 2021 21:48:47 +0800, Judy Hsiao wrote:
> The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
> to snd_soc_gut_volsw.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98373: Fixes a typo max98373_feedback_get
      commit: ded055eea679139f11bd808795d9697b430d1c7d

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

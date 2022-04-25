Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C950E738
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4FA3182D;
	Mon, 25 Apr 2022 19:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4FA3182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907628;
	bh=GC3QoMXgEgyYur5FYAOo7I1aMNJG9cmUPkaCoB8bjXQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htbRWuImyLcjt45Rbk0lMo9uoMuG45WUxgEaqORQOTwJF8KPgTvYDgA5XfzXsirjY
	 m2RzYmj5kZn0Vmd7K5tJnM4r3PzA6w0vpF4/r9sMr6y/clyqZfu6BVshyf0LTcEc4c
	 v9S/75Agpu1yLoez5LS6yhVK6hh6eYhSU3z9Uh3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0590F80519;
	Mon, 25 Apr 2022 19:24:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E81F80516; Mon, 25 Apr 2022 19:24:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59871F804AA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59871F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eXQr1o1R"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED330614D1;
 Mon, 25 Apr 2022 17:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB177C385AC;
 Mon, 25 Apr 2022 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907463;
 bh=GC3QoMXgEgyYur5FYAOo7I1aMNJG9cmUPkaCoB8bjXQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eXQr1o1R+HIG1dXQouie8PLA0dXW5Y2hnO6K+YgNIpi1fFjAevdwBSxWnNkaZEAim
 ADfrLQIMpEoqScHHS74BHDgDSl3SeKEghfoTZcM4/QtzjaXShO2EAu0I2vMkYWNu2R
 mmYu024AgzXMGlnhjCJXcQqYUyvDnP5yquYLUXOZTGBoYaiC45mmlN+yb+Qtudyu5B
 LBr1CyPFcq0jVzpxeVaNL3g7/KLRC4SAKzfAbYwIOKvoPh2r5pEDfcjfSJdyolV9sa
 hI+CyOULXC2SxT7e6UX2p1wN8W2nLCg7q1mIxbq2tCl/TsnignR+uIv+dp1rNThGc/
 v/70MlHFVzWwA==
From: Mark Brown <broonie@kernel.org>
To: judyhsiao@chromium.org
In-Reply-To: <20220419062952.356017-1-judyhsiao@chromium.org>
References: <20220419062952.356017-1-judyhsiao@chromium.org>
Subject: Re: [v1] ASoC: qcom: Use MCLK as RT5682I-VS sysclk source
Message-Id: <165090746068.583823.14672760866095847003.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, alsa-devel@alsa-project.org, dianders@chromium.org,
 cychiang@google.com, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, yuhsuan@chromium.org, srinivas.kandagatla@linaro.org,
 swboyd@chromium.org
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

On Tue, 19 Apr 2022 14:29:52 +0800, Judy Hsiao wrote:
> Both MCLK and BCLK can be the clock source of sysclk via PLL
> according to its datasheet.
> This patch sets MCLK as the clock source as we use MCLK in the
> previous projects.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Use MCLK as RT5682I-VS sysclk source
      commit: 4d9596d42152bfd4a57cc317acf9cd0b90769033

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

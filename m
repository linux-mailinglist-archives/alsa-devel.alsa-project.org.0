Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DBD2EF5BF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:32:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420F3174B;
	Fri,  8 Jan 2021 17:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420F3174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610123535;
	bh=ZBu9tjYBBJQuV5KbmR1p4sGRZK+cB8ndAlphGe/jjPs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkY3+SsLOzipAJfaQRacSsOOANCoPjz+O4HpG5S8ltd6WUbD9W58hU6VwxKTOsIfm
	 7JEMLIT2x4cjoolkYlxx1/iCdjh00mWNxL+fkwTa4oR7Mkpglf6IBHGxhpus4QsurT
	 2AsTJNbs/RRVjLEiL1c/dHfDd8ZlMlFl/U86fwBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74CD5F80279;
	Fri,  8 Jan 2021 17:30:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A9A1F8016A; Fri,  8 Jan 2021 17:30:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01B76F80165
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B76F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KqiAd65K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1CFE2399C;
 Fri,  8 Jan 2021 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610123416;
 bh=ZBu9tjYBBJQuV5KbmR1p4sGRZK+cB8ndAlphGe/jjPs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KqiAd65KXPLfyi2hp74X74giWKKNvdCa6ERl4qmtzaSng7Ocj/aNxVdTLybA0PSU1
 wRk1Ubl7O8lbUi0nA99Wt4goF0iVZ92sht1AjESfFGy858YuYUkMcnje+/NiIVu5wr
 P7hl6z5KUJkpkQdFRFGtQh6XIfAG5byel7ZVbA50tYRs7wAjCbMBUZ8VCvFEUjGYfG
 1IIpp0A9ChcocGRuj69JkVXt7k3st+75hyMo/m83qOAldK0CSLVAK9wmIs+UtBlT2L
 qTTqUNHFODWlDMCv+BH8WMxSY6XcyWYrcSPjHx2CO0Gng1lkA+sJAOCGb86ISQEyZT
 wNg+wiO15Kf+Q==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20210107165131.2535-1-stephan@gerhold.net>
References: <20210107165131.2535-1-stephan@gerhold.net>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Fix return value in
 hdmi_codec_set_jack()
Message-Id: <161012338172.40879.415070195222728099.b4-ty@kernel.org>
Date: Fri, 08 Jan 2021 16:29:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Thu, 7 Jan 2021 17:51:31 +0100, Stephan Gerhold wrote:
> Sound is broken on the DragonBoard 410c (apq8016_sbc) since 5.10:
> 
>   hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at snd_soc_component_set_jack on hdmi-audio-codec.1.auto: -95
>   qcom-apq8016-sbc 7702000.sound: Failed to set jack: -95
>   ADV7533: ASoC: error at snd_soc_link_init on ADV7533: -95
>   hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at snd_soc_component_set_jack on hdmi-audio-codec.1.auto: -95
>   qcom-apq8016-sbc: probe of 7702000.sound failed with error -95
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Fix return value in hdmi_codec_set_jack()
      commit: 2a0435df963f996ca870a2ef1cbf1773dc0ea25a

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

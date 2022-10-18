Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEB602B7C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 474E79508;
	Tue, 18 Oct 2022 14:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 474E79508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095383;
	bh=ERE5fGH+iI9+kRAgCKLOw9anYezkn5lRnmwLpEkdq0I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkna9e5Ea08qWECvye2MhOtlVKFpOCD6qyn9RfP3uP8NLNsR7MZxGQaaEkdEADdeL
	 nJJZ/J/PSG0sdVpHXp9dsWjLkfAZBHyD/he3fXCVDqwjI0XduvNCnV6uzMeoZTGxKm
	 fAwWcWCpXYjNopXu1DOjnualIIp96bdJGpIjecrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF52F8059F;
	Tue, 18 Oct 2022 14:13:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26BCAF80564; Tue, 18 Oct 2022 14:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34E0FF8057B
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E0FF8057B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iKdwIl/d"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54A04B81EBA;
 Tue, 18 Oct 2022 12:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4ABC433C1;
 Tue, 18 Oct 2022 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666095220;
 bh=ERE5fGH+iI9+kRAgCKLOw9anYezkn5lRnmwLpEkdq0I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iKdwIl/dNubjlRXdkBy5sm5XTV/nRUNOr4+7c2Jf4UKbFzdavPuE7pIDovmKNrsMf
 Z1qzOJ3ChUyGND+QEIOrvWd8Y1rdQqcN/jnZMLFe6p4F5V/jPvrYpE0yFM5cvO0abY
 QKXhmBMUHMzz7yp4XnwT7MoInaySuhEudRKUA9afZ3zBGtHpjJI10HIvo50tm4Xst0
 4buUCa1PFkcC+mpIWWT9AlQe3+DJh/iwiN+FduL3wdjqPOBxk0l6TrfRcav2tLZSD4
 Mui+G0fxKV8ExF5zgSD9gvjQmvI5VyQJB6duxUi8+h8o+bFkRz4+psR8QbOWYQS/CR
 iMOV+wUEvDh3w==
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20221015001228.18990-1-rdunlap@infradead.org>
References: <20221015001228.18990-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: qcom: SND_SOC_SC7180 optionally depends on SOUNDWIRE
Message-Id: <166609521768.371929.7568128242261436965.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 13:13:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, 14 Oct 2022 17:12:28 -0700, Randy Dunlap wrote:
> If SOUNDWIRE is enabled, then SND_SOC_SC7180 should depend on
> SOUNDWIRE to prevent SOUNDWIRE=m and SND_SOC_SC7180=y, which causes
> build errors:
> 
> s390-linux-ld: sound/soc/qcom/common.o: in function `qcom_snd_sdw_prepare':
> common.c:(.text+0x140): undefined reference to `sdw_disable_stream'
> s390-linux-ld: common.c:(.text+0x14a): undefined reference to `sdw_deprepare_stream'
> s390-linux-ld: common.c:(.text+0x158): undefined reference to `sdw_prepare_stream'
> s390-linux-ld: common.c:(.text+0x16a): undefined reference to `sdw_enable_stream'
> s390-linux-ld: common.c:(.text+0x17c): undefined reference to `sdw_deprepare_stream'
> s390-linux-ld: sound/soc/qcom/common.o: in function `qcom_snd_sdw_hw_free':
> common.c:(.text+0x344): undefined reference to `sdw_disable_stream'
> s390-linux-ld: common.c:(.text+0x34e): undefined reference to `sdw_deprepare_stream'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: SND_SOC_SC7180 optionally depends on SOUNDWIRE
      commit: 9a7f2c9e7a19b16b4409f372cf2e16e4334cdca2

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

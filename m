Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9B4D08B0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:44:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475FF17B2;
	Mon,  7 Mar 2022 21:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475FF17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685858;
	bh=5S61BsIR/H5cTwmksDis/IvC7kKtQMQg9m+Qpo3d+Ec=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WQtzkK3Bp5s67ZVuPoek5yBH2opNZLc1AF3ZE7FQzFEIT/8uDtBdrliqZFAlPPyIR
	 yKe3EnqtHKLqanC39p5MU+ozd9cZrVicMqu6+WBNsV3oMCbPAUIEqORPTCLvDvzkU5
	 y/eaNRN9tFD/48rDAxw94tECOHJXUmBhgUszgrW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24573F8057A;
	Mon,  7 Mar 2022 21:39:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 189ACF80579; Mon,  7 Mar 2022 21:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB1E2F80579
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB1E2F80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p9raRPCG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D125B8170A;
 Mon,  7 Mar 2022 20:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB4BC340EF;
 Mon,  7 Mar 2022 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685568;
 bh=5S61BsIR/H5cTwmksDis/IvC7kKtQMQg9m+Qpo3d+Ec=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=p9raRPCGJzmCKsABw/ZELXBixP1/POtjWYHK475CrsVbx6JkYMQUUkh+jekzbICww
 ZVfhD+cpegaowbL/ayaRB1u+bVwcdM/PR5tCdWE6mQ+/j+KzvSmPsWPi7ZhkorQCan
 BlXnV+IYfvtU7DZcSxci/SHezivnSR4Lxn4T2oPiFIQrNeKaCnBw4v65qco0BT8lcz
 aPNpeHSl1PsBgopMb2LABt/I9iKh6CktUxDejWVweqEdHJEuPn8iiixVhKx0DRBX1W
 qgDj4korCJYmwqOL9Tt1H64xNJI8HZgh30UTs29uJbJm9YwqX1M7yZBRnckUafioNC
 6n8OqYxGy7h1Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220304160934.32010-1-srinivas.kandagatla@linaro.org>
References: <20220304160934.32010-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: select correct WCD938X config for SC7280
Message-Id: <164668556615.3137316.2971642861768642189.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, quic_srivasam@quicinc.com
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

On Fri, 4 Mar 2022 16:09:34 +0000, Srinivas Kandagatla wrote:
> SC7280 config selected WCD938X instead of WCD938X_SDW Soundwire codecs.
> WCD938X_SDW actually selects WCD938X, so directly selecting WCD938X results
> in unmet dependencies and below warning
> 
> WARNING: unmet direct dependencies detected for SND_SOC_WCD938X
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=m]
>  && SND_SOC_WCD938X_SDW [=n] && (SOUNDWIRE [=n] || !SOUNDWIRE [=n])
>   Selected by [m]:
>   - SND_SOC_SC7280 [=m] && SOUND [=y] && !UML && SND [=y]
>  && SND_SOC [=m] && SND_SOC_QCOM [=m] && (I2C [=y] && SOUNDWIRE [=n] ||
>  COMPILE_TEST [=y])
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: select correct WCD938X config for SC7280
      commit: 6ed5dbba6c971fe644f5c2b4aae436b39da99f18

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

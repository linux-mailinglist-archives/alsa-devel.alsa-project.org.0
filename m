Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A76A4D45D4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B0C18C6;
	Thu, 10 Mar 2022 12:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B0C18C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912263;
	bh=qHuRMGS4wNJnueSlJQQpCm5eLSpGCGZ8/lMw/2uIL7g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDAnORgWMOxGMRC+SLsy5lAYC9iK2lM5/K0c4NRzqG4inAq//7rFJF/dSCBpIiHRJ
	 2NYZ2DA9Blc+A/cTn9LxEpc1CoFqPD7ZKWAAWYhT+V3Ro8lqpl1xBQQkyH9t0aO6Pl
	 NCY+5cESobYFq6HJcVZDONvjljLBqKNv6TgfiusI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F8AF80527;
	Thu, 10 Mar 2022 12:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A96F80519; Thu, 10 Mar 2022 12:35:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B01BF804CA
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B01BF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D9t13BIJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C9BA2B825B5;
 Thu, 10 Mar 2022 11:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724FBC340E9;
 Thu, 10 Mar 2022 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912117;
 bh=qHuRMGS4wNJnueSlJQQpCm5eLSpGCGZ8/lMw/2uIL7g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=D9t13BIJivNlo6iNcy24bXbEPD8ihuA0od8GaW4khcm4weEH+eOA950zEYYOx4YrG
 0YbmLFgWX8+lUnycD2DXH0/MryX0wQdYl4WWp9XOfGWImk/FKLW9/QFgRiM4JE4yE+
 srbRhYLAsn3eWxFqLVwn6KVWUL+7R8QMyozDlzCmAoyZt5gXT48NO/PmqHaqhV9FLJ
 gRn1nV4OenfkzGFz1SNWJqbdmCE6CJzHKH1OHkatioyQkKgp+ijZovhNgoGGFNzchU
 +LYIzfxqVDAZAfXbcphDHOlf2OIYuPLCQOLOLgk0ccwAdu6Z8pL+7pcAL33nPvuAAq
 feAbVZDQM/mfg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220309124453.25841-1-srinivas.kandagatla@linaro.org>
References: <20220309124453.25841-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: fix Kconfig for SC7280
Message-Id: <164691211518.13798.17099640461553438579.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, lgirdwood@gmail.com,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, quic_srivasam@quicinc.com
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

On Wed, 9 Mar 2022 12:44:53 +0000, Srinivas Kandagatla wrote:
> select would force the symbol to value without checking the dependencies.
> In this case selecting TX and RX MACROs directly without checking its
> dependency on COMMON_CLK would break builds on platform which do no
> set COMMON_CLK.
> ex:
> WARNING: unmet direct dependencies detected for SND_SOC_LPASS_RX_MACRO
>   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && COMMON_CLK [=n]
>   Selected by [m]:
>   - SND_SOC_SC7280 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] &&
> 	 SND_SOC_QCOM [=m] && I2C [=y] && SOUNDWIRE [=m]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: fix Kconfig for SC7280
      commit: 31ef579d433a6bcd6b942edea372040298295acf

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

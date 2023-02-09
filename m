Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1B691068
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7841A83D;
	Thu,  9 Feb 2023 19:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7841A83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675967840;
	bh=+LSLpRI2R2Ci3s4pXgdPq4Kud/VwskP44G1eoKLygiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MgRTsXyZvTs7mNXrTDcUB69W9z/NhbF2hd+lkOeAWdZQl/D3/04dhhE0/XQDFCelk
	 6BmYTqXVR7W1R8snxdZ5jufnAMBFGlSYtIECfcqD1p82sCd0EEqvQIdW9GVA9OSlON
	 oOGori2OvXiMXujeNQLesQJutywNuHB+IK68u2qI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C24F80094;
	Thu,  9 Feb 2023 19:36:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B607F8021D; Thu,  9 Feb 2023 19:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1851DF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1851DF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T/sHbWR3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80D0661B80;
	Thu,  9 Feb 2023 18:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106B0C433D2;
	Thu,  9 Feb 2023 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675967774;
	bh=+LSLpRI2R2Ci3s4pXgdPq4Kud/VwskP44G1eoKLygiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T/sHbWR3IGHrpqVlGeJksvfqHio+DShjt8uKpZEws0ZRAgGhrqTyT3CkeKOseSaX2
	 l3ajwKHBotVkLQw/+fmdknFaOvJHvCKwuNQ8QXCfB0JYqtSSPfBz9OfQVpwP9I4h/f
	 Lwpg+lHZY0aRQ66xZtQAX8fN39wZca5af8Z5S1usvGHBlfXGG7031wBlRYvDUwO08B
	 bZnocuwqGJxU9oplCbZnLHkS6EeABF8D0Wvjf/Nup1l4d0+spL0b5wsVk5bQ1jplZi
	 C4tnUbM02jAr8o9DJaGxw9Ph7oZvj5Fvg5NLv8ViqKplzOwvFhUdLr/NPpa4Ny8cLD
	 0KooswT3/m5+w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/8] ASoC: qcom: q6dsp and lpass codec stablity fixes
Message-Id: <167596777266.879652.13238381832493725395.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 18:36:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: ZAHFSKX57MQUYG3ETQS5C3P4PMBAUML3
X-Message-ID-Hash: ZAHFSKX57MQUYG3ETQS5C3P4PMBAUML3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAHFSKX57MQUYG3ETQS5C3P4PMBAUML3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Feb 2023 12:27:58 +0000, Srinivas Kandagatla wrote:
> While testing X13s audio, we found multiple stablity issues this patchset
> fixes these issues.
> From q6dsp side issues are around locking of position pointer and handle
> multiple prepare cases along with pulse audio timerbased scheduling workaround.
> 
> From LPASS codec side most of the staiblity issues were around runtime pm,
> hitting various issues as the codec was firstly resetting the soundwire block
> for every clk disable/enable which is taking the slaves out of sync and
> resulting in re-enumerating. Second issue was around fsgen clk is not
> brining up the codec out of suspend as it was not added after
> runtime pm enabled. Final issue was with codec mclk rate which should
> have been 192KHz same as npl instead of 96KHz. We were getting lucky as
> wsa drivers are setting the same clk to 192KHz.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: qcom: q6apm-lpass-dai: unprepare stream if its already prepared
      commit: c2ac3aec474da0455df79c4a182f19687bc98d1d
[2/8] ASoC: qcom: q6apm-dai: fix race condition while updating the position pointer
      commit: 84222ef54bfd8f043c23c8603fd5257a64b00780
[3/8] ASoC: qcom: q6apm-dai: Add SNDRV_PCM_INFO_BATCH flag
      commit: aa759f3f9f4394a3af65ad1772fca6cb9dd9e4cc
[4/8] ASoC: qcom: audioreach: fix ADSP ready check
      commit: dd33c2e7b21d72b151a87b5dafffee2c019043e5
[5/8] ASoC: codecs: lpass: register mclk after runtime pm
      commit: 1dc3459009c33e335f0d62b84dd39a6bbd7fd5d2
[6/8] ASoC: codecs: lpass: fix incorrect mclk rate
      commit: e7621434378c40b62ef858c14ae6415fb6469a8e
[7/8] ASoC: codecs: lpass: do not reset soundwire block on clk enable
      commit: ddffe3b82849ba2774d7a06fbe1cc7e83378c4d2
[8/8] ASoC: codecs: lpass: remove not so useful verbose log
      commit: 777af241a7ce6ed95f8d3fcb028c08f9b40addb6

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


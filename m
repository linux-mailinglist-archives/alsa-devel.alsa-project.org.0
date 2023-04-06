Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5FF6D9BA8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B29EDF;
	Thu,  6 Apr 2023 17:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B29EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680793477;
	bh=5pP8MmumjWBYVhJyQijBgzOH56EC8C/7UwgLsd6cVS4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jfVnrM9RdQzzGfACiiEvJhyYm+4xhPjH/MgbAmMZj44llkKjWjNG2ekd7hRk+0aAB
	 NdPqgk3vFwKf4UKgh76KcOd1r7ukTCFDRNc6NmIUJZzkpqMJisCWuUX72j9j82tGwM
	 rArz9W+ivBS9p+MHm4NqV0hUrTDBqPuVNarU6IP8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84149F8015B;
	Thu,  6 Apr 2023 17:03:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FAFDF80249; Thu,  6 Apr 2023 17:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4CBFF80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CBFF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QNH2ItiU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E55A62A75;
	Thu,  6 Apr 2023 15:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B5FC4339C;
	Thu,  6 Apr 2023 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680793417;
	bh=5pP8MmumjWBYVhJyQijBgzOH56EC8C/7UwgLsd6cVS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QNH2ItiURCMYDOpUPuD6NC2EdyvbUp0/dj/Gl6lrxYNNGRvmPcLl3YSD202bLVBWA
	 PWXq70U6ldX/emZEOAQ8Rj0YW9CHHM/zVdvNydkp7uHo6R6moItWREfzUSutlcVgO2
	 tZVyDS2lO8RegO9AHJ32X7IPqqwrF2n7HoI9Q9psjrn91zWvYsg0n0GQnlg538TVwd
	 x/ZH4MgQwrmYKpjCdFrcpwsZ7k0eD07XE5Dw2MdTQkGKX08qapoRH/U/kQ3ZfN0wyo
	 mJz36SDlQz/cM5o8wDfNdN3D0kmbpkKO56mp+wVBvk3gAqis+Gs/6rcuVZBMw7B+jb
	 6mEK8zDWY4/5g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 0/4] ASoC: qcom: fixes for Click/Pop Noise
Message-Id: <168079341548.66286.11030803284296102390.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 16:03:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: JHTK4QFHKCBI2BBKPYQBTRW43PTMTGDV
X-Message-ID-Hash: JHTK4QFHKCBI2BBKPYQBTRW43PTMTGDV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHTK4QFHKCBI2BBKPYQBTRW43PTMTGDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 16:43:59 +0000, Srinivas Kandagatla wrote:
> Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> to accumlate DC when ports are active but without any data streams.
> There are multiple places in the current setup, where this could happen
> in both startup as well as shutdown path.
> 
> This patches help fix those issues by making sure the PA is Muted/Unmuted
> inline with the stream start/stop events.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: q6apm-lpass-dai: close graphs before opening a new one
      commit: c52615e494f17f44b076ac8ae5a53cfc0041a0dd
[2/4] ASoC: qcom: sdw: do not restart soundwire ports for every prepare
      commit: e2e530886359246ae782c779be248c59bc2ed111

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


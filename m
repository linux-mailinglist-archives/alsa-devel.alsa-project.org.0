Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3B68EF97
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 14:15:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E1D3E8;
	Wed,  8 Feb 2023 14:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E1D3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675862101;
	bh=8fGBGs3HjX0aUTesqOsRu+lhLIAg05lxUth8mUkVOso=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ru5J7FcCEsEmfG81AZgYZeuWwllDfFp5rsQ52LlC+c2/JlDPSSHDdXAKUXfV0evqy
	 p+Btz6oP2zSEjsloPx84Ly395Kc60arZ26mqPJsuiB/t8CularC2jqcUEj+QnuMLny
	 df1EU6B35jDia+r5IYn24kV70oh1e6TSXQP4s340=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07E1FF8012B;
	Wed,  8 Feb 2023 14:14:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA02F80152; Wed,  8 Feb 2023 14:14:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BD5BF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 14:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BD5BF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZxgSFhY6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FDF9616A1;
	Wed,  8 Feb 2023 13:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40946C433D2;
	Wed,  8 Feb 2023 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675862039;
	bh=8fGBGs3HjX0aUTesqOsRu+lhLIAg05lxUth8mUkVOso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZxgSFhY64f+G8Vs2HlD1ktg2P3VFBVWAuAPM+01o1ekZR6lJLTZr/CTTJjNTdXsvR
	 GUMv0LY9k2fOEOxClB04LvpWgRCW5hz+xjLRitGXuqC9UsvKeRYqCNlfborm/fFBRm
	 WKA7MtYxDym+wd0y40yNspzuPp4kH8GKGe15heUoydrvS+k7b00acTxpgFf4M93ZvU
	 SkZHNmJqoU/JGephqmso5ogWH/l9Gd6X5OSwCGqodVq/qHDPK0KTIae8MZwRyYrrMi
	 772pdZ9zqgfdPqnBooU0KOBBE9///Cq+PvJe/oMkSdbXgHZ0e0AkDlhDk5FAAPaOnQ
	 KHuVQijE94Ocg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230208104404.20554-1-peter.ujfalusi@linux.intel.com>
References: <20230208104404.20554-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ops: refine parameters order in function
 snd_sof_dsp_update8
Message-Id: <167586203697.104842.2594970595275091322.b4-ty@kernel.org>
Date: Wed, 08 Feb 2023 13:13:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: NNO3RUA4WBZZYK7CUISKQFLUXULJZMWZ
X-Message-ID-Hash: NNO3RUA4WBZZYK7CUISKQFLUXULJZMWZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com,
 chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNO3RUA4WBZZYK7CUISKQFLUXULJZMWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Feb 2023 12:44:04 +0200, Peter Ujfalusi wrote:
> SOF driver calls snd_sof_dsp_update8 with parameters mask and value but
> the snd_sof_dsp_update8 declares these two parameters in reverse order.
> This causes some issues such as d0i3 register can't be set correctly
> Now change function definition according to common SOF usage.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ops: refine parameters order in function snd_sof_dsp_update8
      commit: 5afc7eefe41645259da84898fc55f6f46cb4de47

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


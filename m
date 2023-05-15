Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E3702B28
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69F2825;
	Mon, 15 May 2023 13:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69F2825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149089;
	bh=TY313p2eRvk9cM1fJkdAFqjEmiykwdPkT6pqIfpqw+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cXoWq2ktlt71BX6ifqjlSDmqhr0fER9nSop8mD/0PcESDyrBehR++r6kJsAVR8iH7
	 thhdqPUt+jTJmZ5w/lvdqeDY7IuK0WlkZ+f6A8Q7T9zS5ccmkZsmaYE+5DMOA2vaOF
	 xCG3fL663FsCHJYLqeys5+F8h4MqVmu8Oxuby/j8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0558F80563; Mon, 15 May 2023 13:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB0EFF80557;
	Mon, 15 May 2023 13:09:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2D04F80431; Mon, 15 May 2023 13:09:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A948AF8025A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A948AF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gspIvraU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 04E1862267;
	Mon, 15 May 2023 11:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35177C433D2;
	Mon, 15 May 2023 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684148979;
	bh=TY313p2eRvk9cM1fJkdAFqjEmiykwdPkT6pqIfpqw+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gspIvraUhGgBNQgdfFrWlKPzJ10TXG9KeOPWReYUlrbXSgAV1U86xpjlMjTimjvMH
	 22tWbHbWh4WAsjeM6/o1m9PpWPHwKuUH7ARcux1nbFhYCPxXwtUprBp7DuSH0hSNjK
	 I2EQFwJXK5E3Ye+aDEIbxkFaF0bd2XeiGqyT56am6UpyqOzH6rkdvI16/fgosPRVxF
	 wsYLNLzi80HcLuvz20OizGkMMz7uL/cx5o6d2fpoOBt3HtdF+hNTgL6p8TGKMsIit5
	 C4JVUyYXDqLyB0ssAIhUaAqQOtRSux9yzcHDKtPorWWUCkZbbIa2qxztPW+mveQH8+
	 xOgIyytrhNT8w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230512114630.24439-1-peter.ujfalusi@linux.intel.com>
References: <20230512114630.24439-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix logic for copying tuples
Message-Id: <168414897784.394037.9909991751543751270.b4-ty@kernel.org>
Date: Mon, 15 May 2023 20:09:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: B4Q5DWQKI634QQWKGZZRV2DYH7ELR2TW
X-Message-ID-Hash: B4Q5DWQKI634QQWKGZZRV2DYH7ELR2TW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4Q5DWQKI634QQWKGZZRV2DYH7ELR2TW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 14:46:30 +0300, Peter Ujfalusi wrote:
> Topology could have more instances of the tokens being searched for than
> the number of sets that need to be copied. Stop copying token after the
> limit of number of token instances has been reached. This worked before
> only by chance as we had allocated more size for the tuples array than
> the number of actual tokens being parsed.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Fix logic for copying tuples
      commit: 41c5305cc3d827d2ea686533777a285176ae01a0

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


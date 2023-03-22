Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158176C5410
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 19:49:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99520EAB;
	Wed, 22 Mar 2023 19:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99520EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679510970;
	bh=qTravBwiylpgLUmT0N/NvpC5/qMKTYa9CxaBfdgNKhg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uSJ+VldbCAxI0/fohWqyDqPuwTdU82L3F2DyqcoK22ylFU3mYcwyIWiqDphOZu6lF
	 ugfVLejYMZlCA5SBTtIsJ/xKi22dJBY9wXsl0glabZ1gA6W5mOyg1CUHafySucwrkj
	 TXc7aeWzBrc94TT0o46g8hJQF22qMNfsVcdyQo1E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E23DF804FE;
	Wed, 22 Mar 2023 19:47:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE677F804B1; Wed, 22 Mar 2023 19:47:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFBF7F802E8
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 19:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFBF7F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tuGj1kXQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A4136B81D8F;
	Wed, 22 Mar 2023 18:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97373C4339B;
	Wed, 22 Mar 2023 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679510856;
	bh=qTravBwiylpgLUmT0N/NvpC5/qMKTYa9CxaBfdgNKhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tuGj1kXQ3kpHBtTueaBNtWkKEfkUyonu+X/ffMCqHjJjRwcO6QIxcFwyXLJL/+qu3
	 uz+wnQqMExfZOPQgmgGEfZpi3VQS79iALAooYHnlbLKpvZoDqrhb2uMgKMD1YlAyvO
	 fQhs1oRttiy0HemibhY6bfOxS49/4uK6REuvO3hBoxBOi49E0xxVaDhY2UqPh9zx1n
	 jWJZgTVdm3jD7JGwYdgFhR83fKz/cj4wie4eGI32c+1MBebAsgsesA4UNm5h3goq5K
	 UN8MTEayUWsWv7yq07XRwIGDEeqs/v4rIFnr6bPiUBLg3xagmcZ+CdKdJbfx4EzAS+
	 dfz1SNXy3Mvyg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230322075012.23463-1-peter.ujfalusi@linux.intel.com>
References: <20230322075012.23463-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Remove conditional
 dpcm_capture setting
Message-Id: <167951085388.1092488.8235898531681462396.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 18:47:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: DNCI7TPTNQ7PCEVVS5GS6JINSO4GLW27
X-Message-ID-Hash: DNCI7TPTNQ7PCEVVS5GS6JINSO4GLW27
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yong.zhi@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNCI7TPTNQ7PCEVVS5GS6JINSO4GLW27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 09:50:12 +0200, Peter Ujfalusi wrote:
> The dpcm_capture is set unconditionally, we can drop the conditional
> setting of it.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Remove conditional dpcm_capture setting
      commit: 3e1a334ad5b6e1aee25fd7f09400000f9b7b1f82

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


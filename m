Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4BC70F5C6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:59:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F22B3E7;
	Wed, 24 May 2023 13:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F22B3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684929581;
	bh=/B0vdMufjSzg+kWpfRvse4iAzkRz1UKFhqFiVIC2l3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Byl+PfSYT98EQrlvSV6mnWtfhthb1xALw1cSQ5i5EoYn/1NOKPRCataemN7buh0so
	 uf9BP5UOKOW3leL7r9uzJzhsTzBR0cCUheVA0cRWjaOzti7IcbQPmaxMDI2cmr6NFH
	 wt6c9iylMq6l6SszV+anJCDLIKX1EeLg/n7f8Npw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8399F80542; Wed, 24 May 2023 13:58:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E572DF80249;
	Wed, 24 May 2023 13:58:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78796F8026A; Wed, 24 May 2023 13:58:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 14618F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14618F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MqhflI3G
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD2D6632A4;
	Wed, 24 May 2023 11:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4478FC433EF;
	Wed, 24 May 2023 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684929520;
	bh=/B0vdMufjSzg+kWpfRvse4iAzkRz1UKFhqFiVIC2l3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MqhflI3Gwts1TEZhQ9dRco3qCqLLYolvjSx+5bt9qY3IxV9KmhdfIkiMcyR3atk4U
	 +8EbZbat46iKnI2t9WIpFyBhnaj5oC6FFdbzaSlq8jj1oZFX2vMwYXBIB+eLy4XLBO
	 ScZzjaIjqJBOZkHeMpxlRQI3ypqu4Le1NBUiZaxC4CHanI+xwMUk/6Q7quV4kcbWFD
	 5bCypJgj7hTWQd9lXQtmFNXlhvYuucDfhb3u8MNMQlZPuTcxuupJEY9Pue8S94uQS5
	 WHK7FyQwDF+ldm7tBAJAVg6gKR682aDqjhDYTnFoJNmafur9YKu2EexS2599PW95eV
	 +Qv61NgH2FADA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230523-regcache-maple-sync-lock-v1-1-530e4d68dfab@kernel.org>
References: <20230523-regcache-maple-sync-lock-v1-1-530e4d68dfab@kernel.org>
Subject: Re: [PATCH] regmap: maple: Drop the RCU read lock while syncing
 registers
Message-Id: <168492951899.55912.11663734518532161454.b4-ty@kernel.org>
Date: Wed, 24 May 2023 12:58:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: NW3IGZYBNUOOPXMJGAQ2S6RXCQZFXGQR
X-Message-ID-Hash: NW3IGZYBNUOOPXMJGAQ2S6RXCQZFXGQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NW3IGZYBNUOOPXMJGAQ2S6RXCQZFXGQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 23:18:19 +0100, Mark Brown wrote:
> Unfortunately the maple tree requires us to explicitly lock it so we need
> to take the RCU read lock while iterating. When syncing this means that we
> end up trying to write out register values while holding the RCU read lock
> which triggers lockdep issues since that is an atomic context but most
> buses can't be used in atomic context. Pause the iteration and drop the
> lock for each register we check to avoid this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: maple: Drop the RCU read lock while syncing registers
      commit: 0cc6578048e0980d254aee345130cced4912f723

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


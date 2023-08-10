Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5377762E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:47:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E003D1DC;
	Thu, 10 Aug 2023 12:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E003D1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664447;
	bh=GKbgDi1r+gFpeYLx0KjuEloh0xbBXbOqbBL8EUFaqh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J18MO2ci/NT2mbsVsdlegf2gROBSXwWxQGX0nKDW45k3a7R5KtoYPfP6doL2kKII0
	 3GeEqHfTJyDTZMobFIYyOxJKJ+vu1bC0ppfKsSIJkzQtfAAIwsskxknllRw8B1x+r/
	 IHBCAbX2/V0QzNMg2WxqeiQVIVjeyOuYhht5y37k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A4F2F80166; Thu, 10 Aug 2023 12:46:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8178F80166;
	Thu, 10 Aug 2023 12:46:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95117F801EB; Thu, 10 Aug 2023 12:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B8C4F800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B8C4F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tBZLvhAN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CF8C60C3D;
	Thu, 10 Aug 2023 10:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DF3C433C9;
	Thu, 10 Aug 2023 10:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691664382;
	bh=GKbgDi1r+gFpeYLx0KjuEloh0xbBXbOqbBL8EUFaqh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tBZLvhANoV9N9mr2uihl2EiETHMK9qJUu8pH6zjUDJYmsIPXKLxxbxTXk8BzA+sdu
	 b6jL5FRpyQIl2+vEeUkjvgOPkRC/AKcdBfi639xo5Ai4IhUjdeT0wi0y1Oc+mn6+iC
	 vF08Dvlg9CdIi23YbQBIOeE5wuo20yBTlbPyItxbUJxLZG72NK1zPFNj+Z8euhX+L9
	 G3BhPvpSDeJmgtIBblgIaseoh5bdLBEwoEgcmOOiq9twJKSO/wXZ+lWWJcwlHyqyTq
	 YM4VzjpPGMpdlQWWIJocqKLI8M6RmGrzs24MNRAq32LaHHQxaRMGyD3QfHP8CYonWw
	 qef2traPiUYIw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 adrian.bonislawski@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com
In-Reply-To: <20230809125656.27585-1-peter.ujfalusi@linux.intel.com>
References: <20230809125656.27585-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc4-topology: Update the basecfg for
 copier earlier
Message-Id: <169166438047.20959.14696410055555816173.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 11:46:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: NZTAWWE3KKKUI6FC36EOFBLKQ6LY4NF2
X-Message-ID-Hash: NZTAWWE3KKKUI6FC36EOFBLKQ6LY4NF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZTAWWE3KKKUI6FC36EOFBLKQ6LY4NF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 15:56:56 +0300, Peter Ujfalusi wrote:
> The sof_ipc4_update_resource_usage() call updates the CPC value in basecfg
> and it must be done prior to making a copy of the copier configuration
> for the init message.
> Other module types do the resource update as last step or in case of a
> process module at the correct time, before the memcpy.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Update the basecfg for copier earlier
      commit: e6475ce253187d2e68867102fddd57341ebbf8eb

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


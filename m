Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CC67506D1
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D417C3E7;
	Wed, 12 Jul 2023 13:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D417C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162525;
	bh=b7P/loiubRYNq6EW35thuebHR0B0S5Nl28Pm8CTPxu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rTLkQOPfPUBI0Cpd719dtSxFMA3iG4BbhngGwoV8szZqufQPV1PWZJQAeSF1nAIbP
	 Y4amNSMmjnmUD8FUt905vsC7pSbM0NYrOxQewfPe34j2ArRICcPq/nuKHOmbYGHI5N
	 OJLUcqpgtzws7l1k6B9wLLwjsy88UfwXYz9n2E9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F0B9F80578; Wed, 12 Jul 2023 13:46:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B253F80578;
	Wed, 12 Jul 2023 13:46:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11E5EF8055C; Wed, 12 Jul 2023 13:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9826EF8047D
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9826EF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hwJQtEfm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 266CB617A9;
	Wed, 12 Jul 2023 11:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69463C433C8;
	Wed, 12 Jul 2023 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162400;
	bh=b7P/loiubRYNq6EW35thuebHR0B0S5Nl28Pm8CTPxu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hwJQtEfmH2q+9sYql7Cn/GCZuDN7vrr+RnhtYuMsu7esFvcXJg4bIvbDaIrrgdtf9
	 VhtHvAWTOK3kD/9LfcP+tUTQPv/N1IZ8NAN4+2/yDX7Id3978kwqc7DI9rMJEp+qQY
	 FyWNYBvMvZhGFSOOIYVUZVovwsSrhai+l+ebvFJQTR/eVh1o1HtJ/2OGxmykrQxMKt
	 If7gKKIZbE0Q6YTkrBySF62Id6Js16EPx5YNLPBffeCfnDGopqfEImG3AcPUgnjp/N
	 9OPkOlfkCj9T5NK7hFAFNtMX0pt4WH4OIv7SLRgmXMruWXy3vaMnj0vPcMwt9jMPdF
	 40hnZIGZdzZag==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com
In-Reply-To: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
References: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH v2 00/10] Refactor acp legacy driver and add
Message-Id: <168916239914.46574.13493377956654006286.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:46:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 5UINOIFZHVLYKXGRANH2IMJJXV3AZERP
X-Message-ID-Hash: 5UINOIFZHVLYKXGRANH2IMJJXV3AZERP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UINOIFZHVLYKXGRANH2IMJJXV3AZERP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 19:25:04 +0530, Syed Saba Kareem wrote:
> This patch series to refactor acp leagacy driver and add pm ops
> support for rembrandt platforms.
> 
> Changes since V1
>    - Fix below kernel test robot errors and warnings
> 
> 	- ld.lld: error: undefined symbol: acp_enable_interrupts
> 	- referenced by acp-renoir.c:191 (sound/soc/amd/acp/acp-renoir.c:191)
> 	- ld.lld: error: undefined symbol: acp_disable_interrupts
> 	- sound/soc/amd/acp/acp-renoir.o:(renoir_audio_remove) in archive vmlinux.a
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: amd: acp: refactor the acp init and de-init sequence
        commit: e61b415515d3db57dce3af3e4a0441f08d8d8f15
[02/10] ASoC: amd: acp: add acp i2s master clock generation for rembrandt platform
        commit: 7ad6fb9dd1ca63f9f36e413036f36f075cdaec4a
[03/10] ASoC: amd: acp: remove the redundant acp enable/disable interrupts functions
        commit: fc11d3266dc7ed386efe91c20d09780bbded1f03
[04/10] ASoC: amd: acp: store platform device reference created in pci probe call
        commit: 7a83903022dc3bd5214f6bdde8132c66015ab538
[05/10] ASoC: amd: acp: add pm ops support for acp pci driver
        commit: 088a40980efbc2c449b72f0f2c7ebd82f71d08e2
[06/10] ASoC: amd: acp: store xfer_resolution of the stream
        commit: c8786ac7bb374276b1c2b545b4a6be3b230be7cb
[07/10] ASoC: amd: acp: export config_acp_dma() and config_pte_for_stream() symbols
        commit: a8d1316a264f36c2ffe798e42d6b415dc377851e
[08/10] ASoC: amd: acp: store the pdm stream channel mask
        commit: 7373e6bee60cdac36a134897164885b2257a02ac
[09/10] ASoC: amd: acp: move pdm macros to common header file
        commit: e3a96e441e05bbf599ce70c2a03e7acd55b275ee
[10/10] ASoC: amd: acp: add pm ops support for rembrandt platform
        commit: 5debf4ae138c81321832d41203483696cac1c580

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


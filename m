Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5E6BF011
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 18:45:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D255EF0F;
	Fri, 17 Mar 2023 18:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D255EF0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679075149;
	bh=A3PAnQ+JIwFpDASrObxS7EcNbU8UPLp1qv6JS9SVhr0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lmYEE+PzQesAl0C3rfxNka+QDMxHlIIatOYnXZM5ySlN2O9VUMJurCAplUuqGdJNl
	 JDxsTosgFk4tIo0Hr9Xt3gEpJb6sQxzSttb7xBz7NbRx5hJvv/th5Pzd8aMc4NhTu5
	 UvBX3jqX/mWEUfsMiDb8Jd0sZd2jeRpEQhQ5UnvE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EB7F80482;
	Fri, 17 Mar 2023 18:44:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6C4BF804FE; Fri, 17 Mar 2023 18:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B7D0F80423
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 18:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B7D0F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jPUojEvk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61B26B82640;
	Fri, 17 Mar 2023 17:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECF6C433D2;
	Fri, 17 Mar 2023 17:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679075058;
	bh=A3PAnQ+JIwFpDASrObxS7EcNbU8UPLp1qv6JS9SVhr0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jPUojEvktM746XQp+okCdmU344IMAZercGFW3k2GndJKtH1lLkYO/6DE/sBchpkyq
	 8h+QgoHwF1iPaDyjafGNlY85LDvCL8JH0e7O3JCzXj//BcSQvCNPwaeHQSYPA883VG
	 nVWm7CmHDauKib0N1e1ecOdTkMnZN7lqoAMJKj6ii/SIpwmSn0y6MjH+9WSptvTRnX
	 Z6mA4TtAFGoEAVx146EpDS0AKzq/l0RZXxYo8odl2cWalks6QMLp8waMKjHji/Pmvn
	 ft0WSYdGw0OSKdQ/Jwuo2RC+RsOgfrJeIO3rH8E5slWZm9sgi9jfAeFzuRkiitae37
	 t0C21zPaDAPkw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: ipc4-topology: Add support for effect
 widget
Message-Id: <167907505577.51817.16690400395812320291.b4-ty@kernel.org>
Date: Fri, 17 Mar 2023 17:44:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: EU3NG4PFJ7GC7SRLDOADI3MP5M3VIAXH
X-Message-ID-Hash: EU3NG4PFJ7GC7SRLDOADI3MP5M3VIAXH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EU3NG4PFJ7GC7SRLDOADI3MP5M3VIAXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Mar 2023 17:11:31 +0200, Peter Ujfalusi wrote:
> The following series will add support for IPC4 process modules as effect widgets.
> We can cover wide range of modules as a generic process or effect module, the
> patches will lay down the fundation and the generic code to handle them.
> 
> At initialization time process modules can receive additional information on
> top of the base_cfg, which is defined as base_cfg_ext, an extension for the base
> configuration struct.
> Other parameters or blobs for these modules are sent as a separate message via
> LARGE_CONFIG message, which is handled by the existing bytes control support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: ipc4-topology: Move the kcontrol module_id update to helper
      commit: 04b522a4d2acf8447d69bf87b3ab67d5e6d631a2
[2/6] ASoC: SOF: ipc4-topology: add effect widget support
      commit: 7711a2bbc8447dd7185c6da9e405d89ce3ec2f0f
[3/6] ASoC: SOF: ipc4-topology: add base module config extension structure
      commit: d0be868c5a6e0dafb53d0ee9f0b9d66e40d963f6
[4/6] ASoC: SOF: ipc4-topology: Add support for base config extension
      commit: f9efae954905a07a9d152e9b30546a6632227eef
[5/6] ASoC: SOF: ipc4-topology: set copier output format for process module
      commit: 648fea12847695d60ddeebea86597114885ee76e
[6/6] ASoC: SOF: ipc4-topology: update pipeline_params in process prepare
      commit: 811a742f2d4d1b0aee686bc2f4282b51534898a2

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


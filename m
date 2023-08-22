Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C27847CC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 18:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CAF5832;
	Tue, 22 Aug 2023 18:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CAF5832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692722157;
	bh=+Gi0L0puezhiLPx0bJgnU97RFMKBomJQ+9YUXJDIdiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KpzQhqnuC0X7Ib7Q5Nji+MaSyPTCDGiqfm1EbOWgmM8WHEzSC8c5zpiXm/8HyfU+K
	 JkS0NmVbzvPbLHJyKB7vnCnuR07OhUIWbKvdup11M33aPgpE8VhbUM2vgFhmIiWFNf
	 fgMwO+JuQb1UkzC9RipJJm6364zdryX5d8jPHMZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 246EAF805A8; Tue, 22 Aug 2023 18:33:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47EF8F805A1;
	Tue, 22 Aug 2023 18:33:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8476DF80567; Tue, 22 Aug 2023 18:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 780FCF80158
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 18:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780FCF80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WEXUtKzb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 563C765CC9;
	Tue, 22 Aug 2023 16:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E8AC433CA;
	Tue, 22 Aug 2023 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692722010;
	bh=+Gi0L0puezhiLPx0bJgnU97RFMKBomJQ+9YUXJDIdiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WEXUtKzb8OszFFTJca99l8KUZOtNUZaN+cg50RkpPIVMmYAXPXCuDUP5yGrUnRPFF
	 9rQOqxCpvO0hfmEDXUeIaHR6TRv60cCwaRU+JCsebu9A6UHfns76/MrnlSCWQMNTgu
	 R79XHbMQVPbwpBl33ksK5LFhaMgLGqQVgOwBHFN4muyjp0N6yKd9v5MrybWkj0nGJD
	 aKak6ZOF1L2RQES6qW4djkbEor95ebGEdS7m/l/mLFaXidF0FnPpgOhluCbZ4TO/nh
	 HdQpVVWHEac2JumHdQXJnqElFtOZdQEwdv+MRfadgg35JjuI89vzbMcElZKTepBIoJ
	 LwN2q64OEL2Xg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <20230822065419.24374-1-peter.ujfalusi@linux.intel.com>
References: <20230822065419.24374-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add module parameter to
 ignore the CPC value
Message-Id: <169272200887.71502.8291528263080381458.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 17:33:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: W4JZRCP4NJ25EID6GJN3Z432KKBWZLY2
X-Message-ID-Hash: W4JZRCP4NJ25EID6GJN3Z432KKBWZLY2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4JZRCP4NJ25EID6GJN3Z432KKBWZLY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 22 Aug 2023 09:54:19 +0300, Peter Ujfalusi wrote:
> Add a new module parameter ipc4_ignore_cpc which can be used to force the
> kernel to ignore the queried CPC value for all firmware modules and use 0
> instead.
> 
> The CPC lookup is still done to report missing configurations and the
> debug print is going to be different to be explicit that the CPC is ignored
> and what was the value we would have used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Add module parameter to ignore the CPC value
      commit: 26ef47e5ba600ead306ee19e0bf56c1bf59213a3

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


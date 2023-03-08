Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF16B0A32
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:57:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4D51828;
	Wed,  8 Mar 2023 14:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4D51828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283861;
	bh=yUY1DyMAbNs7cfQQWhcZQC0ZTnqssw04i60vPJVsjAk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LGhUNnERUp3Jhw3E8OGDfZDwZvPFjQbbZHIXGYKIGZdH6SHkq8MKwxLSpdgMorgq6
	 AuOLtMQalTYGy8xtqF3bQRIjVssjVnZw6khhe08yX7/81JGDdcetNtK+ZuS5ARi4CR
	 PgsJWbC3H+QoFIKYCl+EnVkmTxE9VwMYQtFNUuFw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D1CF805BA;
	Wed,  8 Mar 2023 14:53:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F904F80567; Wed,  8 Mar 2023 14:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99D7BF80558
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D7BF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LCyOLXYR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C8FE61807;
	Wed,  8 Mar 2023 13:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0B2C4339E;
	Wed,  8 Mar 2023 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283574;
	bh=yUY1DyMAbNs7cfQQWhcZQC0ZTnqssw04i60vPJVsjAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LCyOLXYRyCjnyKifPITdTRpsDH6cJ/B1FwqVMn5TcXAMvfebn/nwumaphyxaehxsv
	 3Ku1xTsAEHNAXfpR8vSYeDtM/ithbXJ5c4joons39Ll7enXRclnNWZBnklvqzJnzli
	 af9YQ6cUiYeRiW+wViLXePhO4qitUH7KfVRW9ma9nzms9bjjGZlonoi2yV/0Eujoy8
	 8NO4ybfBbn9swDTYPBe8IzuZAW/88HWYgBqAEI4QqqhYOp3tyy39HJDbADJpjC4GpO
	 SgGV7G7tVo2yfJQ89wG9v+PlIx2UYaIwx+4QB724BuKeHv8JX9aMfC9Ox2E0ysHXo0
	 AICF91yRA5qbg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307110730.1995-1-peter.ujfalusi@linux.intel.com>
References: <20230307110730.1995-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: set dmic dai index from
 copier
Message-Id: <167828357248.31859.13701028539781567211.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: NM2YZQY7T4EQG5PIZBA3LVGJPKPWNOG2
X-Message-ID-Hash: NM2YZQY7T4EQG5PIZBA3LVGJPKPWNOG2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jaska.uimonen@linux.intel.com, adrian.bonislawski@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NM2YZQY7T4EQG5PIZBA3LVGJPKPWNOG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:07:30 +0200, Peter Ujfalusi wrote:
> Dmic dai index was set incorrectly to bits 5-7, when it is actually using
> just the lowest 3. Fix the macro for setting the bits.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: set dmic dai index from copier
      commit: c99e48f4ce9b986ab7992ec7283a06dae875f668

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


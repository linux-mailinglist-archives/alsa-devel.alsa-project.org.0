Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7C6B0A06
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:54:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55D491831;
	Wed,  8 Mar 2023 14:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55D491831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283662;
	bh=ArgMoV+CIfp0PQ40IL4GhFVGTJ2RvcKsT7ElUGkAhQc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RlsTamzPqWIoTVq97qqWWuKA3tN5YjjmoXocnC+zVuf3WpXEjsu9zBKBQUoFVq+YR
	 5ER2ppzPi9xEudx8/j2OL8UoyuQWIhJLr0zN95p3akRvDOpoiRu6KnUW8TepXWxKAn
	 zRxFHUUbCM6HW1F3X89K0dn2yW2cDzFUMGH0snVE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF13DF80527;
	Wed,  8 Mar 2023 14:52:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B331F80431; Wed,  8 Mar 2023 14:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23E04F8007E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E04F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wo7H5IrX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA727B81CB2;
	Wed,  8 Mar 2023 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D97C433D2;
	Wed,  8 Mar 2023 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283551;
	bh=ArgMoV+CIfp0PQ40IL4GhFVGTJ2RvcKsT7ElUGkAhQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wo7H5IrXZPPxTgXeeWI6QkmvzkNnbJSgP3HGja825aK5yGE/VwgCso7y/hWmxPHQN
	 tt7sXZkKXXlmMYwpG4Htqi544XSWLiBB3HDtZgxTNaKPYZlYYeNmpHQs3YZYXyHD5D
	 YcJwzCAqmh9hNBFZOW8+IAdHxjND/jtmQLG7xCQ8LeOU8Io7JtkuPRiL/1OsWXJbkF
	 n+KVyyly9J8Ryw0TAAjJLqnYhLKc5slvd4Fb6ZYfjWG6MVWhnVbJHV8BXIzch+oTUA
	 cSIP85SZnkCCY7Z2olncdiKVQUn9MHEzM67BGTQIIV8n4AHG0141lAz4azaxdp5ot4
	 eyNmK5TPiMMHA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307114659.4614-1-peter.ujfalusi@linux.intel.com>
References: <20230307114659.4614-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: don't squelch errors in
 WIDGET_SETUP phase
Message-Id: <167828354931.31859.14989833967787242064.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: K3JPEE7YCD2OHD25RCX4XXIK2N3J75S5
X-Message-ID-Hash: K3JPEE7YCD2OHD25RCX4XXIK2N3J75S5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3JPEE7YCD2OHD25RCX4XXIK2N3J75S5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:46:59 +0200, Peter Ujfalusi wrote:
> When an IPC error happens while setting-up a widget during the FE
> hw_params phase, the existing logic will unwind all previous
> configurations but will overwrite the return status. The ALSA/ASoC
> logic will then proceed with the prepare and trigger phases, even
> though the firmware resources are not available.
> 
> Fix by returning the initial error code and ignoring the code returned
> in the UNPREPARE phase.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: don't squelch errors in WIDGET_SETUP phase
      commit: c7e328f1cbf22efe23bc3cd7dd6bb14efccc28d0

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


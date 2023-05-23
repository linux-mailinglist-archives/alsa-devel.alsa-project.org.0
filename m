Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571BF70E5FB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB961206;
	Tue, 23 May 2023 21:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB961206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684871470;
	bh=0kgIbzjX9fgNjWHC6MDxSyK2sgeMFDKHe414S+s4B1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lbeJfoREMW7C3MEHKRZp/Ty82Amo8PIqU522JMytpGx5CRPIqv+BKYKEf/LNFD33Y
	 GTtze3gHnRx3YaLzy7Q8EFB9ob+J58ryt4OPUiZ7JJs4bqPWhUw2hnVo4BCutcRNnk
	 8cyhWaDjbRorfFnEAe9Bj85BPHBzja+iwqGEqmb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A240F8026A; Tue, 23 May 2023 21:50:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E478F8024E;
	Tue, 23 May 2023 21:50:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A57E8F8024E; Tue, 23 May 2023 21:50:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9507BF8016A;
	Tue, 23 May 2023 21:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9507BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p9UHvbQk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56B4E63591;
	Tue, 23 May 2023 19:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10449C4339B;
	Tue, 23 May 2023 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684871409;
	bh=0kgIbzjX9fgNjWHC6MDxSyK2sgeMFDKHe414S+s4B1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p9UHvbQk1P7RQdr3geFPkC6JG4ciBbDKkYgvIjLZqwG6fKWZTagvB9KcUWRATmT4O
	 PkG1y64ukNE0H/1s89SL4xncrVlMk5ZKDGCpIk91hHmzJNeWCdDvcmu69Y6wsHaAdo
	 jlZqOxJrzHgzWTyj6FihQ4vPPEkF+7d/RtuYe4s4lN9msGdSWXVj/kzCflKktTNJrP
	 sHhknRlsikKxc7NDI/ISTkjNH4UI21bpdnfY0Zq7J/Ar/VO0ECYHsGrosMUvHsmO8P
	 bU1S7Dn2xpxTxmT9PxWQc/9dZolMzNVvvRVcOXJnA5q+oFmQzdooi+zIibfGEieV/P
	 ItCsrpnDQUWzw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Yang Li <yang.lee@linux.alibaba.com>
Cc: tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230516081116.71370-1-yang.lee@linux.alibaba.com>
References: <20230516081116.71370-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: SOF: ipc4-topology: Fix an unsigned
 comparison which can never be negative
Message-Id: <168487140577.278276.4105417647413959490.b4-ty@kernel.org>
Date: Tue, 23 May 2023 20:50:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: T2U5NJGMHAULGKBBIAXVS23EWAYV2YFU
X-Message-ID-Hash: T2U5NJGMHAULGKBBIAXVS23EWAYV2YFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2U5NJGMHAULGKBBIAXVS23EWAYV2YFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 16:11:16 +0800, Yang Li wrote:
> The return value from the call to sof_ipc4_get_valid_bits() is int.
> However, the return value is being assigned to an unsigned
> int variable 'out_ref_valid_bits', so making it an int.
> 
> Eliminate the following warning:
> ./sound/soc/sof/ipc4-topology.c:1537:6-24: WARNING: Unsigned expression compared with zero: out_ref_valid_bits < 0
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Fix an unsigned comparison which can never be negative
      commit: fcbc3aaccfd57c7e71eac36bf1a8f063f19ceefa

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


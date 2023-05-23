Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64770E606
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFA73E8;
	Tue, 23 May 2023 21:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFA73E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684871551;
	bh=9+/3lsALs3L56R8aQKa8M9JamjNMX8YuPwChz3lxgVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VauPzuHcrZUjP0cjlkCphTeK3hjT3ZJP/Lp3T5BzIYZnJYSKVTjiBUa4dtGoisxMD
	 v0qDMS/HeKV5ZFLBh5WH2TBm0S2yNjVMtdzlUEOwlLE3Dp0hq2K/Yc6I0bDjHJLzBp
	 TrKTtyN8XRPofhgtyVm9HF7P+AJquW1Oh3h/6BXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08421F805AC; Tue, 23 May 2023 21:50:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54433F805A1;
	Tue, 23 May 2023 21:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB72EF8057B; Tue, 23 May 2023 21:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77F9FF80567
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 21:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F9FF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AsqHbrWI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6832A6260D;
	Tue, 23 May 2023 19:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A673C433EF;
	Tue, 23 May 2023 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684871423;
	bh=9+/3lsALs3L56R8aQKa8M9JamjNMX8YuPwChz3lxgVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AsqHbrWIXVmYWQmAZYHAaXyp13srB2hfS/m7CCzj8aZltN835xVx5diDSvA+R0++D
	 ninmiPO9GrmjP0HW1hz2/nHr+yGXzX2NbeAX6VG2J7bztS4JHgaOe+M89zSS8P4N6F
	 Ao2tIMcuziGYJ2CxwJIw+SNK9Pg3yzS4ELUSkZE0NUD+a1E3pXI1NNfm3hwjZ3Jl9C
	 pJd9YiWHP1GjkpWPu1AqPCDqIBGb5efzmND/GC8ZsnbscZhVMOd8KY52fuZ/yq6h8H
	 DiPCtbEWfyAVsD6cJoC6WvImsgz2bXt0Eu4iBfroffahPGQm/BVWdUZUfo9Ol9/seW
	 EoH/GvPXE3vYQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
In-Reply-To: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
References: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: mtl: Enable multicore support
Message-Id: <168487142215.278276.6191766858062306959.b4-ty@kernel.org>
Date: Tue, 23 May 2023 20:50:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: GCI5RBPQ5QKHRQ4XJS7DQNDERMCXFK4F
X-Message-ID-Hash: GCI5RBPQ5QKHRQ4XJS7DQNDERMCXFK4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCI5RBPQ5QKHRQ4XJS7DQNDERMCXFK4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 13:32:14 +0300, Peter Ujfalusi wrote:
> The following series will enable multicore support on MTL platforms similarly
> to other Intel platforms.
> 
> The TGL patch is included to simplify the core_put implementation.
> 
> Multicore support can be enabled by updated topologies, with current set of
> tplg files this series is not introducing any runtime change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: SOF: Intel: mtl: add core_get & put support on MeterLake platforms
      commit: c6d15567a4d5dd51ecccc332d514c6dc21bce652
[3/3] ASoC: SOF: Intel: tgl: unify core_put on IPC3 & IPC4 path
      commit: 1b167ba8a20152041d3af0c0cbbfd710f1e93e4b

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


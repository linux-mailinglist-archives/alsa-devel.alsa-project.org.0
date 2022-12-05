Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2E6430FB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 20:03:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFDD186E;
	Mon,  5 Dec 2022 20:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFDD186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670267026;
	bh=LnEdXMXG6lXeZ19XgePuXYDir9A2hVdlvMnHpprhHps=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lokO1fDOL2vJYuJ4UG6A7wYsxdJg0UpXx9oMZ63YVZe7A9MJFt/K/gtMe18YieZLf
	 0auoP+fQFhnyeu1GUJ/Q1MDbz+4AN6kW3Z5+TySMfqZP2bPvti+ZiPIa6fCB+V8I9G
	 zzf2ttdtMh+P4MCy6qz6mWpCJseXM+6AmS+aP7+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF30F8047C;
	Mon,  5 Dec 2022 20:02:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85647F80236; Mon,  5 Dec 2022 20:02:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20F19F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 20:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20F19F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dyGXErl1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2370DB811EC;
 Mon,  5 Dec 2022 19:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9047C433C1;
 Mon,  5 Dec 2022 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670266962;
 bh=LnEdXMXG6lXeZ19XgePuXYDir9A2hVdlvMnHpprhHps=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dyGXErl1l8SdCocJUqXcF3CpYifgMsWRaeOkFjxPsI1r0TxCfVMV+XyPQtBunoxTW
 pXMXMnJwtqC4RxSqy8oacCHSRFL/KQiQJRlCluGBAfU1ic3720ePXIyMsz1a6vejy2
 e074ZyQc2rXKH4Vi1f1fhsQ9QBfz81BA5YDHGl2I0DCdsgMCbc+d8zMMs4kfMxHtSb
 95mlyVfeQwDk61QQs0qCqk0ONSiEC9aMyB5xOPAXw64ySRR71aRpubYzqBcAtKxwhm
 XUQUq+PMO1UsQd9AmzDdXhnZYhVtIi07xJ6xDE3KRPnZgLu01CzqeJLi5Y1owI83+Z
 CvjB7irRR6aQg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/16] ASoC: Intel: avs: Data probing and fw logging
Message-Id: <167026696140.667574.15894705789111824076.b4-ty@kernel.org>
Date: Mon, 05 Dec 2022 19:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 2 Dec 2022 16:28:25 +0100, Cezary Rojewski wrote:
> The patchset focuses on debug functionality for the avs-driver.
> Two major blocks are covered here: data probing and AudioDSP firmware
> logging. Both are configured and controlled through debugfs.
> 
> Data probing is a AudioDSP debug functionality which allows for
> gathering the actual data that is being routed to or from a module.
> Helps in debugging its processing capabilities - navigate to a specific
> module which may have caused a glitch within a pipeline (set of modules
> bound together).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ALSA: hda: Allow for compress stream to hdac_ext_stream assignment
        commit: 97d73d978271ade27fc751ad606f23c1c4c43678
[02/16] ALSA: hda: Prepare for compress stream support
        commit: f6b1254664a0a15c8bbe0a17b2c86840aa38d3d7
[03/16] ALSA: hda: Interrupt servicing and BDL setup for compress streams
        commit: 3e9582267e3a06bfd9622dbd2304a8cfac977b43
[04/16] ASoC: Intel: avs: Introduce avs_log_buffer_status_locked()
        commit: bb03099bf2253fcd1a4d57e6f5ee4e8000911e77
[05/16] ASoC: Intel: avs: Drop fifo_lock
        commit: 58029b7734ec84738aeb8fb391e625832bb6b0a6
[06/16] ASoC: Intel: avs: Introduce debug-context aware helpers
        commit: 9e3c15beb8976771f95ba30b3da8bd35dc7188ac
[07/16] ASoC: Intel: avs: Make enable_logs() dependent on DEBUG_FS
        commit: b3eefa5d8dbfe5286c3308fa706fc9c45b38fe19
[08/16] ASoC: Intel: avs: Drop usage of debug members in non-debug code
        commit: f7de161fc8d5e1ebac3c361a37b1d748e7086330
[09/16] ASoC: Intel: avs: Add data probing requests
        commit: dab8d000e25c3e91154efca287434a4f78ab65d2
[10/16] ASoC: Intel: avs: Probe compress operations
        commit: 700462f55493c6831ad71b209eaebe310dcf11fd
[11/16] ASoC: Intel: avs: Data probing soc-component
        commit: ed914a2a45a45e7d8f900ae8997ca4573792afcc
[12/16] ASoC: Intel: avs: Add probe machine board
        commit: e17527e167ae5bd71fc9cb67da4e73bbb050e6f7
[13/16] ASoC: Intel: avs: Probing and firmware tracing over debugfs
        commit: 5a565ba23abe478f3d4c3b0c8798bcb5215b82f5
[14/16] ASoC: Intel: avs: Gather remaining logs on strace_release()
        commit: 34d27c71707c4ed615105376e0f3907d99b1b271
[15/16] ASoC: Intel: avs: Allow for dumping FW_REGS area
        commit: 870f6e5abba95ac78e750b61cf8f3f15be96796f
[16/16] ASoC: Intel: avs: Allow for dumping debug window snapshot
        commit: 85ac9c8c8eed76e8a320a9e017c6d36e2a52745b

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

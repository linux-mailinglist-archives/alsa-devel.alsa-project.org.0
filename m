Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB11EA329
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 13:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F346F1709;
	Mon,  1 Jun 2020 13:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F346F1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591012546;
	bh=lmCGS2ljnhIMFqFkgamCfR7kwSg+m4kDvHq+YhiNCmk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7d4IFT3HLsZJEMB5cbWvqcIzk8ZqKvI2w9HKWTU3xzjkubZOZeJQzCYWX+pPJpP3
	 evLSmPO3DAKQEi8QUb7PJd0R1UCmYNih4OQUtIbKN1P4vMuHhZ+/bAr6vVIdcd+vKg
	 IZV31rwx8+Af8MS+ANtsaBT1ZR4Fd6MbCkYfjv40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 052A7F801EC;
	Mon,  1 Jun 2020 13:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72D48F801ED; Mon,  1 Jun 2020 13:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA27F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 13:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA27F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TnhqqSt0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3DFA206E2;
 Mon,  1 Jun 2020 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591012436;
 bh=lmCGS2ljnhIMFqFkgamCfR7kwSg+m4kDvHq+YhiNCmk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=TnhqqSt0nYRPMZRf+ilz2wdb7exbv7qapKoigSR5XcbUS6KxA6LEhDe1JYs3WrqCV
 3R5SdMxMvLXAQ52vE5N84Qqo3ylboIli58e8DOkzQqTKXQUyoNn+GIByP0zq8g8K5l
 0jgWznhmoZRaSODS6Bg6fsdo4eeeSw3h1oMGsXM8=
Date: Mon, 01 Jun 2020 12:53:54 +0100
From: Mark Brown <broonie@kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>
In-Reply-To: <20200529213823.98812-1-john.stultz@linaro.org>
References: <20200529213823.98812-1-john.stultz@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6asm-dai: kCFI fix
Message-Id: <159101243412.15283.14423556802231850901.b4-ty@kernel.org>
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Todd Kjos <tkjos@google.com>
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

On Fri, 29 May 2020 21:38:23 +0000, John Stultz wrote:
> Fixes the following kCFI crash seen on db845c, caused
> by the function prototypes not matching the callback
> function prototype.
> 
> [   82.585661] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
> [   82.595387] Mem abort info:
> [   82.599463]   ESR = 0x96000005
> [   82.602658]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   82.608177]   SET = 0, FnV = 0
> [   82.611829]   EA = 0, S1PTW = 0
> [   82.615369] Data abort info:
> [   82.618751]   ISV = 0, ISS = 0x00000005
> [   82.622641]   CM = 0, WnR = 0
> [   82.625774] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000174259000
> [   82.632292] [0000000000000001] pgd=0000000000000000, pud=0000000000000000
> [   82.639167] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [   82.644795] Modules linked in: hci_uart btqca xhci_plat_hcd xhci_pci_renesas xhci_pci xhci_hcd wcn36xx wcnss_ctrl wcd934x vctrl_regulator ufs_qcom syscon_reboot_e
> [   82.644927]  qcom_apcs_ipc_mailbox q6asm_dai q6routing q6asm q6afe_dai q6adm q6afe q6core q6dsp_common pm8941_pwrkey pm8916_wdt platform_mhu pinctrl_spmi_mpp pine
> [   82.812982] CPU: 3 PID: 240 Comm: kworker/u16:4 Tainted: G        W         5.6.0-rc7-mainline-00960-g0c34353d11b9-dirty #1
> [   82.824201] Hardware name: Thundercomm Dragonboard 845c (DT)
> [   82.829937] Workqueue: qcom_apr_rx apr_rxwq [apr]
> [   82.834698] pstate: 80c00005 (Nzcv daif +PAN +UAO)
> [   82.839553] pc : __cfi_check_fail+0x4/0x1c [q6asm_dai]
> [   82.844754] lr : __cfi_check+0x3a8/0x3b0 [q6asm_dai]
> [   82.849767] sp : ffffffc0105f3c20
> [   82.853123] x29: ffffffc0105f3c30 x28: 0000000000000020
> [   82.858489] x27: ffffff80f4588400 x26: ffffff80f458ec94
> [   82.863854] x25: ffffff80f458ece8 x24: ffffffe3670c7000
> [   82.869220] x23: ffffff8094bb7b34 x22: ffffffe367137000
> [   82.874585] x21: bd07909b332eada6 x20: 0000000000000001
> [   82.879950] x19: ffffffe36713863c x18: ffffff80f8df4430
> [   82.885316] x17: 0000000000000001 x16: ffffffe39d15e660
> [   82.890681] x15: 0000000000000001 x14: 0000000000000027
> [   82.896047] x13: 0000000000000000 x12: ffffffe39e6465a0
> [   82.901413] x11: 0000000000000051 x10: 000000000000ffff
> [   82.906779] x9 : 000ffffffe366c19 x8 : c3c5f18762d1ceef
> [   82.912145] x7 : 0000000000000000 x6 : ffffffc010877698
> [   82.917511] x5 : ffffffc0105f3c00 x4 : 0000000000000000
> [   82.922877] x3 : 0000000000000000 x2 : 0000000000000001
> [   82.928243] x1 : ffffffe36713863c x0 : 0000000000000001
> [   82.933610] Call trace:
> [   82.936099]  __cfi_check_fail+0x4/0x1c [q6asm_dai]
> [   82.940955]  q6asm_srvc_callback+0x22c/0x618 [q6asm]
> [   82.945973]  apr_rxwq+0x1a8/0x27c [apr]
> [   82.949861]  process_one_work+0x2e8/0x54c
> [   82.953919]  worker_thread+0x27c/0x4d4
> [   82.957715]  kthread+0x144/0x154
> [   82.960985]  ret_from_fork+0x10/0x18
> [   82.964603] Code: a8c37bfd f85f8e5e d65f03c0 b40000a0 (39400008)
> [   82.970762] ---[ end trace 410accb839617143 ]---
> [   82.975429] Kernel panic - not syncing: Fatal exception

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6asm-dai: kCFI fix
      commit: a6b675a89e51a1cdad0481b809b7840d3f86e4b5

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

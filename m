Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5042250B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 13:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA821674;
	Tue,  5 Oct 2021 13:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA821674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633433558;
	bh=kcyfuP4AoC1WGENY5c8lWip3o0s7WsOK7RiCFa7G/8Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fz7sv8P4X8VY/qCHgsbgSQnjTIq/hmmU+xR7vChyrKd4R93AWgpw6GSBpbVfeGoTy
	 0GbHlvRnBjiM6pc9OxY84HylHTek6p76ECAnz0SVOcS8VyHnax91QRuk0+iAeWxsF9
	 NzYKGmztd1+DCPljA4jMQKVApGYoiSj9AfiznSe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0ABFF802A0;
	Tue,  5 Oct 2021 13:31:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7FDEF8028B; Tue,  5 Oct 2021 13:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC5DF8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 13:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC5DF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="205838358"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="205838358"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 04:31:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="589322865"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 04:30:58 -0700
Date: Tue, 5 Oct 2021 14:23:54 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: move clk related code to
 rt5682_i2c_probe
In-Reply-To: <20210929054344.12112-1-jack.yu@realtek.com>
Message-ID: <alpine.DEB.2.22.394.2110051404510.3554566@eliteleevi.tm.intel.com>
References: <20210929054344.12112-1-jack.yu@realtek.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 wenst@google.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

Hi,

On Wed, 29 Sep 2021, Jack Yu wrote:

> The DAI clock is only used in I2S mode, to make it clear
> and to fix clock resource release issue, we move CCF clock
> related code to rt5682_i2c_probe to fix clock
> register/unregister issue.

this patch is causing regressions on some devices in SOF CI:
https://sof-ci.01.org/linuxpr/PR3192/build6477/devicetest/?model=CML_HEL_RT5682&testcase=verify-kernel-boot-log

Reverting this patch and the test passes.

--cut--
[    2.725780] kernel: rt5682 i2c-10EC5682:00: sysclk/dai not set correctly
[    2.725854] kernel: general protection fault, probably for non-canonical address 0x2bd63a3afec92100: 0000 [#1] SMP NOPTI
[    2.725864] kernel: CPU: 2 PID: 80 Comm: kworker/u8:2 Not tainted 5.15.0-rc4-pr3192-6477-default #7c8961c8
[    2.725870] kernel: Hardware name: Google Helios/Helios, BIOS  01/21/2020
[    2.725874] kernel: Workqueue: events_unbound async_run_entry_fn
[    2.725882] kernel: RIP: 0010:clk_core_get_parent_by_index+0x4a/0x90
[    2.725889] kernel: Code: 8d 2c 92 48 c1 e5 03 4c 8d 24 28 49 8b 44 24 08 48 85 c0 74 0c 5b 5d 41 5c c3 5b 31 c0 5d 41 5c c3 49 8b 04 24 48 85 c0 74 26 <48> 8b 00 48 85 c0 74 e3 48 3d 00 f0 ff ff 77 05 49 89 44 24 08 48
[    2.725899] kernel: RSP: 0018:ffff9cf2c07c7c00 EFLAGS: 00010206
[    2.725903] kernel: RAX: 2bd63a3afec92100 RBX: ffff92ca837cbb00 RCX: 00000000f3c74d52
[    2.725908] kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff92ca837cbb00
[    2.725913] kernel: RBP: 0000000000000000 R08: 00000000ffffffff R09: 0000000000000000
[    2.725918] kernel: R10: 0000000000000000 R11: 0000000000000000 R12: ffff92ca861aeec0
[    2.725922] kernel: R13: ffff92ca8cf84420 R14: ffff92ca861aeee8 R15: ffff92ca837cbb00
[    2.725927] kernel: FS:  0000000000000000(0000) GS:ffff92cbd6200000(0000) knlGS:0000000000000000
[    2.725933] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.725937] kernel: CR2: 00007eff771a8400 CR3: 0000000194a24006 CR4: 00000000003706e0
[    2.725942] kernel: Call Trace:
[    2.725947] kernel:  __clk_register+0x465/0x7e0
[    2.725952] kernel:  ? clk_hw_unregister+0x10/0x10
[    2.725958] kernel:  clk_hw_register+0x19/0x40
[    2.725963] kernel:  devm_clk_hw_register+0x41/0x80
[    2.725969] kernel:  rt5682_register_dai_clks+0x8e/0x130 [snd_soc_rt5682]
[    2.725979] kernel:  rt5682_i2c_probe+0x484/0x600 [snd_soc_rt5682_i2c]
[    2.725987] kernel:  ? rt5682_irq+0x40/0x40 [snd_soc_rt5682_i2c]
[    2.725992] kernel:  i2c_device_probe+0x314/0x340
--cut--

Full log at the link ("dmesg" tab).

Br, Kai

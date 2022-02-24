Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A84C396E
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 00:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97081AB0;
	Thu, 24 Feb 2022 23:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97081AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645743642;
	bh=gYd1RTI9rJtBrwrtL9+aQ/yOPEmRInBZHf3X2dw7+Sc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfFmsiK9M6lDcBu0FPBN0cTRCBG7CvKVAk8ij6btW6SMCj//3q74fWzBoE0oYJHER
	 T+CTbPkRAz8WYfVaYIA5yuad+xBYPWiQT46cWaKfYZQiVqUy38ailBcv6KOAHJVbKP
	 bLELmvjMakDnR4o8zN6K5uCCy4rUhafAoX6dolao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67361F804FD;
	Thu, 24 Feb 2022 23:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3C41F804FD; Thu, 24 Feb 2022 23:59:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D8F6F800F3;
 Thu, 24 Feb 2022 23:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D8F6F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DPduJ6jH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66957B829D2;
 Thu, 24 Feb 2022 22:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E197C340E9;
 Thu, 24 Feb 2022 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645743537;
 bh=gYd1RTI9rJtBrwrtL9+aQ/yOPEmRInBZHf3X2dw7+Sc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DPduJ6jHZFqExPfWuPOkfbvB0jKRRXRsPAkkrdy+OqKcigkwTDhqDWgi48aPs8T8k
 R1KwnYFHsieJH+Rqu7Ue9jztoJOEalYCOVcWQ9q1c0w0G8gEqcfwY+/7zTNmEkl7h1
 fl4aGHwgGWHF7TaRMPMzScCq/SEHRNmhv1gZXl5/+mlfCr9Gk9GStz4NCpnpOsMSoI
 FOowQv6QjfLlUIe2A1WYbBCFdrOXgL8XO0ukkG9xoCEY3YWOBC2IqWGzFO+HlF8835
 fWGv1lywrgUWZzaf07h3RPsMCHUdQcNQlahogBhk3ODCQoYyW85JgZx0ECZ4ylNNre
 wyJqGpFdOeqBg==
From: Mark Brown <broonie@kernel.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <20220224185836.44907-1-ammarfaizi2@gnuweeb.org>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
 <cfe9e583-e20a-f1d6-2a81-2538ca3ca054@linux.intel.com>
 <Yhe/3rELNfFOdU4L@sirena.org.uk>
 <04e79b9c-ccb1-119a-c2e2-34c8ca336215@linux.intel.com>
 <20220224180850.34592-1-ammarfaizi2@gnuweeb.org>
 <YhfLCWm0Ms3E+j4z@sirena.org.uk>
 <20220224182818.40301-1-ammarfaizi2@gnuweeb.org>
 <20220224185836.44907-1-ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH v4] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Message-Id: <164574353404.3982297.17368553261476958555.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 22:58:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Fri, 25 Feb 2022 01:58:36 +0700, Ammar Faizi wrote:
> Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
> -ENOMEM because it leads to a NULL pointer dereference bug.
> 
> The dmesg says:
> 
>   [ T1387] sof-audio-pci-intel-tgl 0000:00:1f.3: error: memory alloc failed: -12
>   [ T1387] BUG: kernel NULL pointer dereference, address: 0000000000000000
>   [ T1387] #PF: supervisor read access in kernel mode
>   [ T1387] #PF: error_code(0x0000) - not-present page
>   [ T1387] PGD 0 P4D 0
>   [ T1387] Oops: 0000 [#1] PREEMPT SMP NOPTI
>   [ T1387] CPU: 6 PID: 1387 Comm: alsa-sink-HDA A Tainted: G        W         5.17.0-rc4-superb-owl-00055-g80d47f5de5e3
>   [ T1387] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.15 09/15/2021
>   [ T1387] RIP: 0010:dma_free_noncontiguous+0x37/0x80
>   [ T1387] Code: [... snip ...]
>   [ T1387] RSP: 0000:ffffc90002b87770 EFLAGS: 00010246
>   [ T1387] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>   [ T1387] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888101db30d0
>   [ T1387] RBP: 00000000fffffff4 R08: 0000000000000000 R09: 0000000000000000
>   [ T1387] R10: 0000000000000000 R11: ffffc90002b874d0 R12: 0000000000000001
>   [ T1387] R13: 0000000000058000 R14: ffff888105260c68 R15: ffff888105260828
>   [ T1387] FS:  00007f42e2ffd640(0000) GS:ffff888466b80000(0000) knlGS:0000000000000000
>   [ T1387] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   [ T1387] CR2: 0000000000000000 CR3: 000000014acf0003 CR4: 0000000000770ee0
>   [ T1387] PKRU: 55555554
>   [ T1387] Call Trace:
>   [ T1387]  <TASK>
>   [ T1387]  cl_stream_prepare+0x10a/0x120 [snd_sof_intel_hda_common 146addf995b9279ae7f509621078cccbe4f875e1]
>   [... snip ...]
>   [ T1387]  </TASK>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
      commit: b7fb0ae09009d076964afe4c1a2bde1ee2bd88a9

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

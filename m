Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE96B0C7E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 16:21:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA900181A;
	Wed,  8 Mar 2023 16:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA900181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678288881;
	bh=w5Wq43aKMcTwX8nKsIou+Df8rMxn8L4Me+FGU3w6k8Y=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvrRVi3iF/QhkBwv841Wbzu+9UsNP8/s5RLd3UgSBAsdGzbXpEzcvdhZaML217bw+
	 NZ2TiCj2jdh7V1MNY4xPvIhE4ZgtcSChNMqg6YVG3/mg2J4aQnRCvw1JVQLGIRu4sc
	 ghVaha+EBHxVU7hxEIvxixbsyKuMqAnloJZ7jq/s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BA5CF80236;
	Wed,  8 Mar 2023 16:20:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1F24F8042F; Wed,  8 Mar 2023 16:20:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DB94F8007E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 16:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB94F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cm281oLM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA34E61865;
	Wed,  8 Mar 2023 15:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD330C433EF;
	Wed,  8 Mar 2023 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678288819;
	bh=w5Wq43aKMcTwX8nKsIou+Df8rMxn8L4Me+FGU3w6k8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cm281oLMXSHk/1RWaJgO+zMO4bwXJ3JBBm+Oixmx6JxGzvbgkMK0vJfpIcie7kQv+
	 y4NbZjXa9Kx9Fj1hgiF+RoKGtJ7aid7Wq8stsTHHnsSrXt794qQIEwAEpCZmH+sd/f
	 Vd6H84Kk1gy5xnUSeGceZto5J0vvNPUHjHfWZQNpY6UKQKjRdG8m88Ooevee+VhAOC
	 7pCSlrzK4ewWWKHf+TvMmLTQdwGdrRugcZxt/LJFoD7LIc6NSc3F/bYzNtQnNXBg0O
	 FGg8cCxZVD0NK3jVBkggzy2cXyum2DIUDXuV4pb5pIoGPW8KPUKGorrdKohzn0fIgG
	 xdQXBhHGwjc3w==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>,
 Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230307155111.1985522-1-linux@roeck-us.net>
References: <20230307155111.1985522-1-linux@roeck-us.net>
Subject: Re: [PATCH] ASoC: da7219: Initialize jack_det_mutex
Message-Id: <167828881761.45774.4994753049411138273.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 15:20:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: DEXWISBV3KYYEBYSFAMXIQZJO6677TZ3
X-Message-ID-Hash: DEXWISBV3KYYEBYSFAMXIQZJO6677TZ3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 David Rau <David.Rau.opensource@dm.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEXWISBV3KYYEBYSFAMXIQZJO6677TZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 07:51:11 -0800, Guenter Roeck wrote:
> The following traceback is reported if mutex debugging is enabled.
> 
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 0 PID: 17 at kernel/locking/mutex.c:950 __mutex_lock_common+0x31c/0x11d4
> Modules linked in:
> CPU: 0 PID: 17 Comm: kworker/0:1 Not tainted 5.10.172-lockdep-21846-g849884cfca5a #1 fd2de466502012eb58bc8beb467f07d0b925611f
> Hardware name: MediaTek kakadu rev0/rev1 board (DT)
> Workqueue: events da7219_aad_jack_det_work
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> pc : __mutex_lock_common+0x31c/0x11d4
> lr : __mutex_lock_common+0x31c/0x11d4
> sp : ffffff80c0317ae0
> x29: ffffff80c0317b50 x28: ffffff80c0317b20
> x27: 0000000000000000 x26: 0000000000000000
> x25: 0000000000000000 x24: 0000000100000000
> x23: ffffffd0121d296c x22: dfffffd000000000
> x21: 0000000000000000 x20: 0000000000000000
> x19: ffffff80c73d7190 x18: 1ffffff018050f52
> x17: 0000000000000000 x16: 0000000000000000
> x15: 0000000000000000 x14: 0000000000000000
> x13: 0000000000000001 x12: 0000000000000001
> x11: 0000000000000000 x10: 0000000000000000
> x9 : 83f0d991da544b00 x8 : 83f0d991da544b00
> x7 : 0000000000000000 x6 : 0000000000000001
> x5 : ffffff80c03176a0 x4 : 0000000000000000
> x3 : ffffffd01067fd78 x2 : 0000000100000000
> x1 : ffffff80c030ba80 x0 : 0000000000000028
> Call trace:
> __mutex_lock_common+0x31c/0x11d4
> mutex_lock_nested+0x98/0xac
> da7219_aad_jack_det_work+0x54/0xf0
> process_one_work+0x6cc/0x19dc
> worker_thread+0x458/0xddc
> kthread+0x2fc/0x370
> ret_from_fork+0x10/0x30
> irq event stamp: 579
> hardirqs last enabled at (579): [<ffffffd012442b30>] exit_to_kernel_mode+0x108/0x138
> hardirqs last disabled at (577): [<ffffffd010001144>] __do_softirq+0x53c/0x125c
> softirqs last enabled at (578): [<ffffffd01009995c>] __irq_exit_rcu+0x264/0x4f4
> softirqs last disabled at (573): [<ffffffd01009995c>] __irq_exit_rcu+0x264/0x4f4
> ---[ end trace 26da674636181c40 ]---
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Initialize jack_det_mutex
      commit: af0f46e5b9a462aaa1d76e82781a5316f03828eb

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


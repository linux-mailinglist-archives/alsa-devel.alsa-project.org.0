Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C39429531
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1A9D16AA;
	Mon, 11 Oct 2021 19:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1A9D16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633971898;
	bh=XzLkYgb353iqv9hAK+ZGEMsAqi0vlTmlnZMBZRVRF7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzWRqpO5ZjKillXroAx/l7gRYujhp+51Ew1lv+Gb5O0lnEruk9bUTnbC4vK3RmHhv
	 hbncu2SxmjYRycvIKnmCwajfM5vSx/7rN0yaPR9YDoRfVm1VrX6L7kUN6E022ZhJVj
	 kVsTNnYRhPdghIWyZ+brL1cxxdAe7PYyhBmLSFR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA9EDF804FD;
	Mon, 11 Oct 2021 19:02:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC82F804F2; Mon, 11 Oct 2021 19:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C40F804E6
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C40F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hwIPLJIL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A433603E7;
 Mon, 11 Oct 2021 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633971724;
 bh=XzLkYgb353iqv9hAK+ZGEMsAqi0vlTmlnZMBZRVRF7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hwIPLJIL5kpqYVsrm/wIrAyPirFKYQQCKFGkJCZ+qVbyVevkyba5afceg2tbQeOP9
 WDb9Ai+fhiN7JCPefeixY+ZV3OOBqvVWXYTZH5SVHSJpj0IzROOCeHarAXQyDyLwvs
 18S6JCcXtBry0nSVHE0kPF0F0cE5jiEgCWYvTtz5G1BIDwp/HRCTj5LHt0IVhu4sKi
 cCyludQmqz6qsmh7GSv63KWjDyJEEDEdS6p6qYa6l/S6ctP7305F02htFMtoQFsNh9
 93o/LI0IFHI0gRM9LC9wDQ6eNlhC++S2EfUogq5e6R2l+ft7f3zpuhEs5IgHl+ovpk
 n+/YnBtxr3lTg==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: soc-core: fix null-ptr-deref in
 snd_soc_del_component_unlocked()
Date: Mon, 11 Oct 2021 18:01:44 +0100
Message-Id: <163397094549.6567.13611605791777369681.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009065840.3196239-1-yangyingliang@huawei.com>
References: <20211009065840.3196239-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, tiwai@suse.com, lgirdwood@gmail.com
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

On Sat, 9 Oct 2021 14:58:40 +0800, Yang Yingliang wrote:
> 'component' is allocated in snd_soc_register_component(), but component->list
> is not initalized, this may cause snd_soc_del_component_unlocked() deref null
> ptr in the error handing case.
> 
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> RIP: 0010:__list_del_entry_valid+0x81/0xf0
> Call Trace:
>  snd_soc_del_component_unlocked+0x69/0x1b0 [snd_soc_core]
>  snd_soc_add_component.cold+0x54/0x6c [snd_soc_core]
>  snd_soc_register_component+0x70/0x90 [snd_soc_core]
>  devm_snd_soc_register_component+0x5e/0xd0 [snd_soc_core]
>  tas2552_probe+0x265/0x320 [snd_soc_tas2552]
>  ? tas2552_component_probe+0x1e0/0x1e0 [snd_soc_tas2552]
>  i2c_device_probe+0xa31/0xbe0
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: fix null-ptr-deref in snd_soc_del_component_unlocked()
      commit: c448b7aa3e66042fc0f849d9a0fb90d1af82e948

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

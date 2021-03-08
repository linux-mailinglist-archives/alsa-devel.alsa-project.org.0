Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CAB3312F0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC4A218D5;
	Mon,  8 Mar 2021 17:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC4A218D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219766;
	bh=KpYN8PI6rGont5GCMsXRfQCE5sVoEvl9dlIQ+/e+4nI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=daaIu6b817M9McngDcvHoWIKFIU6Rne9icW8auPkvz+4n81SHvKQY/ZdRpam8P066
	 EIxw/jfi0QMagVLh6B+g/2wGKGXOUZl6YrtZe8+rULzYXhbya62HRAfjkWnEplNqMp
	 HNflZsEpx4rrprKkdhvFlsIdB8JXvZLGgo6VhGCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6453FF80272;
	Mon,  8 Mar 2021 17:08:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09E8DF800ED; Mon,  8 Mar 2021 17:08:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF889F801ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF889F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oxyBs0ar"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F2D36521D;
 Mon,  8 Mar 2021 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219678;
 bh=KpYN8PI6rGont5GCMsXRfQCE5sVoEvl9dlIQ+/e+4nI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oxyBs0armHmACQCSY6zvCid+PObSGxP5msB5rpVgTWSerdvtpBjgd9xKC8SROTJ22
 Lh6gnMy1khD3D27x4jG5GLGwhkTyXlo0aeWqtYOhce1jtQIukYJTGHhZnqJeZfohIh
 8vrKaVokZGxX5DBPqfGdVAg5Mfpug4qflalhC7pS2WDB5W+m48sl+5611mDD8L1q1A
 VoeSDD+gmoe7yKluxFAcjKQTXpnhH6zSozwGd9TbdCxgKglLFAuhpO4+TB7QhtlN3f
 Z/u/m352+l1KQ/xrODLui6eD0ysolDAivtDrMFP0Zjvw02QeKpc1XL4zDb2/l97Jze
 RlHkCnXAgFPBA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 James Schulman <james.schulman@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 00/15] Report jack and button detection +
 Capture Support
Message-Id: <161521960848.9621.15428448037752400716.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

On Fri, 5 Mar 2021 17:34:27 +0000, Lucas Tanure wrote:
> Here is a patch series for reporting to user space jack and button events and
> add the support for Capture. With some cleanups and fixes along the way.
> 
> Regards,
> 
> Lucas Tanure
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: cs42l42: Fix Bitclock polarity inversion
        commit: 97e2b5e5dcd543cd4d85ecb1bfa2a9721a08f411
[02/15] ASoC: cs42l42: Fix channel width support
        commit: 3656667e66858fef45017c8e7c73e9918ed23915
[03/15] ASoC: cs42l42: Fix mixer volume control
        commit: a2ddc577ee4641889bf105d4d6e05be415bd4462
[04/15] ASoC: cs42l42: Don't enable/disable regulator at Bias Level
        commit: 9ad4f9ea976e05d4eba62ea58c7c7c45705b80a1
[05/15] ASoC: cs42l42: Always wait at least 3ms after reset
        commit: ddaa9bea4ffaba50f814585f294a5d98641b41ad

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

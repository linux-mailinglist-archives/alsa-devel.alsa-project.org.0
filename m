Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854A486B2C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 21:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE471A8F;
	Thu,  6 Jan 2022 21:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE471A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641501004;
	bh=IpQIPHBYHIt4fJoB3X66Z00uw10D59V66SBT4tBVrS4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUpktpxf89pdVTb7zeiNtknDv1kG+prUyZUD6HF0PBBR0jdgXgqxzBSVmRwUSFtuc
	 8cbiWu7I6iZJ7IcYnrm43MyGlRygWD4KHbh/ZHp8oy9lzBIPwXxhFuD1qUOlbuhYUB
	 52KNjmTMXAgipMT7qh5RKv2BSpdty3H3soh9Qmjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE67F804FA;
	Thu,  6 Jan 2022 21:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03989F80158; Thu,  6 Jan 2022 21:28:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B619F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 21:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B619F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XhQUWGVA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B64061E0E;
 Thu,  6 Jan 2022 20:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28038C36AE3;
 Thu,  6 Jan 2022 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500888;
 bh=IpQIPHBYHIt4fJoB3X66Z00uw10D59V66SBT4tBVrS4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XhQUWGVAOrv571HrMyYqnTPpni/6IiNvLtxIuflbXFsFz950mrQOXSCET3Qus2ht7
 Xb9Jh5sqvvWx5gI7QKczMrdhlN2JJcoNcP856WT/9kZYe0yCPuA3vq82ikmt5I7fvO
 dqx7pXtAZqufAtM/jHQY19PwdOJOwKZKV6lP7KmHPHlv1s1DixH7YOtSiKjDJ++pAT
 s0/y2iBy7r+OOHf07yEUyQm9NDZCgBSrbTaNmFj8bXDug06eo9pi8TbzGAY/JVC0yx
 5DQKmVaG/Ywv/RPREOms9BzGYgro6N2nlWYelDMPlymBQ/TUXXLG4zKkkEk6OFo2zd
 BfN+uABGr0L4A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
In-Reply-To: <20211227153344.155803-1-hdegoede@redhat.com>
References: <20211227153344.155803-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/5] ASoC: rt5640: Change jack_work to a delayed_work
Message-Id: <164150088687.2243486.4835861828323933435.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

On Mon, 27 Dec 2021 16:33:40 +0100, Hans de Goede wrote:
> Change jack_work from a struct work_struct to a struct delayed_work, this
> is a preparation patch for adding support for boards where an external
> GPIO is used for jack-detect, rather then one of the JD pins of the codec.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5640: Change jack_work to a delayed_work
      commit: a3b1aaf7aef9fa945810de3fd7c15b2e93ecdbfd
[2/5] ASoC: rt5640: Allow snd_soc_component_set_jack() to override the codec IRQ
      commit: b35a9ab4904973a68b4473c2985b8ac0b6d57089
[3/5] ASoC: rt5640: Add support for boards with an external jack-detect GPIO
      commit: 701d636a224a77a4371f57ca2d4322ab0401a866
[4/5] ASoC: Intel: bytcr_rt5640: Support retrieving the codec IRQ from the AMCR0F28 ACPI dev
      commit: 45ed0166c39f878162872babc88830d91426beb5
[5/5] ASoC: Intel: bytcr_rt5640: Add support for external GPIO jack-detect
      commit: 44125fd5315154c6b8326b5c27646af3b33ba25c

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

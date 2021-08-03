Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531673DF801
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 00:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5A0F170F;
	Wed,  4 Aug 2021 00:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5A0F170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628030268;
	bh=gIYIjPjQ0ojhmbqr95RFToHQcd4l1aybGPv9KyjhSuI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azS3x9egUTscvr7QQxcZAtTNljv4KCBWHU0z9AmINVGEe50wc6hS4blXQvWyUibeN
	 /LB62YHUEox+6WmdHTqyMPFlA37tUMFFB5+30q2r+s4DSBUNgHRPkB+tO6muZef2pC
	 9PxjsZZHgcy6nvEL8iCDZF1R2hd2Jy7B2lfJR2Gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA56F8016D;
	Wed,  4 Aug 2021 00:36:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74DEDF802E8; Wed,  4 Aug 2021 00:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 192C6F80095
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 00:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192C6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sB+w1Kai"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AA0F601FD;
 Tue,  3 Aug 2021 22:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628030174;
 bh=gIYIjPjQ0ojhmbqr95RFToHQcd4l1aybGPv9KyjhSuI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sB+w1Kaip8snuALRVdkK93XxTcGNKVJWAQACAXyyIP9IFtj4h+LWtvOLkjfaBsp8b
 mh+A4qDLqSwAqN/ZSC3GmDsQhCkKb1Moe1ZsJN+o7S+OVliZ2h+TYwhqQbALkQTxvf
 6mKBXxjA9Eq0sS0TmV5kHkO5Oy9sUSNyJZljbjEvjcCrQffaBQQnLpxnNHY9acoLC4
 i94wT5RUK6Qu+IERZyPLThwGuy3Az5ohXtWuo/ID3HXQFIYX22/yg9RRerUQOlYca9
 l4OlbrvJELl9ukHFM7BJICOu7TdodfLOR3PuVAO/rBtaxYiw+DOpX0hMR1ZZG6NvKW
 DyVfQqLRSEaeg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/4] ASoC: SOF/Intel: machine driver updates
Date: Tue,  3 Aug 2021 23:35:36 +0100
Message-Id: <162802985540.42099.5913593680949715642.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802152151.15832-1-pierre-louis.bossart@linux.intel.com>
References: <20210802152151.15832-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Mon, 2 Aug 2021 10:21:47 -0500, Pierre-Louis Bossart wrote:
> Two quirks added for Dell XPS 9710 and Intel reference boards, and two
> minor cleanups.
> 
> Pierre-Louis Bossart (3):
>   ASoC: Intel: sof_sdw: add quirk for Dell XPS 9710
>   ASoC: Intel: update sof_pcm512x quirks
>   ASoC: Intel: sof_sdw_max98373: remove useless inits
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw: add quirk for Dell XPS 9710
      commit: b8cab69b0ed9ee10f2a86670ce41ffad991c8dc9
[2/4] ASoC: SOF: Intel: Use DMI string to search for adl_mx98373_rt5682 variant
      commit: 46fa9a158327dd40238fa8e76af4bafdfcb8129e
[3/4] ASoC: Intel: update sof_pcm512x quirks
      commit: 22414cade8dfec25ab94df52b3a4f7aa8edb6120
[4/4] ASoC: Intel: sof_sdw_max98373: remove useless inits
      commit: d4321277b3b90474302a9b3b5ca124bcf0f29f00

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

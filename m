Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB75B056D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 15:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A1215C2;
	Wed,  7 Sep 2022 15:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A1215C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662557966;
	bh=cEB29+eZ63sn6SGDvxQjCJu8E8mFM2+RAsAZHVgBmJ0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XP+juL3JfQs9wxX+EryC6SHRI0SP40tmG5ggDIwF+q0v91UMh2GJTMRUzg6JdGM6V
	 sEn3yNO9R/3T8zjZaKMeL9HNImL9emwtyr3x//fTf6fxZPZjZGC88hMwXibSp4uMjs
	 ch6VKTID+TnbqDYd5+yatXwx5ugQ1w+khQDS8EUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F03F804CA;
	Wed,  7 Sep 2022 15:38:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC32F804CA; Wed,  7 Sep 2022 15:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E850F804B2
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 15:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E850F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TmUNAx01"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C73961909;
 Wed,  7 Sep 2022 13:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C27C433D6;
 Wed,  7 Sep 2022 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662557867;
 bh=cEB29+eZ63sn6SGDvxQjCJu8E8mFM2+RAsAZHVgBmJ0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TmUNAx01gPhlpJ9kK4Iw6TqSBvKDJvhkSs5Gmg9NgdhBLyKg69kUVscZMm7xmvrGS
 GZ6ef7iddL3xaOPhZEvl++NT3oom4S1efWs/Yh9oSme+ao3ZcjR5tZdzG0vTiPW8hD
 tUe3MrFTDMsQp19VWP64vBni6ZnJGdicM+kNytjUpgYoXHqNboG6+iuL0NaGFPRS5n
 WRu4ZMB6am6b6mqfY0CYVC6E/61LtuUcH23zXG8LaYYd2SEkOzS7hLXL9mBldL1nHW
 XIAY0ghL5ohdwsFHX5O6s4opxkRkFrbCj/U3DQpPo35YbaEcaSmr9CxHPXkpr71CsT
 funjx9Uk0muDg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: soc-dapm.c: random cleanup
Message-Id: <166255786657.130875.2167724430678359933.b4-ty@kernel.org>
Date: Wed, 07 Sep 2022 14:37:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Mon, 5 Sep 2022 23:17:11 +0000, Kuninori Morimoto wrote:
> These are cleanup patches for soc-dapm.c.
> Each patches are not related, very random cleanup.
> 
> Kuninori Morimoto (4):
>   ASoC: soc-dapm.c: don't use kzalloc() for param on snd_soc_dai_link_event_pre_pmu()
>   ASoC: soc-dapm.c: don't use WARN_ON() at snd_soc_dai_link_event_pre_pmu()
>   ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
>   ASoC: soc-dapm.c: fixup snd_soc_dapm_new_control_unlocked() error handling
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: soc-dapm.c: don't use WARN_ON() at snd_soc_dai_link_event_pre_pmu()
      commit: 427de091a7112aa8eaf2f689e95c0dbca5ea6543
[3/4] ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
      (no commit info)
[4/4] ASoC: soc-dapm.c: fixup snd_soc_dapm_new_control_unlocked() error handling
      commit: 3caac759681eeb31ac80e3cc14b972680c8bde54

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

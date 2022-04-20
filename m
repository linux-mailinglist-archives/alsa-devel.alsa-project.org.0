Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D9509248
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA36A1DE6;
	Wed, 20 Apr 2022 23:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA36A1DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650491046;
	bh=8X2QEt2lhi2nHtjk6Rs3WVQZYib5Iw0DT7J8jUnG10I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MeOjmPCsmfK7kD0/G3lfxQaa3IA/8BM5nUnavh0x+1wNECr7yQcK3mI5GC4o7G6Vl
	 jP4sGQDKT3sXVuIt6jUDzr1i4LSwfM3LeX3Uy0pyVMvTXw99SHO4Mk+fqZeOhomrpI
	 D3yUK5zr73dyIOxBi+MAr15HgXr1nSTY92SwD9p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 308D5F8053C;
	Wed, 20 Apr 2022 23:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 196C3F80539; Wed, 20 Apr 2022 23:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49408F804FE
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49408F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZeE1O5Ep"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8858AB81104;
 Wed, 20 Apr 2022 21:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321CBC385A1;
 Wed, 20 Apr 2022 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490861;
 bh=8X2QEt2lhi2nHtjk6Rs3WVQZYib5Iw0DT7J8jUnG10I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZeE1O5EpvOwXFbK6lO1RpwVY4KTk0d+yzNGNW47alh9PFEi6TKVJabMSeAlPawhkz
 PibaSiyJsufJmgusHMEPpvL38T2XcqXTj8Y/Ftt5hd4m4cGsAvUr0px5kBkCe8qtrc
 S/rB0k+UHp6zS3TyvLVIQO+R24U6Yn7lR4+IbIZ1Qjkpf3U92P+ZHehH+RthulPy4k
 TAHLP68rMA06V+SqNbHfMjBzayGJpdO+AqE/7n8IyTd8wBt7a3bkVgBlwiEv9GgzIz
 KUI66IxVvvsnzwJ8n6lqmXx4owvaqqfEBut1GfqVkibrdQPSCM4APPaClwuzTHsUI7
 InTyrTC7K2Jfg==
From: Mark Brown <broonie@kernel.org>
To: AjitKumar.Pandey@amd.com, alsa-devel@alsa-project.org
In-Reply-To: <20220420094442.1352717-1-AjitKumar.Pandey@amd.com>
References: <20220420094442.1352717-1-AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add pm ops callback in machine driver
Message-Id: <165049085891.138067.2699474360256184999.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Alexander.Deucher@amd.com,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com
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

On Wed, 20 Apr 2022 15:14:36 +0530, Ajit Kumar Pandey wrote:
> Add alsa snd_soc_pm_ops callback in ACP machine driver to support
> suspend and resume operation of sound card components
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Add pm ops callback in machine driver
      commit: fbae863de87bf50c7b13b40e3b4dc4b479335020

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

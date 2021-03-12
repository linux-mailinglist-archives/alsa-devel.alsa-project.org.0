Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E673399E6
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 00:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C69718C0;
	Sat, 13 Mar 2021 00:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C69718C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615590288;
	bh=oyy2pBtdLLln8vXo63tWUx+96i76C776BnFH+pOACMI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ujRajAlc6VwVqtUekk6GfEVeDqYrIyWQ0/FaKMXYqSVtWmjBZMEwkxNPQycpWspIs
	 tlHlPYwUYO3ymctFGI8PRJXl7nGCOfUX8KF/EBNWljY5jx4gu5W/boZHOkFcj9arv2
	 CKjvscIUjsS0WJP0Vh30WKe/HBUbm3Wi/WBSYFeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4940F80424;
	Sat, 13 Mar 2021 00:02:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35960F80217; Sat, 13 Mar 2021 00:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53757F8012A
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 00:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53757F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aZ5oyhUQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 265A264F49;
 Fri, 12 Mar 2021 23:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615590135;
 bh=oyy2pBtdLLln8vXo63tWUx+96i76C776BnFH+pOACMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aZ5oyhUQ/XK09a7RYewEcHUnV354o0+YsBauAqDHiZawDOatjl+UTd8dSmCvqwWqA
 Dqg5LOg+fDe7NDxBNh0vNJ4126YSrVBIFWM7yGHEu4MZYbMZMFpCrB6Yr8dODaAoNY
 gYn4wgKGnMcIkZjmLobQac2+WtWVrcX2W2zaTmHvUlix8bcuhJFXcHuoOUxTZxff80
 /sshm4P2U+joO7wp/9D/60m69sNbW97xSvYei4ILHTQicw7laPMThhfLYcKWPNbfiQ
 /wFcXrQsP0TJ+EbqKRIZoTQsMy1vBrwszQQo7GNdSfUS/iXzfAcFaYrydxBDPL0SUt
 YUkeKpRO7CKiA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH resend 0/2] AsoC: rt5640/rt5651: Volume control fixes
Date: Fri, 12 Mar 2021 23:00:52 +0000
Message-Id: <161558981190.31753.12908806225739839185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307150503.34906-1-hdegoede@redhat.com>
References: <20210307150503.34906-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

On Sun, 7 Mar 2021 16:05:01 +0100, Hans de Goede wrote:
> Here is a resent of the remaining patches from my
> "[PATCH 0/5] AsoC: rt5640/rt5651: Volume control fixes" series,
> with the controversial "[PATCH 3/5] ASoC: rt5640: Add emulated
> 'DAC1 Playback Switch' control" patch dropped, and these
> remaining 2 patches rebased to still apply with that patch dropped.
> 
> Regards,
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5640: Rename 'Mono DAC Playback Volume' to 'DAC2 Playback Volume'
      commit: 40e4046913a34dd187c94f66c0f43facbff0f430
[2/2] ASoC: Intel: bytcr_rt5640: Add used AIF to the components string
      commit: 9f47c9c8bddc79e770ed19366840b9c2ab280ac1

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD572D30B3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 18:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7BA16EB;
	Tue,  8 Dec 2020 18:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7BA16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607447561;
	bh=UQOIh/6vu2rQQ3Pd3IbTPTi3QCS6zCm/7QvBrPzCdn8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s48qgHmq5ZRfkMfWrc8pl7KpsaQks+2CTwM8zwQa1Zhjep6EfSn785pX7R2EV2qH3
	 ky/YtB4JDZNPzNLrQg4Ayo8oVt1m5mq2mRWCzmaUlz119gDJ3MY4KRH44VsKwjNsew
	 +FV76YCGFKrTmBA7kXag7QbtUxzfsorLHWF803XA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 013A9F804C2;
	Tue,  8 Dec 2020 18:10:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1188EF804DF; Tue,  8 Dec 2020 18:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F446F804C2
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 18:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F446F804C2
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20201208135154.9188-1-tiwai@suse.de>
References: <20201208135154.9188-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: cx2072x: Fix doubly definitions of Playback and
 Capture streams
Message-Id: <160744738922.29839.6016189468819322432.b4-ty@kernel.org>
Date: Tue, 08 Dec 2020 17:09:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 8 Dec 2020 14:51:54 +0100, Takashi Iwai wrote:
> The cx2072x codec driver defines multiple DAIs with the same stream
> name "Playback" and "Capture".  Although the current code works more
> or less as is as the secondary streams are never used, it still leads
> the error message like:
>  debugfs: File 'Playback' in directory 'dapm' already present!
>  debugfs: File 'Capture' in directory 'dapm' already present!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cx2072x: Fix doubly definitions of Playback and Capture streams
      commit: 0d024a8bec084205fdd9fa17479ba91f45f85db3

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

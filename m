Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85EC3520B6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 22:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C7416AF;
	Thu,  1 Apr 2021 22:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C7416AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617309916;
	bh=CxRiGpAwxxqa0Vu8pQQP6HhO9b4ZMmEy0ohqCZncy1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JoLroJ9Nwy3e7eqeVlg4N7UkkCBTSyJhYWVWMaJeRPwTiq+gOm+/PVxp7yNWnLKm5
	 +2FfynUpZyjulYYdienGCMPbn/Nrv95wwtM6GPXV4X8ryHV58/nKp9JgyUvPKWuObq
	 EqrA6M81cJ6mLIyAGrvr2pnsC6BBPSgcpNuhLKEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1383F8026F;
	Thu,  1 Apr 2021 22:43:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93777F8026B; Thu,  1 Apr 2021 22:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECA7DF8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 22:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA7DF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fsc+WA8S"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59B30610EA;
 Thu,  1 Apr 2021 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617309814;
 bh=CxRiGpAwxxqa0Vu8pQQP6HhO9b4ZMmEy0ohqCZncy1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fsc+WA8STNBqH1vWkidrfVnJLh6rjJ3hSsdZvhm6MQ8gLRpWGtKegoBtnGpOae6cT
 CFEPe4LRcxV5lLNW38zYKLhV/6iMFKlI49+XXotIXshuaubEYhLjRAzUAJ6Uv58Vtt
 WIgFmHAZSeBCTSrLyKyg+SM+kwduA0pP5JQlMnS7i3KWAC9XHxrq5zGHP0xG7rVCOV
 j9yfnyHMwLzG8ucBHAdkQISv70NpNAuNz7+fKj1NiowAGwUdyyV87f56XkaeG/QycW
 d5wkhBx1GVgBYgwRX2AmY+gUE2etEc3PmUBdbPeyaiH/oAhV+g5i0SYrQvpBs0NDsI
 rkrjlap8ybMcg==
From: Mark Brown <broonie@kernel.org>
To: mac.chiang@intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: Intel: Boards: cml_da7219_max98390: add capture
 stream for echo reference
Date: Thu,  1 Apr 2021 21:43:18 +0100
Message-Id: <161730965813.25343.18094681542486299831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1617285613-29457-1-git-send-email-mac.chiang@intel.com>
References: <1617285613-29457-1-git-send-email-mac.chiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
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

On Thu, 1 Apr 2021 22:00:13 +0800, mac.chiang@intel.com wrote:
> enable speaker capture dai link for feedback path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Boards: cml_da7219_max98390: add capture stream for echo reference
      commit: 628166c37c16250612da926c010fe6c84d086ac1

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B43D9970
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 01:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D7B31F47;
	Thu, 29 Jul 2021 01:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D7B31F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627515005;
	bh=V3zJBaFzTHNYxbidYGufcLlftR+KGFH0ek4HfHUjcBo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOOUS6aKRqJoIdCCHRrx+602pEhVE2EowinO3WTJ9pjF2GZU0mH8F10bBr/sUH6aC
	 QFm3HdKmr7f4PLxv+jmPY+gVH3xpBat8HlwtIVQuKs+PUidGwirutbbf+6JeoraUTM
	 MdcYGnVMK9tV9BBS3yuQ1vPCaXJ+bD0+IMdc3iNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A07F8025E;
	Thu, 29 Jul 2021 01:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F117FF8028B; Thu, 29 Jul 2021 01:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B68F80212
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 01:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B68F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qZ6UI2Ev"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA21B60E9B;
 Wed, 28 Jul 2021 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627514893;
 bh=V3zJBaFzTHNYxbidYGufcLlftR+KGFH0ek4HfHUjcBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qZ6UI2Evos2kGn60ionklymKHYjP60FqjpzLBozWzosPm661HOFUczbRptFkB0R1p
 LxPDdVLgpp9zbVGqRFGjkCQKTs4qS0+Vq5eFAYe8rkuniVqhDnmFwEKUdcXRCsdDxu
 kkRTFkh5JNr9oDp8+PyvXYAFjLy/2oTv1m7qEYgjbwjGr+8RfFznKvzwJIQZOUxeZF
 AFUjESw7E6H9T4DP3uICBQgaCtCZ5DweBkQp3GcQ8dHtIT6GQ3JQi0N2lNQmUDp/5R
 bcwQ8h6EZR1MEtEU16FlEcqP9GFhUes4I6OXoCjGXyi3SOIYY3S7Sq6G0Q7fc7Jpis
 M0udWRm9exdDw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, sbranden@broadcom.com,
 Tang Bin <tangbin@cmss.chinamobile.com>, perex@perex.cz, rjui@broadcom.com,
 lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: bcm: cygnus-pcm: Fix unused assignment about 'rc'
Date: Thu, 29 Jul 2021 00:27:53 +0100
Message-Id: <162751391069.10122.16132233496782994388.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728124411.3168-1-tangbin@cmss.chinamobile.com>
References: <20210728124411.3168-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, 28 Jul 2021 20:44:11 +0800, Tang Bin wrote:
> Delete unused initialized value of 'rc', because it will
> be assigned by the function devm_request_irq().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: bcm: cygnus-pcm: Fix unused assignment about 'rc'
      commit: 14db5499d583e0952606fbca3eb37a0f28008d30

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

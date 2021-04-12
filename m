Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138835D0B8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 21:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C32315E0;
	Mon, 12 Apr 2021 21:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C32315E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618254188;
	bh=s3jlz2cb94XkzLoxDc92C6GSur14QEE5kXUIi4S4aMo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWapf9X+Toa0YZTyRHNGlNHz5ZUlroFLHSUuSq2jD0S+3HLsuItF3wqqo73BtlCzU
	 ToeFIJkfLBpxjRUFy7q7H5F/y0EbV4t+ncFQyGdy9utmI7cc4x48PiJ9B5qLct86tt
	 dCWhlPBWqHF0sppYlkk72SI+ParieiEeoCDlThBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE4BF8013D;
	Mon, 12 Apr 2021 21:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD140F80271; Mon, 12 Apr 2021 21:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5F28F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 21:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F28F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lKkG/L7C"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96DA761352;
 Mon, 12 Apr 2021 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618254089;
 bh=s3jlz2cb94XkzLoxDc92C6GSur14QEE5kXUIi4S4aMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lKkG/L7Cd/vqNFk30IyZxcuyzOaEK0lHms9lKXdSGRdoQaDZrjEzblZUXGmwWz064
 YrHCYLp/nMJ5W2wipkyI2WUCkwWiGHu4fxkwAW1zNOYBNEbhuG0FvvspRJzGF8wW5j
 X3CKXTjIy79TqT+YOJFmUOVxvRHdTb8HNX41RS+QjYR60F/kscFidEniEbGaQ++bjy
 lcxuG5rfRJFlobvYnZrDCU9eKqfuDo1kNirIwgP6jcpxyHJzfJmTiHYhVaujosZKSI
 2qEsKe8hqTuSuWVB4uisIQNi/FN5sFYojvGQWMc268zftWmJUpqjtOt5xvjIjhpssh
 4j4A4SAm1Gv4g==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: topology: remove useless code
Date: Mon, 12 Apr 2021 20:00:59 +0100
Message-Id: <161825392630.52100.733267241487251586.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409220522.1542865-1-ranjani.sridharan@linux.intel.com>
References: <20210409220522.1542865-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Fri, 9 Apr 2021 15:05:22 -0700, Ranjani Sridharan wrote:
> The patch "ASoC: SOF: Intel: hda: assign link DMA channel at run-time"
> fixed the sof_link_hda_unload() to remove the call to the BE
> hw_free op but left the rest of code that become redundant.
> 
> So, remove sof_link_hda_unload() along with the link_unload() op
> entirely as it is not longer needed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: remove useless code
      commit: 7459f8b703db589e1fa6482449cd681a6a612189

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

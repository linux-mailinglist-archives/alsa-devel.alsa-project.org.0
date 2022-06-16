Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A3854DFDB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 13:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B728E1AEB;
	Thu, 16 Jun 2022 13:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B728E1AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655378226;
	bh=0H94X44bwP0GrLlj0Q2AlhCSU6r1nc2a+8rYr2pqroU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDVv0J+9d1LxhplL/1n7NFQDk7MF6VYfq9Jb2kh30yy++FcppBcnjKeIjKohthC56
	 evD8gmsi1cwfxv9/RCTU4m7kNBSQAqFOthNYwnd1v23M2sG6DjL7U/aZHNpnPlN6QO
	 QUWgWzRq/ZoGvwkpXs6JjnKKfT1rLW6us9scxUkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA16F80528;
	Thu, 16 Jun 2022 13:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCDBEF8047C; Thu, 16 Jun 2022 13:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BAA7F8012A;
 Thu, 16 Jun 2022 13:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAA7F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dA2YYDgM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 768A4618CE;
 Thu, 16 Jun 2022 11:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B520C3411B;
 Thu, 16 Jun 2022 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655378116;
 bh=0H94X44bwP0GrLlj0Q2AlhCSU6r1nc2a+8rYr2pqroU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dA2YYDgMwiohEUvN9W1EnQvdw9/riQtk/gw3lwXDOATbrFKR7Xq/7OnFbDW1h2rL/
 Cu+7P5RT9Lk4EH2DjQU6xV2jJs6ThUmsfz7ckA2RQsJJru+EFY/hhiUt1UGhoEhII2
 uo63+u2u6Pz3Nhye7wdtvANq0etn0Z/uyQ0I2mksKe3xP34hAIjqsr/vo4/pYTH/di
 sQ6X5J/htXbdbAbbJHtjJHkjq5lEojcXTKkDwqtmW3KZpfqCjl/q8CwsPCAeQzBYUk
 V9Chfad4RkQKfUKhzD6QIjZ1Z+V/UeCoHzkHuQbjmLPbvuUWwhw1khczjQZj79w8rv
 /Xvfy8uX6chjA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 dan.carpenter@oracle.com
In-Reply-To: <YqqyDU5BhOzpRjco@kili>
References: <YqqyDU5BhOzpRjco@kili>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Fix error code in
 sof_ipc4_volume_put()
Message-Id: <165537811396.677284.13292348933501496374.b4-ty@kernel.org>
Date: Thu, 16 Jun 2022 12:15:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 kernel-janitors@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, rander.wang@linux.intel.com,
 sound-open-firmware@alsa-project.org
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

On Thu, 16 Jun 2022 07:31:09 +0300, Dan Carpenter wrote:
> The sof_ipc4_volume_put() function returns type bool so returning
> -ENOENT means returning true.  Return false instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Fix error code in sof_ipc4_volume_put()
      commit: 7acf970a6fbb3c10bb5979d0dc3ed42b161daf15

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

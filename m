Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77412429523
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1350016C3;
	Mon, 11 Oct 2021 19:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1350016C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633971840;
	bh=sA9IPFPv1s4drjA088OPVEJGCy9qliVmy40+zSZtmG0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmS84Rsu54pBDL9sVOEWZNGmx/D5t4tZjW8Hn/mmxkYek2m7GNbg3YTn1KA09bayj
	 +VfBNCp7EI6s/9BVdjSQ6lMA6OPdctmLab0RtJk02v3przn6DYLwRM1XMwKO3fu+gz
	 iHEcbQ9QZ6sojBqANMhXqyVHUvH+FaMxAK1Oe4QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCC3FF804C2;
	Mon, 11 Oct 2021 19:02:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07D7BF8016D; Mon, 11 Oct 2021 19:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C81F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C81F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SYyYWH9m"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95BDA60F6E;
 Mon, 11 Oct 2021 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633971719;
 bh=sA9IPFPv1s4drjA088OPVEJGCy9qliVmy40+zSZtmG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SYyYWH9mT/iTcdd9Z0mFqZXKMTVYnCoSOPHBr/QCsUzmbNnV28TlSnR/5VR+P/FaB
 bWfaHzBfBsr6IOO9IkCYXkCqiT3amj5kcOjOa4YsVWPFJKJNwGCWtCAv1STSuvd8QC
 RGaewUOX+MyOhkQGV1f0t+lAZNbyrsyjFATIQpOOMdiq10nRqpnEcc6/5KADLVCrpG
 7JkETWoPbRO1rb4DvFKAcSk5X09neTSbONIPiMxFBQqejgNRHPlngzQqKbLOrlc/VZ
 bgASmtGH86JPDlLWi2ExGEoPIbqQ1Py2oFWKliNT20BNgVXSjV885PKI8Z/uKCJx8O
 eOmskq8GQilyw==
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: amd: Kconfig: Select fch clock support with machine
 driver
Date: Mon, 11 Oct 2021 18:01:42 +0100
Message-Id: <163397094549.6567.3180566951499093730.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011055354.67719-1-AjitKumar.Pandey@amd.com>
References: <20211011055354.67719-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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

On Mon, 11 Oct 2021 11:23:53 +0530, Ajit Kumar Pandey wrote:
> We are using fch clock controller as parent mclk source for rt5682
> codec. Add config to enable clock framework support for 48MHz fixed
> clock when machine driver config is selected.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Kconfig: Select fch clock support with machine driver
      commit: 281ddf62f551321982c7d6f525a83a3b3c1d5eae

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

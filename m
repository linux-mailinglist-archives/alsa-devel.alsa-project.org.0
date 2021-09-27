Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA8419DAE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7562516EA;
	Mon, 27 Sep 2021 19:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7562516EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765432;
	bh=Z4NOzrNbBOX/TYyEuQLP+lxyx0e3iGBJu2EUdQ+Y4cM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uIAXPP/H3BbVumW47PFRm73vI0CImem2/5Ju97l/oDEMvsj+NlB6OR83o1eA0tqEY
	 7j9+d6mKmk0f9ZbfqdKNAMq7cCyNHGSXALbTjfnZLTLmagqbXpxgJYuaz7VpPe2RKH
	 cW0OrWMIYkjGDAAAhV7/FWso1+2MJ8rXmz3i6X0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C30AF805BB;
	Mon, 27 Sep 2021 19:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54593F805B6; Mon, 27 Sep 2021 19:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EBD9F805B0
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EBD9F805B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hono0Luh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27ACB60F92;
 Mon, 27 Sep 2021 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764894;
 bh=Z4NOzrNbBOX/TYyEuQLP+lxyx0e3iGBJu2EUdQ+Y4cM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hono0LuhVf/lPCs9A8ERRHsQOi4bnfSN09yk8T1c6nqPJ+QY3SbtgCKUS39Ma/BfB
 plyxv+PR8F04joIel2taXZqxccaxbn1cHkGYWWKLOFcmhwO5ymj/TO0suVMG92zg9j
 VKZ2gJYOjukVY5A9HvFJESmCGURAsZhJbMFkKCJiV6j/mBfGd90tJKTFK0TpviNw6p
 OgNnCAZNB2BPp8pe5GYG4a/EsuLL6ycG+GIM8zetKiApYPDHIDNMOvGctfo5a8u9dP
 YqglKaspxerloU9xHdffngWLrhUJbmCzL055ylFQ8N6kNgPHVk3paMaL0+IatAjQls
 Ug9Fw0Qloye4g==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: cpcap: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:50 +0100
Message-Id: <163276442022.18200.1201063515695467432.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920165323.17338-1-broonie@kernel.org>
References: <20210920165323.17338-1-broonie@kernel.org>
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

On Mon, 20 Sep 2021 17:53:23 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the cpcap driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cpcap: Use modern ASoC DAI format terminology
      commit: 99a26f2416fc1fadcfb4519ae5de5265b109e268

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

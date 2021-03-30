Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DB34ED33
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 18:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC711671;
	Tue, 30 Mar 2021 18:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC711671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617120527;
	bh=+yVcRQivrrhK/CdHLyOmiRqkqTnFsHEXe8mFaMiYQi8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BlzJRMjxP8EWepaNVZpIMXl+EKZQ0gXM1/g7i/pOyzb/bC3GlI2U2XRmRFJ/W+Erx
	 5RFESDu/xrzDvbrmFDTOjLmo+QbaCfxzjKk3fJ9DCySbmuWf4uNBHDXTgdbx1yRYFh
	 4cZYzOqNCZGOKCuAOWh0qYXxmHiA0Z5gtP41FLik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33224F80424;
	Tue, 30 Mar 2021 18:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B00F8027D; Tue, 30 Mar 2021 18:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD35FF8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 18:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD35FF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WCIjr0CB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0214619C0;
 Tue, 30 Mar 2021 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617120362;
 bh=+yVcRQivrrhK/CdHLyOmiRqkqTnFsHEXe8mFaMiYQi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WCIjr0CBahhFHywdasaDU5l2IqsRRX1GpQDFr75TZcqdNm86DqbWKW8jovFIXK+uU
 PEAt0aiqfarjBA9Yj/PECJrunJtczmRfyRCywQ4lDDxobYvGS3zFoleAhGhafXpfqB
 nScTsd9M/NPUGspSHduV853zkFZtS8GPEVlUFLxa+vvweq0s6FXw+PDfP5xcUb2Hk5
 3ByVetnW2t5YJ3GKGnBLREjh/IvUQ6egAUO/U+JwbwnvZYt92pqKG+AjtD1ZlE6HFk
 wvRwu9wHaxYhLCEBJY+fVC05iS+aoDwZsObnB704eamaHUxplC3rP0ez0lA5Azw/JO
 7AJTNYMWdR/zA==
From: Mark Brown <broonie@kernel.org>
To: mac.chiang@intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: Intel: add max98390 echo reference support
Date: Tue, 30 Mar 2021 17:05:47 +0100
Message-Id: <161711993558.12915.12103388679448177555.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616757689-22014-1-git-send-email-mac.chiang@intel.com>
References: <1616757689-22014-1-git-send-email-mac.chiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Mark Brown <broonie@kernel.org>,
 brent.lu@intel.com, bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On Fri, 26 Mar 2021 19:21:29 +0800, mac.chiang@intel.com wrote:
> load new topology file with speaker capture pipeline.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: add max98390 echo reference support
      commit: c7721e94279887f9dd8f4be303f2054bb5477c9e

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

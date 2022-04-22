Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73150C490
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 01:19:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E371747;
	Sat, 23 Apr 2022 01:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E371747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650669569;
	bh=wZE6G3X0/fzbB+TWxVsGdH67kMHDaZYQkJjTvctnxao=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJFRf4XzrTxep+izN0YYi9/oEJbRUavVAyuuHhyGVp3jvd18s446M3FcpWkJpzX7z
	 1Ek4tn/DEuyxDI2b3ayPht2LgCHJQQIE9vPYEZtK4/KUu+INqZmk/Unr5xTRErFXB3
	 Sw/zmPc+YAEKgvR13byTcK4sRyJwlJebyCGXAGpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A3CEF80511;
	Sat, 23 Apr 2022 01:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C68F80506; Sat, 23 Apr 2022 01:17:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3E3BF804FB
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 01:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E3BF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CIiGUzqj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01404B832FD;
 Fri, 22 Apr 2022 23:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C01FC385A0;
 Fri, 22 Apr 2022 23:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650669450;
 bh=wZE6G3X0/fzbB+TWxVsGdH67kMHDaZYQkJjTvctnxao=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CIiGUzqjrleg7W6kB2q6ItGTtfp/+K/Xm5ICuLg9gJv3Z86Djx7JSg6hscAb3ZnCg
 GkD/lFHfjv73na7Hez5ig0gcBW2E9RjlEFd9T3ATFBVj4/FLoWiUWlfgwD113zF/52
 Mh+/PRzpZypzFmaSaISsCy4wh8QAXMV7TpiLKG0Fm+Zi66arzBYYefAXKR2olpprub
 2lzCY8hsvu/DZCUZWFUz5lr/NXBzo0mqaLF3X4r3yiTS+SSHqs/2MDPGGIFsVNC5tH
 /yMZUpn3rpgZuXtK/eORoFyHxDXFNGrsBxTOOMcxlArutKpCLMHCaWJy1YpBMVx+He
 V0xXB4IGqYqGw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421201946.1547041-1-pierre-louis.bossart@linux.intel.com>
References: <20220421201946.1547041-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: simplify NHLT handling
Message-Id: <165066944928.12937.4385704923446794140.b4-ty@kernel.org>
Date: Sat, 23 Apr 2022 00:17:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Thu, 21 Apr 2022 15:19:46 -0500, Pierre-Louis Bossart wrote:
> The existing code does an init/free for each piece of information
> needed. We can instead initialize the NHLT table in the .probe() and
> free it in the .remove() callback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: simplify NHLT handling
      commit: 95fa7a62e164630981c5f10d36c2967004f74237

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E033A5124F7
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B1786E;
	Thu, 28 Apr 2022 00:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B1786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097084;
	bh=/lugswJVpCCxpphq51w3K6uIRXKSPS9OZJmF8lZ7jNI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRjaVpxVCLw0ORZQQasKk1AVEx/keWCidukVoeCxSJ3tZijGNrn+kMyihwa1kNApA
	 ZX+fL7Us30b9EM8YFWwoABO11bDf4m6H3hM+Pt0MR/FJGZj3AwS8qWb04RAjAfIdft
	 Pq4hjkHk085Nn99pOfDTSakLIdBgECAWZ8Y30qhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4170F8050F;
	Thu, 28 Apr 2022 00:02:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B54CBF804D8; Thu, 28 Apr 2022 00:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19818F80152
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19818F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZwlrxyGU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 517C561E0D;
 Wed, 27 Apr 2022 22:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C1CC385A9;
 Wed, 27 Apr 2022 22:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096957;
 bh=/lugswJVpCCxpphq51w3K6uIRXKSPS9OZJmF8lZ7jNI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZwlrxyGUeFT277VneVg0depOUbQb445DTPXef1BiVFGzmM2xvBfQTE+e3FsV7bxnT
 1MM6aSgh6KPE4Su2B9UcfEm8QSuYHINVHFRjKEXN9Xm0zNAxYNo3ewSFK1QXZTnUdG
 ISNUmgbeidX5qCH/sIv/He7LzE0w8J7Q65jjA21TeVxklVwYBiWd5xD7siPf04S/9/
 rDRWNmeDndNYjXSZWgf8BBJUqYU6vSsuI6gjCdPP3r5hRzUa4pK7BRjzOw9IDO5QD5
 exQUoUHpZr8DFR+x7GSQ8n6y+csaiLKGh2b/1l2R9J7/Je3gjtk4xQF89+g4vJkqz3
 PFCVrIeVKCRzg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426183807.102442-1-pierre-louis.bossart@linux.intel.com>
References: <20220426183807.102442-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: atom: use pm_runtime_resume_and_get()
Message-Id: <165109695621.498174.11519151335327892141.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On Tue, 26 Apr 2022 13:38:07 -0500, Pierre-Louis Bossart wrote:
> Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
> pm_runtime_put_sync() pattern.
> 
> No functional changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: atom: use pm_runtime_resume_and_get()
      commit: d879e9444634e3ef7cc5646fca0892c4f1483a8d

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

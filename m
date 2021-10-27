Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BCA43CFC2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFE016D0;
	Wed, 27 Oct 2021 19:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFE016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355964;
	bh=Pq3SfGHDpc88FKh0R+K0PoZh6QwgzrTWqovNNpy6rmo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlPnfMzbnhI/bKL9eBhMPEhYDp3FaDyZg7bEJ7DD6B+KFfJUwM31VRPECd/LNR3Xf
	 SFHvcnFxQqqCfFNJIia22kxC2itF89NIcH/86PzVwa1BNCEM8tfkwigfVvy2pStNiN
	 8K6lo1MQ5n0MDaaG2ITEx4aoFU4oYULWVF6H9wEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B986F804FD;
	Wed, 27 Oct 2021 19:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE6DF8025A; Wed, 27 Oct 2021 19:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F24F8025A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F24F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ful2KLto"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D30E60E74;
 Wed, 27 Oct 2021 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355760;
 bh=Pq3SfGHDpc88FKh0R+K0PoZh6QwgzrTWqovNNpy6rmo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ful2KLto8dvC5tLEQXCOItXdinLKEkfq37sxy5tO3i51GxZHX5GEXygnE0mavqkVj
 CXeTOWmrQqAsFkSjO7qJKHVfaxAhBW2UG+bQ7TjvZsV3IhzJN82znaT9V9ckqN4mef
 RgJhOSWcdhT7uJgPuu285EDqUMbugFGpIUn3uJNuASvGp27eroU/gKb43l8VhQ5NG8
 5y4Euc56qtbqVkKdUDNeF/3gvId0ZlvvpGG8rNvljHVoicNX5PmmbL/enw58NgRcds
 1iZyTC+PAXBzlawhblwDP5zlPt/jlazvZjGTKtjboeVOmBlirtBEDNu/VT5LMrxLqn
 aD9L7g4AjUXiw==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20211027025142.25898-1-CTLIN0@nuvoton.com>
References: <20211027025142.25898-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 0/3] Make genaral and simple for new sof machine driver
Message-Id: <163535575832.4012075.5610998531157694851.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On Wed, 27 Oct 2021 10:51:40 +0800, David Lin wrote:
> The series of features will make general and simple for new sof machine driver.
> 
> David Lin (3):
>   ASoC: nau8825: add set_jack coponment support
>   ASoC: nau8825: add disable jack detection support
>   ASoC: nau8825: add clock management for power saving
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: nau8825: add set_jack coponment support
      commit: c6167e10e76fb97d37613004046e66027b3a569b
[2/3] ASoC: nau8825: add disable jack detection support
      (no commit info)
[3/3] ASoC: nau8825: add clock management for power saving
      commit: 6133148ca08a097ed8c57d7f5a7826723273049b

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

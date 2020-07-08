Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A078C218DDF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030AC1697;
	Wed,  8 Jul 2020 19:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030AC1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227938;
	bh=WnhCZojewPXcv0n/TF3e1xmOynWedsPS6pPm82CttRE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uuwVa3BCKPIUjwBGSxz6mAvA3DQOVEFK5CNj5DvQbLtrbxFurMNgVarGpmhIrduEd
	 zyDzUm5x/jpjrKLgaf6Nkg9JnmUbEtUkZ4yUpTJRX7V01X6cG+PoiOkx4LjQ4bMfX0
	 GRRE0waWLc6lL4jFdngLK/7HdInMtWvwijtwJdL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 086CDF80304;
	Wed,  8 Jul 2020 19:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3309CF80303; Wed,  8 Jul 2020 19:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BF15F802FB
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BF15F802FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QEA/Dt9v"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F65E206F6;
 Wed,  8 Jul 2020 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594227635;
 bh=WnhCZojewPXcv0n/TF3e1xmOynWedsPS6pPm82CttRE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QEA/Dt9v66OvDEiw6aCk1h7ffkzZKT14hMmC3MEoWl0mslZPF9v8sdeX3fTPNhOJK
 0P7YmGnSzR6nrdNCgGAiHrGKQWh+VRqPB+6eVwFk+DcEQghVXm3hk6RJc9bqqwidD4
 KlE6kJdXCt1mFrffP8vGx6UNe0Msgz0PG+P33jsQ=
Date: Wed, 08 Jul 2020 18:00:30 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200707202628.113142-1-pierre-louis.bossart@linux.intel.com>
References: <20200707202628.113142-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] regmap: add missing dependency on SoundWire
Message-Id: <159422762554.28767.13186222307552952374.b4-ty@kernel.org>
Cc: tiwai@suse.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:REGISTER MAP ABSTRACTION" <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Tue, 7 Jul 2020 15:26:28 -0500, Pierre-Louis Bossart wrote:
> CONFIG_REGMAP is not selected when no other serial bus is supported.
> It's largely academic since CONFIG_I2C is usually selected e.g. by
> DRM, but still this can break randconfig so let's be explicit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: add missing dependency on SoundWire
      commit: 443a34ba68e8a627c15f9987b11cfa01f3e1ba0a

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

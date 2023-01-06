Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AE660549
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 18:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A09A14861;
	Fri,  6 Jan 2023 18:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A09A14861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673024780;
	bh=yzUgOX03REvnqdWszk7eSyOU7gDnqqziGYE0sY8A/R0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D1/r1V47wCobahdJ+GUa9n7sY5/4o1hqukY00NsLtsy+hcxTOOkUIaz6JYDNOns2U
	 s8jZEXrKje/l3PR3OM7KHYMoCaOdSqvB5M9lQKYBItdmXo+uUoFW7/MITOGUPNTsje
	 N/By7d1cqL0S5NmgJZWCejlRnBKnydZjgEH8QSfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C82F7F8032D;
	Fri,  6 Jan 2023 18:04:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6683F8025A; Fri,  6 Jan 2023 18:04:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 301ABF8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 18:04:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 301ABF8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HjHzhgaw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53C1BB81D5B;
 Fri,  6 Jan 2023 17:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26358C433F1;
 Fri,  6 Jan 2023 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673024691;
 bh=yzUgOX03REvnqdWszk7eSyOU7gDnqqziGYE0sY8A/R0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HjHzhgaw1XooiPR5KvpTtcJGy4ufiqh/xYMReh5Qb4WXyFSPRBNkgA7iBAWRrJ+Xx
 2upZw+vnbP7NTdDqrsUybXj1AtlTaZAIJPuFweRoYYOAhABXYBo0uipqml5tt8sK0G
 TVMWPOHjRPMVpZZUL9ppIJ+53UR9XhMJsJZfzGFdx7+MR92xzrQYYnp6x3ECNFuEkw
 kUJgU5RG1s0sH86ENqLJZ07MenIbXt3bZe6ftnXDMTy9j9UrT2lxhcEEqSDSAM/IxA
 jUC6KsyvPIwik4C8NzKX5Vav64JFUaEsAMXYCwqmwJse8F7Zm1/sJpN9H99p4MwgfN
 62oIoq7PKR9RQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230104145708.25051-1-pierre-louis.bossart@linux.intel.com>
References: <20230104145708.25051-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: amd: ps: use static function
Message-Id: <167302468987.215080.18138342775610314637.b4-ty@kernel.org>
Date: Fri, 06 Jan 2023 17:04:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-214b3
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 04 Jan 2023 08:57:08 -0600, Pierre-Louis Bossart wrote:
> Sparse warning:
> 
> error: symbol 'acp63_fill_platform_dev_info' was not declared. Should
> it be static?
> 
> Also reduce line lines below 100 characters.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: use static function
      commit: b118458936785bd104e95f09abd52525c0a84616

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

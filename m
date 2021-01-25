Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B89302637
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 15:20:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B741854;
	Mon, 25 Jan 2021 15:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B741854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611584440;
	bh=xLBycEasdGGeULBGkQh0Rit5QIdl3CS1v02e1Ehui+M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ea9Y0py1JlH0asmb0jpRWHpUP+e72uwNL9otV4KyY2r/iNhVBNSGjMbpzbxMl3Cl2
	 qZvrMGvWbB5GID+5GdD/rBnolEUBZyqXsc9gAoYDdfcJBKHgmUN48WvtuJePTilJzt
	 Ok4pF0y9Se5/JEXy6d869jcwArNlzZSSwuaybWG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 777C0F804C2;
	Mon, 25 Jan 2021 15:18:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E6E1F804B1; Mon, 25 Jan 2021 15:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C071CF8027B
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 15:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C071CF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UjWcm/lW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 995DB2145D;
 Mon, 25 Jan 2021 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611584294;
 bh=xLBycEasdGGeULBGkQh0Rit5QIdl3CS1v02e1Ehui+M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UjWcm/lW8nR2vkJSq6rXwyOJ0ESe8BCGXpBx9b9MTmjlpmL2Yvd1yywU/p3LrL+Yb
 Oi4N2rJQR4qY2t5aVP4NKZ8Tu9Ulko8ekV0yWcA3uAzmWbmOxVSG509QN8g0+fYr5s
 QCY4zWtgkZlum5ycoUqyI8JuVjd/qffYOR1x/hTWeIUJTr5I6APIzDiOTIv9/CzNHy
 qmN/Q01JkIPtGUDGoxYDerkAmARs65AtiRpOJzdUw4sGWlEDrtmv0UYxVyjjzw2NWE
 Xnse/fouQuQtLMXSgCKbf1coz1laFSUX+kHMayxxjrcx8kEsKyHq5jS7zSl3PqEEQm
 67/2H0JCQHhMw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
References: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: partial fix to Kconfig issues
Message-Id: <161158424213.32959.2931023496403408589.b4-ty@kernel.org>
Date: Mon, 25 Jan 2021 14:17:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Arnd Bergmann <arnd@kernel.org>, vkoul@kernel.org
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

On Thu, 21 Jan 2021 18:57:23 -0600, Pierre-Louis Bossart wrote:
> We've had several reports of broken dependencies. The 'right' fix is
> to revisit the module dependencies as suggested by Arnd Bergmann. This
> is WIP at https://github.com/thesofproject/linux/pull/2683. Since this
> is taking longer than expected, I am only sharing quick fixes for now.
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: Intel: soundwire: fix select/depend unmet dependencies
>   ASoC: SOF: SND_INTEL_DSP_CONFIG dependency
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: soundwire: fix select/depend unmet dependencies
      commit: bd9038faa9d7f162b47e1577e35ec5eac39f9d90
[2/2] ASoC: SOF: SND_INTEL_DSP_CONFIG dependency
      commit: 8a3fea95fab14dd19487d1e499eee3b3d1050d70

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A012F35F4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 17:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF47171D;
	Tue, 12 Jan 2021 17:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF47171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610469854;
	bh=JG9NA4gmk2OF3yBQase9YP3CleqRpkDToO+QG9Kq4b4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCxMRD0Lke05lcUkxpybCTKa2Vv9iZqpDRXyp/XYESunnGvGIJZJkHn4qxq0UnKk9
	 SsKKAokSEZt3EviIcfmZnDlPNghfOXFi0+btU9Ne1p497S2Iuko8yQUbJ6vPKbES2B
	 kFKgGgPugU984L4IQzEwnpIvKIp64+amb+aefms0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51312F80249;
	Tue, 12 Jan 2021 17:42:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 741CAF804AA; Tue, 12 Jan 2021 17:42:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E880EF80279
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 17:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E880EF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NrdLRsa4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C08B223109;
 Tue, 12 Jan 2021 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610469760;
 bh=JG9NA4gmk2OF3yBQase9YP3CleqRpkDToO+QG9Kq4b4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NrdLRsa4PeIBCMtfpbxC0agkw1+FUEWniicuj3+wyQ72WoqJPfl2o1kMjENKWdK5N
 VhoV5Ms3s2Iyg+pTIc1Uq/AIXPvv7TsM9xDdWu9aObTQN0umiPvDiQ7CO3BH+wbpL2
 kNl6TWIK/m3ywDQ3TSB7mO5yFoQESNV6GVq4DNxwYfe7/A3NX8Isr7CS5o7h/jJSOS
 psh3gMpBHKeLuSxul7+pWRYj9RowAB0v4o6drPdYj6KA2N1GW+V9Al77gLR0MA5ZjK
 dbpPWzDCQCtX2B/+pN/ntZYwW4KZD+F5awHeZ7aeAFacbrV6bqlzq9W30DIJiZY4di
 UuFXWuVsVNtIQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20210109210119.159032-1-hdegoede@redhat.com>
References: <20210109210119.159032-1-hdegoede@redhat.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: bytcr_rt5640: Add support for devices
 with only a headphone jack (no speakers/mic)
Message-Id: <161046972101.805.10335037097575192780.b4-ty@kernel.org>
Date: Tue, 12 Jan 2021 16:42:01 +0000
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

On Sat, 9 Jan 2021 22:01:16 +0100, Hans de Goede wrote:
> This series adds support for devices with only a headphone jack
> (no speakers/internal mic). Specifically this adds support for the
> Mele PCG03 Mini PC. But the new no-speakers and no-internal-mic quirks
> will likely be useful on other devices too.
> 
> Regards,
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: bytcr_rt5640: Add new BYT_RT5640_NO_SPEAKERS quirk-flag
      commit: 1851ccf9e155b2a6f6cca1a7bd49325f5efbd5d2
[2/3] ASoC: Intel: bytcr_rt5640: Add new BYT_RT5640_NO_INTERNAL_MIC_MAP input-mapping
      commit: 46466ab68e752d054b4b7aece1bfadc9f9bbf272
[3/3] ASoC: Intel: bytcr_rt5640: Add quirk for the Mele PCG03 Mini PC
      commit: df33032146baefb29d7e61193738f39e454917e3

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

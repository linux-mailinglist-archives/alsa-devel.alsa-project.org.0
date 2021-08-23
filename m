Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB043F4FB1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 19:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFCBD15E5;
	Mon, 23 Aug 2021 19:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFCBD15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629740421;
	bh=41LhauVFS3gX1mVth1JG8WWP9JTXtHsPOz47tPzOlzs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvF2ZhSnSBYzFupEJlAAn8NuwortGLz5L2HEtP2i05E0YGipamUx28wLGEd8/rJ2l
	 Xnj+6qZDu4eRpuWe+yPt3ayXnkmDwk2hLqRd8vgajmDe/tq6njx2R4zzKvAUzlJW0b
	 jkywekhf5nWucSvEyldf/ZDw5C8pFMMoY+mlst9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA9D0F800B6;
	Mon, 23 Aug 2021 19:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC7FF8020D; Mon, 23 Aug 2021 19:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 782F9F8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 19:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 782F9F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SRGH2aJU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8121F6136F;
 Mon, 23 Aug 2021 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629740313;
 bh=41LhauVFS3gX1mVth1JG8WWP9JTXtHsPOz47tPzOlzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SRGH2aJUdxcQgXNgpVb7QI0xzVeATO9YXy0jiUFjwiaVgICiIJFjqdlVwKz88pK4+
 9BgZzqIsPrz0M94w0R58QG+6yNQKx4wjvr+ueYbFWOD3dMbLl5iWfa/idxlkMGhW9w
 0dnroszVReo2hoa9mBrkWEQ3gur/QHCYQKWTbgryyTJwTWgqP73ZzOHeDXbffQOJxF
 2oW/mPmwzS3fPk55JZuVSUcJnQTeDQBRMXql58UnVAOUQH8HWLCTPoCGZX3ujlZxVf
 SwvIWzNyCseQwit2d+n+H4c2vl7n+HZmB7yGs2fDjj8wkvdBsR9P3WP9u12WM4dNvp
 Sh79JlY+GNvLw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/11] ASoC: Intel: Skylake: Fix and support complex
Date: Mon, 23 Aug 2021 18:37:54 +0100
Message-Id: <162973996480.3102.1275041848227650771.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jairaj.arava@intel.com, upstream@semihalf.com, cujomalainey@google.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 Mark Brown <broonie@kernel.org>, jenny.tc@intel.com, lma@semihalf.com,
 harshapriya.n@intel.com, vamshi.krishna.gopal@intel.com
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

On Wed, 18 Aug 2021 09:57:31 +0200, Cezary Rojewski wrote:
> Existing skylake-driver supports very basic scenarios with limited range
> of modules and their control. Attached changes first fix code as several
> advanced configurations are 'mentioned' throughout the files but are not
> actually functional. Follow up are changes adding missing support for
> said configurations.
> 
> Cezary Rojewski (5):
>   ASoC: Intel: kbl_da7219_max98927: Fix format selection for max98373
>   ASoC: Intel: Skylake: Leave data as is when invoking TLV IPCs
>   ASoC: Intel: Skylake: Fix module resource and format selection
>   ASoC: Intel: Skylake: Fix module configuration for KPB and MIXER
>   ASoC: Intel: Skylake: Select first entry for singular pipe config
>     arrays
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: Intel: kbl_da7219_max98927: Fix format selection for max98373
        commit: 6d41bbf2fd3615c56dbf2b67f6cbf9e83d14a2e2
[02/11] ASoC: Intel: Skylake: Leave data as is when invoking TLV IPCs
        commit: 126b3422adc80f29d2129db7f61e0113a8a526c6
[03/11] ASoC: Intel: Skylake: Select proper format for NHLT blob
        commit: 87b265260046d4e0ed3f150dac2184b9dbd4bf7c
[04/11] ASoC: Intel: Skylake: Fix module resource and format selection
        commit: e8b374b649afe756c2470e0e6668022e90bf8518
[05/11] ASoC: Intel: Skylake: Fix module configuration for KPB and MIXER
        commit: e4e0633bcadc950b4b4af06c7f1bb7f7e3e86321
[06/11] ASoC: Intel: Skylake: Fix passing loadable flag for module
        commit: c5ed9c547cba1dc1238c6e8a0c290fd62ee6e127
[07/11] ASoC: Intel: Skylake: Simplify m_state for loadable modules
        commit: e4e95d8291831fa63c32e00b59f544f0812dc0b6
[08/11] ASoC: Intel: Skylake: Support multiple format configs
        commit: a4ad42d28618eef83bee02e0a19af0d467bd9722
[09/11] ASoC: Intel: Skylake: Support modules with generic extension
        commit: db5a3f83a241a98d855e2cecc67869d06cb3e135
[10/11] ASoC: Intel: Skylake: Properly configure modules with generic extension
        commit: 5b27a71cbbfe6ffb554c87fde2ad9b71841478c2
[11/11] ASoC: Intel: Skylake: Select first entry for singular pipe config arrays
        commit: b947d2b467c0ea275ac3b468974ebe0dd0c0c3bd

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9710281D3A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 22:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B8A1941;
	Fri,  2 Oct 2020 22:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B8A1941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601672329;
	bh=t/Ztw0J+ZodvHR6457eNwTKeCbDEpJfGWwp4PpH+pZI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AV1VxShZlTEQn1e2Z4yHRtWm/HyJjtCFK2BZjb+bx+WeTWV5pRY8Egtv2uf22rj9C
	 HYZUTMh0yNfvAWPEFf1XGvOyyEfg52I7lj8MiDpiTcMh+e1q6YI9/b3x78S48Pj/9Q
	 FKt0CnoDsThPn0nfzyz3qxa5Hjij9dDGMBkUAQXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6615FF80292;
	Fri,  2 Oct 2020 22:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1439F80292; Fri,  2 Oct 2020 22:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4C82F801ED
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 22:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C82F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y+0stMHm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FA8A20754;
 Fri,  2 Oct 2020 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601672179;
 bh=t/Ztw0J+ZodvHR6457eNwTKeCbDEpJfGWwp4PpH+pZI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=y+0stMHmQ6xuhQ7LQ0Rr1YYo5iGQTY9utev3m2CcFwC/dpEbCv82gOSyWk9WNV+2E
 IwRKuYQboVHbXGwGtoVYn8KFBvvXQHP2wRcAdLh1rxyIfz5kKR7ACcGm6U0NsjWYop
 Laa2K7MUnG7MtWC3kG0Q4y41XZr8E5M+NLC8EK34=
Date: Fri, 02 Oct 2020 21:55:20 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20200929141247.8058-1-cezary.rojewski@intel.com>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v10 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
Message-Id: <160167211499.21762.8626894140454976813.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.com, krzysztof.hejmowski@intel.com, harshapriya.n@intel.com,
 filip.kaczmarski@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, filip.proborszcz@intel.com,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, andriy.shevchenko@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Tue, 29 Sep 2020 16:12:33 +0200, Cezary Rojewski wrote:
> Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
> solution deprecates existing sound/soc/intel/haswell which is removed in
> the following series.
> 
> Due to high range of errors and desynchronization from recommendations
> set by Windows solution, re-write came as a lower-cost solution compared
> to refactoring /haswell/ with several series of patches.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: Intel: Add catpt base members
        commit: 4fac9b31d0b9d3b3e9dd1408f457139f94077bc5
[02/14] ASoC: Intel: catpt: Implement IPC protocol
        commit: 92946c1d7ea8c5e19a4d7b4bd8896f04dc09c655
[03/14] ASoC: Intel: catpt: Add IPC message handlers
        commit: 64b9b1b005743a7bb4443442347024fca56433ee
[04/14] ASoC: Intel: catpt: Define DSP operations
        commit: ba202a7bc3da05ca4548c7247f9be769b4e8c9fa
[05/14] ASoC: Intel: catpt: Firmware loading and context restore
        commit: a9aa6fb3eb6c7e0e7e117b3f2dfafef8c45b9ea6
[06/14] ASoC: Intel: catpt: PCM operations
        commit: a126750fc86546bf86c7536923a77cfecc15e5e3
[07/14] ASoC: Intel: catpt: Device driver lifecycle
        commit: 7a10b66a5df965ea4074aae265068b3483fa9fc6
[08/14] ASoC: Intel: catpt: Event tracing
        commit: 8ba1edb9c245e63c6750c4c77bfdba1230442d4d
[09/14] ASoC: Intel: catpt: Simple sysfs attributes
        commit: 8f80a834b909784c6e1ff7fcc819b1f8bd1651be
[10/14] ASoC: Intel: haswell: Remove haswell-solution specific code
        commit: 0ce1610578bcb3b4a6824eb12f1a02cfc34a21e0
[11/14] ASoC: Intel: broadwell: Remove haswell-solution specific code
        commit: e81a707a3935493ed04b62775943ae41ae254289
[12/14] ASoC: Intel: bdw-5650: Remove haswell-solution specific code
        commit: 02f2442fb32a1f8bde7774bd58e1dbeabe7970bc
[13/14] ASoC: Intel: bdw-5677: Remove haswell-solution specific code
        commit: 053743f0c49074e710401ce39dd6f7d767094f77
[14/14] ASoC: Intel: Select catpt and deprecate haswell
        commit: 6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1

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

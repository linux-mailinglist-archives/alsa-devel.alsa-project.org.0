Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277E284ED7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 17:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C502C1737;
	Tue,  6 Oct 2020 17:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C502C1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601997784;
	bh=NwFwjLXKZ+sORKSd26tHgs3LHpxnvB8CIoyhvuMpDlw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOw1jMQCVGyws8ZxIoMIciDhWmZ8LeJFZmOhxSLjcgo7GAAr5ZI+/fvWhhjZClAye
	 ZI61U/PyqMdvIMxvJIUIqJtF2GbDyFcpcNNXeoe1KD52dBNLrYlJ242vdXMsh4/R+X
	 cRdisQYVsJZVLL3zlLf6x9IS7je8epMSV5uc1Oxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E91FF8012B;
	Tue,  6 Oct 2020 17:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F8CDF8015B; Tue,  6 Oct 2020 17:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DBFEF80129
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 17:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DBFEF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rp55/t+N"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F158F206D4;
 Tue,  6 Oct 2020 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601997710;
 bh=NwFwjLXKZ+sORKSd26tHgs3LHpxnvB8CIoyhvuMpDlw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rp55/t+NnF2mDwJVq7D/vBRyBk+TCRCji9yMfpVGKcWkOZfXI78caMYHEatkOCGtY
 zrVDbioN1r8ffkmcwKMEmzXIysdNIo2Po9hqAQduZSDLP7k9MzKYgYx3xe82VUnwQO
 5nHlH+rDby6n5eHdTkaq3rfgf/e9c6+kFz+M1Se8=
Date: Tue, 06 Oct 2020 16:20:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201006064907.16277-1-cezary.rojewski@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Message-Id: <160199764658.51353.18358531158611769260.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, krzysztof.hejmowski@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 filip.proborszcz@intel.com, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 andriy.shevchenko@linux.intel.com, ppapierkowski@habana.ai,
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

On Tue, 6 Oct 2020 08:48:54 +0200, Cezary Rojewski wrote:
> Follow up to catpt series as mentioned in:
> [PATCH v10 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
> https://www.spinics.net/lists/alsa-devel/msg116440.html
> 
> As catpt is a direct replacement to sound/soc/intel/haswell, it leaves a
> lot of code redudant. The second legacy solution - baytrail - is
> deprecated for a long time by sound/soc/intel/atom with SOF flavor
> available too.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: Intel: Remove haswell solution
        commit: ca756120d4bcf28dfde5e3df8882153303d4010f
[02/13] ASoC: Intel: Remove max98090 support for baytrail solution
        commit: 5f3941b63c25d8123ebe4406a714c603525b1b90
[03/13] ASoC: Intel: Remove rt5640 support for baytrail solution
        commit: 3056cb0082feccee9a0012440ee5e4ca6a6e80ac
[04/13] ASoC: Intel: Remove baytrail solution
        commit: 07833cd0569bb73cc9f82814cdab921abb3dfb4a
[05/13] ASoC: Intel: Remove SST ACPI component
        commit: 05668be1b3644f9bd25b22f62e79ad7a5adbd3e2
[06/13] ASoC: Intel: Remove SST firmware components
        commit: fb94b7b11c6a20b786c6a8aec3d701ced8854419
[07/13] ASoC: Intel: Skylake: Unassign ram_read and read_write ops
        commit: a4bebce26d560a4a1dff557ad7822bab90dd1c3f
[08/13] ASoC: Intel: Remove unused DSP operations
        commit: 37465972015cf7aeb586a9245da2a87d3b531959
[09/13] ASoC: Intel: Remove unused DSP interface fields
        commit: b4e60807182a243d9dfe985e9e13d295f5868f81
[10/13] ASoC: Intel: Remove SST-legacy specific constants
        commit: 7d07f9c1ba0e670d1a967f16eda53e5c87411753
[11/13] ASoC: Intel: Make atom components independent of sst-dsp
        commit: b972153d6c53a89dc92d991c466a6b4800a9c91f
[12/13] ASoC: Intel: Remove sst_pdata structure
        commit: 720811f0e4ac5a31d38aaee20905692dd7150997
[13/13] ASoC: Intel: Remove sst_dsp_get_thread_context
        commit: eb062e47f7c8cc28f19ba8f897481c22d13db1ec

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

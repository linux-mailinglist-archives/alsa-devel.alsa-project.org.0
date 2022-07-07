Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B956A48C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 15:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32AFCE0F;
	Thu,  7 Jul 2022 15:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32AFCE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657202112;
	bh=YxMzjokADQrbKoPDO+0wT5Rr7rSlh3WfSRj6cxknfTQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXGZp21V/PB5j1VcJYM8gBSldfa0uYmzxqU6LqDGB2wi37A7OCnpau4r+M4hNfoUi
	 C2+VCWy4FRSJTphqQ50oMUBIlojb5Hwcg/pcAvPAtgV1iRmbNC9JmAhdgJ2HQkB/MO
	 h7Dpd4nTJj/dZFFo2SDeQPezfD2IMF5Zz7iPnoe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEAF0F800DF;
	Thu,  7 Jul 2022 15:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FF8CF8016A; Thu,  7 Jul 2022 15:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4989F800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 15:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4989F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sanBS9M6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21506B82177;
 Thu,  7 Jul 2022 13:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B52EC3411E;
 Thu,  7 Jul 2022 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657202044;
 bh=YxMzjokADQrbKoPDO+0wT5Rr7rSlh3WfSRj6cxknfTQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sanBS9M6YlcLU7O/8cdfdB0fjs8mOK7nmYA/qprrlS3oPFF80teijQX5KL1DBd3m6
 yNpAEgmKilip5p6fSWvHpIx3hzNpKeLTdplocbFQtjuEqJQFSKS6xDlUHgYv7s8iAT
 1NLNrPFk4jwfb/8IIuTyzEpaQMPAgKZhbVghtMpZ+t/acsildYrFgMy25ReVcJt1VY
 ClVGcGVb9JXHalfk8/1vAMJ6Q1lq5ePiLmKPkuRFP/AuiMpR66iAwkhk0lfcIUj58y
 ZXmzpNwwt9uculMT8mWc0bmTUw5Q8WhrTFBXEwqkoBL+8vyF9lhKoSpPUIVgRSxjzM
 6xUlMbb4kzK3w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com
In-Reply-To: <20220706205515.2485601-1-Vijendar.Mukunda@amd.com>
References: <20220706205515.2485601-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: fix ACPI dependency compile errors and warnings
Message-Id: <165720204134.3916612.9568740345035740462.b4-ty@kernel.org>
Date: Thu, 07 Jul 2022 14:54:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, lkp@intel.com, AjitKumar.Pandey@amd.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Basavaraj.Hiregoudar@amd.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 julianbraha@gmail.com, daniel.baluta@nxp.com, tanureal@opensource.cirrus.com
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

On Thu, 7 Jul 2022 02:25:14 +0530, Vijendar Mukunda wrote:
> Fixed ACPI dependency complie errors and warnings as listed below.
> 
> All warnings (new ones prefixed by >>):
> 
> sound/soc/soc-acpi.c:34:1: error: redefinition of 'snd_soc_acpi_find_machine'
>   34 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>      | ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/soc-acpi.c:9:
> include/sound/soc-acpi.h:38:1: note: previous definition of
> 'snd_soc_acpi_find_machine'
> with type 'struct snd_soc_acpi_mach *(struct snd_soc_acpi_mach *)'
> 38 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>    | ^~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/soc-acpi.c: In function 'snd_soc_acpi_find_package':
> sound/soc/soc-acpi.c:58:36: error: implicit declaration of function
> 'acpi_fetch_acpi_dev';
> did you mean 'device_match_acpi_dev'?
> [-Werror=implicit-function-declaration]
> 58 | struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
>    |                            ^~~~~~~~~~~~~~~~~~~
>    |                            device_match_acpi_dev
> >> sound/soc/soc-acpi.c:58:36: warning: initialization of
>    'struct acpi_device *' from 'int' makes pointer from integer
>    without a cast [-Wint-conversion]
> sound/soc/soc-acpi.c:64:25: error: invalid use of undefined type
> 'struct acpi_device'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix ACPI dependency compile errors and warnings
      commit: ab34403db24233e603338b70deb9a84093c88397

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

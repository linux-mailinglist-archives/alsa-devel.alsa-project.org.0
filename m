Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEC5A6057
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 12:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8BE169C;
	Tue, 30 Aug 2022 12:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8BE169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661854240;
	bh=fKG1MQyFy/CBRY5IwsgZn8zxL+GpKi0UiL9409hS164=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPeRpf0vxhS1PD/OlrgsjsSXz0ruhqedOzaQgzBU7N7OjFhfO+r/QGhCka7Z0+yaw
	 4xSG7E6lYnYblW1pv5ieiP1CceFuANIF6B3a3vAkXvOvf5fEACrmXwHSFqz24f/5hu
	 hkliLauntmoxAxx6POO+9CKqZTb7RSPbg1hmaUKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A3AF8012A;
	Tue, 30 Aug 2022 12:09:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC8EF800AA; Tue, 30 Aug 2022 12:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80115F8016B
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 12:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80115F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Oy599ehG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E2DF61456;
 Tue, 30 Aug 2022 10:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0019C433C1;
 Tue, 30 Aug 2022 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661854141;
 bh=fKG1MQyFy/CBRY5IwsgZn8zxL+GpKi0UiL9409hS164=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Oy599ehGhPgRJWC2PkqoxNVsb8p5EzhliJ8Xak3WwtR4mkdno6LqkXYRDPvB6ASnq
 KngHLSiYvPzKJDMvS9tYipdqXFXyfnHUVC3x/eE7CcT58HH5QEQO0cSubv1OJKSfec
 WqpMGqi+hZSaE2otYN87v1psYqz8Xi0qy7oT9jCA8yfTibkcpM/WghNAZTyFHybh0r
 5pADQeNXZUi05QfLAJr6Z7+NZfRgCSP5h++crp1T3ZcbUYnxByvKIKlCSF6ibNCLFy
 qouWmXwMZEQH+DHO7Ft3Y3NO/Q9ZBaPnPpPxMfkv93ZWO3idgrJ6kMHE02kFtEGT0S
 j1VySYZJbo/TA==
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
References: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH v2 00/13] Add Pink Sardine platform ASoC driver
Message-Id: <166185413954.1099664.14581442421276925266.b4-ty@kernel.org>
Date: Tue, 30 Aug 2022 11:08:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
Cc: alexander.deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com
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

On Sat, 27 Aug 2022 22:26:44 +0530, Syed Saba Kareem wrote:
> Pink Sardine platform is new APU series based on acp6.2 design.
> This patch set adds an ASoC driver for the ACP (Audio CoProcessor) block
> on AMD Pink Sardine APU with DMIC endpoint support.
> 
> changes since v1:
>         -Removed subraction logic in acp62.h header file and changed
> 	the address in acp62_chip_offset_byte.h file.
>         -Fixed indentation in pci driver file.
>         -Removed comments which states function names in pci driver file.
>         -Replaced some hex values with decimals in pci driver file.
>         -Corrected MODULE_DESCRIPTION in pdm driver file.
>         -Removed structure variable which is used for byte count in header
> 	file and added new local variable for denoting the byte count.
>         -Added Kfree for freeing the runtime->private data.
>         -Replaced X86 && PCI with X86 && PCI && ACPI in Kconfig file.
> Syed Saba Kareem (13):
>   ASoC: amd: add Pink Sardine platform ACP IP register header
>   ASoC: amd: add Pink Sardine ACP PCI driver
>   ASoC: amd: add acp6.2 init/de-init functions
>   ASoC: amd: add platform devices for acp6.2 pdm driver and dmic driver
>   ASoC: amd: add acp6.2 pdm platform driver
>   ASoC: amd: add acp6.2 irq handler
>   ASoC: amd: add acp6.2 pdm driver dma ops
>   ASoC: amd: add acp6.2 pci driver pm ops
>   ASoC: amd: add acp6.2 pdm driver pm ops
>   ASoC: amd: enable Pink Sardine acp6.2 drivers build
>   ASoC: amd: create platform device for acp6.2 machine driver
>   ASoC: amd: add Pink Sardine machine driver using dmic
>   ASoC: amd: enable Pink sardine platform machine driver build.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/13] ASoC: amd: add Pink Sardine platform ACP IP register header
        commit: 161bff51181f919a4b80fe2ab3504d60ac4b4316
[02/13] ASoC: amd: add Pink Sardine ACP PCI driver
        commit: 95e43a170bb1e91a7972610d33a26ea4841e2cdd
[03/13] ASoC: amd: add acp6.2 init/de-init functions
        commit: 9766bb62cf315ccbfc6203372074dffe69389356
[04/13] ASoC: amd: add platform devices for acp6.2 pdm driver and dmic driver
        commit: 515ee2574aa4d6bf05dce194e342bd2712ea4bd4
[05/13] ASoC: amd: add acp6.2 pdm platform driver
        commit: 33cea6bbe48896bcaa03f030f5b52e05de68bccd
[06/13] ASoC: amd: add acp6.2 irq handler
        commit: 5bbeca60a57bb9a35cc98c064bbb575738d5be0d
[07/13] ASoC: amd: add acp6.2 pdm driver dma ops
        commit: 5137305662ef5cad12ff472ca4c8c3b266fd46c5
[08/13] ASoC: amd: add acp6.2 pci driver pm ops
        commit: 3a543d56e3d3c9bb67ffe3ff9ad7ddf77e448019
[09/13] ASoC: amd: add acp6.2 pdm driver pm ops
        commit: 28023a78790c33f5df0147fd00ab3cf333edd24f
[10/13] ASoC: amd: enable Pink Sardine acp6.2 drivers build
        commit: 1e4366489e2c059cb00e453737e802d74fd9b1d1
[11/13] ASoC: amd: create platform device for acp6.2 machine driver
        commit: 76dd567591c89f92dea97b581988538312ae584f
[12/13] ASoC: amd: add Pink Sardine machine driver using dmic
        commit: 0c8327c07b2ecc4a4443b1dae407f0d4854b5ae1
[13/13] ASoC: amd: enable Pink sardine platform machine driver build.
        commit: 2a09cef652d9c1e76229a4381e928560bec3d878

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

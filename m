Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6BE1AB457
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 01:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA73C850;
	Thu, 16 Apr 2020 01:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA73C850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586993950;
	bh=rRI3rxKpvbRtXPlOKo6GuwcLpUCni35YI26WKnWChYk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaFa8z9b+izvqMvSTxAdeI9HAsARpbBU8Hhb9e2QVnZwPyQJyOLynsY8XMDLFuJvw
	 LcFsmvkDcWGPD9PGLERirtKTxpMVC8R8lwaq6fptc6vV4ncMRYfqXDI/TxA1LZokFY
	 N1TTowlou/esYOYVLxhaSn/MwWt3mrCTct/Ow81w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0740EF80290;
	Thu, 16 Apr 2020 01:36:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CEEF80266; Thu, 16 Apr 2020 01:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 638BEF80229
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 01:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 638BEF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eOTJ5qVj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FE5B20787;
 Wed, 15 Apr 2020 23:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586993800;
 bh=rRI3rxKpvbRtXPlOKo6GuwcLpUCni35YI26WKnWChYk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eOTJ5qVjLKT6JJDeaKdDxA94FVyXmpBZWuHMWdk+DopBqwrew42oQvYmk18IF5M53
 TgP5WCxGLTNpYSQMMSnYKsMVp8emp/6UaejLiagMDmBfcW0AW0Avek0V2PmnJdMkRR
 +jd1jdIRjybvl6lC7JGUB37Q0VqRK923QxTIGSzM=
Date: Thu, 16 Apr 2020 00:36:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200415030437.23803-1-pierre-louis.bossart@linux.intel.com>
References: <20200415030437.23803-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC TEST] ASoC: soc-dai: revert all changes to DAI
 startup/shutdown sequence
Message-Id: <158699311027.11249.10119085332942223883.b4-ty@kernel.org>
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Tue, 14 Apr 2020 22:04:37 -0500, Pierre-Louis Bossart wrote:
> On Baytrail/Cherrytrail, the Atom/SST driver fails miserably:
> 
> [    9.741953] intel_sst_acpi 80860F28:00: FW Version 01.0c.00.01
> [    9.832992] intel_sst_acpi 80860F28:00: FW sent error response 0x40034
> [    9.833019] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
> [    9.833028] intel_sst_acpi 80860F28:00: sst_get_stream returned err -5
> [    9.833033] sst-mfld-platform sst-mfld-platform: ASoC: DAI prepare error: -5
> [    9.833037]  Baytrail Audio Port: ASoC: prepare FE Baytrail Audio Port failed
> [    9.853942] intel_sst_acpi 80860F28:00: FW sent error response 0x40034
> [    9.853974] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
> [    9.853984] intel_sst_acpi 80860F28:00: sst_get_stream returned err -5
> [    9.853990] sst-mfld-platform sst-mfld-platform: ASoC: DAI prepare error: -5
> [    9.853994]  Baytrail Audio Port: ASoC: prepare FE Baytrail Audio Port failed
> 
> [...]

Applied, thanks!

[1/1] ASoC: soc-dai: revert all changes to DAI startup/shutdown sequence
      commit: 5bd70440cb0a6f5c6a84019bb2aa93ab8310a5cd

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

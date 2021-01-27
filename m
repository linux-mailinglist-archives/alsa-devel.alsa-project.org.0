Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948A30627E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E4416CF;
	Wed, 27 Jan 2021 18:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E4416CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611769690;
	bh=jSQLKwsEAPMXlobxahgRL9tfaCHU1DRTH7YgE0hHxEs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTpCdhmQxkHy7A63YN/6CVp6BbMDWHr1Y2r3+O1eXjrD1MJN+Z7LLw8F/mD9XK5dp
	 IzvyMcxKGsYi1+lpApVSWZEf1WR+hFPGVjRbSHazbkj1pumw/8VniCtUzS+ZAB5jbR
	 5xEpJGRXIy5JidOCfIjnW9WkrziLVQZc++8n1+pQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FFBF8025F;
	Wed, 27 Jan 2021 18:46:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29F17F80259; Wed, 27 Jan 2021 18:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FECF800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FECF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZUwsWpmj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DA4164DA8;
 Wed, 27 Jan 2021 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611769593;
 bh=jSQLKwsEAPMXlobxahgRL9tfaCHU1DRTH7YgE0hHxEs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZUwsWpmjIIRQzbW0MLtNkobgzZ1FaNNFvDEOqtinaYWYUnKCs4CdTRMV0rKcX1dOW
 F1xFu0eLbu1UaFyYxokpZeHflfVBw6yGGiJIL34mp32BrT4Mp3NpvWYoIg4i+cSuNm
 /Bihm+5x5zNI9MuN5OrW4KGzonC3yWw1FxbEHzhWwPLI32zENenSmbAfTIR+eEIUxe
 +AEVGssyI50rzwwYoNw5JtqK6q5yGl7qrvJg5wk95jG0fH3/13L8StAKucu9q8pfuH
 Cs535U3INj1BToN/5VCZVL68rq88kRzk6m5QANF5wJsp1eXeDWQ4Ovw6jreQOgTLFS
 UrWBcKgF/YdxQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
References: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
Subject: Re: (subset) [PATCH 1/3] ASoC: SOF: allow soundwire use
 desc->default_fw_filename
Message-Id: <161176955088.45769.2905283402299825465.b4-ty@kernel.org>
Date: Wed, 27 Jan 2021 17:45:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

On Mon, 25 Jan 2021 09:04:58 +0200, Kai Vehmanen wrote:
> The old code always uses sof_fw_filename in struct snd_soc_acpi_mach
> as the firmware name. However, firmware name should depend on the platform
> instead of the machine. For example, different machines may use the same
> soundwire link topology, but they are using the different firmware. In this
> case, it's hard to determine in struct snd_soc_acpi_mach which firmware it
> should use.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: Intel: adl: remove sof_fw_filename setting in ADL snd_soc_acpi_mach
      commit: e32df142359fb6f4d27977b7652549f0844aa62f

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3FF626088
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 18:36:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651E516A4;
	Fri, 11 Nov 2022 18:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651E516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668188181;
	bh=OkefddGIjElvmBELFcTCn1rDgl1B2unbSSO12KPdpNM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sw7DuBvkU9HGS2J7N0AihXQh+bJGRNxpMRJNiTlWOt29kBmhlWRNfzg1GFUKBiiq/
	 68mn2XzL4/PJWrAHcxhBscAcez1ecdJhjJkmB66EjYx63VxJn5JuMPrMoI/6dEVTJ0
	 Hsd+k/U3G3wZYf6ZBE9YtVPOSOuOvgw9qfDxmTM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3360F80559;
	Fri, 11 Nov 2022 18:34:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF1B4F80536; Fri, 11 Nov 2022 18:34:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B109BF800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 18:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B109BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DMCgPDxi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59EA66205C;
 Fri, 11 Nov 2022 17:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC382C433B5;
 Fri, 11 Nov 2022 17:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668188067;
 bh=OkefddGIjElvmBELFcTCn1rDgl1B2unbSSO12KPdpNM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DMCgPDxiLuJQRuSBc/DWtU65t6mWt/5Fw40edoSPLycTNS5kzJDQb5sk3DHauRXgR
 jV9cDKGZAhzEmtl4tKn6tz45OBj+VCY6Rcu0h4qT3HCrHKUBsDhvkBIm3VcILbDKLD
 6eezbWukeA5+4ywn6jomw5FFEsyXbZ1rxeRQiX6M7legkpbYOqr+gKP4ALGFimvyIy
 OOBQEXEbmUwG+I0US9EzIypDY/xV1SN1glEbv0SslASzLMGEJ9ArrM51hWLNknDe7g
 Ydlja3CnWZzRVOQqJkI0uu4fGb+R5fRL4rYV+EbGDvOurJ6fdwxAlKvics3Kd+HDmD
 mkc23VVcdlLVw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221111045016.46573-1-yung-chuan.liao@linux.intel.com>
References: <20221111045016.46573-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: add new Dell devices support
Message-Id: <166818806549.535544.10835506624726426278.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 17:34:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

On Fri, 11 Nov 2022 12:50:12 +0800, Bard Liao wrote:
> Add 2 Dell SKU support.
> 
> Gongjun Song (4):
>   ASoC: Intel: sof_sdw: Add support for SKU 0C10 product
>   ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire configuration
>   ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
>   ASoC: Intel: soc-acpi: add SKU 0C40 SoundWire configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw: Add support for SKU 0C10 product
      commit: d608bc44181c1010eca165e895bbe630077b2e16
[2/4] ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire configuration
      commit: 55fc03445e2c4e05169db0390ceb92d7ffea1a96
[3/4] ASoC: Intel: sof_sdw: Add support for SKU 0C40 product
      commit: 880bf4b47fc1810616e254738bb40fe108c01cb9
[4/4] ASoC: Intel: soc-acpi: add SKU 0C40 SoundWire configuration
      commit: 97b5fbf44c001a1c575550e4b40c4abd9d7db175

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

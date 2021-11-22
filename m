Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E634598E4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01514829;
	Tue, 23 Nov 2021 01:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01514829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637625707;
	bh=VDG8rJIp/+sbqF5E7Yk7EbPOFenwEhwPriPVytlCoBI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Novz2SW4V2WWlHY2/KjM4ryWVaBEdOM8aobAcZTHWksj+4L3R8Eh5T8Fcy5w8Ztne
	 WegqzoZqCMyE/DHfGfBQGtlq9Utek9p0cLlz1cy1BPf2p2O0Bk1h3wxnctdzBJgxkT
	 I3+0lXD6Y7YQunxyODNST7+x1RjC3+ob5hnegqvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDF1F80154;
	Tue, 23 Nov 2021 01:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D88DF80212; Tue, 23 Nov 2021 01:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 508A0F801F7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508A0F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wm3KDbIv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0690E60E08;
 Mon, 22 Nov 2021 23:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625595;
 bh=VDG8rJIp/+sbqF5E7Yk7EbPOFenwEhwPriPVytlCoBI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Wm3KDbIvRjlPa/gtPGoxFvKeGcK+2jaexW0YDgGw3jv3O96GH0d5gKaFK5ZPvcBIY
 VoWVHm1i0uGCmiJcnnnVl5wetOlZVk8SPB3o1nqwdrmusywdhA5zCIoNFM8D2q41b4
 TxKXUu5vvEU8h7evgDsdGnUwdRhAjkUuj6JS7uGNxZ+QukGNy44QegU5SiYwHyjawy
 vnJv24wMztiu5BGpbV0PfzlqaFlgdKJJbMEiEmNA04krN3SSq6o6L9VL5wVBMGHwCs
 GYejXGk8BeL8SQIc0sec9qBdeElMUOpk20Dk5crpa5z+73vJXzNzcj2FfdQMc3Uu9n
 D206K/Rd2Jh9w==
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20211118153014.349222-1-hdegoede@redhat.com>
References: <20211118153014.349222-1-hdegoede@redhat.com>
Subject: Re: [PATCH 5.16 regression fix] ASoC: soc-acpi: Set mach->id field on
 comp_ids matches
Message-Id: <163762559376.2471670.3572212333575293959.b4-ty@kernel.org>
Date: Mon, 22 Nov 2021 23:59:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
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

On Thu, 18 Nov 2021 16:30:14 +0100, Hans de Goede wrote:
> Commit dac7cbd55dca ("ASoC: Intel: soc-acpi-byt: shrink tables using
> compatible IDs") and commit 959ae8215a9e ("ASoC: Intel: soc-acpi-cht:
> shrink tables using compatible IDs") simplified the match tables in
> soc-acpi-intel-byt-match.c and soc-acpi-intel-cht-match.c by merging
> identical entries using the new .comp_ids snd_soc_acpi_mach field to
> point a single entry to multiple ACPI HIDs and clearing the previously
> unique per entry .id field.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: soc-acpi: Set mach->id field on comp_ids matches
      commit: 28c916ade1bd4205958f74bb817fd3a05dbb7afc

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

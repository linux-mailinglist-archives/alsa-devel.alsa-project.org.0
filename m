Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D64624A38
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:05:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06531657;
	Thu, 10 Nov 2022 20:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06531657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107130;
	bh=Fdos3yrig/YXWCfSadWY8NvihYdcZRISicY+GY0Ipcw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQe3cLICEAAjiu9251fkwvlMpAfRIU+KrcTWHKo3JH/n3fQSCjlbJnu0TR2qv2vPA
	 EJ9Av1lSU71jlsisNfHiLTC8Kc+R0WWikIfSgQNgjsiXL4Kxa5GtOFCkh2oxEArh2r
	 qBz9UZbPqombEZjiP8DygtdwkzqQBxejIWD6sbHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6BEF8032B;
	Thu, 10 Nov 2022 20:04:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E228F802E8; Thu, 10 Nov 2022 20:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A7EF80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 20:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A7EF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NXVr4lye"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C96C61E0D;
 Thu, 10 Nov 2022 19:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6071C433D7;
 Thu, 10 Nov 2022 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668107063;
 bh=Fdos3yrig/YXWCfSadWY8NvihYdcZRISicY+GY0Ipcw=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=NXVr4lyeQVWvqb4XDgmn7Jfa5mZK9g9CwSwIyT45X1m4FvlPd4ROb+00w98eeXCfF
 tuoMDsc51DSxTIfPX7KkEZ5HPudWT5mmkVet+C07b8eYl21GAyqGWDbgrN3bO1fHrv
 AWk40g/Z6iEL7GggYIa3XzOQy8rYvJh5Df3lJGJRBoRrhhbw/FFyn+l80bD6q/Nx2q
 vmVkiPDgvn3kErJzBkkD1krpiiR9AWpGJ1+esWrksNbRKeAJvT/e+xTssYavxEiLoQ
 HWTvs0GyQSCywidOPwtNxklgIzEA7F7B0tUn9buV3cisDVslGfMjf0J4LB+UN2vSuY
 SzYEnel8JVP1g==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com,
 Junxiao Chang <junxiao.chang@intel.com>, alsa-devel@alsa-project.org, 
 perex@perex.cz, lgirdwood@gmail.com, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, 
 linux-kernel@vger.kernel.org, furong.zhou@intel.com, tiwai@suse.com
In-Reply-To: <20221109234023.3111035-1-junxiao.chang@intel.com>
References: <20221109234023.3111035-1-junxiao.chang@intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: fix hda pcm buffer overflow issue
Message-Id: <166810706137.995851.18267350374607278167.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 19:04:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 10 Nov 2022 07:40:23 +0800, Junxiao Chang wrote:
> When KASAN is enabled, below log might be dumped with Intel EHL hardware:
> [   48.583597] ==================================================================
> [   48.585921] BUG: KASAN: slab-out-of-bounds in hdac_hda_dai_hw_params+0x20a/0x22b [snd_soc_hdac_hda]
> [   48.587995] Write of size 4 at addr ffff888103489708 by task pulseaudio/759
> 
> [   48.589237] CPU: 2 PID: 759 Comm: pulseaudio Tainted: G     U      E     5.15.71-intel-ese-standard-lts #9
> [   48.591272] Hardware name: Intel Corporation Elkhart Lake Embedded Platform/ElkhartLake LPDDR4x T3 CRB, BIOS EHLSFWI1.R00.4251.A01.2206130432 06/13/2022
> [   48.593010] Call Trace:
> [   48.593648]  <TASK>
> [   48.593852]  dump_stack_lvl+0x34/0x48
> [   48.594404]  print_address_description.constprop.0+0x1f/0x140
> [   48.595174]  ? hdac_hda_dai_hw_params+0x20a/0x22b [snd_soc_hdac_hda]
> [   48.595868]  ? hdac_hda_dai_hw_params+0x20a/0x22b [snd_soc_hdac_hda]
> [   48.596519]  kasan_report.cold+0x7f/0x11b
> [   48.597003]  ? hdac_hda_dai_hw_params+0x20a/0x22b [snd_soc_hdac_hda]
> [   48.597885]  hdac_hda_dai_hw_params+0x20a/0x22b [snd_soc_hdac_hda]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: fix hda pcm buffer overflow issue
      commit: 37882100cd0629d830db430a8cee0b724fe1fea3

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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC4AD1F0C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 15:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54CD601FE;
	Mon,  9 Jun 2025 15:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54CD601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749476450;
	bh=wgOlf3BLSDg9lsOfCqIcS3H7EE8U/h+Lfbiitf05EAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g5eSztTsxpw4Z3mXpBIR74J+3nHC6KAABggdqEvntbonCKPXrinq+UXooBPrJ5RbU
	 vlrKGsGRo5NJShhBMh1zl1JgwBePGzkkihLVvutX+IAkaaTPvKbS6X9IJnP69xhAOt
	 xQwhabSJXCuf2Gtk2g/HzW6p4ahI/1B44StJ6t8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A43F805BB; Mon,  9 Jun 2025 15:40:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C68D8F805C2;
	Mon,  9 Jun 2025 15:40:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EFDAF8025F; Mon,  9 Jun 2025 15:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2F3FF80038
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 15:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F3FF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lycqj2Hu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD7EE40C44;
	Mon,  9 Jun 2025 13:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D20C4CEEB;
	Mon,  9 Jun 2025 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476408;
	bh=wgOlf3BLSDg9lsOfCqIcS3H7EE8U/h+Lfbiitf05EAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lycqj2HuRls0vbqm2Y0tUONQLNrtLblRfhs8OOCl7bqnEthM644aieMZQqQKyncJt
	 7IJOnMcWcg5Bz7iPxoeKv6fbaKsfkEdGoqNoU6Wmwx7a8TAyHkMcIDBY/lD+Fxm3gt
	 9oRl1D+igs3rJSN9HOLF4qNyNaFVsSNNCNnQGNS4D3SosBVRz78Bwnb2LZEmM3rRWK
	 X3nmicqRM0ogrHO37cR/Y5fhKq47UIXiZL82jlqzphOHf+VCPGjaTChcHgRR4VDydr
	 gv5jun0SjFqppGtPhgVQ5aMxXHz0F+eUZfs4QxCljZa02vchYOOgusD+qvFF+iepHh
	 WbDir3nfq7Msw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
 13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com,
 jesse-ji@ti.com
In-Reply-To: <20250523131111.1884-1-shenghao-ding@ti.com>
References: <20250523131111.1884-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Drop the unnecessary symbol imply
Message-Id: <174947640693.126747.9706344371743366359.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: 6PCZ3M62WO7YM26FAZA4Q3OBQYLGQSFL
X-Message-ID-Hash: 6PCZ3M62WO7YM26FAZA4Q3OBQYLGQSFL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PCZ3M62WO7YM26FAZA4Q3OBQYLGQSFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 May 2025 21:11:11 +0800, Shenghao Ding wrote:
> The unnecessary symbols for imply are SND_SOC_TAS2781_COMLIB,
> SND_SOC_TAS2781_COMLIB_I2C, and SND_SOC_TAS2781_FMWLIB. They all used for
> library compiling. All the symbols in the imply are used for codec driver
> compiling.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Drop the unnecessary symbol imply
      commit: ac209bde018fd320b79976657a44c23113181af6

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E262C8D367F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 14:35:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A02852;
	Wed, 29 May 2024 14:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A02852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716986128;
	bh=LscZBrrk5tWprbX4pRMgccv36rp4xOvloWSZpk5k6Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuA5jjFMAKsIV7wCRJvbF3cvHVbz5mUoDSxLN5i9Lv7wmPUcKMoS1IDuKWX9eB+zw
	 pZRpQ/cEurahpxy2mDPRaPcovlLna1ZLdBE+QgBY6lFsITr6MvrAfb+jVsQmXbD+es
	 twMxWYbylSx5ibl0K9OMxexp4GLGZ+BjC1+aBhvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05172F805A9; Wed, 29 May 2024 14:34:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DCC0F800BA;
	Wed, 29 May 2024 14:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB57F80149; Wed, 29 May 2024 14:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED376F800BA
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 14:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED376F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S9rsZ4+y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0EB60CE16D0;
	Wed, 29 May 2024 12:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEBAC2BD10;
	Wed, 29 May 2024 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716986074;
	bh=LscZBrrk5tWprbX4pRMgccv36rp4xOvloWSZpk5k6Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S9rsZ4+yqoaDaiVzwph4xGaa4FpPfyFaviyTheIk4M5qU+i48QNV5WhGnqbgNniZF
	 IInl6Pu3QO6ErDCfzGdxrnWCVsn1XTpNxVWiUzOFQTj3wdieXVbl6yt2sMxo932o9b
	 qRsz6RwVJs/kCcvkBEHKCXBeeI14Br2znGA1STgCqAFIbu/VWvdMk/VLhtfgkwlc+b
	 slRHkSW98tGXNm5ZYfGE7+hcMATwZE64n0EifYwrCQRxF3FjWfbn6P5vvAWX8nS5jd
	 IWEUKKRJotwq3f8Kqcf2o0UeOZF0L16zDUmLJAv3cTf0g+Oj8KwjRsH5aKRe14mTA7
	 zJ8CzxUILk41g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 kernel test robot <lkp@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
References: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof-sdw: fix missing SPI_MASTER
 dependency
Message-Id: <171698607277.66190.15891871680506088286.b4-ty@kernel.org>
Date: Wed, 29 May 2024 13:34:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f
Message-ID-Hash: JHIENPQLAO2SPCOHAGTGX5ACQMXS62VA
X-Message-ID-Hash: JHIENPQLAO2SPCOHAGTGX5ACQMXS62VA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHIENPQLAO2SPCOHAGTGX5ACQMXS62VA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 May 2024 14:19:40 -0500, Pierre-Louis Bossart wrote:
> The addition of the Cirrus Logic 'sidecar' amps adds a dependency on SPI_MASTER.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
>    Depends on [n]:
>      SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] &&
>      (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
>    Selected by [y]:
>     - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y]
>       && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
>       SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] &&
>       (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) &&
>       (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST
>       [=n]) && SOUNDWIRE [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency
      commit: b062938fd9afec844c50571fddd8d81623a60ee1

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


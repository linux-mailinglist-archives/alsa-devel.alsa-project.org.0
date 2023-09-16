Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F37A2CED
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08930E8C;
	Sat, 16 Sep 2023 03:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08930E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826857;
	bh=Q765KB9+qjKbm8q2YdIPlbtX8d3INC50BInrobNMT+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIG7u2ZqpqaOZedfPXOpkZRGXiNsDek9LqLMbLUd/NVQUYCDrUN0Qhc+dpx1mjHG8
	 iHCKYggAHMXyYTrevykWyoGq2+iLpAs/JtFiWgYn2k9tkjG3DOGxQPr7TnNnpyIAEJ
	 oM1qVtpXkj45g65UYwdUgrGKh3QceiibCATYLs2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95263F805BA; Sat, 16 Sep 2023 03:11:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A161AF805B1;
	Sat, 16 Sep 2023 03:11:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98FB7F80587; Sat, 16 Sep 2023 03:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D188F80564
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D188F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L9jVJMWr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 02690CE2E51;
	Sat, 16 Sep 2023 01:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4569C433C9;
	Sat, 16 Sep 2023 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826700;
	bh=Q765KB9+qjKbm8q2YdIPlbtX8d3INC50BInrobNMT+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L9jVJMWrEU7GsQU6el4kOZ6CM2CjhViGfrK96AXbpi+d5joDqwA0jQXVWdtWG4g/r
	 7whycC1jjMhgUOtYvfgPk0jZAUdhYNqkuhfBcNDlp6ksnourlTfpKDyQZxq3ommx0l
	 Crkle4obOPJcUUsbSiyDSnt70viu6sn0Yu8/HvqKLMzyfTGZB5fayggy01I/coRs4i
	 t56PXPaNm+C1zz20JpkadsMvrq7T9sw1hfv1J/I83RnN0zMm/mvcloKUAdL+Un/3GG
	 gyhme+1Yym0QSz0iXhEKEzyP0V/DrPW32diJZjHy7DnVJ9/dPh012i6zzL2/r+5sUq
	 15U+UV4gsEDZw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com,
 ckeepax@opensource.cirrus.com
In-Reply-To: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
References: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: intel: sof_sdw: Remove large global CPUs
 array
Message-Id: <169482669865.606223.11147122522996550997.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: QTYF2XW36K6M3CEGLDXUIQSDU4KYG3NR
X-Message-ID-Hash: QTYF2XW36K6M3CEGLDXUIQSDU4KYG3NR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTYF2XW36K6M3CEGLDXUIQSDU4KYG3NR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 15:56:07 +0800, Bard Liao wrote:
> Rather than keeping a single array of CPU dai link components allocate a
> smaller one for each DAI link, this reduces the amount of state that
> needs to be passed back and forth in the driver.
> 
> Charles Keepax (4):
>   ASoC: intel: sof_sdw: Move sdw_pin_index into private struct
>   ASoC: intel: sof_sdw: Add simple DAI link creation helper
>   ASoC: intel: sof_sdw: Make create_sdw_dailink allocate link components
>   ASoC: intel: sof_sdw: Increment be_id in init_dai_link
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: intel: sof_sdw: Move sdw_pin_index into private struct
      commit: fc46ecf34782c0d3ec8224ce6003a2631f8a93f1
[2/4] ASoC: intel: sof_sdw: Add simple DAI link creation helper
      commit: b359760d95eecaabd081c1c2cd58e0a15fe5a68c
[3/4] ASoC: intel: sof_sdw: Make create_sdw_dailink allocate link components
      commit: f6c0273ba936c80632f5edfb5659e49b8bf6b6a9
[4/4] ASoC: intel: sof_sdw: Increment be_id in init_dai_link
      commit: 7a35d05f1e7687bbb57b97efe6d0af560826507e

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA370C1ED
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D535DE;
	Mon, 22 May 2023 17:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D535DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767928;
	bh=0kSm3ArSMBBAQILGy53MDvxURNgbl1q/2fMqcPnpq38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PRbYy2Kuag+jE6WL3pj8OxgQuClUHXV2WRhcLE0bqwei6Kx8Ycgy4YCTOV7MS593I
	 8RccZS1rt5N0BktlAUi1jKqb4z5fnA+aJJxc0E6jPB+r/y3nwa6UT/t5Lm2aOqlf7m
	 +CuX7KV7d5AuuB2IyQiKpQh6YpMT2wciE2ZwFjBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80B22F805EB; Mon, 22 May 2023 17:02:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 088DAF805E5;
	Mon, 22 May 2023 17:02:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCA1FF805B4; Mon, 22 May 2023 17:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8A27F805AF
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A27F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m87iycOa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9536C61D10;
	Mon, 22 May 2023 15:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD489C433A0;
	Mon, 22 May 2023 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767719;
	bh=0kSm3ArSMBBAQILGy53MDvxURNgbl1q/2fMqcPnpq38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m87iycOa8k1AW9JHNB9eKX02mBpzezQHmT5s30sdE0NN7gjmoqtLSV1xSjH0Q4I5H
	 4xwBBnpZzQ0F60JxVw4m2QjeRe6PmPR2yK4Wj9Xhvz/c8Lhw8KRz0DLnU2Vo7z/6Wc
	 nbVvVHlXsUu8p0wN+BxxaUqglDqj6s9GYi+p0lACPGkgpKWXNDhXpICXZ93UqnnEZH
	 DwimdmXPK72UGrmhJfYMqT2XLr7j9umx77Z4rXi7nlc5DIVuF/kXscISwQ35+8lb1Y
	 Nlw41cElK2LDkAP/vl1lJ1teJVoV4gjDQOrrsa5Ml5/dRjFwHtV30B6LML21e4s/Q7
	 eygHI+Gq9B3fA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
References: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: ipc4: Querry CPC value from firmware's
 manifest
Message-Id: <168476771749.849172.11613916365692508468.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: ZIHDOFHJCRCFUGBKWIGN6T2GNZOEETFS
X-Message-ID-Hash: ZIHDOFHJCRCFUGBKWIGN6T2GNZOEETFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIHDOFHJCRCFUGBKWIGN6T2GNZOEETFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 May 2023 13:13:08 +0300, Peter Ujfalusi wrote:
> Hi,
> 
> The MOD_INIT_INSTANCE message contains a CPC (Cycles Per Chunk/processing unit)
> parameter.
> This CPC value is used by the firmware to calculate the total cycles needed by
> the enabled module instances and based on this it can decide to set the
> frequency of the DSP core(s).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: ipc4-loader: Drop unused bss_size from struct sof_ipc4_fw_module
      commit: d474809e9284848b6cb57a885f3252b86a0b485f
[2/5] ASoC: SOF: ipc4-loader: Save a pointer to fm_config in sof_ipc4_fw_module
      commit: fe04f300035d497a066172a9a9331439cc8300f6
[3/5] ASoC: SOF: ipc4-topology: Rename sof_ipc4_update_pipeline_mem_usage() to be generic
      commit: 19c745d1fd1a61a04a0b44623c70c4e71b6f274a
[4/5] ASoC: SOF: ipc4-topology: Do not use the CPC value from topology
      commit: 9caa90180512581821d7498132f952ebd4ba05ad
[5/5] ASoC: SOF: ipc4-loader/topology: Query the CPC value from manifest
      commit: d8a2c987934959dd1f27de75401625650cd25e47

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EA7A95C7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ACF6E76;
	Thu, 21 Sep 2023 18:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ACF6E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695314082;
	bh=QcghfEVQ+7sZ0IERxkAoR4kgaIN7uggzHaMvZcIgWnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cyElIGLH9iwy7lSSdwzSOBW2QezVkwOR1XQwZ8Agv4a8W3Qe67tQvTmwEHIUKeNDU
	 1p7Q1csBDYVScVZRWqghej0mBjz8MVuz1Mz2YSEQtzj7Y4rWArtNR0C8YqiKLLqLp8
	 eMNR1LcK3X30mgNJ0dexl29/85CKn3ookARpcnQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A1FF80613; Thu, 21 Sep 2023 18:30:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C24B7F8060E;
	Thu, 21 Sep 2023 18:30:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59E15F805F4; Thu, 21 Sep 2023 18:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80B9AF80578
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B9AF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ed7oV3+M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A8E961F31;
	Thu, 21 Sep 2023 16:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36DEC611A6;
	Thu, 21 Sep 2023 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313832;
	bh=QcghfEVQ+7sZ0IERxkAoR4kgaIN7uggzHaMvZcIgWnY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ed7oV3+M51I7R+/s06Z1+4PoUpLS1lMUuHMsZsFepj5kSap5nbLRkXZt34zx876ac
	 2Zw76f8Iph7Zr+WMFDRxKXkVEEJkWtx9MpR0WuNbgmlOvBCsGIGOCJYfeq9oHtTWKH
	 7wyh74xoXKMxISpYF7tGA5veiGYtVSazEnG5BJJOsIz5UZn6KkGlRczXIjKVa5BUAw
	 QZ3XhWX89AFCb+T53N353wmlDYz24OKX18m0Gbq0MxJ4XNWZPe3wfA6zjtqgToyvfA
	 4NY4giQLNqoBiLdxwRHBH0iTH50UJk5WGpmuSqLhjM52d2SPU62sMGwPLeXdrOinsx
	 OjjUOrp8YuM1Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20230921064317.2120452-1-yung-chuan.liao@linux.intel.com>
References: <20230921064317.2120452-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: fix HDA patch loader support
Message-Id: <169531383138.61074.244138319291791890.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: YY6BZB64C7UX4ZTMIQNC6TQZW5DWX7EN
X-Message-ID-Hash: YY6BZB64C7UX4ZTMIQNC6TQZW5DWX7EN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YY6BZB64C7UX4ZTMIQNC6TQZW5DWX7EN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 14:43:17 +0800, Bard Liao wrote:
> The array size is irrelevant with SNDRV_CARDS. dev_index is from
> codec address and the available codec number is HDA_MAX_CODECS.
> Also, hda_pvt->fw is for a temporary use, no need to add a new extra
> field in hdac_hda_priv{}.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: fix HDA patch loader support
      commit: 2f3fb85b258334a4247af5c92b4a21480ca5634e

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


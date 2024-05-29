Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1328D3D3C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 19:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D346C0;
	Wed, 29 May 2024 19:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D346C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717002730;
	bh=9UpR3hGU/5+3bUNpfdSES1Ui6yAXcd8PftieunFAs7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dn/mawOb6hDjolI2NJXuRnRMh+HFSDB8Aa3RtaBzbJ63md5bMFdaXJjR1gf+q/lPZ
	 F7UzcyFzuxJAlnjoiTaD2fhiobOot/JRO4r+hsl7GftbE6w3aYdEQnNIUmtDxuOSEm
	 bpcZf8KfbYfwjh0xdh4ZRjZEgmtUSALBDysz/NJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55DBAF80149; Wed, 29 May 2024 19:11:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB395F80579;
	Wed, 29 May 2024 19:11:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46479F80149; Wed, 29 May 2024 19:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 635B6F8003A
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 19:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635B6F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hyaBnfEC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E797A60346;
	Wed, 29 May 2024 17:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C078CC113CC;
	Wed, 29 May 2024 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717002684;
	bh=9UpR3hGU/5+3bUNpfdSES1Ui6yAXcd8PftieunFAs7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hyaBnfECVPHlH84ACfb81Qj4jMkCnvaRlTS4D1dCP7Sptb8I916D5XPQI5W4y0lhu
	 1SJK6WYF+Dcpa98zfNGv5ZCAAA/he5RFUCf9DZqN4gH2xMRJK/hS+J43uAAV7ZO+wB
	 dD9U4hYOQxlPT5rYcwyzNwDBHDGh/B92H20Cvewi5YbDo/RQyVp0wv+idMBh65nFXA
	 V9VAIUEfWERowJYhSdUX3yDKYOenCu1DDR2Qt93tvkFj/CcoQcwG8ifLKW0d9OnNsv
	 72OuITvVODc+fG35isNk9t2JNpoayvYY7Ed0TRfq4NeFzjwyrt6eO5bRMpUNgbkU0c
	 nR/eNzp60w6oQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: add missing MODULE_DESCRIPTION
Message-Id: <171700268349.145451.11791404311765995337.b4-ty@kernel.org>
Date: Wed, 29 May 2024 18:11:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-2ee9f
Message-ID-Hash: ZKFAQBOOLXKXX6CJE7A6H5CWOFQ4KTLY
X-Message-ID-Hash: ZKFAQBOOLXKXX6CJE7A6H5CWOFQ4KTLY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKFAQBOOLXKXX6CJE7A6H5CWOFQ4KTLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 May 2024 14:44:10 -0500, Pierre-Louis Bossart wrote:
> 'make W=1' now reports missing MODULE_DESCRIPTION lines. This patchset
> cleans-up all the module definitions and adds MODULE_DESCRIPTION lines
> as needed.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
>   ASoC: SOF: AMD: group all module related information
>   ASoC: SOF: reorder MODULE_ definitions
>   ASoC: SOF: add missing MODULE_DESCRIPTION()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
      commit: e30a942861b540e056425a8e31ba801de1ed4f25
[2/4] ASoC: SOF: AMD: group all module related information
      commit: b88056df4fcb7b5930d6ee3fef494e8729dcf2b2
[3/4] ASoC: SOF: reorder MODULE_ definitions
      commit: 06a2315da0b02db4f2115bc9253daa270571e389
[4/4] ASoC: SOF: add missing MODULE_DESCRIPTION()
      commit: 3ff78451b8e446e9a548b98a0d4dd8d24dc5780b

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


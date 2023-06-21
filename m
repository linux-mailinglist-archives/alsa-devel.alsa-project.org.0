Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274E737845
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 02:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A092851;
	Wed, 21 Jun 2023 02:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A092851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687307786;
	bh=6id9vY1mKgdMFgQpAzfiukrypLDhJI8Kp9RGn4ayV8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2AMUPlzF9W/Npx9SWgL2lgaSJ5o0qEF/0m6XQn5nGCAlPovTSRBbQx+Bthqs56x+
	 r/BzPAnI6fNQZaRBvree/Nx3GRgxeASb7330RGUmlB4k8C98fCs+c8cNAbb1BsOoAM
	 4oyI+mddvC03bpBaPfIs53YCoXxipPX4SXhUqRXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFDDDF80570; Wed, 21 Jun 2023 02:34:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AAD2F8055B;
	Wed, 21 Jun 2023 02:34:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CA8DF80141; Wed, 21 Jun 2023 02:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C608EF80132
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 02:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C608EF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RTnwj/uO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BB4561452;
	Wed, 21 Jun 2023 00:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ABEC433C9;
	Wed, 21 Jun 2023 00:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687307666;
	bh=6id9vY1mKgdMFgQpAzfiukrypLDhJI8Kp9RGn4ayV8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RTnwj/uOsONNN+Se2VhtYMB67MrpAE63WdXb+ZrPdHk24aJfWyBLYC8NodQdzYc6L
	 PKTzyBgeQ/qUVhIVTrBFQkLGhc1N3hD2Z4SIMrdfykC1f8ajVHuUCQQmhkHzg0f2fH
	 h0p5RatshTFRvcygbyAVnzPT5J4AIIOMo/ihBhEEhg4Fae0UVBOCcwG90uDC7CQuMj
	 +ZRMPCxfRHr1a6lRErAbZC1ki53TNOMRqLzENew/lnUBvCqs5osfU/o87BulR3fM5k
	 Xbd1Jrb4hYqKU/OF5pFIbHUSqc8/xb+1JlaaUu+fQX43C9Q/aE5y5MiBmhU8WxaPa1
	 wFJ9IqxBjidFw==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20230614142116.1059677-1-ckeepax@opensource.cirrus.com>
References: <20230614142116.1059677-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: Fixup typo in device link
 checking
Message-Id: <168730766420.219941.5196650666857587356.b4-ty@kernel.org>
Date: Wed, 21 Jun 2023 01:34:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: GQC2DNPJU664M5U5XAMEORDFFJXFHMBP
X-Message-ID-Hash: GQC2DNPJU664M5U5XAMEORDFFJXFHMBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQC2DNPJU664M5U5XAMEORDFFJXFHMBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 15:21:16 +0100, Charles Keepax wrote:
> The loop checking for multiple different devices on a single sdw link
> contains a typo accidentally using i twice instead of j. Correct to the
> correct index variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: sof_sdw: Fixup typo in device link checking
      commit: 1f1ef7e5bbe2de125da413e238915f6047ea4ba2

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5293940B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 21:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A14AE82;
	Mon, 22 Jul 2024 21:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A14AE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721675597;
	bh=qJaKIk6+DCF4AXqlRywZH6G44gwfDvN4DfZHy3E4aqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GlHGQIh25Qr2XqIlVR4Nld7RPGBZFilBJLBeekSlcg4CEWdgpAyof8XfKz7S1FNbm
	 mVLzJGTEOx634kW1xdenTCObP/7XwMYlf8ppHZc5Uka2x3WrxJlWvQcgS3irosjB25
	 zby66+pEx23cvmVYd9Nh+FIEDXb56HKTSzrADE28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55818F805A1; Mon, 22 Jul 2024 21:12:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7742AF805B1;
	Mon, 22 Jul 2024 21:12:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DBF3F8026D; Mon, 22 Jul 2024 21:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 766C5F800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 21:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 766C5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PwkHTE30
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BAF58CE0B24;
	Mon, 22 Jul 2024 19:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D68C116B1;
	Mon, 22 Jul 2024 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721675543;
	bh=qJaKIk6+DCF4AXqlRywZH6G44gwfDvN4DfZHy3E4aqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PwkHTE30Kl7ROzM2ZPHCTzHnu8MVPga9ssfUJcp0adnOwVG6aSqTL7UQ8j5dhV/26
	 aYxwwczchip/IrmDUoPBsK4+rw+yA83FRwHkt6m/ShUVpxdMPSgwSfFT8mlrXH2fCt
	 1hTcAzzoPqRp8gQY+mn41f703/brpjQsIAQC+MAl7pGZuMQ6njC3kwTg07FDh6XbBv
	 5t3/2sfHLHsC6F3Q3W56mXxnD5vUKsBk7op0Abjzd6xbEwrxo16jV3QHCM81cqu+9I
	 64RCNkleAC0BzMh/zAz30uIlrQJkQu7C8nHJEvSUf8ZbJsHomXYfPgV6iWti/+NYpX
	 XzdhSBKxVwFwQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 kernel test robot <lkp@intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240722083002.10800-1-pierre-louis.bossart@linux.intel.com>
References: <20240722083002.10800-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: use soc_intel_is_byt_cr() only when
 IOSF_MBI is reachable
Message-Id: <172167554047.83479.17939715379049478337.b4-ty@kernel.org>
Date: Mon, 22 Jul 2024 20:12:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: E5RGXIJFRTQAVGJBJFAI4WU4R7EXAXV6
X-Message-ID-Hash: E5RGXIJFRTQAVGJBJFAI4WU4R7EXAXV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5RGXIJFRTQAVGJBJFAI4WU4R7EXAXV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Jul 2024 10:30:02 +0200, Pierre-Louis Bossart wrote:
> the Intel kbuild bot reports a link failure when IOSF_MBI is built-in
> but the Merrifield driver is configured as a module. The
> soc-intel-quirks.h is included for Merrifield platforms, but IOSF_MBI
> is not selected for that platform.
> 
> ld.lld: error: undefined symbol: iosf_mbi_read
> >>> referenced by atom.c
> >>>               sound/soc/sof/intel/atom.o:(atom_machine_select) in archive vmlinux.a
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
      commit: 9931f7d5d251882a147cc5811060097df43e79f5

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3787BE9C0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 20:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6A3FEA1;
	Mon,  9 Oct 2023 20:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6A3FEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696876748;
	bh=UtdyveDWWHHSkdK1+oJvfL+FiLXQ7l2c311dluDzelU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jD/1m5toBuuoEZc3gzylUdElmQhFp9Hm2j7i1Vpy/NXOpQqWMFasTjuWNTOLNtZVV
	 06TMeSJw/FUVG3SMCBhPVcxDavxHChqq38dijyf+QB6ceOpo+lNaggyt3hu0U/SdX/
	 Ir+QpfR45oDq5VD5uuDxvs4pxb5wj4+bfCLvET8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18AAAF805B6; Mon,  9 Oct 2023 20:36:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 676E8F805AE;
	Mon,  9 Oct 2023 20:36:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A5CEF80563; Mon,  9 Oct 2023 20:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E93FF8027B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 20:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E93FF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uxuNNY0s
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81D4B612D3;
	Mon,  9 Oct 2023 18:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10013C433C8;
	Mon,  9 Oct 2023 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696876588;
	bh=UtdyveDWWHHSkdK1+oJvfL+FiLXQ7l2c311dluDzelU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uxuNNY0sThcuwVxrYphBlkuSBPNWfnzGkDNxML7k/Hou8MQkd00Qfxl2YwaimkfGN
	 6wAapn2vvS1rnDCjIEHWaqrl3OId3Nt4Y1uPMDCR1vydZIHzlJZXhPgjz/U0BLfX+6
	 wqw2Qq04JE6+tCBICIHk85It9iMmHISTkMUJ6bntoUwziLI4Pu9Ajd0E1iCuHCuoGM
	 tzmtACWskzx/esXjeQP0otf/trpF5EerF3FYqLkC7/lOX6bUgGBW5LyOo/sHA5ZSJB
	 e6PyBN/HMMV16On9Gf5Q4axJKpbsmCoTm/To4wIpSCJcTyOf33mVtVg+fdhnxqe7RC
	 Zks7PAdBgJIpw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20231006164405.253796-1-rf@opensource.cirrus.com>
References: <20231006164405.253796-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix illegal use of init_completion()
Message-Id: <169687658644.138823.563040829634157998.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 19:36:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: RCNB3DNH5L6E7HTA7N6O2BDHGQOPA3IH
X-Message-ID-Hash: RCNB3DNH5L6E7HTA7N6O2BDHGQOPA3IH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCNB3DNH5L6E7HTA7N6O2BDHGQOPA3IH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 17:44:05 +0100, Richard Fitzgerald wrote:
> Fix cs35l56_patch() to call reinit_completion() to reinitialize
> the completion object.
> 
> It was incorrectly using init_completion().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Fix illegal use of init_completion()
      commit: af5fd122d7bd739a2b66405f6e8ab92557279325

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


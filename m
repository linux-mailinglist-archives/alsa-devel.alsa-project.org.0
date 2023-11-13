Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBD7EA3F2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 20:41:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76EDC820;
	Mon, 13 Nov 2023 20:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76EDC820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699904510;
	bh=S4SJ5v5fN3kFbHG/E5G2kZ44ZvCYDn0Hcn+QnI/Y2xs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9OeZxl8Ho/vn1Nxq/2ezThtsdlRWeg3KIcCZbedz6mQH+NcY5WJd9nX+UIVxeQwB
	 UmxBh165WYjOEcMxMrzx9HbIOodyHcRd8WfRc0gQ8QzlKEmle15RPTvCw0ZL2H1/BR
	 lJpvG83p9+7ZCT69TPSgWSNENxvwMFHjqjMicXPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E81F80549; Mon, 13 Nov 2023 20:40:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E89DDF8016E;
	Mon, 13 Nov 2023 20:40:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D09DF8022B; Mon, 13 Nov 2023 20:40:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7311BF80152
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 20:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7311BF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dYGH7zwT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B6AA60FAB;
	Mon, 13 Nov 2023 19:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832E5C433C7;
	Mon, 13 Nov 2023 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699904416;
	bh=S4SJ5v5fN3kFbHG/E5G2kZ44ZvCYDn0Hcn+QnI/Y2xs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dYGH7zwTmQEkyVBmGSSkmt/lfTXaEcB6NUqyjuo+mCrPJcro7VjkAoAvSYO/LPrJZ
	 VHJLCl0ngdPTyReJrvYXu83bV6oznzpPglVjt37GAC/tGPDEU1e651PSXXX2+CacU5
	 WwvkkWMFnM5PAepszFGpCykd6jAr8ySsQnqNXkiAIRUv0+W2XxFsWZpjInXOpQ0JK4
	 3xhvDx+SScqKahhDjuKoKD32P1GF28SaqKW1HpUAvjdpPHXB8VzX1tKVVlIqJenibp
	 9bEUpCkX+1LdAZaeZMLqQLEiCzReSGxwgQoLWrJGO/V+gu7j5mSjE8imBZrxi3meec
	 rqJRa4SUYOybg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhu Ning <zhuning0077@gmail.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com,
 zhangyi@everest-semi.com
In-Reply-To: <20231101072702.91316-1-zhuning0077@gmail.com>
References: <20231101072702.91316-1-zhuning0077@gmail.com>
Subject: Re: [PATCH v1 0/3] ASoC: codecs: ES8326
Message-Id: <169990441385.3293939.14125839080140495513.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: NIGLBSGOMVOGQD7WZWYEQXD4TSC3YUVA
X-Message-ID-Hash: NIGLBSGOMVOGQD7WZWYEQXD4TSC3YUVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIGLBSGOMVOGQD7WZWYEQXD4TSC3YUVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 Nov 2023 15:26:59 +0800, Zhu Ning wrote:
>     3 patches here for the es8326 driver...
> 
>     We developed a new version of the chip. 3 Three patches are used for
>     compatibility with the old and new versions of the chip.We did tests
>     with the new driver at version_v0 and version_v3.The test results
>     from the test department met our expectations.Both versions work well
>     with the new drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: ES8326: Add chip version flag
      commit: ee09084fbf9fdda6bf0179bcdca52196d0cde8a1
[2/3] ASoC: codecs: ES8326: Changing initialisation and broadcasting
      commit: fc702b2c04d778d7e3a4091ebe54a86c5d0a0d96
[3/3] ASoC: codecs: ES8326: Changing the headset detection time
      commit: 8a81491adbd9b25a648704c9825adaefb0c31868

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


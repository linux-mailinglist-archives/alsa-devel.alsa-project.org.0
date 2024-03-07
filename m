Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E6887556D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 18:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE1AAE8;
	Thu,  7 Mar 2024 18:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE1AAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709833436;
	bh=dRCr4zJi41yXbASQXJZrJDtLGjtady1umh0wbNI3ZAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iY/uefwD5XwiBsFYoKZb66C4Aw0/DGDIfg7lDveloHL5gIWWGz/4GPJ72ZhOCa9F6
	 zbRLGHjJ6DbvludWi7zVQPSVlFOEIVHnPQLVIxTs18Ocd3EazyPPM+fu35wozqCVYo
	 j93u7cMKNkBpOZiz/UsxbsEc3TYXCV0cJRqJPkVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F48F805A8; Thu,  7 Mar 2024 18:43:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E87F8057A;
	Thu,  7 Mar 2024 18:43:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A5BBF802E8; Thu,  7 Mar 2024 18:43:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6618DF80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 18:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6618DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b3HKh8vJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51DFECE2504;
	Thu,  7 Mar 2024 17:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCE4C433F1;
	Thu,  7 Mar 2024 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709833388;
	bh=dRCr4zJi41yXbASQXJZrJDtLGjtady1umh0wbNI3ZAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b3HKh8vJ7spuAj9L4sttDawTDv0+XxOOBgPC1Z2Z3Umm5g0d4/FS+79YdLoCjS9t5
	 kzXP3nqACQJJ+Gt3VKvBzEGlwZLCoaHtd2QG8cY2e2/zV0MPSQbGumrOGcoXwLnioe
	 8W0hMp4dMYFXOLkAKMQxwwS2GdofNkF6XHXEYRzwrYmbA2VfvzZR4/qGVhOfL5z8fd
	 VwLLpWUdvyAhzpixwH7Odkvw3l1MnnsoQnv4II8nYHrBrWH2YNyfUn1O58Phr/2Hm6
	 U+HAR+R1GERBOQbcq6+DZLptLYido2jaoBbnv6qCVvZy6HJ3bZpnx3zjxOk9BGId/X
	 xI/e4deUxYOMQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20240307051222.24010-1-zhangyi@everest-semi.com>
References: <20240307051222.24010-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: ES8326: change members of private
 structure
Message-Id: <170983338698.97308.6303056838124044344.b4-ty@kernel.org>
Date: Thu, 07 Mar 2024 17:43:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: YYUCLHBPDA64NWL5EZ7KRKIHLKAAJLXO
X-Message-ID-Hash: YYUCLHBPDA64NWL5EZ7KRKIHLKAAJLXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYUCLHBPDA64NWL5EZ7KRKIHLKAAJLXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 13:12:20 +0800, Zhang Yi wrote:
> We found that using 0x45 as the default value for interrupt-clk
> would cause a headset detection error.So we took 0x00 as the default
> value for interrupt-clk and passed the test.
> We removed mic1-src and mic2-src, which were not used.
> 
> Zhang Yi (2):
>   ASoC: codecs: ES8326: Changing members of private structure
>   ASoC: codecs: ES8326: change support for ES8326
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: ES8326: Changing members of private structure
      commit: bb6983847fb4535bb0386a91dd523088ece36450
[2/2] ASoC: codecs: ES8326: change support for ES8326
      commit: e87eecdf53228dd2b8bfeab84d409652f96a16d0

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3BC6FB177
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 15:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7971133;
	Mon,  8 May 2023 15:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7971133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683552483;
	bh=PMWVR4rD/QmoXX+jrPywb+5su3hOBWmKSJB+XSMrYVY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f34AY65VfsNxHEW/pEkqmJ/tVdTOEy//yhIPPIr4vp8EyWsPhHlW9WEILzg6RgIZS
	 cBsLdAzJiswvAyZ9hxbQFMAEO/dvVnz/hBg1SMJWdQCm2+MnF3RfSKkUjeXzeeeRwP
	 m20hPuzKIPTPEmLhli2rtNHvqTh1B6VOrUVpxN98=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B729EF80310;
	Mon,  8 May 2023 15:27:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8385F804B1; Mon,  8 May 2023 15:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCF3BF80087
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 15:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF3BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ElW8heWB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F22D163D29;
	Mon,  8 May 2023 13:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAB1C43445;
	Mon,  8 May 2023 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683552422;
	bh=PMWVR4rD/QmoXX+jrPywb+5su3hOBWmKSJB+XSMrYVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ElW8heWB4sHnD96i9l8XUac2XDrawmJFZEYgWZrw8eKqqURJlCyBer4fcVp8Wp6Ky
	 hu0/LqrVuy2pbETnfnNHpqB87J/VtGCgWcSClbBI1Hp070mKbHkWLMv5ZGoj4J1zc4
	 dvZyEb5hS+es7q8F1wtkp1drUoP/wLgUrIW53ES4PNHEZRn944Y5wKQOQlN2DXXxYj
	 Z0ZB6/I85wiR/64ooDo9kMxRFPsj5qKoAmyR7vzXbxRnmbBItoggUH6wba2JnFA3oj
	 SuV/9t8uoERVGNpC5RMmMprjewWILKHscJhonSbEjVduww1OGIASCS5mIJM2X183L0
	 mmu+1NSXVwsww==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Tim Crawford <tcrawford@system76.com>
In-Reply-To: <20230505161458.19676-1-tcrawford@system76.com>
References: <20230505161458.19676-1-tcrawford@system76.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry to support System76
 Pangolin 12
Message-Id: <168355242113.260078.3036428333196529547.b4-ty@kernel.org>
Date: Mon, 08 May 2023 22:27:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MRSBPJHNXULNRUHOKIXOZEBHTLEAIIRD
X-Message-ID-Hash: MRSBPJHNXULNRUHOKIXOZEBHTLEAIIRD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: productdev@system76.com, Jeremy Soller <jeremy@system76.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRSBPJHNXULNRUHOKIXOZEBHTLEAIIRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 May 2023 10:14:58 -0600, Tim Crawford wrote:
> Add pang12 quirk to enable the internal microphone.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 12
      commit: 7b9891ad25246b18b5ccc19518da7abc7763aa0a

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


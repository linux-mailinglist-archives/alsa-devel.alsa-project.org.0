Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76D73AC96
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 00:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98879868;
	Fri, 23 Jun 2023 00:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98879868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687473348;
	bh=pVo+/ISXibiLscmCDNLsV1/WF9MElrFoN9dy+8aHC3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B5ce1gXpuEK8dBrlwAI/OtQKKHcTEOwZT11qQdr3j/6T4i9P76DF+nhv9qWKu0aA4
	 dLcHV3zLVEIeZI4ikX1L1LU3eoZCZokW1oFU7a+eKavLd73RRsmvHQ2E/EC3pM4Fgm
	 0/BfcT0PLGdaq8gv4esCnqbZYwIisK1f+PyrwU0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 981B8F8057C; Fri, 23 Jun 2023 00:34:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 672B1F80564;
	Fri, 23 Jun 2023 00:34:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CC62F8057A; Fri, 23 Jun 2023 00:34:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AFA43F8055A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFA43F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tMY4mvc2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B09461924;
	Thu, 22 Jun 2023 22:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA44C433CC;
	Thu, 22 Jun 2023 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687473233;
	bh=pVo+/ISXibiLscmCDNLsV1/WF9MElrFoN9dy+8aHC3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tMY4mvc2IEk3huRUmyd+CKSIQAg1Fq5ZpTvMm8j5idWbc8/Mgvh3uMK1sWAbWc1id
	 Z81MdZKEwFZv4FWArTsafK1cLI/l+SkwloUA4P9hj79JW8pyPp6jQNCJm772mOuACm
	 7tEfX4TKkP3DBZ7VjlGRu6q3Ym799nOHoVbGxRKCOy6v3IHaNKbIEx7K+ZIU4ODdtw
	 Sr+MsXl6PpDKsLVwIoZ2S4UVq7QsNZyB50CHN83OlVlmClBxRTNpe3g2KpreDY/4vi
	 8Hx9JxHmjPlmQkHWKkSf7Csvk/LyVQ7irOU9XOeNCDfUMch/NmZ6HIhcHEj7QXMpia
	 m4bCIYUTRMNlw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com
In-Reply-To: <20230302120327.10823-1-srinivas.kandagatla@linaro.org>
References: <20230302120327.10823-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: common: add default jack dapm pins
Message-Id: <168747322954.318849.3017080931137286900.b4-ty@kernel.org>
Date: Thu, 22 Jun 2023 23:33:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: BPYPOP6UDJNIB6VSFAHKESIJHOL24Y5B
X-Message-ID-Hash: BPYPOP6UDJNIB6VSFAHKESIJHOL24Y5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPYPOP6UDJNIB6VSFAHKESIJHOL24Y5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 02 Mar 2023 12:03:27 +0000, Srinivas Kandagatla wrote:
> If the soundcard does not specify the dapm pins, let the common
> code add these pins for jack.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: common: add default jack dapm pins
      commit: 82f76ac26c601c5b0c0db7f69500efc42f2ee7ed

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


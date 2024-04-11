Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D618A1B0F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 19:20:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43C0B2BD0;
	Thu, 11 Apr 2024 19:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43C0B2BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712856044;
	bh=g+rh97gXhMk7bXFHOvAUpa2M3brb+cjQoTQ9MIbLCXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L1BDm86NtNWjROS0HpPTFO8x97jiPiZWwB9SoksThlaDQQ7LEteseYKtA+JbWXfps
	 3yD2ylKqhFQcJ563wBVC3IZ4jwJc+B6c5qwmJTJFRA9D1+07W8h6Y8T/XTDLFV0fn+
	 8EARwkuFPWIMVkUFh3s2IpPfFjo17GpFpPXvkCHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E047F8057C; Thu, 11 Apr 2024 19:20:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAB0F8055C;
	Thu, 11 Apr 2024 19:20:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 287D7F8026D; Thu, 11 Apr 2024 19:20:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AF19F80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 19:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF19F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tji3vN2A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1D7EACE0613;
	Thu, 11 Apr 2024 17:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7033C072AA;
	Thu, 11 Apr 2024 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712855996;
	bh=g+rh97gXhMk7bXFHOvAUpa2M3brb+cjQoTQ9MIbLCXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tji3vN2A0ZpRs2aIL/PtCnQE4u2NF6LV5mPjjWudnrt2SJDA7ALoNZLq/skSsL8Tc
	 JJcgqIwkC6n0CM1gBGpZAHy71Wq9ambX+usqo7qcgkm4mQWp/ykpmFJGKk//pw/LV4
	 QFUvuf+8B8lxuyun3gV7k18Xx/HOmzgqctAQl4OJJHzG/ByWdeNiLdeub7TEJ0osAp
	 8i3n3c8MoUn7dQRWnrtVcdJf5enTRM2vffIzM37lW3z+iAwS//o1XiHXiL8p+ETjhm
	 3csUfxH33xi7MAC6lwL+mfJXfKE74lcE75+yqN/ILFJ6gtHYyEGVJJv+3otPdkrlwh
	 rVoRMPIwgebXw==
Date: Thu, 11 Apr 2024 22:49:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] soundwire: qcom: allow multi-link on newer devices
Message-ID: <ZhgbuL2GftDFrBHw@matsya>
References: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
 <ZheyJ5PORudx9gsK@matsya>
 <5cad6693-8a76-4a74-92a0-00a0818b5210@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cad6693-8a76-4a74-92a0-00a0818b5210@linaro.org>
Message-ID-Hash: 32HGKPMIIZ6RUPC2KAN76GHSXPICAD6U
X-Message-ID-Hash: 32HGKPMIIZ6RUPC2KAN76GHSXPICAD6U
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32HGKPMIIZ6RUPC2KAN76GHSXPICAD6U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11-04-24, 12:10, Krzysztof Kozlowski wrote:
> On 11/04/2024 11:49, Vinod Koul wrote:
> > On 05-04-24, 16:41, Krzysztof Kozlowski wrote:
> >> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
> >> over two Soundwire controllers, thus they need a multi-link Soundwire
> >> stream runtime.
> >>
> >> Cc: Mark Brown <broonie@kernel.org>
> >> Cc: alsa-devel@alsa-project.org
> >> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Only rebase (slightly different context)
> > 
> > Applying /tmp/v2_20240405_krzysztof_kozlowski_soundwire_qcom_allow_multi_link_on_newer_devices.mbx
> > Applying: soundwire: qcom: allow multi-link on newer devices
> > error: drivers/soundwire/qcom.c: does not match index
> > Patch failed at 0001 soundwire: qcom: allow multi-link on newer devices
> > 
> > This fails as well :-(
> 
> I just applied it on v6.9-rc3 and next-20240410 with b4. No problems.
> 
> Did anything change since yesterday next? Can you point me to the tree
> and branch you are using?

Thanks for the clue, my tree was in a bad state, reset helped and the
patch is now applied

-- 
~Vinod

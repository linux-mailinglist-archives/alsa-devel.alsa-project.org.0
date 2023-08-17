Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B077F531
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 13:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336FC827;
	Thu, 17 Aug 2023 13:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336FC827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692271690;
	bh=CgpyAn4XPo7wawKt8pESyplY/MXDqD/84guw3hcr5BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JD2Jjm0iIAsaegMRjoFbTnVRpidjPhjkaTwRJclMxiHe7zwmH/NOI4F5z0HJtpKss
	 erzNXRY60/jQiJvC7VspV5X03SopVCR9R8yeodg9MyztccoS6VLyK8mBO3hziSwf8Q
	 ckUpFvDQTXrzmaK9Lcs5t8KWcl9rNBjKOcwv7PsQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE66AF80074; Thu, 17 Aug 2023 13:27:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 386E0F8016A;
	Thu, 17 Aug 2023 13:27:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F570F8016D; Thu, 17 Aug 2023 13:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4102DF80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 13:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4102DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FhzoCu/T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDCC8633E0;
	Thu, 17 Aug 2023 11:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33268C433C7;
	Thu, 17 Aug 2023 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692271625;
	bh=CgpyAn4XPo7wawKt8pESyplY/MXDqD/84guw3hcr5BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhzoCu/TUdNQziircJe7kowP+fuoRY5rwZgWkf3X+imWBhowe3cgf/AO8n0jsOlrv
	 4pjwtk0uo3WF6fdwfhkZmrY3I8sQglwJbM3r8eCPhDuoQUX3XOgkIKwZP0GmvpmkD9
	 RJUwmju+2tWM5Vg0zNR6Cjdlc9SKsJwhXFz6hnllUqUvpeZzG/O43RnlyG6A1khasd
	 Lq3roKSj4CfJINjXV42AV83A6gDyMMrdRwXOrSUd29rqtuMrEFLKm87LvGIfGM8aCN
	 oWQUEbmkIT1Ckbps4g2CIMA3xheWkc1lX4YIX30H+5wIA6t4rqjFQipUwP/Uv2EGVx
	 MYCB5Sj1LmZPg==
Date: Thu, 17 Aug 2023 12:26:59 +0100
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-ID: <20230817112659.GA986605@google.com>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <169227059141.987802.3881975345148652106.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <169227059141.987802.3881975345148652106.b4-ty@kernel.org>
Message-ID-Hash: 2EED6OQF7DO46GYBYGB52PAOPIWVL2NY
X-Message-ID-Hash: 2EED6OQF7DO46GYBYGB52PAOPIWVL2NY
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EED6OQF7DO46GYBYGB52PAOPIWVL2NY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023, Lee Jones wrote:

> On Fri, 04 Aug 2023 11:45:56 +0100, Charles Keepax wrote:
> > This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> > SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> > branch.
> > 
> > This series is mostly just a resend keeping pace with the kernel under
> > it, except for a minor fixup in the ASoC stuff.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] soundwire: bus: Allow SoundWire peripherals to register IRQ handlers
>       commit: 89e63e62ad14dbe528257882856c08365e5bb337
> [2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
>       commit: 940cdb69aeb4aa3dde97bd46a5d8422f8a0f1236
> [3/6] mfd: cs42l43: Add support for cs42l43 core driver
>       commit: c4962e013792df36dceacd692fef0f6803517b3f
> [4/6] pinctrl: cs42l43: Add support for the cs42l43
>       commit: df393be615ae61993ac0c32edc13dff27b7e925d

Sent for build-test.  Will submit a PR once all checked out.

-- 
Lee Jones [李琼斯]

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6428D6218
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 14:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9000283E;
	Fri, 31 May 2024 14:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9000283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717159659;
	bh=abiFUaW/IoT5wwmTdvZKLXT6azQhCAp2fplhjmPNpmY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QaY6C88bVjw0yCP1zMVnITa3k68bu1kqYwW/I3IFFn3oDhsldPITP5/sCv6JRuxrR
	 KXGxPdVw4r9iQyXJirH8lzhzZ2esGcCSw7V3nMoLulbrXS3QHUboilzLgLXXHCL2ev
	 uz2oX8oUOZ+210w9EZK9zavLK8yUUNzd7hswF930=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55357F80588; Fri, 31 May 2024 14:47:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BADF804FF;
	Fri, 31 May 2024 14:47:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B860BF8026D; Fri, 31 May 2024 14:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F725F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 14:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F725F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=oYkuGcIQ
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E8E739C096E;
	Fri, 31 May 2024 08:46:56 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id N0Q0BSSbY1Ew; Fri, 31 May 2024 08:46:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1E8009C57BB;
	Fri, 31 May 2024 08:46:56 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1E8009C57BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717159616; bh=WZsGaXJZZy+fsZIWjtMJ5qii2e1R2StcjqgwWGh4rzM=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=oYkuGcIQvuwxk6I666pfXOLWp7nkCgMUkaYIr2KQrs3bgmDsBR79pRVbnu0NEuXK8
	 q1B2ZWcMdTjnepT9d9fsPLgYpVOCHaqsGy83oO81cewL2M1hDBv8Szy8h8yXPcm7YC
	 tBsNPGu3J/wl3rmLcBWP4TTDRJcIzomA8ding+1cAd+wrKQ1eBEEtlt1EeRHwOQLIz
	 sZEKu33lVdIXMbswKBJn+98Sajqt753aE8OXfOeEbtctkIkgY1i19mb+x0kyVAssjK
	 D+vEcjxO1i116xIA3wQZodBgXfjI3joArFzWteHEidTw5afIbLsxqY/5izO0Sv7F56
	 C1tukavT0XWFg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Dx2jCPthSXWX; Fri, 31 May 2024 08:46:55 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D57F99C096E;
	Fri, 31 May 2024 08:46:55 -0400 (EDT)
Date: Fri, 31 May 2024 08:46:55 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound <linux-sound@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: 
 <1660761484.701255.1717159615755.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
 <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with generic
 codec
Thread-Index: fcftgDhNt5MliZw6sGsrnH7v0rWaiA==
Message-ID-Hash: DJGADH6FDQAMO2CELDUFBIEUMWL564LY
X-Message-ID-Hash: DJGADH6FDQAMO2CELDUFBIEUMWL564LY
X-MailFrom: elinor.montmasson@savoirfairelinux.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJGADH6FDQAMO2CELDUFBIEUMWL564LY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Mark Brown" <broonie@kernel.org>
Sent: Friday, 17 May, 2024 13:17:20
> On Fri, May 17, 2024 at 05:05:35AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
>> > On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:
> 
>> >> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
>> >> +		if (!IS_ERR(cpu_sysclk)) {
>> >> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
>> >> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
>> >> +			clk_put(cpu_sysclk);
>> >> +		}
> 
>> > I don't really understand the goal here - this is just reading whatever
>> > frequency happens to be set in the hardware when the driver starts up
>> > which if nothing else seems rather fragile?
> 
>> The driver allow to set the sysclk frequency
>> of the CPU DAI through `priv->cpu_priv.sysclk_freq` when calling
>> `fsl_asoc_card_hw_params()`.
>> Currently it is hard-coded per use-case in the driver.
> 
>> My reasoning was that with a generic codec/compatible, there might
>> be use-cases needing to use this parameter, so I exposed it here via DT.
> 
>> Is it a bad idea to expose this parameter ? This is not a requirement for the
>> driver to work, most of the current compatibles do not use this parameter.
>> It is currently used only for `fsl,imx-audio-cs42888`.
>> In that case I can remove this commit.
> 
> I'm having a hard time connecting your reply here with my comment.  This
> isn't as far as I can see allowing the frequency to be explicitly
> configured, it's just using whatever value happens to be programmed in
> the clock when the driver starts.

In v3 I used parameters `cpu-sysclk-freq-rx/tx` to explicitly
set the frequency.
In its review Rob Herring said that the clock bindings should
be used, so that's why I changed it to use this `cpu_sysclk` clock.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34218C9E57
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E91823;
	Mon, 20 May 2024 15:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E91823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212868;
	bh=qaI1HGeZwQBBafuZfT3T7gHh0pYBlXpnWAg7pywFKjM=;
	h=Date:From:To:In-Reply-To:References:Subject:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQ0sOa9H9PkCwnA6AOWLB/lTvqUSR0ZfvhLH2gMFEwh5XgOqu2SCxPlf0cIZ3dcJX
	 b2WVWxnqt0Chal70rzMhu6lhoPW2pVjj2nxw7FeTSoTshlP1RJRR3QOR498+xQjK6i
	 P07Z6rJWZNwzXtvOHLO39wCHK+CSbQMK2iW3lc1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D611F8067A; Mon, 20 May 2024 15:46:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD0BF8067A;
	Mon, 20 May 2024 15:46:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C1DF805BD; Mon, 20 May 2024 15:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3901FF8028B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3901FF8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=QNEjG5K0
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 68ACA9C57A6;
	Fri, 17 May 2024 05:05:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id j0EVtTFCV_in; Fri, 17 May 2024 05:05:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A809E9C5864;
	Fri, 17 May 2024 05:05:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A809E9C5864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715936738; bh=8SLwMepymaYZWEVQR9qjp1ldhDA0f4QIis7dKy4nHYQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QNEjG5K0CVnFA9ZM/PRvc2Zh6zP52Jks46QB+HzouGEwR8al3i5mGFG0E5hvkLxtW
	 jfJ0SmCrlxlkZjINYMKaDg0MzSgXZF+dWcIR+U5mF1YLwKUQqxSR/rNglVfpOYRRHe
	 Q8j7N0STKjp3oer40wADQ2Z3ri5pzW/8IgB9iMEWVcZtBZvRiCaSlT5SxwyLb18z3l
	 jb4pS4ZMdyOkK+SG2G5CSZn3dOpF0dtrQ4GGm5L2T2yGSMa1QovS+6jG5alPggxGy1
	 bRttWhmsfaminOQaDm/e93JkQ62jvrh3sCo/c3AU/rSd1IcYreNd6bkHhTYfERy/ds
	 epm+dfcegME8w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ydHCeB7dNc_i; Fri, 17 May 2024 05:05:38 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7254F9C57A6;
	Fri, 17 May 2024 05:05:38 -0400 (EDT)
Date: Fri, 17 May 2024 05:05:38 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: 
 <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
 <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Thread-Index: GFI3lOelC49AXb+0LrXDbBRGlEMPdA==
Message-ID-Hash: RFBMNPEFJQGT4BPKCYT473SUXVNT72TV
X-Message-ID-Hash: RFBMNPEFJQGT4BPKCYT473SUXVNT72TV
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, shengjiu wang <shengjiu.wang@gmail.com>,
 Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound <linux-sound@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Mark Brown" <broonie@kernel.org>
Sent: Thursday, 16 May, 2024 14:18:00
> On Wed, May 15, 2024 at 03:54:10PM +0200, Elinor Montmasson wrote:
>> Add new optional DT property "cpu-system-clock-direction-out" to set
>> sysclk direction as "out" for the CPU DAI when using the generic codec.
>> It is set for both Tx and Rx.
>> If not set, the direction is "in".
>> The way the direction value is used is up to the CPU DAI driver
>> implementation.
> 
> This feels like we should be using the clock bindings to specify the
> clock input of whatever is using the output from the SoC, though that's
> a lot more work.

Similarly to patch 7/9, I exposed this parameter because the driver has it, and
because there might be CPU DAIs needing this parameter.
Otherwise the cpu sysclk direction will always be IN as a default.
This parameter could be needed for cases with CPU DAIs, such as an SAI,
which can provide or consume Tx/Rx clocks.
For these devices I know the sysclk direction should correspond to
what was set in the dai format.

This new compatible is intended to be used when there is no codec
device/driver. There is technically no codec device/driver for which
the clock input can be set.

Is it a bad idea to allow setting the cpu sysclk direction only ?
Should the compatible be limited to use-cases where the cpu sysclk
direction cannot be set by the machine driver ?

Best regards,
Elinor Montmasson

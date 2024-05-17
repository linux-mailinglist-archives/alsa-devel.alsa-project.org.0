Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79A8C9E55
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:47:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD155DEE;
	Mon, 20 May 2024 15:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD155DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212828;
	bh=TlQMwSG+/gBY7QDcpZ58FdFlwzxX6d2C5yctN9arRp4=;
	h=Date:From:To:In-Reply-To:References:Subject:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hqZm+XnHB/cbX0Eo77U2Mu/0s7n5NA7cZB0Ky+YkYACnEEiYeVvYXgBfycjuEJRem
	 c0GE1wRgZ7k2wohnQyFk81efUzkYTRjJFuc+1dtJGlyAVG3hLO3Jfb2xv0swH/1sp6
	 IIePx5OqL8JC+iSFAwhvKca+65K+ET9uonOKRoAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B71AEF805EA; Mon, 20 May 2024 15:46:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C17F80615;
	Mon, 20 May 2024 15:46:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B5D5F805BE; Mon, 20 May 2024 15:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39779F80588
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39779F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=oG1T2vdH
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8B8DB9C58EA;
	Fri, 17 May 2024 05:05:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ycSku0e4je0q; Fri, 17 May 2024 05:05:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E1D8D9C591F;
	Fri, 17 May 2024 05:05:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E1D8D9C591F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715936741; bh=cx6CQV5YfxghVjmPjejucL2olCe90bCSbFqa4g71+0M=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=oG1T2vdHJ7olkf/IEQ4rw1h56wPiTy9nafFlLPsGCZwsqEJt/hBQwoXKYfPbmqn2h
	 qZu2NlE4sQ8A4gbFeK5DUxGaN4+8TNLmbIKDfM5+i/QQN7IS+ya2Uh+JmKsmsSkqf5
	 MBGTtuIp7xLTlE+3yW/sFKWA4LY7drC0AoeY8TdAT7jSKPSGqa4jIqgy8pHLsrqkyh
	 yAcrOiTjeSJLLtXbpZhHcSON6ooFo3JQVIidV1+HLSXl00uXRf6t6r0H3XspC0vWKO
	 wEcQ2mrCYmQ0xuC6DEzFord8S+Lfc/I7cQ++SWegOi5kEYBQ0bQ2PDnlLdkJZIuoH9
	 7VWRve/a3Uxng==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id UkPCSXxrdA7W; Fri, 17 May 2024 05:05:41 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id ABB829C58EA;
	Fri, 17 May 2024 05:05:41 -0400 (EDT)
Date: Fri, 17 May 2024 05:05:41 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: 
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic
 codec
Thread-Index: 5nXwooIVrjUMUfEG3TeQl8yJKNJb9Q==
Message-ID-Hash: 2FVCOU6SHPDHPYS7AF4THGNEB7R67IFZ
X-Message-ID-Hash: 2FVCOU6SHPDHPYS7AF4THGNEB7R67IFZ
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
Sent: Thursday, 16 May, 2024 14:11:11
> On Wed, May 15, 2024 at 03:54:11PM +0200, Elinor Montmasson wrote:
> 
>> Add documentation about new dts bindings following new support
>> for compatible "fsl,imx-audio-generic".
> 
>>    audio-codec:
>> -    $ref: /schemas/types.yaml#/definitions/phandle
>> -    description: The phandle of an audio codec
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      The phandle of an audio codec.
>> +      If using the "fsl,imx-audio-generic" compatible, give instead a pair of
>> +      phandles with the spdif_transmitter first (driver SPDIF DIT) and the
>> +      spdif_receiver second (driver SPDIF DIR).
>> +    items:
>> +      maxItems: 1
> 
> This description (and the code) don't feel like they're actually generic
> - they're clearly specific to the bidrectional S/PDIF case.  I'd expect
> something called -generic to cope with single CODECs as well as double,
> and not to have any constraints on what those are.

I proposed, in an reply of the v3 patch series to Krzysztof Kozlowski,
the compatible "fsl,imx-audio-no-codec" instead of "generic".
Krzysztof thought it was too generic, but it would convey more clearly
that it is for cases without codec driver.
Would this other compatible string be more appropriate ?

Best regards,
Elinor Montmasson

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF368C9E59
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536CA93A;
	Mon, 20 May 2024 15:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536CA93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212903;
	bh=Cg9MTPT9tWRh/8PAEQ/0bLqgcKcVgIar/eyWrNXcBzY=;
	h=Date:From:To:In-Reply-To:References:Subject:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HmDq2qVBCrl4Zdm268P3dLbdJz7Xu6NOvkeo7+EQyqg9S7HIOjNAjLqk4/HJYwJXs
	 jqkl4mH6oL2hcp03ebwDLOYTITNIebBUhBm5yB88xm1Cd6z+EMsLe19uEAHYRaQUr7
	 0/hYAsgSQZQS8qLbY6rnrJ2TsxzweJUgiwOk9GUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C945BF806C1; Mon, 20 May 2024 15:46:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A015CF806BC;
	Mon, 20 May 2024 15:46:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 398CDF805BB; Mon, 20 May 2024 15:01:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 94653F805BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94653F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=yJbKu2bb
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BE8889C585F;
	Fri, 17 May 2024 05:05:36 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id OzTJfta_rJ3O; Fri, 17 May 2024 05:05:36 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 157C59C591E;
	Fri, 17 May 2024 05:05:36 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 157C59C591E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715936736; bh=eDu4DXcZYZmRMzTsE23CtiqrrOlfxWxDABDYJj8qWVA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=yJbKu2bbAaZIR1lR4fB9rs8ae78l/ej/Pp4GgndaChfrPjM47VvPNd7mTV47IFukQ
	 X//+44ZJ4DRw9DkSHZQf+v4uy4/XKYtuUAaLvLFOebJCl7icu265xkvxy38LLcQmS7
	 Uyg52oLkXf5YOc/GhiY3eH6K1tqG//Rc45iBqqEkBeuftfDcDzCCis0t5jONcc0Oyu
	 HuRL8xxkCfNNH2TA3XiBbsjIWxvlyZmJi19c0PW2BlDRhMuiH8f3EfoiH8ednXXhWm
	 KV3s2SR/VuND91x4ULBGel4DWWFLJ+utgH1gix+qQFlQ/twAETDwd9o1xrq4N0stDE
	 CWzLmI6/TPfag==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 8CeRVN1p2hdp; Fri, 17 May 2024 05:05:35 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B02AA9C585F;
	Fri, 17 May 2024 05:05:35 -0400 (EDT)
Date: Fri, 17 May 2024 05:05:35 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: 
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with generic
 codec
Thread-Index: iBqosQBSuRfSSp+1CUZcAzEUlctHMQ==
Message-ID-Hash: SCRHQBCQ7TDTJKCETB6DO4UDFVTNRCFT
X-Message-ID-Hash: SCRHQBCQ7TDTJKCETB6DO4UDFVTNRCFT
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
Sent: Thursday, 16 May, 2024 14:13:19
> On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:
> 
>> Add an optional DT clock "cpu_sysclk" to get the CPU DAI system-clock
>> frequency when using the generic codec.
>> It is set for both Tx and Rx.
>> The way the frequency value is used is up to the CPU DAI driver
>> implementation.
> 
>> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
>> +		if (!IS_ERR(cpu_sysclk)) {
>> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
>> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
>> +			clk_put(cpu_sysclk);
>> +		}
> 
> I don't really understand the goal here - this is just reading whatever
> frequency happens to be set in the hardware when the driver starts up
> which if nothing else seems rather fragile?

The driver allow to set the sysclk frequency
of the CPU DAI through `priv->cpu_priv.sysclk_freq` when calling
`fsl_asoc_card_hw_params()`.
Currently it is hard-coded per use-case in the driver.

My reasoning was that with a generic codec/compatible, there might
be use-cases needing to use this parameter, so I exposed it here via DT.

Is it a bad idea to expose this parameter ? This is not a requirement for the
driver to work, most of the current compatibles do not use this parameter.
It is currently used only for `fsl,imx-audio-cs42888`.
In that case I can remove this commit.

Best regards,
Elinor Montmasson

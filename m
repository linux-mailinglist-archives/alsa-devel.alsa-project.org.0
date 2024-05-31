Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EC8D64C9
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 16:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE352E8E;
	Fri, 31 May 2024 16:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE352E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717166960;
	bh=fbwm0L2czEYAPW6jgiLOul/mhTB+DhMoOqJhXVu2zTE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tuui/AyewU/n8u+/SaceTiFxQHBYKUIepkr/kQaTYvG5hx4g6kbOSPXnZB5bqf1Jk
	 NQQ7raIq7TfIl0/ZuscMPuD5xpwssbD5P+H5nAKcnDg58Q7lo4VN4f2NTvaG1fZcZu
	 mldmfR8pfLIFx3CUQyh/cbOo7fYRRvA5urcptmlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B75F805C8; Fri, 31 May 2024 16:48:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F7D8F805C0;
	Fri, 31 May 2024 16:48:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B9F9F80494; Fri, 31 May 2024 16:48:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AB377F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 16:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB377F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=dOdOJWcE
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 36E239C53DB;
	Fri, 31 May 2024 10:48:14 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id OWmkbaQti6vx; Fri, 31 May 2024 10:48:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 328EF9C584C;
	Fri, 31 May 2024 10:48:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 328EF9C584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717166893; bh=4gJOT2TZM2vOr96kCkDrX091SaTjqssoW8NSELgeEzE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=dOdOJWcEsLtRJnvmZHrd7joAl03hH1oLp9K4prLenwv82raBUOBImRW4hxEktPxXA
	 EYyPIxUtmyJFKap11cje6hg71HRxQKTFEn+8oTyaqpLhSw6XWZxobCVOr3RKeAyNtn
	 x6bfE1KhLhAnYzMWhEc/DwzKbfQ6CZQfBckFeP4mRXK/MV0SUpO+GcklsYZTOkb+Kj
	 XL15epmwTYJ2exGvzlIFi0qyvm+CXfbfeb9JdK32vJSszSUNpgKPGzrW/RVr/BK9LU
	 LjYSQyTy1TVR+0E/uNLt0Vox/0OiDrYus5FMBOIThFzilOQk0WOgkuVJgf6kRhLJTK
	 1VeDckfjArpdQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 7DO2Pw_eVkH3; Fri, 31 May 2024 10:48:13 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E7B269C53DB;
	Fri, 31 May 2024 10:48:12 -0400 (EDT)
Date: Fri, 31 May 2024 10:48:12 -0400 (EDT)
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
 <1200863744.706237.1717166892907.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <826f6c22-d1f1-42ce-a8d1-2d5cb894a970@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
 <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
 <1660761484.701255.1717159615755.JavaMail.zimbra@savoirfairelinux.com>
 <826f6c22-d1f1-42ce-a8d1-2d5cb894a970@sirena.org.uk>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with generic
 codec
Thread-Index: KvvrpDg7ywtOAT1UfAfWnw0nFmtERw==
Message-ID-Hash: O3U6XOR5TO5GQYPARTANE5DROR76CL3J
X-Message-ID-Hash: O3U6XOR5TO5GQYPARTANE5DROR76CL3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3U6XOR5TO5GQYPARTANE5DROR76CL3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Mark Brown" <broonie@kernel.org>
Sent: Friday, 31 May, 2024 15:05:28
> On Fri, May 31, 2024 at 08:46:55AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
>> > On Fri, May 17, 2024 at 05:05:35AM -0400, Elinor Montmasson wrote:
>> >> From: "Mark Brown" <broonie@kernel.org>
>> >> > On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:
> 
>> >> >> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
>> >> >> +		if (!IS_ERR(cpu_sysclk)) {
>> >> >> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
>> >> >> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
>> >> >> +			clk_put(cpu_sysclk);
>> >> >> +		}
> 
>> >> > I don't really understand the goal here - this is just reading whatever
>> >> > frequency happens to be set in the hardware when the driver starts up
>> >> > which if nothing else seems rather fragile?
> 
>> >> The driver allow to set the sysclk frequency
>> >> of the CPU DAI through `priv->cpu_priv.sysclk_freq` when calling
>> >> `fsl_asoc_card_hw_params()`.
>> >> Currently it is hard-coded per use-case in the driver.
> 
>> >> My reasoning was that with a generic codec/compatible, there might
>> >> be use-cases needing to use this parameter, so I exposed it here via DT.
>> > 
>> >> Is it a bad idea to expose this parameter ? This is not a requirement for the
>> >> driver to work, most of the current compatibles do not use this parameter.
>> >> It is currently used only for `fsl,imx-audio-cs42888`.
>> >> In that case I can remove this commit.
> 
>> > I'm having a hard time connecting your reply here with my comment.  This
>> > isn't as far as I can see allowing the frequency to be explicitly
>> > configured, it's just using whatever value happens to be programmed in
>> > the clock when the driver starts.
> 
>> In v3 I used parameters `cpu-sysclk-freq-rx/tx` to explicitly
>> set the frequency.
>> In its review Rob Herring said that the clock bindings should
>> be used, so that's why I changed it to use this `cpu_sysclk` clock.
> 
> So you're trying to use this as the audio clock?  There's no code that
> enables the clock which seems worrying, and I'd expect that if the
> device is using it's own clock the device would be querying it directly
> via the clock API rather than this.  This all seems really confused.

It's not specifically the audio clock, I am merely using this
in the machine driver to let the user the possibility
to configure the CPU DAI sysclock frequency.
The CPU DAI and codec drivers already manage their
own clocks.

I agree it is confused, I am trying to expose a driver option
for this generic compatible without really knowing a use case where it
would be needed.
With the S/PDIF it isn't needed, so I should probably remove this commit.

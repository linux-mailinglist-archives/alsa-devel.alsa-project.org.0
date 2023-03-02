Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4636ACADD
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:42:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5732E114E;
	Mon,  6 Mar 2023 18:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5732E114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124519;
	bh=FObMvCDvwMH2KH0SLSHxFlWtOkwCva/S1emt4p7AvOA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kwqgrsy/ZaAEoEDn19q8ZHaLsC6ptD9Dv5xvoH917csGdImVGjfs2arkUq/yxDTlj
	 1Wk2nm4BpEqgRNYTF8h4gxr+EVVxE5JtZE/8Ss4uYNmqbzQfAgLRrCSI7SyhcI6pMc
	 n4Z0Rh0varuNI0xIg76cQ3dnvL1P714ohOvYL4eo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA7DEF80570;
	Mon,  6 Mar 2023 18:38:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B696F80266; Thu,  2 Mar 2023 15:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-14.mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AEE4F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 15:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AEE4F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=BhdP8+r9
Date: Thu, 2 Mar 2023 15:46:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677768403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwol87XDWXqBL/XnmrtGtZtjABgKSyQA6ugkaogEFYY=;
	b=BhdP8+r9QSbtpRZiPRsN2Qey92rHcMc4bJCYEeGLYJZQ3XT/dwlU9qW6ZYJhiPwbbaJXfO
	Jy3AkKN9/IeAX8RxOw8b/c3vSHNpqIT7gJ7vdeTd/NEijOF0466e9JtYbN2bJMSX7CAD4S
	qenb0nX+9WkWKdFs3UDYU9onft5PhF0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Claudiu.Beznea@microchip.com, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] ASoC: maxim,max9867: add "mclk" support
Message-ID: <ZAC20AcKy/O+9DkV@g0hl1n.net>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-3-aa9f7f25db5e@skidata.com>
 <b0a5c0c2-dfbd-460a-af0d-c9d498607d72@sirena.org.uk>
 <61e4485b-9211-fa38-5061-f5861292ddd1@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61e4485b-9211-fa38-5061-f5861292ddd1@microchip.com>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SSY4DHRQG4V4RNSOZCG6T7WGPMKDXJVC
X-Message-ID-Hash: SSY4DHRQG4V4RNSOZCG6T7WGPMKDXJVC
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:45 +0000
CC: broonie@kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, ladis@linux-mips.org, tiwai@suse.com,
 benjamin.bara@skidata.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 richard.leitner@skidata.com, bbara93@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSY4DHRQG4V4RNSOZCG6T7WGPMKDXJVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Claudiu,

On Thu, Mar 02, 2023 at 12:45:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> On 02.03.2023 14:20, Mark Brown wrote:
> >> +	max9867->mclk = devm_clk_get(&i2c->dev, "mclk");
> >> +	if (IS_ERR(max9867->mclk))
> >> +		return PTR_ERR(max9867->mclk);
> >> +	ret = clk_prepare_enable(max9867->mclk);
> >> +	if (ret < 0)
> >> +		dev_err(&i2c->dev, "Failed to enable MCLK: %d\n", ret);
> >> +
> > Nothing ever disables the clock - we need a disable in the remove path
> > at least.
> 
> I don't have the full context of this patch but this diff seems a good
> candidate for devm_clk_get_enabled().

Thanks for that pointer, but currently we are thinking of prepare_enable
the clock in SND_SOC_BIAS_ON and disable_unprepare it in SND_SOC_BIAS_OFF
(similar to wm8731.c).
Therefore probe() will only do a devm_clk_get().

Claudiu, Rob: Will this be an acceptable solution?

regards;rl

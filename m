Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C916ACAD8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:41:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02AA21148;
	Mon,  6 Mar 2023 18:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02AA21148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124474;
	bh=sVdZcAMMU1pp37zbXlyAkpW1ZICsPwIolSPJsPbvJwo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KdyPFmtykWjodAEOmPJBNySG+5bWkzl/nNL/w8zqKZiq4qt6v1CHS4S+8Ktivw6+f
	 +QSNJLfVdXeAVj9a1hZVCGPkB8aKHT0AW/mPMVWptNSPb5pbFBT7uW1MS3CPRsNHrP
	 ZebNCgCw9JV0ys9dkpVbvzjujrT5Q7Mn+fFkf98o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20FF1F80552;
	Mon,  6 Mar 2023 18:38:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE129F80266; Thu,  2 Mar 2023 13:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-47.mta0.migadu.com (out-47.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE16DF800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 13:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE16DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=kkaqAPLJ
Date: Thu, 2 Mar 2023 13:45:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677761152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NPpn9lnE9VN46m7Kz9u5WpXlX7L7nN99uIr6gXUSh8=;
	b=kkaqAPLJxMlF5jBJFTUgdiZbbOF8VbSmmAy0Y2OOaabuY0Mt67pKg+p1NiZdVukSscLx5j
	p9lz5GTqXUhiS2fEdyRU0I+oZtD/aj5UxRScNqBPjTYPvOW/3qQHdPH6yEg1kqd0tmeB6g
	GQu3l/NhZIl7D4tJFN3vYJFcdut4Wek=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ASoC: maxim,max9867: add "mclk" support
Message-ID: <ZACafglBa201CUUd@g0hl1n.net>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-3-aa9f7f25db5e@skidata.com>
 <b0a5c0c2-dfbd-460a-af0d-c9d498607d72@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0a5c0c2-dfbd-460a-af0d-c9d498607d72@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UULTRP3JTCG3TWEJZNVYTJS2EBBQ7EWI
X-Message-ID-Hash: UULTRP3JTCG3TWEJZNVYTJS2EBBQ7EWI
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:44 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UULTRP3JTCG3TWEJZNVYTJS2EBBQ7EWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 02, 2023 at 12:20:18PM +0000, Mark Brown wrote:
> On Thu, Mar 02, 2023 at 12:55:03PM +0100, richard.leitner@linux.dev wrote:
> 
> > +	max9867->mclk = devm_clk_get(&i2c->dev, "mclk");
> > +	if (IS_ERR(max9867->mclk))
> > +		return PTR_ERR(max9867->mclk);
> > +	ret = clk_prepare_enable(max9867->mclk);
> > +	if (ret < 0)
> > +		dev_err(&i2c->dev, "Failed to enable MCLK: %d\n", ret);
> > +
> 
> Nothing ever disables the clock - we need a disable in the remove path
> at least.

Sure. Sorry for missing that. I will send a v2 later today.

regards;rl


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76860557864
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BAB41A99;
	Thu, 23 Jun 2022 13:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BAB41A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982374;
	bh=EmZrjDwbJ58i17TdgQV/RnmjbfNBufD+xGSwTnWVswE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muAwXAMNTltmXYHwQXWLT6aqTLB89V9dnaAlGupLuDRUB/IXlRa91n3b9N7Q0DeAb
	 miJlNhoZkUgRxPMkgMk53b345zz1Tr6YFBtyIKDytyuYXHJ9BELqkiH+w2cK516+C7
	 XrXeSQGHLyL+1r7TzSBcpBSfYS4qBLGCUX99CQbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C89F8053A;
	Thu, 23 Jun 2022 13:04:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5356DF800CB; Thu, 23 Jun 2022 08:34:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C025F800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 08:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C025F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="gLr8uomm"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0FE0C22238;
 Thu, 23 Jun 2022 08:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1655966037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hqT3t9Tm1nHT+lm/Z7bA4ua6B2+Df9ZImv68DzG6Cg=;
 b=gLr8uommdreGXgmHHPEAnlD2V7ZqXD+HjpWMY60yABfR2LiAwJttn58T4mgdZWF8yaTFoO
 Ztwj3TjCMxBHr9bVbv+IY/mIbndMk+qO5ZfdsvxerVc1cUNDiDe0MzU76fy1X6Dn6tsBRk
 m0mVgDT5ADN7M/cXMQupFJ/mN+Rict8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 23 Jun 2022 08:33:53 +0200
From: Michael Walle <michael@walle.cc>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH 39/49] gpio: sl28cpld: replace irqchip mask_invert with
 unmask_base
In-Reply-To: <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <37dd70a5e9779a86b4455817df0c87df@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:19 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 jernej.skrabec@gmail.com, cw00.choi@samsung.com, wens@csie.org,
 agross@kernel.org, orsonzhai@gmail.com, linux-sunxi@lists.linux.dev,
 b.zolnierkie@samsung.com, linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, tglx@linutronix.de,
 cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
 rjones@gateworks.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 zhang.lyra@gmail.com, baolin.wang7@gmail.com, mazziesaccount@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am 2022-06-20 22:06, schrieb Aidan MacDonald:
> An inverted mask register can be described more directly
> as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Reviewed-by: Michael Walle <michael@walle.cc>

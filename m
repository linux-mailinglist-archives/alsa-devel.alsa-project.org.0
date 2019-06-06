Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D9B368B4
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 02:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E280950;
	Thu,  6 Jun 2019 02:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E280950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559780317;
	bh=uFciYS9lMV2C3wg0UaL4gEYYmjtVHV1IRpVttfWVOis=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqH7ntohpeRyxEqJBxKCArxd7P629uQ6rm1Zs9Z95SdHgjhY4q/X93vWt0IXCx65N
	 NFFKDUf6KHSOzH4bqcFbNLN62b4vsNoY271TRGdoTcETLZFJVYFG2wXCtQDkLiLTsp
	 EMNjKZqjCD3aWGblsRctTw52S5yBqzolOZnOT+Ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D00F896ED;
	Thu,  6 Jun 2019 02:16:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77370F896DD; Thu,  6 Jun 2019 02:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A61ACF8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 02:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A61ACF8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ay6RwqsM"
Received: by mail-pg1-x542.google.com with SMTP id s27so265859pgl.2
 for <alsa-devel@alsa-project.org>; Wed, 05 Jun 2019 17:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cK/gGt5PDimlIevfbs8g1ARiYxKpO3It4jGHeUdOAXQ=;
 b=Ay6RwqsM05DNTHbEStXHw3SHZKFvhBkjCx8hE4XKG0cWnEjcpqh9Jb33U70NaQK5P5
 JRB8pq/Yv1iSxEVJIdwTFVeT956CEFAyRS+KdKadsqMAOE1dxxx+kkZc0J6ibY/EiQyk
 T9Y5dPWUBdYx++K6X+6MKeB2LVaUPXV+C4qmTvSoXFCUYIy/2stW9i01QSf95M6u7QZS
 yOWMQZbN/65Ot9oZZLwrgeVSLMaOpkZZHSFhYVwnf0bi9BYjcCMKc2jmCZTqpbWUoaaD
 hN0xLeFv976DkIpB+bXcUTrk7gNaxhhJrKKpNfMfJZGgFogEMT2CIntoAluVsBdoA8Xi
 m6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cK/gGt5PDimlIevfbs8g1ARiYxKpO3It4jGHeUdOAXQ=;
 b=g7q4+mEgWoxCSGNz95cNdyBJ2Y4a0AW9INvFVd85s3Gl6c4/Ttwun1rngzcZ79cKCG
 P73nW/DNivVUf1lV9GvNdERsWXOLCwxr9LtLxXfX7pGgX1iMGvhg2m3YrC6zfyzk8lLW
 1kY7QvTpxDO4EoGHrTx7gLs/9aWkjzE3VyQ9QgHIY+UaJcL91mpG9oLpGJ8JB5Kp6yc8
 +CqOn3lE03Rn8nGJ2yTYRT+/sfEZHcFIunotrlR/xrOibM27C3MMCO4VakFEwtbC9qb/
 TxpGo5EWDANdo0UvxF09zRLpJ8VOhxa52b7wZYYJdmhXVQ1DTGeYR6mEXP+OTzZPAal3
 3IXA==
X-Gm-Message-State: APjAAAWx2agSzQJsN3Ya8cbrdBNIfl1vdf6iVSf0Ov3wZDYKXwf8FerZ
 yBLYx96tC8B8/SzTyevmPT0=
X-Google-Smtp-Source: APXvYqxwKRXiNuveG7RIUpRL8Y8GH4zg3HqUKLfaIlbElDmZUZU2dbjjzlJ33UBzpFgTEcuhwJbeAA==
X-Received: by 2002:a17:90a:338e:: with SMTP id
 n14mr46596229pjb.35.1559780204786; 
 Wed, 05 Jun 2019 17:16:44 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 10sm93476pfh.179.2019.06.05.17.16.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 17:16:44 -0700 (PDT)
Date: Wed, 5 Jun 2019 17:16:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190606001644.GA20103@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB6479D7512EDE1217228033CAE3160@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479D7512EDE1217228033CAE3160@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: fix the channel swap issue
	after xrun
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Shengjiu,

On Wed, Jun 05, 2019 at 10:29:37AM +0000, S.j. Wang wrote:
> > > ETDR is not volatile,  if we mark it is volatile, is it correct?
> > 
> > Well, you have a point -- it might not be ideally true, but it sounds like a
> > correct fix to me according to this comments.
> > 
> > We can wait for Mark's comments or just send a patch to the mail list for
> > review.
> 
> I test this patch, we don't need to reset the FIFO, and regcache_sync didn't
> Write the ETDR even the EDTR is not volatile.  This fault maybe caused by

The fsl_esai driver uses FLAT type cache so regcache_sync() would
go through regcache_default_sync() that would bypass cache sync at
the regcache_reg_needs_sync() check when the cached register value
matches its default value: in case of ETDR who has a default value
0x0, it'd just "continue" without doing that _regmap_write() when
the cached value equals to 0x0.

> Legacy, in the beginning we add this patch in internal branch, there maybe
> Something cause this issue, but now can't reproduced. 

The "legacy" case might happen to have two mismatched ETDR values
between the cached value and default 0x0. And I am worried it may
appear once again someday.

So I feel we still need to change ETDR to volatile type. And for
your question "ETDR is not volatile,  if we mark it is volatile,
is it correct?", I double checked the definition of volatile_reg,
and it says:
 * @volatile_reg: Optional callback returning true if the register
 *		  value can't be cached. If this field is NULL but

So it seems correct to me then, as the "volatile" should be also
transcribed as "non-cacheable".

Thanks
Nicolin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

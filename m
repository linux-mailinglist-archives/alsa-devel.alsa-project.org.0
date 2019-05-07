Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9C16DC9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 01:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26853181C;
	Wed,  8 May 2019 01:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26853181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557270874;
	bh=EP+aDFoSE+jPbNxY9hRLpuoJPznhGyWbKIgzFz6k3cc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8Z+RPzQ44k4ku9ntyHrnpSHozgit36K5llfDuS0eCj8ywMsVFwogEyko/I6LYe47
	 QJi+WPSIId6BNSQLNH4b2xBK7M2MormE+/eydZT1+/onA1eF3Q+D02MsmPtq/Ib/kP
	 E1QAS8NUedYyP3lgHNkfxNXEubIWWzJXsm4hRipk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D7DF89674;
	Wed,  8 May 2019 01:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57623F89673; Wed,  8 May 2019 01:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8220BF89671
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 01:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8220BF89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WudCQKf1"
Received: by mail-pg1-x543.google.com with SMTP id c13so9071108pgt.1
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 16:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tWjHfDmr6zfr6uEFNgoTwl3QSdpsHDKdbL7emu6+I7o=;
 b=WudCQKf19/mQ7OgzsTY0vSgIImKPxFoM+sLFaezbTXhZSZsHqHy/pa6pV7OSMAj4dS
 z3ly6js80G0ExrYvBa72ezekQM9t8P1HTXKJdAQNCk/7pNEJ2PA7nnmAlCYPpCNRffWe
 XQgdvbtSATNbm1b0KOFkF1oGs1Casxn/XmLj3tHNnUkq5BmnpWiiT4iu7b/rJg7EnKaE
 hzXDpYYsvIMN6SajuJDlOT9wYLQzI5SpQt3lKsHfWwvLcMZkk0+J7WN4+YAV1rGD0lZz
 UuYEMtjmWp/wj9DYwiG6MoX52ZbZ5niZ3Jlhn/bUqUUMiz1JL2fmIRweGvJMdG2mUMgG
 oDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tWjHfDmr6zfr6uEFNgoTwl3QSdpsHDKdbL7emu6+I7o=;
 b=FNdYroqPHhIAVwEf/kUD/D+yRwXQ1mVutVDFfEH4AWWbkj24VT7HOBotsODueNjJP3
 knntysnbijVH/X92sV6vz18jFObWmuYCfis6h5oU+pAJQDrhGmG+VJf5xnjhrkctfZko
 eqz0+3xU6czSr9DkZLfRxg6kUAsnT5L8IRVV8Nnf5EVSX9KhCwSQrR4WOUwefSrQncMg
 g/MTXFUc3RqGBrF+mvpZRsAxe+a+1PA/7qamAr9YrrHOISe7xW5X7RCEzXSFfieEItV7
 rOlurndt+vLnJJ3Fbtg5TFm9V3AoQJZex8cg+g4OwcOupMuq/CSBVHpsibfIV59yIUXy
 6Jcw==
X-Gm-Message-State: APjAAAVcJsbjLqUjjbO0EWXbBwkmbPkdUdiqS2V25MSU3CVlftZ3IFKd
 cqCzW6zE86+Nb0Mfppurtdo=
X-Google-Smtp-Source: APXvYqyV4BvuDtnxbZwvhHc6+bHTU8WcX0OlbIakNQEfaZpg7WJRgZytOsIoQ08/5s95SNQG3ij7CA==
X-Received: by 2002:a63:7d0a:: with SMTP id y10mr42516704pgc.292.1557270760058; 
 Tue, 07 May 2019 16:12:40 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a9sm728073pgw.72.2019.05.07.16.12.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 16:12:39 -0700 (PDT)
Date: Tue, 7 May 2019 16:11:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190507231108.GA22188@Asurada-Nvidia.nvidia.com>
References: <20190507140632.15996-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507140632.15996-1-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [RESEND PATCH v3] ASoC: fsl_sai: Move clock
 operation to PM runtime
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

On Tue, May 07, 2019 at 02:06:52PM +0000, Daniel Baluta wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Turn off/on clocks when device enters suspend/resume. This
> can help saving power.
> 
> As a further optimization, we turn off/on mclk only when SAI
> is in master mode because otherwise mclk is externally provided.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Viorel Suman <viorel.suman@nxp.com>
  
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

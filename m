Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D1523578
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 16:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620C11A7D;
	Wed, 11 May 2022 16:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620C11A7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652279352;
	bh=I9vGeFJi5v7ksxvFEo5+MO2yt1A/jE0rU1SS+JkUmtQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YXqJKG/3aDgZLKXs79BtK/0KYxo+u9wwGtWJB0lBrwhWecxaho7uA60aJ1bwUJ6Em
	 yNTmA4n8WsESxPwtB7efjCCiaZv95xee80On7K13XM2dSPqepXNesb5rmXyXodRDOe
	 HJs9qR8DWN/mPAXef8A7OOT771IPVrMIM5d/bGb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0DA9F80116;
	Wed, 11 May 2022 16:28:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A9DF8015B; Wed, 11 May 2022 16:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F28F80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 16:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F28F80116
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so2965368fac.12
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 07:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l5hfI95nGKptfm8+V5D6k5JgCAeWViIYLBqO5SQ8AOg=;
 b=V0tTRBtbGobpwSwBcAWAc44okMmOkW63Ciq9zQFvs61j2CQ+ZAnmcHGm+S3o2RIG4e
 /4wLs3e8mlEGbDbQsLc5q4jgdnTwFNalCDDfYKxvdxvDNR8wXY7mwPqK7WAhP7fIq4wG
 nMPV0noAzkp1LS0XQhEqqOuoUWKkRR63hnAckQAmmK9XkABCxYzgXIP0qjK7oJzm8eWK
 Hj8lbRAnFLxHlRVkSHzznL4KVmmTglIK5jsVsXeNbtOr7OTekBVm/PKd8MyWaLURuwAb
 AMkeKKrPhjpBMDwsvHPp6nOJLtdeCFPwnxtqCqAll+ltZBZWv0NW6akvp2SAurvVTkm0
 F2TQ==
X-Gm-Message-State: AOAM531gVTdrlnaytcZDZexSXhJNcOFrQ5zNFtd26AOu0Qgb09WiQhz5
 7a2vkvFxgZX/J4dCWXmVOg==
X-Google-Smtp-Source: ABdhPJwx6Qb8tL87ntfzUHzEzTkhI+b4g11lzmWoqGBuzVTYMC1eKnagTBy0+lyWuayExf/sakpdXw==
X-Received: by 2002:a05:6870:14d6:b0:ed:ed86:9040 with SMTP id
 l22-20020a05687014d600b000eded869040mr2918700oab.199.1652279282580; 
 Wed, 11 May 2022 07:28:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j18-20020a4a9452000000b0035eb4e5a6c3sm967857ooi.25.2022.05.11.07.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:28:02 -0700 (PDT)
Received: (nullmailer pid 259228 invoked by uid 1000);
 Wed, 11 May 2022 14:28:01 -0000
Date: Wed, 11 May 2022 09:28:01 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Kaehn <kaehndan@gmail.com>
Subject: Re: [PATCH v7 2/2] Add generic serial MIDI driver using serial bus API
Message-ID: <20220511142801.GA236225-robh@kernel.org>
References: <20220509145933.1161526-1-kaehndan@gmail.com>
 <20220509145933.1161526-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509145933.1161526-3-kaehndan@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, May 09, 2022 at 09:59:33AM -0500, Daniel Kaehn wrote:
> Generic serial MIDI driver adding support for using serial devices
> compatible with the serial bus as raw MIDI devices, allowing using
> additional serial devices not compatible with the existing
> serial-u16550 driver. Supports only setting standard serial baudrates on
> the underlying serial device; however, the underlying serial device can
> be configured so that a requested 38.4 kBaud is actually the standard MIDI
> 31.25 kBaud. Supports DeviceTree configuration.
> 
> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> ---
>  sound/drivers/Kconfig          |  18 ++
>  sound/drivers/Makefile         |   2 +
>  sound/drivers/serial-generic.c | 374 +++++++++++++++++++++++++++++++++
>  3 files changed, 394 insertions(+)
>  create mode 100644 sound/drivers/serial-generic.c

Reviewed-by: Rob Herring <robh@kernel.org>

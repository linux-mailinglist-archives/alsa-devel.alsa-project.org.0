Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D45A6E67
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 22:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07666169F;
	Tue, 30 Aug 2022 22:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07666169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661890970;
	bh=qy3BSCRQWusJ0fdj3tXME6kuIMj0gQrExCDjvPY/rQE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ieSKWQFlB1/ARXrjyKWnEfNd44auBpqNsEjxtlkQqFrUzRINE0fyb3uLBMxZd2Pjy
	 APwRz7vf9AAV0AxAc+MyDcy3IPQ78Duj0cn0Jv9zOYuONgpYRdOW5oDXehNLxcR2gH
	 qRkGyxIjPI7bFKiR2erqYDHzBwCBxd8NBzUpMrC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D463F8032B;
	Tue, 30 Aug 2022 22:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBAE0F8023A; Tue, 30 Aug 2022 22:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DE4FF800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 22:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE4FF800AA
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so19478302fac.12
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 13:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2tyLQ7GgQ7cU0EriSVKtmoSifiTo/6SrJqVFTq/hnxw=;
 b=LpOfI7bI6v28QPfAJ4Vmq7buJaybc+6jENcheyuRWuGMy2CV9Im5eem3GdRMDToBrn
 dM4uSx37uQWcQGX7uS0l3WYIN67b46kMgXezhOAlNVlTtqJD2n/DjWqnNoi9hovCGH1u
 g6jTwIVuVFm5bUazYP0tNvtIpKbqAfuVrDK98pHyIMgQLRM5rf6BuMOi9W+MSYRTbzT5
 TGJnhGHv/Z0AHIrxQDazqwnS0O6Y3qsK0BnaWJeL2lP5vKrSvSefunz22bPuaoIDfoSb
 gWkR6+VLibRpiyMy7UCwW5SrZgZdXY3WrccFsOI9xA1/7HXu/+hUu8s7NAd4Oulm0dzW
 TvUw==
X-Gm-Message-State: ACgBeo2ylUG/gZIs8LhdKcQhWLvRsXjUgwq8fzwcU7i9TXkuSLDfpio8
 RoNaVSZ0Xk7jcFZZ3wHCFw==
X-Google-Smtp-Source: AA6agR6HuMDDMBl8fxMMpCdo+i8bkLLrwppph0RJ8mnZ4NZ/88KXQaC55sfyOQUDPpoYEd6YDe4AFg==
X-Received: by 2002:a05:6870:45a1:b0:10b:8ee3:b3bd with SMTP id
 y33-20020a05687045a100b0010b8ee3b3bdmr10542409oao.9.1661890898375; 
 Tue, 30 Aug 2022 13:21:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t5-20020a4ab585000000b00448aff53822sm7100164ooo.40.2022.08.30.13.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 13:21:37 -0700 (PDT)
Received: (nullmailer pid 1996275 invoked by uid 1000);
 Tue, 30 Aug 2022 20:21:36 -0000
Date: Tue, 30 Aug 2022 15:21:36 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: max98396: Document data
 monitor properties
Message-ID: <20220830202136.GA1996212-robh@kernel.org>
References: <20220826085927.2336224-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826085927.2336224-1-daniel@zonque.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 ryan.lee.analog@gmail.com, robh+dt@kernel.org
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

On Fri, 26 Aug 2022 10:59:26 +0200, Daniel Mack wrote:
> This device features a data monitor that puts the device in software reset
> upon a configurable set of events.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
> v1 -> v2: fix a typo and remove a stray blank line
> v2 -> v3: Rename device tree properties, drop $ref for standard unit suffix properties
> 
>  .../bindings/sound/adi,max98396.yaml          | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

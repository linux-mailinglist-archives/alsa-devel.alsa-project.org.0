Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13554AF4C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 13:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58FD174A;
	Tue, 14 Jun 2022 13:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58FD174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655206125;
	bh=Ph+TeqUgL1lm0WJUl1j6mtDLIHZYOZd+hMJ2hwJPJ1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cSr3NEW8cNub7CPHVVt0I9VxJMiG7WQGSIobVVeXB48MfBnKdIHdwBXylZyz9jXPj
	 p+XWQm2nuFLGN9wwNX42XCyK890qHptWd0CES37Kic2BJJDVz9Zzf6D38KJOChhrd5
	 9O55USljuxIsWJgy0Ekl6tH0E5GD2Z7ez61sprNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4105FF800E1;
	Tue, 14 Jun 2022 13:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76EF4F80139; Tue, 14 Jun 2022 13:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 361FBF8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 13:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 361FBF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qTuHeZTL"
Received: by mail-ed1-x52f.google.com with SMTP id b8so11133433edj.11
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ph+TeqUgL1lm0WJUl1j6mtDLIHZYOZd+hMJ2hwJPJ1o=;
 b=qTuHeZTLmMq3jvfmytQ706f1oEr964PZB4oN6WBOcjzVCWbyxrGvFEYq50kvJBQBRc
 ZD7dIw0K13qSia6MxbWKhSFOSb3dEaFNZNYOIHkWNKHWptwV0zBn/VsMsPCvbW6EHQd6
 V7hjA2tl7aM3ChqCOoQrmzYTuj5obPKI6g6OLoNx9NI/C79pLEgrXH6axeAHUsCayG+f
 5levcJFvgj8/s1RHneBl+hrkSHLnjImXF3tQkjSCtdSt2XCOt9wCRAk+BzC0jGjCV3f7
 5h4kPnJQaLBRDfEVr6FH2QEeZKUxaL7SlZW4sVyfcuf4wiEbq8ysWb0WJ9S7o77gBtbY
 Aeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ph+TeqUgL1lm0WJUl1j6mtDLIHZYOZd+hMJ2hwJPJ1o=;
 b=eU/DWNsyBEaYzl/xU5WaNXVuYjrBxm+A5Kv3PDv6GRA6Tr7+okm2dpRSgBFpiyKp68
 us3XkYtlvkEp/+utkCRge1o2pxpyzwjn7/DV27r/amyUAY/LCwMUh92XEF+XvlcNBR8s
 sB8FGmkb3iRQsWT3ld2c7aNyG4xm7vyyJ+7T85zturATOXXNHxu0a9/BMrX1re2WMPiT
 s3bF8pL4mIC8iuUWI13O1/UKsYcxy2By7q1PtvP22yYPuTDisk4mMZCxImoW2Tu2Dmob
 YLeOFB1O+7tvyU1mf3m67ewk+B/XXmGkmdWw776b9gxPKcXTex1EjZyj81MXxsVQEtwj
 RR+g==
X-Gm-Message-State: AJIora9ZYNAJQUDWvsqzwIHEZkZgaiiYll/QQgNFKEqHErdfbJTlp/Jn
 LY9gbHmEwO2YlCLvah8rX2c0gYQRk5ZuV8Kx1Hw=
X-Google-Smtp-Source: AGRyM1vfZ0JYnIzqOV2YYs2V9VppoNybSpBd2EyUGbTSfHHdR2dHfu9G1jn5mU+scJi1UyrRSiGAFJPM4H2V+RMuBuA=
X-Received: by 2002:a05:6402:1cc2:b0:434:f631:d7f3 with SMTP id
 ds2-20020a0564021cc200b00434f631d7f3mr5368000edb.171.1655206055241; Tue, 14
 Jun 2022 04:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220614101546.1559434-1-s.hauer@pengutronix.de>
In-Reply-To: <20220614101546.1559434-1-s.hauer@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Jun 2022 08:27:26 -0300
Message-ID: <CAOMZO5D0JmudCLKh72pcwXhtfciGTDJev8yys8P4H1BWEO_BnA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fully initialize structs
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <kernel@pengutronix.de>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

Hi Sascha,

On Tue, Jun 14, 2022 at 7:15 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> The driver uses two statically ininitialized struct dma_slave_config,
> but only one of them is initialized to zero. Initialize config_be to
> zero as well to make sure that no fields are filled with random values.
> Let the compiler do this instead of explicitly calling memset() which
> makes it easier to read.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

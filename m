Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E101A38F29
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 17:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD3C1661;
	Fri,  7 Jun 2019 17:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD3C1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559921647;
	bh=FYX0TjGRkju56YHG14sh8xZd2kCRKulA2qz5CrSln0c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ubd9er2uR9yDXorcv5VbzKLZBmeeXUGR0Ypefg7DuI0z3aWAOJIPjexjCabQcpWDh
	 iJij9WHgZaZ1kjVQ5NebwoO+42m99McgB5gRow1k/uaNPA2Phhf0KY1xbB67fI/xrO
	 h4LGXZkSlQrpG8nM1p0CbfR+eHI0Fm7LCwBTQQLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EAAF896DD;
	Fri,  7 Jun 2019 17:32:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F17FF896DD; Fri,  7 Jun 2019 17:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F22A5F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 17:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F22A5F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="c9AVefrV"
Received: by mail-ot1-x343.google.com with SMTP id p4so2253493oti.0
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RiCAYMeO+A7bsPx/+hgB7b6SKPexKeC2tbDhDeDQUaM=;
 b=c9AVefrVXC//LjQYtyx4dOnLm2OEEJ7Fv3XzVTNOxqOqgqNkck3JXyJMqAqWe8BLCX
 IjQLJhR8rKEYLixBAfOf+TT3b2+o3gXLLT+PPCoLfDTO3ZoI4+2g1tloffWFkliR7N6E
 uVHEHUcb5CWEJr0qCvT7wixOtWUIURW3p1h5CY4G+ZDE8ND0SsZQ8HbUSLPq+LMSKVyX
 y4XnC3zay0ekJRQM5NtrZG9uaCeHP/JiQld+iYks7hkrab0AU9VEu+W6vohmi9sflHAm
 qk2Tkf63bAaCUBDr8CjXyzUZ9d8oCf7n7XAVAGuncsJi9VbMmGzKHqV2pU37kV2rX2fr
 TNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RiCAYMeO+A7bsPx/+hgB7b6SKPexKeC2tbDhDeDQUaM=;
 b=m9vS4kgdFTuLj1GHB/4RYoce7q+jJqRE2nkmZKagYJeg7yB+qYmS+q5UQsdiI225qW
 GAciOL8ppmFz2YElfx3eW3upXHUUilxzEtNJ+x/Os7LOjHjb4yIH53WCIFkzOYhjr61Y
 2sisA2VZQ4MUu1YC5wJHpVuJ0FJLMW4yZnGe27AoKfuHb2JYuAOU4wkKwGPEUDyd5ibz
 lSRk4ymb1TQz12WRnb8rSbvkqunX0QtXOzIJXQK4F24JoPvgK3qi5Coj8EjItQA0YH8t
 WDMt21/2WCv0C1SQQ/SJcuXb8urWY3Zkh2kv0Nr/ClaBbfR8tcWd5A+mFN4vJe//wdfX
 dm2g==
X-Gm-Message-State: APjAAAXL7sOmchecf1L69EkV8jBEwa1cjb24ONOBNlFulqb9o6pFHOQw
 RwKGBFzfy7rPIwhrkqPOQl6n4N5Dy+/B0tmAOVBciw==
X-Google-Smtp-Source: APXvYqxWDdBwyrOYFn8YqwR53+lIj5+7RLdoR5n0czhOkd7gwOlH5lB6YdOzz9RHZafDiIAbsgnu5d8htCo4Yk/9egU=
X-Received: by 2002:a9d:4f02:: with SMTP id d2mr2737659otl.328.1559921534355; 
 Fri, 07 Jun 2019 08:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <CAOMZO5A=zi_6OtjwWXJcbHn+AKz3SvmKgQrSemd6qWjAePuqXQ@mail.gmail.com>
In-Reply-To: <CAOMZO5A=zi_6OtjwWXJcbHn+AKz3SvmKgQrSemd6qWjAePuqXQ@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 7 Jun 2019 23:32:02 +0800
Message-ID: <CA+Px+wVQ_MWL6wnycqxksD2K4iJ7OfQ3vCbBYrp86W0s_E5vKQ@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 000/146] ASoC: modern dai_link style
	support
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

On Fri, Jun 7, 2019 at 9:23 PM Fabio Estevam <festevam@gmail.com> wrote:
> We are seeing kernel crash in today's linux-next and it looks like it
> is related to this series:
> https://storage.kernelci.org/next/master/next-20190607/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/boot-imx53-qsrb.html
The kernel crash is caused by a merge conflict was not resolved
correctly.  See this series
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150747.html
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

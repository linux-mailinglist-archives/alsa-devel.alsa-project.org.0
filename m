Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAA3F943A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 08:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3307F16D5;
	Fri, 27 Aug 2021 08:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3307F16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630044976;
	bh=06U7WlKDfLudC8lliZ4jcC1t5yh0ujLxtLLI7dU4Pes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l/iK5YNtqCDUe86hs+0aNDrdudeoM8rB71BITtM4V9nN/k8UTHUGNjxgtiEB2hTZy
	 dtfm5ilx+EVyvJ2O5UFypRQjQKOZVhuEtPDoCmsy9S22WZropFkTt1pa78DjdCLBBA
	 e//QxNFiWql7fKO1NVL8kYLL7RExDK74Yr+cgyBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE31F80129;
	Fri, 27 Aug 2021 08:14:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4ECBF80129; Fri, 27 Aug 2021 08:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A20F800EE
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 08:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A20F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NHZ1G+5i"
Received: by mail-qt1-x831.google.com with SMTP id s32so4540869qtc.12
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6wH6VQ81UagFZrBDuQfg5acAy2kFwSXlQ1BsRDUlyk=;
 b=NHZ1G+5iMYP+XgOXH5UWH9rl5MgrCTsw24zUz0jzVVBz+Xmrufgkm+tVgv6ucD2UWG
 S74VU3T8byNcrBZ2G9VlqPDsKNIlVcW/r7j+CkdQxc+++4BXjItHwYo0t3ILCKB/wnAp
 CEKmr9AqAKKl9+MtHquG8IriOb8ywV+JJXsBmM4iUSnhM+hUfB9rj8osl8FsghWTCPB0
 Ed0v7eB71ig5k51ZQTX8nfHtVuy+Qq6tE+lYQcDGYTg2vpU35rphOC1jKOIDR2H4eiDT
 x2wJV28v4xylCa/M7SwI2380goxX5k+D7RH3VvD14mxt3AKl2gBkdxxTn6eiGYI3K//B
 0PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6wH6VQ81UagFZrBDuQfg5acAy2kFwSXlQ1BsRDUlyk=;
 b=rd4gvOglQwZ5kveTP08xC2LsGlb130PSNmKhpv/kqJH3pMgNwnRFm6fahFGEeXRY/A
 TZAC1eRSBZoQYOB1iuLBQqptUdp8K9GKsQo3/QI1rhGxVvPGL9CFlGTf3aYXOy1VWUv8
 MmPHlgWvozP+LIC/EprVUwY7O4AtqRwGixUsL1rfFa1+qtW/0nDO4SetdRhZ9isF5VjT
 PU+Mtr3IN1xaeOsHJqlwc0e+RgHn237m5HmCSI9b2ToByoZwJuHzK/ExUarXXX1xwHn/
 +ZKAxkiNze84wsfkhXKAGnGhnuG+wzCFbmnzCHWjPKM/wkr8ILCSyfd5HG7sWx7tINX4
 a3Gw==
X-Gm-Message-State: AOAM530d3rfJH9wELtZAHDT4bBuoviE7g1OysEd4digORRkXxeHa+isL
 bWx1VGob/T/GmWHW2tnR51JRUGktm1p3yw+eZkg=
X-Google-Smtp-Source: ABdhPJyrAdL7K8XPjqcwtnfWW1RsdpvIxn2uSbruNkxA69ge/iKoWUvnFJynkt+EtCBZhj7XUF4HWM80qKarwD1AKt8=
X-Received: by 2002:ac8:5805:: with SMTP id g5mr6951210qtg.360.1630044880150; 
 Thu, 26 Aug 2021 23:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <1629975460-17990-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5BCsTMjJJPtLN6_seVcWb24A2ms11FP3HzR0i7t3GLSuA@mail.gmail.com>
In-Reply-To: <CAOMZO5BCsTMjJJPtLN6_seVcWb24A2ms11FP3HzR0i7t3GLSuA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Aug 2021 14:14:29 +0800
Message-ID: <CAA+D8AOTAL9H8mr819v9VTQmJvNyKjnRNGPOX64LekjvXXGEcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_rpmsg: add soc specific data structure
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Thu, Aug 26, 2021 at 7:54 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Thu, Aug 26, 2021 at 8:19 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > +       rpmsg->soc_data = of_device_get_match_data(&pdev->dev);
> > +       if (rpmsg->soc_data) {
>
> This check is not necessary, because rpmsg->soc_data is always non-NULL.
>
> Other than that:
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks, I will update in v2.

Best regards
wang shengjiu

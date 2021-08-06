Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 783273E2F76
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 20:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED81A16C2;
	Fri,  6 Aug 2021 20:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED81A16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628275678;
	bh=oAVC0k8WGSbGkKP+o+xceOlJxnllsw5yXvL4gjncCwE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jldtOq3BonXZE1ljTDxVbttp0xEuCGMdTjG656Mupsp84fdmestQhGZf+g5qv7GGk
	 /rSuALQ9Dx6VoRDbnA+k3G2YvSUHcfZlXoneTYdq+sGGPAj2EUbf1dLa37vDSrJ5ht
	 0+/zOe1y2Fx4fXi8giOWVqqlEqlZDi9OyRFSN6Js=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFD1F80268;
	Fri,  6 Aug 2021 20:46:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C17AF8025F; Fri,  6 Aug 2021 20:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40833F80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 20:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40833F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oPU85Ks4"
Received: by mail-pj1-x102a.google.com with SMTP id j1so18021404pjv.3
 for <alsa-devel@alsa-project.org>; Fri, 06 Aug 2021 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lq+ZJabFR/aEqAVLWWQwRS+Bk30mmVgINsLo2QOd63g=;
 b=oPU85Ks4t/BD97TfUEBxq2w8KeO5d4b1Nvchn+Yv7kB9wyq/mf6St5MBYsxebm3xyK
 2TryVrMzKvdFR8lsNpJJvPTGVD4xpl+ayOSVdJa9rxZqEG8whTlQ9VyP8dlNEQrJJob9
 L1GJYfPOIitMNMopL09Z+xctxoFgA0e1jTOj55Hexm/8/2DIwLeTuQql2G/TkU9C3erd
 aqjtHdqEda9mrydWw7Nl7tQlscqzQhgaTkh3FsV8iPW0Y607/KxDgxiwjF79JrWcFsfS
 nD/+RPX0BYNASPKwyYxj4WgS75i+bpNHRnG/mqXLAaY3TvvGXIOmp2cf1T5bSsVeRVnR
 2OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lq+ZJabFR/aEqAVLWWQwRS+Bk30mmVgINsLo2QOd63g=;
 b=Erz8oiHQKFxqqkon6SN5VSKqwA9sZdvqv0tQwTVsqveVc0waoNHLNwrpS3vfUamXdy
 TfclSjbpE/LWBeK+7yGbWuZVF3jspejskJJiL9FknrJgTtmfx0MbiBe6aD3L27uj70C8
 oCqQMxhV3F+o8ERfPL0FJWFEpHaCFRjnD/TI41F6mXmg87BJZEX/0kAmbaeQjB6v8acq
 gRiafx4+JUNu7JCQphTnT0svlHw6yIjXJEvDrzi4/IaekOrc5fHeaidwtCY8NLOKt2li
 kScJEWalOS6LtoMvKoK7obKqoFrA8mF4IitkmLoO8Bv6NfhuhBKzRNX+J+D5tQmkctHP
 LmDw==
X-Gm-Message-State: AOAM53090++ayr/3+0GGcH3j/av1R+vSY6qvQyOdv5DqIj6oIN92fr92
 8ixE60eORpsphV3mYlFlsGM=
X-Google-Smtp-Source: ABdhPJzzMFSdpyMOk7GztnyuZ8fgTAmGVjar/iMG55IOe92tbJufWKgnV6AdQl2ufQFq5C/G1yNdUw==
X-Received: by 2002:a62:8f86:0:b029:32e:33d7:998b with SMTP id
 n128-20020a628f860000b029032e33d7998bmr12215091pfd.64.1628275577437; 
 Fri, 06 Aug 2021 11:46:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:8873:2b2a:719c:18c7])
 by smtp.gmail.com with ESMTPSA id jz24sm10017062pjb.9.2021.08.06.11.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 11:46:16 -0700 (PDT)
Date: Fri, 6 Aug 2021 11:46:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] parisc: Make struct parisc_driver::remove() return void
Message-ID: <YQ2DdZG2tQuzM22U@google.com>
References: <20210806093938.1950990-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210806093938.1950990-1-u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Corey Minyard <minyard@acm.org>, linux-scsi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Takashi Iwai <tiwai@suse.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Jiri Slaby <jirislaby@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

On Fri, Aug 06, 2021 at 11:39:38AM +0200, Uwe Kleine-König wrote:
> The caller of this function (parisc_driver_remove() in
> arch/parisc/kernel/drivers.c) ignores the return value, so better don't
> return any value at all to not wake wrong expectations in driver authors.
> 
> The only function that could return a non-zero value before was
> ipmi_parisc_remove() which returns the return value of
> ipmi_si_remove_by_dev(). Make this function return void, too, as for all
> other callers the value is ignored, too.
> 
> Also fold in a small checkpatch fix for:
> 
> WARNING: Unnecessary space before function pointer arguments
> +	void (*remove) (struct parisc_device *dev);
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

...

>  drivers/input/keyboard/hilkbd.c          | 4 +---
>  drivers/input/serio/gscps2.c             | 3 +--

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF9E84E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 19:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82AA2166B;
	Mon, 29 Apr 2019 19:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82AA2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556557454;
	bh=SaOlnQNTc2SizaUziSYQWehSwCnHid4q0GIC69j2Bek=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7Beu+JHgS9WiSl2bHTyJvYej5D+5eltT2bZ/jHVquGQ6j78Z/o7BnHLz1YRk3dEr
	 ixTb77cHhTmKJ2zIyhcIuCYJylCxH/l0FIgFnIb8z+76/kHsKx+cb/e7uW+Xvc1qM3
	 1oke40i62i0akRuQAVNT58jQyhx1qJA4l7C+UN0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2EDF80C41;
	Mon, 29 Apr 2019 19:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38143F80CAB; Mon, 29 Apr 2019 19:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC96F80C0D
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 19:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC96F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="s2AGHwV0"
Received: by mail-it1-x144.google.com with SMTP id z4so142798itc.3
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 10:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wL3BmO/NnA3NwafXMitsQjGpheHu4M8s6Xt8v0Jomo0=;
 b=s2AGHwV0MIipVuKm522AGWItowSBGgqT99tWc8KzjL140BVwLf0BNLJtwKT41jWXNL
 Ukof9nce0Cq6pB0k4RT6l+JJckq6LDo7dqUTee6F4HyesQwlrL6FccvupQpguUqjGpNE
 1LBkfc1FShajkH5kEmAjl9yf5FfYh/FTohBDK2bup5Dt8ctFaMV91kmiluhGT6lwpsIL
 XNYRY1uDKflHGrH3ShCan7broKF2mwu9hB3Nri6Yuhib2DH1pqwGFDg425K6uze853HA
 YqRV8YWIdZh09HQ/zO2TrNYOfMHz1jkmWpxyVCVGrCB7tP4XVQzYSYBc/qRxDOruKlp+
 OUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wL3BmO/NnA3NwafXMitsQjGpheHu4M8s6Xt8v0Jomo0=;
 b=k/l6Vp3ypAkTJ9hteke0BVGyDOQruXnYNEC/ndBkbQEJvDHZDDpbONw4AIOcdUHoGu
 d1mzuwafb9QghhVpNl7J8+Gs+003DyeP4KMGDJRfDDO2MCP5kunfRiUJ6KusEYGktrI5
 eszw8gVgmFEpTsbBFM4R6rnR2GUiduSGgLUcrcn0lGVl8alac6T7ZIaOdGXg1MvNbSTW
 tFTSgEWP3J9iBdDyiKVuR1MnqNZakYXwJUaeS+S/d51PA+G/OJkHOIe6v+5qE5ubmocZ
 MYj6cwTO4wPiNllicw0qAu2LAnCvak8L8J7EW1nuV08TOTyWHYtE1WDodf1+Mt5EjaAY
 I4aQ==
X-Gm-Message-State: APjAAAX0Duz3hkYGo+YtnBpipUZTKQPt6rNrKCVIRKoQYaTWhSCYfXBx
 eI1nQ74OrTMqqoVNpN2CHzNayQ==
X-Google-Smtp-Source: APXvYqyy2Hy85tx6UOgrLCUuzqKRridrK87+eM70gRZqlE4r2DrU+rLIsbBcQp9QFi70TYGENQj11w==
X-Received: by 2002:a24:3602:: with SMTP id l2mr85415itl.68.1556557342335;
 Mon, 29 Apr 2019 10:02:22 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id w2sm9289032iot.33.2019.04.29.10.02.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Apr 2019 10:02:21 -0700 (PDT)
Date: Mon, 29 Apr 2019 11:02:19 -0600
From: Ross Zwisler <zwisler@google.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190429170219.GA89435@google.com>
References: <20190426164740.211139-1-zwisler@google.com>
 <0b030b85-00c8-2e35-3064-bb764aaff0f6@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b030b85-00c8-2e35-3064-bb764aaff0f6@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: avoid Oops if DMA setup fails
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

On Fri, Apr 26, 2019 at 04:03:47PM -0500, Pierre-Louis Bossart wrote:
> On 4/26/19 11:47 AM, Ross Zwisler wrote:
> > Currently in sst_dsp_new() if we get an error return from sst_dma_new()
> > we just print an error message and then still complete the function
> > successfully.  This means that we are trying to run without sst->dma
> > properly set up, which will result in NULL pointer dereference when
> > sst->dma is later used.  This was happening for me in
> > sst_dsp_dma_get_channel():
> > 
> >          struct sst_dma *dma = dsp->dma;
> > 	...
> >          dma->ch = dma_request_channel(mask, dma_chan_filter, dsp);
> > 
> > This resulted in:
> > 
> >     BUG: unable to handle kernel NULL pointer dereference at 0000000000000018
> >     IP: sst_dsp_dma_get_channel+0x4f/0x125 [snd_soc_sst_firmware]
> > 
> > Fix this by adding proper error handling for the case where we fail to
> > set up DMA.
> > 
> > Signed-off-by: Ross Zwisler <zwisler@google.com>
> > Cc: stable@vger.kernel.org
> > ---
> >   sound/soc/intel/common/sst-firmware.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
> > index 1e067504b6043..9be3a793a55e3 100644
> > --- a/sound/soc/intel/common/sst-firmware.c
> > +++ b/sound/soc/intel/common/sst-firmware.c
> > @@ -1251,11 +1251,15 @@ struct sst_dsp *sst_dsp_new(struct device *dev,
> >   		goto irq_err;
> >   	err = sst_dma_new(sst);
> > -	if (err)
> > +	if (err)  {
> >   		dev_warn(dev, "sst_dma_new failed %d\n", err);
> > +		goto dma_err;
> > +	}
> 
> Thanks for the patch.
> The fix looks correct, but does it make sense to keep a dev_warn() here?
> Should it be changed to dev_err() instead since as you mentioned it's fatal
> to keep going.
> Also you may want to mention in the commit message that this should only
> impact Broadwell and maybe the legacy Baytrail driver. IIRC we don't use the
> DMAs in other cases.

Sure, I'll address both of these in a v2.  Thank you for the quick review.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

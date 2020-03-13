Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F01841D5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 08:55:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6A7617AE;
	Fri, 13 Mar 2020 08:54:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6A7617AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584086136;
	bh=02M3P2Zxs5dVvaBf5blffcFjm6XvmTXJxXybLj3CmlU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4cIqsrcf3VPxHNbTUNx2rv5fs+XIdqUK2HLEaEKtBOPz/4jzE+h8ms7L8vlU1ofo
	 QX3TpQejzRuh97FpmSW6hfs8Q2mUO/o5pYsZG81+bhfdJ04U7gEI2dRIYwkxOT5Rs4
	 TzsLelU3cd3zpN57qmT48sWKLxyzUhglGXDKWKIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B48E5F80086;
	Fri, 13 Mar 2020 08:53:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EDC4F801EB; Fri, 13 Mar 2020 08:53:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F8B1F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 08:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F8B1F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pGZ8jwdB"
Received: from localhost (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6D3B206FA;
 Fri, 13 Mar 2020 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584086008;
 bh=02M3P2Zxs5dVvaBf5blffcFjm6XvmTXJxXybLj3CmlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pGZ8jwdBNbCtcx1eXL+kgMOZksL+1pN8+mn/JdKV+ybcymsKKqRJQRCJ73n75yfCm
 C92zfrJDEOeV6hpOSLDUh1PxEakVm1+JFcaoDpC+a34RHAfCUUkbBLYSVmPfsCjfP+
 J36sEn1WBdc7pFXNGB/tSGdYErOaN9z1ycPNlJRw=
Date: Fri, 13 Mar 2020 13:23:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/9] ALSA: compress: add wma codec profiles
Message-ID: <20200313075324.GA4885@vkoul-mobl>
References: <20200313070847.1464977-1-vkoul@kernel.org>
 <20200313070847.1464977-2-vkoul@kernel.org>
 <s5h36ac67nl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h36ac67nl.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

On 13-03-20, 08:22, Takashi Iwai wrote:
> On Fri, 13 Mar 2020 08:08:39 +0100,
> Vinod Koul wrote:
> > 
> > Some codec profiles were missing for WMA, like WMA9/10 lossless and
> > wma10 pro, so add these profiles
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  include/uapi/sound/compress_params.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> > index 9c96fb0e4d90..634daa354b58 100644
> > --- a/include/uapi/sound/compress_params.h
> > +++ b/include/uapi/sound/compress_params.h
> > @@ -142,6 +142,9 @@
> >  #define SND_AUDIOPROFILE_WMA8                ((__u32) 0x00000002)
> >  #define SND_AUDIOPROFILE_WMA9                ((__u32) 0x00000004)
> >  #define SND_AUDIOPROFILE_WMA10               ((__u32) 0x00000008)
> > +#define SND_AUDIOPROFILE_WMA9_PRO            ((__u32) 0x00000010)
> > +#define SND_AUDIOPROFILE_WMA9_LOSSLESS       ((__u32) 0x00000011)
> > +#define SND_AUDIOPROFILE_WMA10_LOSSLESS      ((__u32) 0x00000012)
> 
> Are the profiles are bit flags, or they are just enums?
> All other definitions are set as if bit flags.

Yup, sorry missed that, will revise

Thanks
-- 
~Vinod

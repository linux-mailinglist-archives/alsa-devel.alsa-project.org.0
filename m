Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C31511838
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E22A1779;
	Wed, 27 Apr 2022 15:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E22A1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651065690;
	bh=XDe+XvtfaY3DZ7iJJp0mSXr95MI1siViaC4waGME9wA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7fWC9o3d0xI3gKW2mWaWGGQ7McPn242X4QaHDfA8GFFn5+EObVnhEuDYpIS8r9Z1
	 dDQZDJ0veorg2PXFt+HYj2zIaBMSHzU7+oXiL6JT/dW/Zd/wMFcIGVw7jOnsa7XPqE
	 aXuoCIPwoSqGlKWSslzDfgIHw8E6WYV/7m6Vtk+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D817CF800AE;
	Wed, 27 Apr 2022 15:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0013F8016E; Wed, 27 Apr 2022 15:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D7C2F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7C2F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZTz6GlKW"
Received: by mail-pj1-x1031.google.com with SMTP id r9so1463719pjo.5
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c7DPeLpObMz8uAx4tNccMIEknuX16kyYxUEMSjcUokY=;
 b=ZTz6GlKWx4OWFLmQGgmGi0OXxasXdApZGJ5/9iMtSKjE4lEcuOzXGf9lMx5TW40jPh
 8ggrWluRHYRVKU2T7rGFMfdp/naxHPZCOaAXCDKpx6DP5Ij5s9xkT3q3ekKxXAmiy7rR
 NW1AX+br0rG1q74hV9NuwzfrPKOL8+vcurz/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c7DPeLpObMz8uAx4tNccMIEknuX16kyYxUEMSjcUokY=;
 b=AGGMqV8fVqZTpKW+918QV68WleKneskCmomxVYPC189X2l5kgYG50LpvrDhGj64vzp
 bpiGMWG85ryiX5Dntg0xzVLZ6o2NvkU5kjqdzZTnYGPuQGN1Hm9p0Z0H5pqJ7dpAp9i0
 sfyCa0Y0r/t+rysabGDiu6IW49HdsqvYY1CkjkQq9KO4pbL2bdYk6UNzVnK/XvoRMMoY
 u7OAxaDWDp2TTtYJsGrWkkHjmEXatqnA6uXzvMxOVSpRwmzLNEqyrssQZ+LaNv1vl+dp
 ZNqaPPlhvw6XUCwxIswUSDQ0SiQ8oZqBaZmLIxjGq+EPMLLJHseYjOAcx1GXJ8Yk+RmH
 Vyag==
X-Gm-Message-State: AOAM532VIzH6ZtdphgM4Hzc81HoI8lPZcZds5aLZgqAJOyKdlbv0OO/A
 aopskDLOBAXUirY8OxGX9J7QYg==
X-Google-Smtp-Source: ABdhPJxMPnNVI9dtxIn8MsDodyuAz2KYqhDLpDYmYX4Vw6NtmJmddqrc6uUJs1e5HKu1TTU2KQ3FZw==
X-Received: by 2002:a17:903:300b:b0:15c:b49b:6647 with SMTP id
 o11-20020a170903300b00b0015cb49b6647mr25371967pla.90.1651065622705; 
 Wed, 27 Apr 2022 06:20:22 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090a760d00b001cd4989ff70sm2926283pjk.55.2022.04.27.06.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:20:22 -0700 (PDT)
Date: Wed, 27 Apr 2022 22:20:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmlDEY960ypq/QHH@google.com>
References: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
 <YmlBgsQtrayqK0P6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmlBgsQtrayqK0P6@google.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On (22/04/27 22:13), Sergey Senozhatsky wrote:
> > @@ -784,16 +785,26 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
> >  		}
> >  
> >  		cdata = wdata[i].control->ipc_control_data;
> > -		wdata[i].pdata = cdata->data;
> > -		if (!wdata[i].pdata)
> > -			return -EINVAL;
> >  
> >  		/* make sure data is valid - data can be updated at runtime */
> 
> A silly nit: does this comment belong to SOF_ABI_MAGIC check below?

I mean something like this?

---
 
 		cdata = wdata[i].control->ipc_control_data;
 
-		/* make sure data is valid - data can be updated at runtime */
 		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
+			/*
+			 * make sure data is valid - data can be updated at
+			 * runtime
+			 */
 			if (cdata->data->magic != SOF_ABI_MAGIC)
 				return -EINVAL;
 

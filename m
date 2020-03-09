Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EEC17EB15
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 22:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABAC61674;
	Mon,  9 Mar 2020 22:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABAC61674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583788859;
	bh=GmasEzlCCOSZKRf3M6eRgmE+AaIssJFMZotQZJdCjK0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXqpqyZDcKUUDWIgZ+79DsI1HBfTf2Xm/Y2sEZIwnE5kiVgfE7xXGbQkv11eNUKk8
	 zpXlgftnyTu2vqWd6k9V0WacMAXhC/VsAJ3M6kci/YZ3ocNmcXz9+j1LAIXA0HMU7z
	 nnV90/F+mn4QTr92N23MgXhrpDUczi76480y7AjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A76B1F8021D;
	Mon,  9 Mar 2020 22:19:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E72E0F801F8; Mon,  9 Mar 2020 22:19:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE18AF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 22:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE18AF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pbO7fa9h"
Received: by mail-pg1-x543.google.com with SMTP id b1so5285866pgm.8
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CSeop4EP+cHMLCfdhjpEDfNo8WqTVWutCfl/33ROm+Q=;
 b=pbO7fa9huNww+H4GhUCnFSIZbuh3Sf/rqL+W+gTUIf64t4U2IixcH4BPbnCSE8qcFS
 UFQeQYt3s3zs0VatDi9JjRoQ89980G7DbXdtTb6Xv+TFK984PRq8TwylqphaXkExjt9e
 Xz5NNdc5nN8xwtUgWFNoCG93FRrBhJ+/l9IckYff3HQvEitnWoNN14NCKsfJ2OD9gS4W
 k+FppLDxkIPBUWhYWJxUiM8VHQ73wgCCs51Fniu84mN3YqmRggft2jiivrPTxzEEvtdq
 Ui+ObyGCQmX3LzvkIZNhar5QHwGH5uWiu5+IlvyBg1k+SwlLEZI4g9HVM7oMwISqFxyo
 6law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CSeop4EP+cHMLCfdhjpEDfNo8WqTVWutCfl/33ROm+Q=;
 b=ggyYknpEGn5a8Ju+uCVO0EwmW4YXaxuH+ts8dpZzTOe2QRzjbh7J4G5Hh0s/Ivie5g
 T4Mp9A0qG+7yJBgFAUn3HeYfCfdLnmvXfxUZkR/b+yB6HGLPaOw5/MLWft0lN8k1orrH
 HRFfKZ1VrpMiiNkbKywTxMcdK6ndY594L14ysR+o2flIIliD0tFZu2VGtOrcGSG8as+B
 uXCMQzycW4JR50bi6DAkg3sv3IOA/S6iQoaXv/SrKRh4czA5hVntDpMSZs/NiWNVJ7tZ
 Mw487lIS+5ilieXpfXRncnRCT9HA1KYRo84h5QLuoLHAGFQqfT8QoBvPOn3tYt3qvHjq
 9Kow==
X-Gm-Message-State: ANhLgQ3M9Sn9/8KrSJhk7dcG2zXWi4XLJc66KPPQx/WvPKNVYz4mBVlr
 kUOGnq+XnW/NgTGGeYQlMy4=
X-Google-Smtp-Source: ADFU+vsg7KizeYcWAnahiuG5JhDpW4TK4b4no2mIFhQ7Xz1jVWgPmRVkedECb5+Or6RlRlgKY30Ong==
X-Received: by 2002:a63:8f17:: with SMTP id n23mr19033927pgd.161.1583788776473; 
 Mon, 09 Mar 2020 14:19:36 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d10sm448423pjc.34.2020.03.09.14.19.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 14:19:35 -0700 (PDT)
Date: Mon, 9 Mar 2020 14:19:44 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
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

On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> In order to support new EASRC and simplify the code structure,
> We decide to share the common structure between them. This bring
> a problem that EASRC accept format directly from devicetree, but
> ASRC accept width from devicetree.
> 
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, then driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index cb9a25165503..780455cf7f71 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -51,6 +51,11 @@ Optional properties:
>  			  will be in use as default. Otherwise, the big endian
>  			  mode will be in use for all the device registers.
>  
> +   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
> +			  Ends, which can replace the fsl,asrc-width.
> +			  The value is SNDRV_PCM_FORMAT_S16_LE, or
> +			  SNDRV_PCM_FORMAT_S24_LE

I am still holding the concern at the DT binding of this format,
as it uses values from ASoC header file instead of a dt-binding
header file -- not sure if we can do this. Let's wait for Rob's
comments.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A28841CD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 03:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E851673;
	Wed,  7 Aug 2019 03:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E851673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565142533;
	bh=D0pp7Wrzs+sruqAw2m3xg0xMiPokTFY0+BcHCtJb73s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpeElXkRVTVZ5z1lVxrqW7xdB8fIXjZ7DpCwDKmy/9FG4UD5VFrf2Pf+SWO6lknID
	 zJd4Lq6MAEKc+tT57pfr5fs45KbmfAPJ3x7hoD0SBxPB7IVgseuOCp+2KOapoY+Aot
	 olaaykgMJckWe059UqpprvdpJGPS1a0qOfnUjl/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9289F80290;
	Wed,  7 Aug 2019 03:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0485F80483; Wed,  7 Aug 2019 03:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A42AF800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 03:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A42AF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WFTUI9Ri"
Received: by mail-pf1-x441.google.com with SMTP id 19so42493552pfa.4
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 18:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Edh1s2+Hz0JvWJr5X8N4ASrf1QiKcSFMMDMTTyV4qrI=;
 b=WFTUI9Rik4s7rXx4cO7m45CIyjoVkafBvHO/YsjRKbDPMoSfV8ZUbL2i1/BYT0xSn8
 QloGiMApvuVHF8wOpxJvalYyEkEars2YRjoTUD3Dwzodi6U6OV5gE6M51IqNFtMMZycv
 hWVffE1TBXS+N/RGa+hPiM+70KEeZVFzsQKFvY0eLaLGV9Up7sB9XTpilX2XRgER7Hja
 JTZidlrZ61rIylwhcDewSR+6bkR1N+PCf/Lond9BAQdzKVNgHy8CEhP43R+hrqTAm9o6
 dkVYQ11a5mwrvTbmB9FUoq21dY7Ou95siHu7afyBFs8yc+LG/BoOfkXadDR/sTkACn4x
 iDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Edh1s2+Hz0JvWJr5X8N4ASrf1QiKcSFMMDMTTyV4qrI=;
 b=BeHccef7u1Pu+62u8svQWbKSrAwFoaqYV5eZouonY4k+MFS75U2/9r8+9oUctgyxkk
 d8JhgShd79BhEfCTzRnl4xIKViHam14qGM+dpmJ/2t2vlyqQ3GTYWbShlBL1pqBll94l
 cLwYfpPxPs5bEeoJqpIGCxVXxmZbXmeoevJNsB8GuA4/89ki9CCYM5Ww6mVaoJzvtMfW
 1SEgzgxBoEOK1oyZ5mpPaUUYs6xeS9ZZNdHyLOASGQhn3h9aO056LBY6lEUAU4SVtsiR
 EKx5rZl0Ca25Lf3OG/KyVwBEh2Ear+qYd8+Xf/f7FmB0J0Sr4A4hh0O3fx9yIMNgvvni
 OiFQ==
X-Gm-Message-State: APjAAAUs2/QUY1FoE+YAIYXn5+aIN9HhwKwqsWyh0b4IfZNLSJ1buHtS
 AJGaohVjjqt1Xnj6E+y2ako=
X-Google-Smtp-Source: APXvYqz0y6FnZKy0wvbDLBt46tymafR+AbNRcHSbRCLBxC27KsBM3Wa8A16eke7Tm8rYHNLD9NfUKA==
X-Received: by 2002:a65:60cd:: with SMTP id r13mr5719740pgv.315.1565141980407; 
 Tue, 06 Aug 2019 18:39:40 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w4sm110141105pfn.144.2019.08.06.18.39.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 18:39:40 -0700 (PDT)
Date: Tue, 6 Aug 2019 18:40:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190807014035.GF8938@Asurada-Nvidia.nvidia.com>
References: <20190806151214.6783-1-daniel.baluta@nxp.com>
 <20190806151214.6783-4-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806151214.6783-4-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, Mihai Serban <mihai.serban@nxp.com>, festevam@gmail.com,
 mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v3 3/5] ASoC: fsl_sai: Add support for SAI
	new version
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

On Tue, Aug 06, 2019 at 06:12:12PM +0300, Daniel Baluta wrote:
> New IP version introduces Version ID and Parameter registers
> and optionally added Timestamp feature.
> 
> VERID and PARAM registers are placed at the top of registers
> address space and some registers are shifted according to
> the following table:
> 
> Tx/Rx data registers and Tx/Rx FIFO registers keep their
> addresses, all other registers are shifted by 8.
> 
> SAI Memory map is described in chapter 13.10.4.1.1 I2S Memory map
> of the Reference Manual [1].
> 
> In order to make as less changes as possible we attach an offset
> to each register offset to each changed register definition. The
> offset is read from each board private data.
> 
> [1]https://cache.nxp.com/secured/assets/documents/en/reference-manual/IMX8MDQLQRM.pdf?__gda__=1563728701_38bea7f0f726472cc675cb141b91bec7&fileExt=.pdf
> 
> Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
> [initial coding in the NXP internal tree]
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> [bugfixing and cleanups]
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> [adapted to linux-next]

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

One small request that we can do with a separate patch later:

>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
>  	unsigned int fifo_depth;
> +	unsigned int reg_offset;
>  };

I think we need a list of comments for the structure defines.
It might be okay for the old two entries but reg_offset isn't
that explicit any more.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

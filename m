Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23379587099
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 20:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C9F84A;
	Mon,  1 Aug 2022 20:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C9F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659380010;
	bh=b+A+RcXPIZ8XVyhQk2X1hcXBl0z+FLYiaBCWW4RjasY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XnbMOAX5UcfTUY12Do0Zz5dc2/nbHXORTpqgb3Alm8ZwcWiinjsJz5Nd1L/2keWOi
	 Wbax51DhQw0OR1pmzgyErCnbEyC/kwAiB10HkOCCJ9KOSfkLhYSpwoWQpoG8l3iyT0
	 9CcNJYh+JLz4WLHf3SGhAB5iuTa24cuP2pOi41t0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D748F80139;
	Mon,  1 Aug 2022 20:52:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1ADDF8023B; Mon,  1 Aug 2022 20:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEAB3F80139
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 20:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEAB3F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YXzk9twu"
Received: by mail-lj1-x22b.google.com with SMTP id v7so5667660ljh.5
 for <alsa-devel@alsa-project.org>; Mon, 01 Aug 2022 11:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=XodWKtMN07V4P1gDY998vleQ9dB+naH4EgPf6/fTaf8=;
 b=YXzk9twu9VI3vnWbgBkmcsoloEmgmYakx4wv+qH0kId5dId3Rce4U1IhtxddjCyvb4
 Za6fegzrfV4CkVq4QgXqn3ieluMuLVSIUxqv8ts6cLF0TZOwTvDpCA0J46cJi48fyE0s
 xfhtXPuGKV7f7myskDTFkecPpfb9oF95rF+mVlMGwh6n/ontfF9mRPi/4l7YMPj6Lx3Y
 QQ426BnUhfe9m6ekbUkrRJ2l3jZinhbO3mNiEqg8bjib3tRMB6hDO72i8ilPYpRXcgip
 FVAfuTF5bBNNRM0zYzNd5xsOpoPToE69/ksdbvlOx7TIFgSaSjfSfmcQO6k+/maKHxRS
 GFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=XodWKtMN07V4P1gDY998vleQ9dB+naH4EgPf6/fTaf8=;
 b=bY/NswG6qOZriyfvdSjtXFcHS8byD44S6jvucO8/0qTzSYYgIaRkw/GNVBvhpm1xzr
 1uq5zulcm06wUeOog373bi5rthYzbPIW0gMJr+8/0qYkUxAxyI1L60EbFWEU34FY4M2w
 6s/zXxLRQHDFc58bcaK5BMfkV/G5f/OXcFFKj4ScAsbLLxBR08dwDsx++Qj/i2ub0sYi
 0P7GbdmBT9u+oS0HwSwx2te5Q0V51uy6WOJBO/f0yn/pXwg4GvDATP/SPWCW2wMiJQfi
 2hWWIdT3XXHE7/3qlPPj5nJaOPeYOAyEGCK6v3bX6fNjc2xO++TL3KIHyDfYSiOIfmKM
 FeyQ==
X-Gm-Message-State: ACgBeo2pv8J910gftv8PBM3+5CPuRHsoopPYootG/APfQw7XEIv2JFJW
 FsQcJFrlUQhAKv4OJTkvksA=
X-Google-Smtp-Source: AA6agR7eGf9EPRJ45CCnoeqWBppiY90ZNEtax7jq7hkG2xbUJKsoUKeVlqM0BPO2PYM5CqhkdZyVBA==
X-Received: by 2002:a05:651c:10a4:b0:25e:48ee:33f5 with SMTP id
 k4-20020a05651c10a400b0025e48ee33f5mr3619243ljn.297.1659379940581; 
 Mon, 01 Aug 2022 11:52:20 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 p20-20020a2eba14000000b0025ddad51e48sm1599550lja.140.2022.08.01.11.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:52:19 -0700 (PDT)
Message-ID: <4b9855a8-7132-74b0-1573-a775713d8041@gmail.com>
Date: Mon, 1 Aug 2022 21:54:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] ASoC: omap: Replace sprintf() with sysfs_emit()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220801170108.26340-1-tiwai@suse.de>
 <20220801170108.26340-9-tiwai@suse.de>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220801170108.26340-9-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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



On 01/08/2022 20:01, Takashi Iwai wrote:
> For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
> instead of the raw sprintf() & co.  This patch replaces the open code
> with new helpers, sysfs_emit() and sysfs_emit_at(), with the proper
> string offset.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/ti/omap-mcbsp-st.c | 6 +++---
>  sound/soc/ti/omap-mcbsp.c    | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
> index 7e8179cae92e..8163f453bf36 100644
> --- a/sound/soc/ti/omap-mcbsp-st.c
> +++ b/sound/soc/ti/omap-mcbsp-st.c
> @@ -244,10 +244,10 @@ static ssize_t st_taps_show(struct device *dev,
>  
>  	spin_lock_irq(&mcbsp->lock);
>  	for (i = 0; i < st_data->nr_taps; i++)
> -		status += sprintf(&buf[status], (i ? ", %d" : "%d"),
> -				  st_data->taps[i]);
> +		status += sysfs_emit_at(buf, status, (i ? ", %d" : "%d"),
> +					st_data->taps[i]);
>  	if (i)
> -		status += sprintf(&buf[status], "\n");
> +		status += sysfs_emit_at(buf, status, "\n");
>  	spin_unlock_irq(&mcbsp->lock);
>  
>  	return status;
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index c4ac1f30b9fe..0b377bb7737f 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -517,7 +517,7 @@ static ssize_t prop##_show(struct device *dev,				\
>  {									\
>  	struct omap_mcbsp *mcbsp = dev_get_drvdata(dev);		\
>  									\
> -	return sprintf(buf, "%u\n", mcbsp->prop);			\
> +	return sysfs_emit(buf, "%u\n", mcbsp->prop);			\
>  }									\
>  									\
>  static ssize_t prop##_store(struct device *dev,				\
> @@ -560,11 +560,11 @@ static ssize_t dma_op_mode_show(struct device *dev,
>  
>  	for (s = &dma_op_modes[i]; i < ARRAY_SIZE(dma_op_modes); s++, i++) {
>  		if (dma_op_mode == i)
> -			len += sprintf(buf + len, "[%s] ", *s);
> +			len += sysfs_emit_at(buf, len, "[%s] ", *s);
>  		else
> -			len += sprintf(buf + len, "%s ", *s);
> +			len += sysfs_emit_at(buf, len, "%s ", *s);
>  	}
> -	len += sprintf(buf + len, "\n");
> +	len += sysfs_emit_at(buf, len, "\n");
>  
>  	return len;
>  }

-- 
Péter

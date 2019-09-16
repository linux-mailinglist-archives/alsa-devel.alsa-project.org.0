Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB93B447A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 01:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F4D166F;
	Tue, 17 Sep 2019 01:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F4D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568675605;
	bh=f6yr6i7oJdPPt9nVsufM1hkToi2uwIs6JWd4s6yrKDk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3eSws4syd0Tli00iLGasMBG1auNJFWwvXZyE43k9W7KaWRTxDkEF4z/TuFrkBqxY
	 YHj406qPLhfwiPmRdxmPdBwLJhXtG+tW62NeVTXntAR9u7bRiKcqYDBeG39E7ik9Dg
	 HH/H28murlVVXwpeat3BplzntM+AhFHWrXz1RqmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 098B0F80137;
	Tue, 17 Sep 2019 01:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FBFCF80137; Tue, 17 Sep 2019 01:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B20FF80137
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 01:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B20FF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AsJQjfcO"
Received: by mail-pg1-x544.google.com with SMTP id a3so827075pgm.13
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 16:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vXYdGqPDZM+NPePS/5Jwb2aUiY74/dpzWm8plNldnis=;
 b=AsJQjfcODTLEi6ISfaOneaEzIWhMD6r3I+rK2M1rqWhbEnZQQxOfEsKkizJEDoBVod
 h0GkT3gp7m0FsrwodxPrwAVP181bkD0Qbd0zLdGvPpkLL4ALUG79yb5UAv81e4JyluuC
 oFtuLbLvcNAiFFENdP4XxwVYmQ//UUTDMDVhmN1IFU4ibpJYaH9uB4+FbkrZu4Hu004E
 xvTHKuflAaX/Sw6D9PoaiXJMcnmOhla58gHqyC7NQNP67uozbGPyrfLQwDox4G139mna
 TgG+rO990M89Mvd1NMf/vcfJasYyG+lDCDxWCKLMvROd1pX7DrngJWTs5Y1reXHuE/M5
 jbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vXYdGqPDZM+NPePS/5Jwb2aUiY74/dpzWm8plNldnis=;
 b=op1YCYCB9YWv0duGFB5YrKBvw76k+2IjNxbpv+2oazBxMUBPiGglPLNE9/2juCKHUm
 80rx4asp1RCfViebhUTb5a3dSe7Z5jba0tFyjLnVDPrXNtKYbV/eWJi66fb4otgXW0W/
 4luQTZ/y8VOL3WXvcbYQ/P95HxEglZykJ5JCbWgafbTk3bzK8Z7QTQ1KaSKjvSvj2l3h
 v6eKzxA9x9N0CCTE6V51Rk0XEmzYdXwqjEsMxeXUQuIvyDmCXj2gaqtSJkQ3mq2pMNo1
 /9ZPoBLXdMQLUTyDssSGQSKGo/joT3jEwRyEykitXMn3bUPd/CIbmwTOrRkOirB8amXR
 QDdA==
X-Gm-Message-State: APjAAAVCo7bTEkC+c27Ge0Tgt0QowFahqECz8OKAx1ZKgrp7HE57tdcK
 N8LNAaTy6rUS0Eu0W3zi0ro=
X-Google-Smtp-Source: APXvYqxvfpv6SgXSwE0epprq0vUNZdDpJT1erTYjGihUH8dkTrdAZLrZ2NaOfexshSPpoutWjitWsQ==
X-Received: by 2002:a17:90a:ca05:: with SMTP id
 x5mr1740392pjt.66.1568675494336; 
 Mon, 16 Sep 2019 16:11:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id v12sm152839pgr.31.2019.09.16.16.11.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Sep 2019 16:11:34 -0700 (PDT)
Date: Mon, 16 Sep 2019 16:11:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190916231115.GD12789@Asurada-Nvidia.nvidia.com>
References: <20190913192807.8423-1-daniel.baluta@nxp.com>
 <20190913192807.8423-4-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913192807.8423-4-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, NXP Linux Team <linux-imx@nxp.com>, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: fsl_sai: Fix TCSR.TE/RCSR.RE
 in synchronous mode
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

Hello Daniel,

On Fri, Sep 13, 2019 at 10:28:07PM +0300, Daniel Baluta wrote:
> The SAI transmitter and receiver can be configured to operate with
> synchronous bit clock and frame sync.
> 
> When Tx is synchronous with receiver RCSR.RE should be set in playback
> to enable the receiver which provides bit clock and frame sync.
> 
> When Rx is synchronous with transmitter TCSR.TE should be set in record
> to enable the transmitter which provides bit clock and frame sync.

I don't quite get what this patch fixes....can you explain?

> @@ -539,8 +539,8 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			   sai->synchronous[RX] ? FSL_SAI_CR2_SYNC : 0);
>  
>  	/*
> -	 * It is recommended that the transmitter is the last enabled
> -	 * and the first disabled.

This is copied from iMX6SX Reference Manual, IIRC...And I just
took a look at iMX8DXP/QXP RM: it has the exact same statement
in "16.16.3.3.1 Synchronous mode" section.

> +	 * it is recommended that the asynchronous block to be the last enabled
> +	 * and the first disabled

So... why are we changing to this? Any update/explain?

Thank you
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

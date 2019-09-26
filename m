Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD3BEA52
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 03:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E1D1721;
	Thu, 26 Sep 2019 03:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E1D1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569462706;
	bh=emhZiSbBLRpU+7CHCofL4BIO+h0tBoexzRQgipEZe8E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5XHDL3/tgbKBKmi7Z3gSaJ1AA+3cHAHMbX0CZl0H8PtZis3+kIO7AzifLQ76+zQt
	 jkI0I20OZQJck+VdCE7318cHOFCEnskUhJLFSSOWTjnD+aRciwZBwQ/8LD+uWglx5f
	 Vd5GJtf70HyU46J0a7dEBKjToRCVep5DfYtcPw2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F85F8045F;
	Thu, 26 Sep 2019 03:50:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF55F803F4; Thu, 26 Sep 2019 03:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17E5FF80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 03:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17E5FF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BmhqPRhl"
Received: by mail-pf1-x441.google.com with SMTP id q7so732023pfh.8
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 18:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uI3653QvRfDun5vRH9qyIawnNKEumCLQmRxicnF+xIE=;
 b=BmhqPRhlQgpby6NkH48NMswsV+CwXScc+2OJ4w/Kc48zNgHHAfS2FqHNPwzS+O0xB6
 6ocLda3/dxNOPh9j3Rv4CSYsH+9gMHSJKJblwGho55ICTrYxOb6AdPD8tdBI3DtrleLI
 i7Fcl/1yXHmmVQeNqf39ZNrySFVSen2JoClH6PQhbsFZWrxgPm9Gj4TxA+Vp7L7RnLTd
 Ogwiv5cMP6Lvy6MjRCbnuVAQkAw9iHmCnOiLSbdgQ/ybBe85RQkDQ63NhNgHiQ621/Zc
 DsHnR7LUv8gvc57oGKi1HAnqVnRM1qfPt0kZJFNzgXDQw+rWN+BfxVItLiGg/ED/h0c+
 tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uI3653QvRfDun5vRH9qyIawnNKEumCLQmRxicnF+xIE=;
 b=mnycZ/eyb6ewJtxDs180Nq3EqC6n1eqdl9HgVGuk8CKO2+RjqRwxpy3w533n2O9Epx
 VqHGZpS+w2HNDzJU9UuE9PplQWSlROS6xedsDlPElj0I2kpRSqi8VZtZz6LEcxzRQIX+
 qx6h3+E413KtQG7/k1Hn9UW0VmGSAG5xTQfnh9XC8n+1kd1+4j02EfYpw93sHHsz2/9U
 0lJJ1UbUiUksdHYEJWzKMJu1/CQtx1x31RuQo/yDwRG4AvwvcvEulepSscHw7R9RxyHd
 SdcGktvYTXpSUSsxqb/CP/MtRFz+GIPvcByz5OHrtb+X4Pj9p0QfxiUuEC8DKNWWDcWT
 mP4Q==
X-Gm-Message-State: APjAAAVAaLdYZ71RH/YBtUh2t6ph9L7e33PIw56mtWXz3HkEiXzMq9s1
 1LZjB8wh+Y8yrqRUY+2fDB8=
X-Google-Smtp-Source: APXvYqxBJIYCpZx86R9ytnHhKp607PqA7avrf7WrBtzA3FCSAUzgHNDVzVxOo3YZNahIPTbhg92bhg==
X-Received: by 2002:a17:90a:1b46:: with SMTP id
 q64mr817457pjq.76.1569462593023; 
 Wed, 25 Sep 2019 18:49:53 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d14sm324463pfh.36.2019.09.25.18.49.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 18:49:52 -0700 (PDT)
Date: Wed, 25 Sep 2019 18:49:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190926014905.GA24545@Asurada-Nvidia.nvidia.com>
References: <cover.1569387932.git.shengjiu.wang@nxp.com>
 <7c05d8396fd8c4f9d41c13a85e7486f3664bc73f.1569387932.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c05d8396fd8c4f9d41c13a85e7486f3664bc73f.1569387932.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V5 4/4] ASoC: fsl_asrc: Fix error with
 S24_3LE format bitstream in i.MX8
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

Just a small concern...

On Thu, Sep 26, 2019 at 09:29:51AM +0800, Shengjiu Wang wrote:
>  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  {
> +
> +	release_pair = false;
> +	ret = snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);

This set_runtime_hwparams() always returns 0 for now, but if
one day it changes and it fails here, kfree() will be still
ignored although the startup() gets error-out.

We could avoid this if we continue to ignore the return value
like the current code. Or we may check ret at kfree() also?

> +
> +out:
> +	dma_release_channel(tmp_chan);
> +
> +dma_chan_err:
> +	fsl_asrc_release_pair(pair);
> +
> +req_pair_err:
> +	if (release_pair)
> +		kfree(pair);
> +
> +	return ret;
>  }
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

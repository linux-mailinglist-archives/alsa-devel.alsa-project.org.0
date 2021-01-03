Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BE2E8E21
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jan 2021 21:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F7C1657;
	Sun,  3 Jan 2021 21:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F7C1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609706418;
	bh=aBASoCtvlvCo2U0Gwi3tiM24R9uf6/VWUJ5zhT0g3Io=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCmRZXSBYSpUULU3KwGlvz0hpLQlmu3cAw/MooZQa3jIKph1BrzG78vMbD3KIV3yi
	 JgoqVS5zzi2atIbQEGncFf+vYT2lin80+MVAvR8ENR+FcKMGTxga3TFdlGU9+qWIYM
	 tOME0AbFjFQKkta19nnYqMWRNBscaNLJPBnuKRGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D77F8014C;
	Sun,  3 Jan 2021 21:38:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE87F801F5; Sun,  3 Jan 2021 21:38:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B7E0F8012B
 for <alsa-devel@alsa-project.org>; Sun,  3 Jan 2021 21:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B7E0F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E7LjxrLe"
Received: by mail-pj1-x1029.google.com with SMTP id v1so8549506pjr.2
 for <alsa-devel@alsa-project.org>; Sun, 03 Jan 2021 12:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XvrKssYYT7cwZM69/vVSJ9MvxCCu5oos/HuxgCZEtxI=;
 b=E7LjxrLe33RpLpApT8KK9xNFa8cVaYMgQHfpHxtmt6PElVaHXO6DWqHsgMWuVnYPNV
 5a6g4DnOH1ctQRTKKNe9XE5MVPqqNijBUzdX2v8rdagJ0Ve3hMhIiHt1U/qjGHGlQUFv
 2OM/kGkNkVayWYtveeKiOIMZJBbVKGqQk9qZDF16LENqqmRSYXl+h1fJe7rAkdXil1zH
 vcYSfi4vVLwzOhqWKHH4/HsUCV327e0kp27mB/bWEiCsQCWr92NlwOp2+q3m6cpe6MtQ
 68A/nCSiSTngUiu8PQnKyize9l8ROScwH7l05xrU383+qUrAqIpkhvGtF9Vb3tvA+baA
 bnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XvrKssYYT7cwZM69/vVSJ9MvxCCu5oos/HuxgCZEtxI=;
 b=SNdsbUlex6jDIPZHWXshv+cTQ7xGXxXJT83clq5cDWALFphDNCBB6sKrfUw3LhSeEa
 EMo7VRv20XVNAveYa/6YTtHIV+cBVPy3SNek84ArWJDgELUBiDrN8Ka8WoKnvIwLW9Nx
 c/MO6KK/j1yaYmn3mXhOz3KQnE5W8v26RLo9Bey2c/BHWirNzD2xF6FC6wvhPO4SXM6z
 Wv1qPEdUsGVKUEzwaYRd971b1BDFWM1mDEbTtcXwjYfNjU4V8+c2mm6qvc8v41efjmoO
 tSQ+z7tAyfq3D0VzVoHMzbbDrhnwaMRzSFZUv3lWCpTIO5lyynCVrmP2CPZGY0onLi3G
 e/KQ==
X-Gm-Message-State: AOAM533RKHVYWHwXERwm5sQR4lKDFIVG/uv3wpo8vAnAx9nfOEJjwpP9
 PrmcPYlSQ7FzRln/DddVuAE=
X-Google-Smtp-Source: ABdhPJzOUTk7776jpYnKQuUkjnwafBFh9qgvVIzYW4BMsTa/mkli9DsBJKj+ahbJMUTsppa2z5EJlw==
X-Received: by 2002:a17:90b:68e:: with SMTP id
 m14mr26573593pjz.228.1609706303729; 
 Sun, 03 Jan 2021 12:38:23 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d4sm18477198pjz.28.2021.01.03.12.38.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 03 Jan 2021 12:38:23 -0800 (PST)
Date: Sun, 3 Jan 2021 12:38:38 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: select SND_SOC_IMX_PCM_DMA
Message-ID: <20210103203837.GA2020@Asurada-Nvidia>
References: <20210103135327.3630973-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103135327.3630973-1-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Viorel Suman <viorel.suman@nxp.com>, Fabio Estevam <festevam@gmail.com>
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

On Sun, Jan 03, 2021 at 02:53:17PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver requires DMA support and fails to build
> when that is disabled:
> 
> aarch64-linux-ld: sound/soc/fsl/fsl_aud2htx.o: in function `fsl_aud2htx_probe':
> fsl_aud2htx.c:(.text+0x3e0): undefined reference to `imx_pcm_dma_init'
> 
> Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

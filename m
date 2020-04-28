Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6E1BBB62
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 12:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFDF71683;
	Tue, 28 Apr 2020 12:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFDF71683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588070373;
	bh=dAfElojX/Z6FylzbUorhE6A688Cdj1Orv2AZs+2E4c4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tDHOTojwZmS7kV7aWHYUaJTL0h3yYsgLOyHTt+sjyNGzG/J0bgDlgKCuRTN/nztlx
	 /7xJm8lhibl/CPxDnQT/pgyRYsn5AgQy207EnZ1Jg99sdlfyvC4cN+7SV8pPRnorbY
	 n6A+Wu1ZBPrkS93JZ4PVe5qkqrWT/pVOZUp9fBvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 228F8F8028D;
	Tue, 28 Apr 2020 12:37:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 681BEF8028C; Tue, 28 Apr 2020 12:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E055EF8021C
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 12:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E055EF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CW1WJz+v"
Received: by mail-wr1-x444.google.com with SMTP id s10so24065388wrr.0
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7MejAFBM22X91TMwqTDKSAeWhAdaxEoe9krCl6slZcg=;
 b=CW1WJz+v+l5HJMoPdvjvjK/VgsrHkwFr4WsjHdgLJGBXnep8kEZ68Z+I1d60yQVsg5
 8ycIUR4EOnZSldddQ+VA7nG8H5wj91eIDi7sDP6g+dV+NEku+iLIaTzcJz7qCDOqdhPu
 oHa6deCp/HBKhISiwFkT5Eb0yXwnC26RyKbmpEq4iz7DNDud5v2lSggY0aJpoE1x1Lue
 jJoI2KGhD2+wXreNYy2XH1+RgVAiHfgVlfkWtkNuGzIgyq2g02Sw3UbOA6i2Et+ltdha
 tWuZmqrrgavp+4B2q+n3dCe2wDA4gSfV7+Mo+rABKEyziPx26InaOZOfzgeIzu/98O+w
 MWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7MejAFBM22X91TMwqTDKSAeWhAdaxEoe9krCl6slZcg=;
 b=C+wEWsVSdd4SijCvZy/1QE2+gEClb4MyauqHcXbzz7yn94c1XyNS7wFaSiXPyfHxUJ
 jNYmHp4h5ALuiJd0x5OYtpV4U/ohkDSTR/v6jkqbjKtxSQNwiPvNhaoKp69vyA1dd18/
 4AAibFEZq/NzeyuZB6AhqLer5W3kAZz4v15dCwO0gEsU7HfCg+fuJyaLK5nwKaRwdOa7
 funT8rPpm3U7wh/FH3TNJ3ujCioQuW59eAZ1YCdDQEaVQuomTM3K5brY1JYLsGCLKLcz
 IU+yz0cyHa8ljzSsBie5SEjRLj8W+QPzlTENMiYb/tFWdatxvWcCDjf2eWJBbycXglKH
 9C/w==
X-Gm-Message-State: AGi0Pub1PXQk++RCIbb/C9AGsTi6bToJ9RHa1fNU2wo51PLev44U7FJJ
 rlO5Auz3ad5zS0fsA2045KfbvA==
X-Google-Smtp-Source: APiQypKdoep9dH64db2eqNaZcKDzXAa4SCLSqqV2lBPjzT69msPFvROIeGblV3W9BBHviXISbLazmA==
X-Received: by 2002:a05:6000:f:: with SMTP id
 h15mr31915700wrx.408.1588070238317; 
 Tue, 28 Apr 2020 03:37:18 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id h188sm2986813wme.8.2020.04.28.03.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:37:17 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:37:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/4] mfd: wm8994: Fix unbalanced calls to
 regulator_bulk_disable()
Message-ID: <20200428103716.GR3559@dell>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074842eucas1p2a37c7f854188cccf3b103b221a84e9f2@eucas1p2.samsung.com>
 <20200427074832.22134-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427074832.22134-3-m.szyprowski@samsung.com>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 27 Apr 2020, Marek Szyprowski wrote:

> When runtime PM is enabled, regulators are being controlled by the
> driver's suspend and resume callbacks. They are also unconditionally
> enabled at driver's probe(), and disabled in remove() functions. Add
> more calls to runtime PM framework to ensure that the device's runtime
> PM state matches the regulators state:
> 1. at the end of probe() function: set runtime PM state to active, so
> there will be no spurious call to resume();
> 2. in remove(), ensure that resume() is called before disabling runtime PM
> management and unconditionally disabling the regulators.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/wm8994-core.c | 3 +++
>  1 file changed, 3 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649771869A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 10:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C58CC1851;
	Thu,  9 May 2019 10:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C58CC1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557389619;
	bh=tF30E1j2Ixnq3lkIJqFh9o22EaWJwPhDruiDlZsa6Ac=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVGKlz1n5pu40s7v5ECCv34NlP+FWZxlHAthAvBOXSKQCIjvax46It+ULm+jH/gs4
	 N9ETVlavkx2yWYOE6Vf8LTC/i51VEapRwGsfBfD/CBOQ+VZoB7vMyFAYUv7mECMkA2
	 LbqfvxnUe62sFcPmrgSyZlbAR+xRShDCOqMJFRl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE82F89673;
	Thu,  9 May 2019 10:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24ACEF89674; Thu,  9 May 2019 10:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09182F80796
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 10:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09182F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="FS1bTyue"
Received: by mail-wm1-x342.google.com with SMTP id o189so2018361wmb.1
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=PiUStQAc2r5Zg3DaxsjfssB9tqNwXFDkwGZRTJrvo7M=;
 b=FS1bTyueMsG+AWoL4zjmP3ly8X1YXHjIPwUSwi9i5e3sqr19OLbG1cHcz8uxATn9tE
 5JHPKxNcV2PYF9ennPwJ6p4cjb/LnMY7Q8JffJ4Hd6aD5X+vkVc6OwVSQWLJ00Qx1U6Y
 kcfR+C/yM3RIVFZIF4tNw8Xr7vDbPpAeInP1FfFwFrcWnWRn6m2NMNTtX9R1T+2AkoQA
 7Y70IMpliMWr+Mz4n+6nX4rawxHMT+VFdUKmWh8zc5nnOYVT2PPRXXC9f/fLj6ihtA7L
 XtyhEGNOYIUtq7Es+40t+gvmYw0ectKU2fMZMKPWEh2sQHXRxZuh0aIv/Ewrhydpzipf
 R7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=PiUStQAc2r5Zg3DaxsjfssB9tqNwXFDkwGZRTJrvo7M=;
 b=WkhJzscuB6YBM0by89XxlpZ+gjPk/dz5wSOhWHgfFpeggXERvYWjfl4KB0o/s04bdZ
 OIkcVaprvBk3bn7h52amGFlx7fqcNZeH1RidQnucCGCFyuYHNujUNefJig+OI+GxvgYy
 rXjCp7eKX2jSoUJIww0JNhC1Rbaz+WB1AXagRNDNS8VXW2fadBLY8+2euHHDXyuB2GuQ
 xShdNCKcGg78iEx2oZXhDmCGyltqflV/1p5anY2qNE7CivPfeeIm/TUXCeHnTKL8fV/B
 A6dbT9TgeiBdHuh3AhLgrHs/OJR9j8IpyK/zjv95plqCHPsgFTOUEvAUsD+Lzz+qSlsh
 g+6Q==
X-Gm-Message-State: APjAAAV6fC8RcrZLux81Mznr92nxWU9tJ9w/JLH4+X2bo9Otl4nVnGcA
 aTNiN/qBiZaAIu/hwzuaDKGgJQ==
X-Google-Smtp-Source: APXvYqxKrbJAcRMB6/GRYZW/18lbgLrjQtaJ77NGIOkmbeT0q+RSNQj9FBgMjGSk6o2y2KkTQZs1Rg==
X-Received: by 2002:a1c:f504:: with SMTP id t4mr1744809wmh.121.1557389509907; 
 Thu, 09 May 2019 01:11:49 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e16sm1175686wrw.24.2019.05.09.01.11.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 09 May 2019 01:11:49 -0700 (PDT)
Message-ID: <5b677f1581565bd8c915a14cd91352ec4bcabdd7.camel@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 09 May 2019 10:11:48 +0200
In-Reply-To: <20190508085758.GE14916@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-3-jbrunet@baylibre.com>
 <20190508070058.GQ14916@sirena.org.uk>
 <fd633a5597703f557d75e43c14213699efe295f0.camel@baylibre.com>
 <20190508085758.GE14916@sirena.org.uk>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] ASoC: hdmi-codec: remove reference
 to the current substream
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

On Wed, 2019-05-08 at 17:57 +0900, Mark Brown wrote:
> > Another solution would be to use the mutex as the 'busy' flag.
> > Get the ownership of the hdmi using try_lock() in startup() and
> > release it in shutdown()
> 
> > Would you have a preference Mark ? 
> 
> Probably using a mutex for the flag is clearer.  I'd rather keep things
> as simple as absolutely possible to avoid people making mistakes in
> future.

Hi Mark,

I received a notification that you applied this patch.
Just to confirm, you expect a follow up patch to re-introduce the mutex, right ?

Thanks
Jerome

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

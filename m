Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C917351
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 10:10:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6F218CC;
	Wed,  8 May 2019 10:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6F218CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557303037;
	bh=wt9s2PIlxA12ZDBEIj1tCPNWegJaOCkvCJSH3VPpDf0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tC3ZEfgre8DHiI5wT8/Jd6kBPiQkxQ9tdEl8ugijcJnhCudGlQzPbxJUVSLL1eqjU
	 +pbkshBLuNTpgVwXYUlZoL/o44cBFV2M+fPo9E7L2OXiZxVPIxf+Ae/VPYXPmAryVh
	 LKuyk0TrtNCBi412RFcjXjl2NtU3pnfQ0QVtTArQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB771F896FF;
	Wed,  8 May 2019 10:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76423F896F0; Wed,  8 May 2019 10:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F588F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 10:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F588F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wa47Q87Q"
Received: by mail-wm1-x344.google.com with SMTP id p21so2014193wmc.0
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=86uV2HxREIhuwS4GJK2Jn9KN6S6XEQro7aC0j5fNqaQ=;
 b=Wa47Q87QsTzZzMoc0lgH3dN5QS5PlcHSVtDDVyW5uCaLEews6uOxM5hSxUqnt32Due
 TdJWBlfvIVsOz+MlL05tFkgVODnYnKZETpeeDNrAIqNqFsei7fKmyGurn1kRL0KlKyZ5
 jHMdDOSGsYr2+9+wIU3CXiNPFsBPfjTOuO6ReuB1tME7L1KLHx2Zkeb9w3mUUvHGUK08
 4SDZA0LxFGrO2pqw9KHMg8V2YE8WC0mlIl7cOQ/ih7eFkCq70OTgJTkXbsozCnTpBtxS
 sS47yZAf1+1cWiyBcyHKHBIC8z2q/4zQdj7Ybhek+hKJhjWbun72BzQZE3Ieuk1aP9yg
 8ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=86uV2HxREIhuwS4GJK2Jn9KN6S6XEQro7aC0j5fNqaQ=;
 b=WwwkX83pz7kIwLXV3m0nSiVcCxGKbDbJ7MqPYlT+AkrXS3c7sLSGIZqExrn0XjHu4V
 Q/rLKLdF95lXTLxaup41rKuHCOhD1MzmxCyvKt0Rk3vspV7cgVwtgSnscrX7JPnW/k93
 mFaOQ/DgyqGDeG26qU5YazVR05kLS0fsPlYvhU4A7mWMwNw/JQkAd9PICrzmm6j8nDgj
 VIcf2P3/8xAUKU/jY6B5qhmAvu3FfoJTPuOY6OEtAkbPU9ILZAh6bYJ32ov2h0KxnLfz
 pdtkHU2yyaYFgX6xhWAzESXEQOJPQHPeotom95wBdhAEmbPTDznLoW84R/EJjnMoo9+i
 mb4A==
X-Gm-Message-State: APjAAAXzouZkO195YaUk8rRksoc6vs12CiVQsvi8oac5U1wGilseBqV5
 9K2PHVwFhiDrc8jXtrqS+AscvQ==
X-Google-Smtp-Source: APXvYqxnCHnnuRVpXbAZJH0rRCaLSN9SfrDf8LxsMRt1drEGr3nMB2tZ13hyFOUV6PMsoGG32FurPg==
X-Received: by 2002:a1c:9c03:: with SMTP id f3mr2010807wme.67.1557302926262;
 Wed, 08 May 2019 01:08:46 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id h24sm1626063wmb.40.2019.05.08.01.08.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 08 May 2019 01:08:45 -0700 (PDT)
Message-ID: <fd633a5597703f557d75e43c14213699efe295f0.camel@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 08 May 2019 10:08:44 +0200
In-Reply-To: <20190508070058.GQ14916@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-3-jbrunet@baylibre.com>
 <20190508070058.GQ14916@sirena.org.uk>
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

On Wed, 2019-05-08 at 16:00 +0900, Mark Brown wrote:
> On Mon, May 06, 2019 at 11:58:13AM +0200, Jerome Brunet wrote:
> 
> > Remove current_substream pointer and replace the exclusive locking
> > mechanism with a simple variable and some atomic operations.
> 
> The advantage of mutexes is that they are very simple and clear to
> reason about.  It is therefore unclear that this conversion to use
> atomic variables is an improvement, they're generally more complex 
> to reason about and fragile.

The point of this patch is not to remove the mutex in favor of atomic
operations

The point was to remove the current_substream pointer in favor of a
simple 'busy' flag. After that, I ended up with a mutex protecting
a flag and it seemed a bit overkill to me. Atomic op seemed like a
good fit for this but I don't really care about that particular
point.

I can put back mutex to protect the flag if you prefer.

Another solution would be to use the mutex as the 'busy' flag.
Get the ownership of the hdmi using try_lock() in startup() and
release it in shutdown()

Would you have a preference Mark ? 


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

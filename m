Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D2229F35
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 20:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D8351616;
	Wed, 22 Jul 2020 20:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D8351616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595442315;
	bh=e8IG6fzsQl7i31KMDJNCI6aJvbm9kev76UxBercvbEY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRngu2726zuwsA0wbrWooIWE0yKsgQ46W8ccyN7H12c9+z0vXW0+E/P5MvYob8CIJ
	 sYDKCATjnxdChc62TewvBBzK68TZqDj+Wvyao3i2Crzq4wUJTVqMJiIDRWOMlMTvLh
	 AcSHALdid6YiCSCD6MjTeBsIrctRc7PRPEeDBMYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3A7F80087;
	Wed, 22 Jul 2020 20:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8E8BF8014C; Wed, 22 Jul 2020 20:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4401F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 20:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4401F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="fXAmA24J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=JrD3G1WSRO2ACZGrzdo5vNTbMsFVg5sjgpFhLlIa/+M=; b=fXAmA24JXRO3SuO0hkx1FF5XHt
 yg792tJwQ6zVUMj6Nmfi7PiHNZesrNBpPEJBhI4Ep/nXPugJWcnKpe9/cfh9kK7vWiUDIpe6bAYRR
 7WylJu4yliWdoqssibniqd+FCWkZ0oBmV9uculJX5ixBLOwjoPlK/dGRRf83GU5XMHdsj+qdLAXvK
 2PYvcHdxuK6LC/cUlugfEnK27SWPoK46feIUWvltYwV+TIBO5rKXVRRcRtC0NZIynY8W+qatpuS6C
 xdt6YG2naeKlEuYJCmRlpHTGCea1ME2N5v8h7lQQYlXFDZ+yt4gTQgADt9OYieApZRAhd1fJsKSpl
 yDoDvK4w==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyJOi-00010t-4w; Wed, 22 Jul 2020 18:23:20 +0000
Subject: Re: linux-next: Tree for Jul 22
 (sound/soc/tegra/snd-soc-tegra210-dmic)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200722231640.3dae04cd@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8816636f-4b6c-5bb3-20d3-a240aceadc99@infradead.org>
Date: Wed, 22 Jul 2020 11:23:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722231640.3dae04cd@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Rahul Mittal <rmittal@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 7/22/20 6:16 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200721:
> 


on i386:

ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko] undefined!
ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko] undefined!

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

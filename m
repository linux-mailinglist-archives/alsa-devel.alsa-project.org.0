Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA549869F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 18:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BBDE2851;
	Mon, 24 Jan 2022 18:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BBDE2851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643045098;
	bh=m/wg/IWT/bVyChMcDytMueNay+ZEXEAwNFpIPOGcW4A=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgMbhXJ4HX0Os4WrhAuOv4/Ln0+WxSi8aEqoY9qY2AmfHVQ/S4Dwm2/aZSal6QmQ+
	 /exf4z36o0LXuzuAhC1JZvO7jvOOyKnCrojjmt3UG/1+e5TAPEHMzx+STnlAcBanpv
	 5bZ300X24G9ZGgOXXSxur/9lvAr1YnKwyU24Iv18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD28F802BE;
	Mon, 24 Jan 2022 18:23:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F380EF8027C; Mon, 24 Jan 2022 18:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72328F800E9
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 18:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72328F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CT5aW9G6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADD1561303;
 Mon, 24 Jan 2022 17:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C01C340E5;
 Mon, 24 Jan 2022 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643045019;
 bh=m/wg/IWT/bVyChMcDytMueNay+ZEXEAwNFpIPOGcW4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CT5aW9G6CuSgV1bcFWriioswASoci6kwqYzjmCSQa3pZh3wo0TTUFlHd+pH35ADqt
 BfPVxG2IZWbROhpEzJGMmICqJ8dPD0sB0HP686ZQqBoUn3dvMwZxNTwN8nuruvCD8W
 t8DNh27n2XK6ZAVYaAIKZx/TpdGPsCQdqivxJPhWDNBSbX4w94yr2b+nU6+toc6HLl
 41fDFkbVAx3tRuAS0+VS6fJ6xcSvWxxF1ywhyPZm1geOlUEr35hx8nmaGpUnHRg3g7
 GzlSG7RwKyAGhcDojCVPLDDN3g6QzsJZC65vg1v/sHpaTK0m1tcqWDPhSz95UxuFSE
 BgBMILOagnNeg==
Date: Mon, 24 Jan 2022 09:23:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.17-rc1
Message-ID: <20220124092337.5ecadd71@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220124090433.1951e2ea@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20220123125737.2658758-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
 <20220124090433.1951e2ea@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Tobin C. Harding" <me@tobin.cc>
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

On Mon, 24 Jan 2022 09:04:33 -0800 Jakub Kicinski wrote:
> On Mon, 24 Jan 2022 08:55:40 +0100 (CET) Geert Uytterhoeven wrote:
> > >  + /kisskb/src/drivers/net/ethernet/freescale/fec_mpc52xx.c: error: passing argument 2 of 'mpc52xx_fec_set_paddr' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]:  => 659:29    
> > 
> > powerpc-gcc5/ppc32_allmodconfig

Sent:
https://lore.kernel.org/r/20220124172249.2827138-1-kuba@kernel.org/

> > >  + /kisskb/src/drivers/pinctrl/pinctrl-thunderbay.c: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]:  => 815:8, 815:29    
> > 
> > arm64-gcc5.4/arm64-allmodconfig
> > arm64-gcc8/arm64-allmodconfig  

I take this one back, that's not me.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AA2A49FD
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 16:36:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45D616A4;
	Tue,  3 Nov 2020 16:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45D616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604417779;
	bh=XmePEw9JU0rAZFEeNQ5n/UYCqWNsboTn5hyfBC16x4k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZcl4NQTuJ6bdUy6Hd7HivBTA0AVFxPINjJmELu+xAiTNciNusRBAjeKDIL855grB
	 oe8n9ZVhj4Ws7VNWNpCXGNfVdeKrkI2Ey5KNpfCcxLhWeM5YwYSi49BuyfGOnWkOOV
	 h5nLLawKofXGkdEw8mV/WsEbFyjEpErFyGnjibw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DAC0F80083;
	Tue,  3 Nov 2020 16:35:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF019F804BC; Tue,  3 Nov 2020 16:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 202A5F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 16:34:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 202A5F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MIX7/2dm"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03D3020735;
 Tue,  3 Nov 2020 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604417689;
 bh=XmePEw9JU0rAZFEeNQ5n/UYCqWNsboTn5hyfBC16x4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MIX7/2dmsXSV9/1SZ2NGVDwZM90tDQjQ+FigSzWSKfN00vScP2rdeOoMO4/5+raZa
 vzLX04WsgV2vnZ+MESIwsPz76w86R9u6eIMZRNj7K5u572vhd7yQ8du46CLv0LiCxN
 CZZAc1SumiOdLZUtcst3noBy39gBF6z3lgEvZHVY=
Date: Tue, 3 Nov 2020 16:35:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
Message-ID: <20201103153541.GC3267686@kroah.com>
References: <20201103141047.15053-1-mateusz.gorski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103141047.15053-1-mateusz.gorski@linux.intel.com>
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Tue, Nov 03, 2020 at 03:10:47PM +0100, Mateusz Gorski wrote:
> [ Upstream commit 1b290ef023b3eeb4f4688b582fecb773915ef937 ]
> 
> Add alternative topology binary file name based on used machine driver
> and fallback to use this name after failed attempt to load topology file
> with name based on NHLT.
> This change addresses multiple issues with current mechanism, for
> example - there are devices without NHLT table, and that currently
> results in tplg_name being empty.
> 
> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Link: https://lore.kernel.org/r/20200427132727.24942-2-mateusz.gorski@linux.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> 
> This functionality is merged on upstream kernel and widely used. Merging
> it to LTS kernel would improve the user experience and resolve some of the
> problems regarding topology naming that the users are facing.

What problems are people facing, and what kernel(s) are you asking for
this to be ported to, and why can't people just use 5.8 or newer if they
have this new hardware?

thanks,

greg k-h

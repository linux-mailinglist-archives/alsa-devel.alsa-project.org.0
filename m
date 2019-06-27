Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2315757F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 02:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8D2616A8;
	Thu, 27 Jun 2019 02:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8D2616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561595125;
	bh=TKKDTxKjqziX2SmdQDpJ4E4jBuJlMI5xJJkvv+UiAyQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KeonNOmaWzhj9CwSI/8L+cGfz72KY754QGGAm1vB2A2hHOE2Y0A5FaneUXWVvGwon
	 wA8uWj1++IVMLtxXJObomJVZja4wlMmK27Q/7uCSS8iC9zRLpOZJMK91CUiDkkxvwY
	 S6xvNPDDt4niBchqYs6//7B92Q3y9IsAlTFGNl7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E0AF896CB;
	Thu, 27 Jun 2019 02:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A718F896B9; Thu, 27 Jun 2019 02:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C527F8071F
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 02:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C527F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egQWSH7J"
Received: from localhost (unknown [116.247.127.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 365B820815;
 Thu, 27 Jun 2019 00:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561595012;
 bh=atPKDYZCcDmAaXDhNxCFQytNTI0+r9z90yyDJSK/580=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egQWSH7JF1vGjJOdmQsQMaJOiq5iMwFrbdsnKuf4dETfx7utx0fqA+lZPk3SQFSN/
 WQuL+ybXmvswmSqLd1RKKr1ixcNYvAG2CQ+9zNv0JPHXiLvlU87Q2asQ1MON9nvlxq
 7oYvpoHmL03vMaKMvOQFt22V0cnqRY3R7iQ6XFR0=
Date: Thu, 27 Jun 2019 08:23:29 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190627002329.GA3540@kroah.com>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-2-gregkh@linuxfoundation.org>
 <f85fe797-f843-bf71-549a-00a169d527dd@intel.com>
 <s5h4l4hwe1c.wl-tiwai@suse.de>
 <20190624105334.GJ5316@sirena.org.uk>
 <s5htvcfxgy9.wl-tiwai@suse.de>
 <20190624133336.GN5316@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624133336.GN5316@sirena.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.de>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/5] sound: soc: skylake: no need to check
 return value of debugfs_create functions
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

On Mon, Jun 24, 2019 at 02:33:36PM +0100, Mark Brown wrote:
> On Mon, Jun 24, 2019 at 03:15:26PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > Currently debugfs doesn't report any errors other than via the return
> > > codes (at least in the common creation stuff) so it's up to the callers
> > > to do that.
> 
> > So this should be changed to follow a la sysfs creation error, IMO.
> > At least, the name conflicts etc should be reported more obviously.
> 
> Indeed, that'd mitigate the problems with just making everything
> silently fail a lot - so long as we say there's a problem people are a
> lot less likely to be mislead if anything goes wrong.

Ok, let me work on doing this in the debugfs core and will cc: you all
on the resulting patches to see if it will satisfy your objections here.

sorry for the delay, am on the road all this week with limited
internet...

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

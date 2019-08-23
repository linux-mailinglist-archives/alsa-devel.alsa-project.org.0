Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF279A78C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 08:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21E21658;
	Fri, 23 Aug 2019 08:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21E21658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566541883;
	bh=ryzp7fd+lhkpJl3aaDpPBzJPNmBXl0Ielzskif1ll4k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpToxan9qfBC0tnXeKasWSnWRctZVA2OApuJ22BKKk11KP9rGz2zFfatsoqa8vzrr
	 1YR7vePgfmdvGsl+3fFNwr2vQM4jJO6qFou8wrJzFcVWGm63mjp7Vt/EFqYtySgrqs
	 T/iiM8HC4Q0FSqEAJhzZJWxUkEBI2oRML1+6/Vbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8204EF80306;
	Fri, 23 Aug 2019 08:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65976F80306; Fri, 23 Aug 2019 08:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C2E4F8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 08:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2E4F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gb3CTYmF"
Received: from localhost (unknown [106.200.210.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 753CF2070B;
 Fri, 23 Aug 2019 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566541766;
 bh=nxHNS7+d3ksEI4OVOLapa7P1/b9eu8lvEAfSwknSu2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gb3CTYmFSGXj1eADlC2c3sZ+VL8DWtif5ZRtkZyAneZLwKkpEyEw73NwWJ80axyLm
 iaclJZ8SuYLLB7TJt4Pw8ISpM1AMIb+jA5lmprvBMJXVNO+AfZSGFBf8Qp777nmUUi
 7ArJ/nw17tQlGLQFgC+3Oo0T/8ZqHYu8TA2nVO6k=
Date: Fri, 23 Aug 2019 11:58:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190823062815.GA2672@vkoul-mobl>
References: <20190822062555.30216-1-vkoul@kernel.org>
 <05406f83-a799-2110-cf51-c289ae838065@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05406f83-a799-2110-cf51-c289ae838065@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: intel: remove unused variables
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

On 22-08-19, 08:38, Pierre-Louis Bossart wrote:
> On 8/22/19 1:25 AM, Vinod Koul wrote:
> > Variables 'nval' and 'i' are no longer used sdw_master_read_intel_prop()
> > so remove them.
> > 
> > drivers/soundwire/intel.c: In function 'sdw_master_read_intel_prop':
> > drivers/soundwire/intel.c:829:12: warning: unused variable 'i' [-Wunused-variable]
> >    int nval, i;
> >              ^
> > drivers/soundwire/intel.c:829:6: warning: unused variable 'nval' [-Wunused-variable]
> >    int nval, i;
> >        ^~~~
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Fixes: 085f4ace103d ("soundwire: intel: read mclk_freq property from firmware")
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> This was fixed in the followup patch to disable hw links:
> 
> -	int nval, i;
> +	u32 quirk_mask;

Well it is my mistake, the patch 085f4ace103d should not have kept it
and I should have pointed it out in the review
That would be the correct thing to do for a series.

> which wasn't applied because debugsfs didn't apply, and debugfs didn't apply

Changing after is not really desired. I understand that this goes away
if that patch was merged but the point of a series is that we can find
issues in patch N but still be able to apply patches N-1.

> because of discrepancies between soundwire/fixes and soundwire/next...
> I realize these variables were removed in the wrong patch but I would
> appreciate it if we could just avoid creating more conflicts for minor
> changes. Thank you.
> 
> > ---
> >   drivers/soundwire/intel.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> > index 459cc1e6355d..cad378f741c0 100644
> > --- a/drivers/soundwire/intel.c
> > +++ b/drivers/soundwire/intel.c
> > @@ -826,7 +826,6 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
> >   	struct sdw_master_prop *prop = &bus->prop;
> >   	struct fwnode_handle *link;
> >   	char name[32];
> > -	int nval, i;
> >   	/* Find master handle */
> >   	snprintf(name, sizeof(name),
> > 

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

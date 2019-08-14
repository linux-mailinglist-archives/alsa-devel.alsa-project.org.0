Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3B8CA11
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB951698;
	Wed, 14 Aug 2019 06:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB951698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565755744;
	bh=DCLxAX/95sLO+LnDy4hfUP/BX1bFlVy0kl19xV94vfg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dYQpT1Z5e/IhR8+bEvgHQatz+8dQlMB+l1rJbikNwShDQHguTM9xTiRe7gSd2MAyX
	 pvARGq6u+wlSR/P3Xl2D6aFkcHpLKy6QoxRIgui3uBjndTDXa8PV/3QI0Sz3owdPLd
	 oNnn2Q5a3k2zEFVsqvpikUPEvetWIlcd0ZNFmY18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C49FF80214;
	Wed, 14 Aug 2019 06:07:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E07D5F80214; Wed, 14 Aug 2019 06:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E77FF801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E77FF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zU9dzbXh"
Received: from localhost (unknown [106.51.111.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 880172083B;
 Wed, 14 Aug 2019 04:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565755633;
 bh=Fbm2JsgKb3+Qlou7UbRECn9QYyevRyLZgAJEMCqmHWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zU9dzbXhkI60XVNZEJ6lsxWo6ZERKeZNY/HTiPGo+cOjKQbAQHef8g3IbRPXVvS9i
 cJcW9Rce0NQbCcPKbtOthsbYweUwJ2ErWgf1s4z6h9pQEkP2Qzn4lU9s8DqDXgmoED
 5TFQaxjUC7ez9J2peuPkimAmtOf07SNknQHeuh9k=
Date: Wed, 14 Aug 2019 09:35:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190814040558.GT12733@vkoul-mobl.Dlink>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-2-srinivas.kandagatla@linaro.org>
 <7e462330-a357-698a-b259-5ff136963a57@linux.intel.com>
 <1a02f190-0aab-d512-ceb0-4a21014705e8@linaro.org>
 <3fd3c98c-eb25-7040-3089-f5e5bc9d24ee@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fd3c98c-eb25-7040-3089-f5e5bc9d24ee@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 1/5] soundwire: Add compute_params
	callback
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

On 13-08-19, 14:08, Pierre-Louis Bossart wrote:
> On 8/13/19 1:17 PM, Srinivas Kandagatla wrote:
> > 
> > 
> > On 13/08/2019 15:34, Pierre-Louis Bossart wrote:
> > > On 8/13/19 3:35 AM, Srinivas Kandagatla wrote:
> > > > From: Vinod Koul <vkoul@kernel.org>
> > > > 
> > > > This callback allows masters to compute the bus parameters required.
> > > 
> > > This looks like a partial use of the patch ('soundwire: Add Intel
> > > resource management algorithm')? see comments below
> > > 
> > 
> > Yes it duplicate indeed!
> > 
> > I will use that patch!
> 
> Actually please don't...
> we found issues with the Intel allocation so I'd rather have the big Intel
> patch split into two parts, with callbacks+prepare/deprepare changes going
> in first. It'll be much faster/nicer for everyone.

I was about to say that as well. I think lets take this as is and Intel
algo can be on top of this. That seems easier for everyone to sort
dependencies

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

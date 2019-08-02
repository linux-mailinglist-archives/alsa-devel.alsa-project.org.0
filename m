Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFBF7FE0D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 18:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8B7171F;
	Fri,  2 Aug 2019 18:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8B7171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564761863;
	bh=2uNvGqa6Kbf+K8QCves9PNuBBOH6MJgDdIAXkoFE6kU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnv5R5zdKhQV/A0Ozn1mMCBbuzGau8GGZxAAUHuJqSX+9YKH7isUETKAsbItalwgD
	 xqc7H5TuyeISTqmewrUJmQWTZCYJcbkScP9pAlouMNdgCIx2+TuKszwSUC5AuHTV+A
	 prw1k7TC9dnHc6zU2sYL07I453vGL4dApUnog5ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC95F8049A;
	Fri,  2 Aug 2019 18:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3EEFF8048F; Fri,  2 Aug 2019 18:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95567F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 18:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95567F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PI+K16Wn"
Received: from localhost (unknown [122.167.106.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AE70216C8;
 Fri,  2 Aug 2019 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564761753;
 bh=HqRMBzEVJ91zUIcc/7XgWIBNC/V47cjTHlM+0R3V3G0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PI+K16WnDzjYDJFQEXnmXMix0PX19y08kd4ZT7xqWqQzxOGKlt8aKzwzK64V758RH
 Gjns+UqAJSEnLz8c6Vg0mgFUP4NH9P2EiZvGc28KyevydcpjqtlxFMKtX+fssge1Sf
 VA23rXbwNn07SqLJBqMiULQ1y2kgdJEBHZ/ljO3M=
Date: Fri, 2 Aug 2019 21:31:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802160115.GS12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
 <20190802122003.GQ12733@vkoul-mobl.Dlink>
 <c4d31804-48af-30e3-4b4f-4b03dac6addd@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4d31804-48af-30e3-4b4f-4b03dac6addd@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 15/40] soundwire: cadence_master:
 handle multiple status reports per Slave
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

On 02-08-19, 10:29, Pierre-Louis Bossart wrote:
> On 8/2/19 7:20 AM, Vinod Koul wrote:
> > On 25-07-19, 18:40, Pierre-Louis Bossart wrote:

> > > +				status[i] = SDW_SLAVE_UNATTACHED;
> > > +				break;
> > > +			case 1:
> > > +				status[i] = SDW_SLAVE_ATTACHED;
> > > +				break;
> > > +			case 2:
> > > +				status[i] = SDW_SLAVE_ALERT;
> > > +				break;
> > > +			default:
> > > +				status[i] = SDW_SLAVE_RESERVED;
> > > +				break;
> > > +			}
> > 
> > we have same logic in the code block preceding this, maybe good idea to
> > write a helper and use for both
> 
> Yes, I am thinking about this. There are multiple cases where we want to
> re-check the status and clear some bits, so helpers would be good.
> 
> > 
> > Also IIRC we can have multiple status set right?
> 
> Yes, the status bits are sticky and mirror all values reported in PING
> frames. I am still working on how to clear those bits, there are cases where
> we clear bits and end-up never hearing from that device ever again. classic
> edge/level issue I suppose.

Then the case logic above doesn't work, it should be like the code block
preceding this..

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

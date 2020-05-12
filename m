Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B61CEB83
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 05:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD9A1614;
	Tue, 12 May 2020 05:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD9A1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589254359;
	bh=QNWc4mCSUQkWmfV/BNuwNh/r3Nw7d08P4k2wYg5jrDo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXVY03LzKYh1xEdcpDBTN4RQ9po/Hm0rw5a0aVBuY++MaR6LlTrt8xgK/0nvzdar3
	 A/EWEPbLDi4mMLNq8vai1b38zpzTG5SYjw6zphjp70yu1roziqJNwYHg++xhD7tK9g
	 T8eEeQHtVMKeIlCF3sIcjaB+e+/6GHKFFcC+2mv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB33F80158;
	Tue, 12 May 2020 05:30:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80985F8014C; Tue, 12 May 2020 05:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F9A1F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 05:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F9A1F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DXljxuIt"
Received: from localhost (unknown [171.76.78.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88FDD206B9;
 Tue, 12 May 2020 03:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589254241;
 bh=QNWc4mCSUQkWmfV/BNuwNh/r3Nw7d08P4k2wYg5jrDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DXljxuItkt/Ukfz/eJPpHgaVnfEHwiP5bCPwjke9teJ8Hob+gJ3hupnjt2b1996UX
 leH+KWNPvkvy0IFqe3koseuEWo8D7y9XlJOL6lqXlOo4JOJjM4PRBL2WpFxKPzEt+V
 WYcVWKB2KW0zGtvRBbH5De9dgkRJKGfSYUO9N2Ts=
Date: Tue, 12 May 2020 09:00:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200512033035.GV1375924@vkoul-mobl>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 11-05-20, 14:00, Pierre-Louis Bossart wrote:
> > > +	md = &bus->md;
> > > +	md->dev.bus = &sdw_bus_type;
> > > +	md->dev.type = &sdw_master_type;
> > > +	md->dev.parent = parent;
> > > +	md->dev.of_node = parent->of_node;
> > > +	md->dev.fwnode = fwnode;
> > > +	md->dev.dma_mask = parent->dma_mask;
> > > +
> > > +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
> > 
> > This give nice sdw-master-0. In DT this comes from reg property. I dont
> > seem to recall if the ACPI/Disco spec treats link_id as unique across
> > the system, can you check that please, if not we would need to update
> > this.
> Table 3 in the Disco for Soundwire 1.0 spec: "all LinkID values are relative
> to the immediate parent Device."
> 
> There isn't any known implementation with more than one controller.

But then it can come in "future" right. So lets try to make it future
proof by not using the link_id (we can expose that as a sysfs if people
want to know). So a global unique id needs to allocated (hint: idr or
equivalent) and used as master_id

Thanks
-- 
~Vinod

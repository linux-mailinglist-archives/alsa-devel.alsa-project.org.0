Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE001CFA02
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 18:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600E616BD;
	Tue, 12 May 2020 18:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600E616BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589299285;
	bh=GcSuARZnjzHzIHxazwT2+9mc/w9gn8B3hHEScotCwcU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwycG+wQyNqVLLe2JE3V5cW8KrUYf5xLA0Qi8ad/zwnLLqUI29vpaGuEb5d6bnvuu
	 fK/VxdOz6qoN7TINtbWiY5FoY47Xl980JwCZTFQli7DPXBok8vxvQqSUyisNrJ8R+a
	 v2FiKWdafjT28FQ8uwVG14D2s6SO3VeSiQXW0mA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACC6F800B7;
	Tue, 12 May 2020 17:59:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C5A9F8014C; Tue, 12 May 2020 17:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17A9F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 17:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17A9F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v7lI9soG"
Received: from localhost (unknown [171.76.78.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED7282054F;
 Tue, 12 May 2020 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589299172;
 bh=GcSuARZnjzHzIHxazwT2+9mc/w9gn8B3hHEScotCwcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v7lI9soG/SmwG2yUhc9KJyezmXo/Gk4Jf220jVov/Caf09EzhlUcyfLclXTbdZa/l
 8emUysqo5CvmTlokYxi6Q8LOHC4Murg51DmwS1atarMjEqU3O/Sj0M0ygc2zKgr5Cc
 EHEEqJooAKAed1/nPEOCTQ8HawNLFwvCvLrRWEac=
Date: Tue, 12 May 2020 21:29:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200512155927.GA4297@vkoul-mobl>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
 <20200512033035.GV1375924@vkoul-mobl>
 <84f09843-3245-5fa4-530f-c915b28e9bc5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f09843-3245-5fa4-530f-c915b28e9bc5@linux.intel.com>
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

On 12-05-20, 09:36, Pierre-Louis Bossart wrote:
> On 5/11/20 10:30 PM, Vinod Koul wrote:
> > On 11-05-20, 14:00, Pierre-Louis Bossart wrote:
> > > > > +	md = &bus->md;
> > > > > +	md->dev.bus = &sdw_bus_type;
> > > > > +	md->dev.type = &sdw_master_type;
> > > > > +	md->dev.parent = parent;
> > > > > +	md->dev.of_node = parent->of_node;
> > > > > +	md->dev.fwnode = fwnode;
> > > > > +	md->dev.dma_mask = parent->dma_mask;
> > > > > +
> > > > > +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
> > > > 
> > > > This give nice sdw-master-0. In DT this comes from reg property. I dont
> > > > seem to recall if the ACPI/Disco spec treats link_id as unique across
> > > > the system, can you check that please, if not we would need to update
> > > > this.
> > > Table 3 in the Disco for Soundwire 1.0 spec: "all LinkID values are relative
> > > to the immediate parent Device."
> > > 
> > > There isn't any known implementation with more than one controller.
> > 
> > But then it can come in "future" right. So lets try to make it future
> > proof by not using the link_id (we can expose that as a sysfs if people
> > want to know). So a global unique id needs to allocated (hint: idr or
> > equivalent) and used as master_id
> 
> Can you clarify if you are asking for a global ID for Intel/ACPI platforms,
> or for DT as well? I can't figure out from the soundwire-controller.yaml
> definitions if there is already a notion of unique ID.

If ACPI was unique, then I was planning to update the definition below
to include that. Given that it is not the case, let's make it agnostic to
underlying firmware.

> 
> properties:
>   $nodename:
>     pattern: "^soundwire(@.*)?$"
> 
>    soundwire@c2d0000 {
>         #address-cells = <2>;
>         #size-cells = <0>;
>         reg = <0x0c2d0000 0x2000>;

-- 
~Vinod

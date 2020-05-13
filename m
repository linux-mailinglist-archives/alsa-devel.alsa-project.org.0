Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E261D0F91
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 12:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B9B1666;
	Wed, 13 May 2020 12:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B9B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589365120;
	bh=3vuvhwtAZpnS66RSuG8LddV1to4ZKi+d7n0imn7UJ8s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=De55fRH5VV1y5SeEZ7qGsfik5Yk+ShK1YYvLr/drgtIwaVKNDoGUzk77pfpVFWGgN
	 /hq6o8PzaSeXe+I4kJH+PfcPmxwNxtz4Rs9xgi9Kfi87d2xHAvVADOoA659VZKDyJz
	 HxmptafK3PvDQPwPp/Uw4dJUWxBM24Qanh7hdPic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EA1AF80253;
	Wed, 13 May 2020 12:16:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28285F80247; Wed, 13 May 2020 12:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 285D4F800B7
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 12:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 285D4F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y9Az8Mqj"
Received: from localhost (unknown [106.200.233.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54E2B205ED;
 Wed, 13 May 2020 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589365011;
 bh=3vuvhwtAZpnS66RSuG8LddV1to4ZKi+d7n0imn7UJ8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y9Az8Mqjykr3Mhl7wM309gFo2qfAjdPDU03RauVflr7mQkhW9Ko8eerqxCst0CnUs
 c8ku8Nch4qUA2Q+oiyz2IzxqcU/f1Oc96tyhG2Cz66g5d6inR81Dur7d3pj/sYHcmO
 qerEBvI2kgWjPFORlIOrec/oiIoSDVR/9Ap6UHJ0=
Date: Wed, 13 May 2020 15:46:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200513101642.GC14092@vkoul-mobl>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
 <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
 <20200512033035.GV1375924@vkoul-mobl>
 <84f09843-3245-5fa4-530f-c915b28e9bc5@linux.intel.com>
 <20200512155927.GA4297@vkoul-mobl>
 <79ee2b4a-c2e3-aba7-8b67-b1a01922d089@linux.intel.com>
 <86d45af8-93db-d284-64d4-efa22ccc0908@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86d45af8-93db-d284-64d4-efa22ccc0908@linux.intel.com>
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

On 12-05-20, 12:01, Pierre-Louis Bossart wrote:
> > > > > > 
> > > > > > There isn't any known implementation with more than one controller.
> > > > > 
> > > > > But then it can come in "future" right. So lets try to make it future
> > > > > proof by not using the link_id (we can expose that as a sysfs if people
> > > > > want to know). So a global unique id needs to allocated (hint: idr or
> > > > > equivalent) and used as master_id
> > > > 
> > > > Can you clarify if you are asking for a global ID for Intel/ACPI
> > > > platforms,
> > > > or for DT as well? I can't figure out from the soundwire-controller.yaml
> > > > definitions if there is already a notion of unique ID.
> > > 
> > > If ACPI was unique, then I was planning to update the definition below
> > > to include that. Given that it is not the case, let's make it agnostic to
> > > underlying firmware.
> > 
> > I am not sure I understand how this would be done.
> > 
> > The call sequence is
> > 
> > sdw_bus_master_add(bus)
> >      sdw_master_device_add(bus, parent, fw_node)
> > 
> > At the bus level, we don't have any information on which controller the
> > bus is related to.

This should be done inside the sdw_bus. controller should not care about
this IMO.

> > We'd need to add an argument to sdw_bus_master_add() and have the
> > controller unique ID be allocated outside of the SoundWire core, hence
> > my question on whether the DT definition should not be extended.
> 
> And btw I don't think it makes sense to add a new definition for Intel. We
> already have a notion of HDaudio bus->idx that's set to zero since we don't
> have a case for multiple HDaudio controllers.
> 
> if we ever do have more than once controller, then we should rely on HDaudio
> bus->idx as the identifier and not create one specifically for SoundWire -
> which means as I mentioned above passing an argument and not defining a
> controller ID in the SoundWire core.

I was thinking of following code in bus.c

static DEFINE_IDA(sdw_ida);

static sdw_get_id(struct sdw_bus *bus)
{
        int rc = ida_alloc(&sdw_ida, GFP_KERNEL);

        if (rc < 0)
                return rc;

        bus->id = rc;
        return 0;
}

int sdw_add_bus_master(struct sdw_bus *bus)
{
        ...

        ret = sdw_get_id(bus);

        ...
}

void sdw_delete_bus_master(struct sdw_bus *bus)
{
        da_free(&sdw_ida, bus->id);
}

This way you get a unique master number across all devices and this has
nothing to do with link/of ids and is used for numbering masters in
sysfs uniquely.

HTH
-- 
~Vinod

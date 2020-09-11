Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592E2658E4
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 07:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB7DC1671;
	Fri, 11 Sep 2020 07:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB7DC1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599802814;
	bh=4YlGeAzSk+VGx7Lv2PxADvGdtfP9LG4jw7wIhUBPn2A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAQouz9Pb5s1pNX9E2BBWvXUeoz5sJbuYjaYa0Pr13BDEQM8kdyvMVIdGYoSrdP30
	 ReolaMOqBuhQEKkGzOqiv0SRvw7smfovZZWrvCrQv/JgnNgEspCG2uyxg+Be1bNeXY
	 jWvQ3v2OG8GkNmL8Fg6selSDRRS575AZs57BLgPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECFCAF8021C;
	Fri, 11 Sep 2020 07:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28993F8021C; Fri, 11 Sep 2020 07:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1545F80100
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 07:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1545F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="riUjklHY"
Received: from localhost (unknown [122.171.196.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28D0C21D81;
 Fri, 11 Sep 2020 05:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599802699;
 bh=4YlGeAzSk+VGx7Lv2PxADvGdtfP9LG4jw7wIhUBPn2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=riUjklHYjcpHSKbAt936DqtmLfL2dDXTo9r+oRDFaOCySYol6MGsWbAfxd+OkCIGj
 tGpQmNFlPWC9oAuPayqkaq7GfDIDM932wcbcZ9VOP1+u1xX5nRG9VXbRQbgte2PJHV
 yMeCyTWt+1oCzEl1ZYPSuURdGxtcHMqiIjbuq7KU=
Date: Fri, 11 Sep 2020 11:08:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: bus: add enumerated slave to device list
Message-ID: <20200911053814.GT77521@vkoul-mobl>
References: <20200909082711.11670-1-srinivas.kandagatla@linaro.org>
 <80081c70-9137-c9f0-9813-8166275ef7af@linux.intel.com>
 <ab107351-dbde-7f6d-c588-11572aed5d2d@linaro.org>
 <4cdcda10-bdc6-211f-d279-e74f57684b79@linux.intel.com>
 <d0c71a83-9dc1-83c3-5cb1-d8fb7dc7f809@linaro.org>
 <ed88432c-e21c-b5fc-3abc-5f574769b722@linux.intel.com>
 <20200910085621.GS77521@vkoul-mobl>
 <f3880470-cdc4-7b84-97a1-303f9a95d3f4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3880470-cdc4-7b84-97a1-303f9a95d3f4@linux.intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 10-09-20, 09:02, Pierre-Louis Bossart wrote:
> 
> > > > May be we could make the enumerated devices discovery bit more verbose!
> > > 
> > > Maybe adding a device number sysfs entry would help, e.g. reporting
> > > NotAttched or a value in [0,11] would tell you if the device is actually
> > > present.
> > 
> > Agreed, I cooked this patch to report verbose device status, let me know
> > if you are okay with this. I think this would be useful regardless of
> > current discussion.
> > 
> > On Db845c I see:
> > 
> > root@linaro-alip:/sys/bus/soundwire/devices# cat sdw:0:217:2010:0:1/status
> > Attached
> > root@linaro-alip:/sys/bus/soundwire/devices# cat sdw:0:217:2010:0:2/status
> > Attached
> 
> looks like we are all aligned on the idea, I have a similar patch to at
> https://github.com/thesofproject/linux/pull/2426
> 
> The difference is that the sysfs status and device_number is added even
> without a driver probe and when there's no firmware description. sysfs is
> currently only added after the driver probe, which wouldn't work for the
> case Srinivas was trying to deal with.

Okay sound fine

> but the way you dealt the status below is better than the switch case I
> used, so will merge this into my code.

Why merge? That patch can remain independent and you can add
device_number patch on top and another one for moving sysfs creation
without a driver probe, these three sound like three different patches
to me.

> Srinivas' patch needs a fix for ACPI platforms, won't probe otherwise since
> we don't have an of_node. If that's alright with everyone I can submit a
> patchset that gathers the 3 contributions.

Yes one series should be good, but lets keep one change in a patch
please

-- 
~Vinod

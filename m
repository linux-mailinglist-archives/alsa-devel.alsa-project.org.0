Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A75667921
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:25:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19F1791BD;
	Thu, 12 Jan 2023 16:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19F1791BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673537098;
	bh=xDmwjywJLhxTesfoaedLfKxuHBE4U5Qc/GEUQvlSwl0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KOQric1wmX5s7ic6p+repJkF6pQ2gkaRzpNBw3HHkDYGAgc/RFc3TQQrzYsi+p16X
	 BzIPm9dbKQfQUZbZ0QvISxBc0DR6wfeZZ3rrCFih94zOT+mJKZ1xJBYpW6/Jejh92C
	 E21Cfg7u/cmTaXAQTe/KQrmfZx03KdCNcG2YTJ3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53393F80542;
	Thu, 12 Jan 2023 16:23:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7107CF804E4; Thu, 12 Jan 2023 16:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D756F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D756F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iwQAOoop
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536996; x=1705072996;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xDmwjywJLhxTesfoaedLfKxuHBE4U5Qc/GEUQvlSwl0=;
 b=iwQAOooppIAloicQa7eOcQs8kcGFFrY1KbVEYWPyHbVjTffEs6B0NkTO
 21SJBbDpuiOPGHghNAqq43oxw9fEtDUytOQVlbYT65Y7XU37e6JhRawkG
 GBsWKDph6irtHDbe94BubkA9ts8H9rn8kLI+w1sYVg2Pa5GC5Zxp9RPaw
 S0Kgt165KufnccnnXSnn2jpPzyagNhDe64XGqOIfjOfyAkquHcuywNwlw
 dwoiJ3EQhSkoy38eLPD/WDxgcaifeDginyGQRp8huAjMTIuI1Nxfsne5W
 7hZ4JZXvUxtxfNYGZPW+aoOHCBfQ1EAMjKOxDTqU0FtRhBfM2xKDnaT9O g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388212571"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="388212571"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="607816928"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="607816928"
Received: from jbetan3x-mobl1.amr.corp.intel.com (HELO [10.209.143.163])
 ([10.209.143.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:11 -0800
Message-ID: <5d7659af-ffd0-4948-4c38-68815f4ca17f@linux.intel.com>
Date: Thu, 12 Jan 2023 08:47:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 14/19] soundwire: amd: add runtime pm ops for AMD master
 driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-15-Vijendar.Mukunda@amd.com>
 <1af8aa6a-9896-4d35-48de-f084fd16ebc7@linux.intel.com>
 <216b288d-16d3-5806-86fb-fc6ba83b757a@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <216b288d-16d3-5806-86fb-fc6ba83b757a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



>>> +static int __maybe_unused amd_suspend_runtime(struct device *dev)
>>> +{
>>> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
>>> +	struct sdw_bus *bus = &ctrl->bus;
>>> +	int ret;
>>> +
>>> +	if (bus->prop.hw_disabled || !ctrl->startup_done) {
>> do you have a case where the startup is not done? This was an
>> Intel-specific thing.
> We have included startup_done flag in probe_work to check whether Manager
> has started. In case if manager init sequence fails, then there is no need
> to apply any PM ops.

Not following, sorry.

We introduced the .startup callback for intel because of a power
dependency where we could not access and initialize the registers at the
.probe time for the master driver.

Do you have a similar dependency, and if not why not remove this flag?



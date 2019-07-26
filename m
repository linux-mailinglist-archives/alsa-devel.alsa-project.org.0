Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19B76DBC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836A820AE;
	Fri, 26 Jul 2019 17:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836A820AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564155394;
	bh=UKPHzrrQUDNaagKHvn34fEiXZu3ECYUZR1qNkI/+pgY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pqkO6sSqgfZe4AZ8bgA6AKI8wlRwgVTScw5ii96aVIMXXO/4aBJUMfGyaouVIyf6i
	 5/BnNUZ1rVzuTQZsfIA+0IMtqEVJSfIHhhJXzWdTJd4SoNOEa3cvDUSbZKsyCptggv
	 J3zz9ev4E8GX7tjIYm3ge7OM3LqM0X04FWvIYgeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE40DF800BE;
	Fri, 26 Jul 2019 17:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2529EF80393; Fri, 26 Jul 2019 17:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F7B0F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7B0F801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322067214"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 08:34:39 -0700
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-5-pierre-louis.bossart@linux.intel.com>
 <20190726140635.GB8767@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0dc45659-33cd-0dfb-946b-9303fe54ec1c@linux.intel.com>
Date: Fri, 26 Jul 2019 10:34:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726140635.GB8767@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 04/40] soundwire: intel: add debugfs
	register dump
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>> +static const struct file_operations intel_reg_fops = {
>> +	.open = simple_open,
>> +	.read = intel_reg_read,
>> +	.llseek = default_llseek,
>> +};
> 
> DEFINE_SIMPLE_ATTRIBUTE()?

yes

> 
>> +
>> +static void intel_debugfs_init(struct sdw_intel *sdw)
>> +{
>> +	struct dentry *root = sdw->cdns.bus.debugfs;
>> +
>> +	if (!root)
>> +		return;
>> +
>> +	sdw->fs = debugfs_create_dir("intel-sdw", root);
>> +	if (IS_ERR_OR_NULL(sdw->fs)) {
>> +		dev_err(sdw->cdns.dev, "debugfs root creation failed\n");
> 
> No, come on, don't do that.  I've been sweeping the kernel tree to
> remove this anti-pattern.
> 
> The debugfs core will print an error if you got something wrong, just
> call the function and move on, you NEVER need to check the return value
> of a debugfs call.

Yes, sorry to make your blood pressure go up... I missed this one in the 
cleanups yesterday. will fix.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

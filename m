Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3F2144388
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:45:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D72516C6;
	Tue, 21 Jan 2020 18:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D72516C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628709;
	bh=P2Gn+W3PNOkdECrKMN54YrYXEc1WGsWfovZuxLCc/LY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLm1BRF/lzvdLwe1rmV4L/2AWJFg3X0BnGBiF06tXEs/M63gLLr8Wtvc19Q9r5Ucy
	 TAS2lgDXPzS04KSEBnhEM6aTc2uWsRr4BRNkt4XWGH7oFt9QyNfkNXeMzohiMiZsgE
	 NTLjsiBtoFjFnulEDAzeAitO05mN02QQ5qZ87SUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06EE3F80271;
	Tue, 21 Jan 2020 18:31:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB4E3F8021D; Tue, 21 Jan 2020 18:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 946D4F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946D4F800CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="307265038"
Received: from kfang1-mobl.amr.corp.intel.com (HELO [10.251.147.146])
 ([10.251.147.146])
 by orsmga001.jf.intel.com with ESMTP; 21 Jan 2020 09:31:32 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20200114060959.GA2818@vkoul-mobl>
 <6635bf0b-c20a-7561-bcbf-4a480a077ae4@linux.intel.com>
 <20200118071257.GY2818@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73907607-0763-576d-b24e-4773dfb15f0b@linux.intel.com>
Date: Tue, 21 Jan 2020 11:31:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200118071257.GY2818@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 09/17] soundwire: intel: remove platform
 devices and use 'Master Devices' instead
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


> A rename away from probe will certainly be very helpful as
> you would also agree that terms 'probe' and 'remove' have a very
> special meaning in kernel, so let us avoid these

ok, so would the following be ok with you?

/**
  * struct sdw_md_driver - SoundWire 'Master Device' driver
  *
  * @init: allocations and initializations (hardware may not be enabled yet)
  * @startup: initialization handled after the hardware is enabled, all
  * clock/power dependencies are available
  * @shutdown: cleanups before hardware is disabled (optional)
  * @exit: free all remaining resources
  * @autonomous_clock_stop_enable: enable/disable driver control while
  * in clock-stop mode, typically in always-on/D0ix modes. When the driver
  * yields control, another entity in the system (typically firmware
  * running on an always-on microprocessor) is responsible to tracking
  * Slave-initiated wakes
  */
struct sdw_md_driver {
	int (*init)(struct sdw_master_device *md, void *link_ctx);
	int (*startup)(struct sdw_master_device *md);
	int (*shutdown)(struct sdw_master_device *md);
	int (*exit)(struct sdw_master_device *md);
	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
					    bool state);
};
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 491622C8CF6
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 19:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B333A1703;
	Mon, 30 Nov 2020 19:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B333A1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606761534;
	bh=w95GJELxBFf/dGCjUUNBSjN1d80L+qVhOjDJ+Qdr55M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzbDgSj0FAxvxtFqkqWEwGrf70u5w7spqH7lCVivBHn58Li9VLoftcy1hHSWL3S5E
	 2D1LpSyJ6Mi7a/noDA+9KZhseTAC+VM5Ofm0CmdZ1OVvJX5hrt0KfLE8utWxgzHKHE
	 xPHUedAytb63puzUcPsh/v7JOHoqVVq0XwClWdsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F530F8049C;
	Mon, 30 Nov 2020 19:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31093F8025F; Mon, 30 Nov 2020 19:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55D06F80247
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 19:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55D06F80247
IronPort-SDR: xXnd653fKuMj1OQTXgxclu3GEH6OBR0h8sOOkSo0HLGvRTuJKJTLSFq5BOS7eBmS/GKe1r6h7i
 v8uJTkrGgfTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="234293447"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="234293447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 10:36:59 -0800
IronPort-SDR: BeCpo/cUwVGoBhiIBAXypgNtcU3t8vq+saG2OVL6fZDSArhX9wCNKEGvt9cuOUkNTqVgBsteG0
 wfCQuzxk5kkw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="480759994"
Received: from whsiao-mobl.amr.corp.intel.com (HELO [10.209.17.17])
 ([10.209.17.17])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 10:36:57 -0800
Subject: Re: [PATCH 5/5] ASoC/SoundWire: rt711-sdca: Add RT711 SDCA
 vendor-specific driver
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
 <20201103172226.4278-6-yung-chuan.liao@linux.intel.com>
 <20201130181708.GF4756@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a53c4705-38d8-aa78-ab0a-c484814f2c64@linux.intel.com>
Date: Mon, 30 Nov 2020 12:36:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130181708.GF4756@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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



On 11/30/20 12:17 PM, Mark Brown wrote:
> On Wed, Nov 04, 2020 at 01:22:26AM +0800, Bard Liao wrote:
>> From: Shuming Fan <shumingf@realtek.com>
>>
>> This is the initial codec driver for rt711 SDCA version.
> 
> This and the rt1316 change are failing to build for me on both the
> regmap tree and a merge of this branch into the ASoC tree in an x86
> allmodconfig with the errors below, I assume this is a dependency on the
> SoundWire tree which I guess I need a pull request for?

Ah yes, the 'is_sdca' member definition was added in Vinod's 
soundwire/next branch

b7cab9be7c161 ('soundwire: SDCA: detect sdca_cascade interrupt')

This should be the only dependency for now, but I should mention we have 
a follow-up series to fix some pm_runtime issues that will also touch 
regmap/soundwire, so wondering if it might be simpler to have all 
SDCA-related changes in the SoundWire tree to avoid another dependency 
handling in the next two weeks.


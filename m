Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A21C37C777
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 18:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0E7D185B;
	Wed, 12 May 2021 18:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0E7D185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620836861;
	bh=yuvJEq06mN6effKnqHexkj2oma2V4bNN3FO8AkjlCAo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGp354pFhQsMh5h6+p8AT8fmt/6JrFD4sy8N2i5WBFb4UOnErRHElogAl4mnWgdYy
	 sAGQ2De9qZngmDf6uk4fyCyd45+WbptYK+DZhmPCslzsiV0n7wgNKEf3c+HWIki+ml
	 UbwLEAk4uhfZSVCQhwnOFrKncO2ILygxTZ4vlQB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 151B4F8026B;
	Wed, 12 May 2021 18:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07ECEF80240; Wed, 12 May 2021 18:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F213F8013A
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 18:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F213F8013A
IronPort-SDR: 3eDbmKyQjz2oXmmagmovDWsGlDndXMNhQtGmdDZRe3cjI684/VN48L+QtK9MtlLj7Ljo6QFhxi
 AWp+Suyfv+Ew==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="197773843"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="197773843"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 09:25:59 -0700
IronPort-SDR: dHfPVdrBuQvyobdL3A9WvlZuIsDR0OwBTAZWGxKLKH/0nZHrk0K2RmOiIZ11T4dXanxRqC3bLb
 vR0taFWc/cfg==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="455671473"
Received: from tzehanch-mobl2.amr.corp.intel.com (HELO [10.213.186.26])
 ([10.213.186.26])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 09:25:56 -0700
Subject: Re: [PATCH -next] ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
To: Mark Brown <broonie@kernel.org>
References: <1620791647-16024-1-git-send-email-zou_wei@huawei.com>
 <50fa973b-aa9f-ccb4-8020-9d38a63e2c30@linux.intel.com>
 <20210512155318.GA54562@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b2873226-4505-5a7b-74ce-95e8d4dd72b5@linux.intel.com>
Date: Wed, 12 May 2021 11:25:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512155318.GA54562@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 cezary.rojewski@intel.com, dharageswari.r@intel.com,
 kuninori.morimoto.gx@renesas.com, kai.vehmanen@linux.intel.com,
 yang.jie@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 fred.oh@linux.intel.com, tzungbi@google.com, sathyanarayana.nujella@intel.com,
 Zou Wei <zou_wei@huawei.com>, alsa-devel@alsa-project.org, brent.lu@intel.com,
 yong.zhi@intel.com
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



>> I wonder if this MODULE_DEVICE_TABLE generates the alias automatically,
>> which would make the existing ones added manually at the end of the files
>> unnecessary? If that was the case, then we should remove those MODULE_ALIAS
>> as well, no?
> 
> Yes, you shouldn't need the MODULE_ALIAS stuff there.

ok, if that's alright with everyone I'll send a larger patchset that 
correct this for all machine drivers, and add the following two tags to 
give proper credits to the reporters.

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Zou Wei <zou_wei@huawei.com>


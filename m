Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B33405C1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 13:41:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00521679;
	Thu, 18 Mar 2021 13:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00521679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616071310;
	bh=OxWAUwrThkhHp43zvtC2jn8e5Wl19QKu9B4DUwn9aL8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnDfZP/QVBksLeXtzUPOuKSdCbp5xqPVugbDpFIGHRs4F6mZ87p+OuKzQ7B993LUc
	 gTu8nOjHxUPUKE4aI37dG/GJdWY7gWNt1N+n5lC1Pi+PzuCaE5ES7oK6MyXXopaGyt
	 /cRjoJLaZenw+FOp7Dm4rK22ettBHh9M9eRikZQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AE0DF80163;
	Thu, 18 Mar 2021 13:40:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B4C1F80165; Thu, 18 Mar 2021 13:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5796F800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 13:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5796F800C8
IronPort-SDR: Hzo56s+tD+tPOsHYB8l3lmVFl5XD2U94fMEoSKTAigpM9zQrLbEnypOcVCHxaL4XyzJJplyDMY
 KlGmx9TAeC1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="251023112"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="251023112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:40:11 -0700
IronPort-SDR: bobDO5vCHWlSL+K0947iJLJWLiFdP6txAHPD36LmOswtWjGvdIhX0QGMFpAv9yyp9afjHJW5m3
 wxC2GzxwfLfw==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="406346515"
Received: from hapte-mobl.amr.corp.intel.com (HELO [10.212.219.204])
 ([10.212.219.204])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:40:10 -0700
Subject: Re: ASoC topology loading vs card bind
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <09c77d7e-3def-0643-b838-94d748529333@linaro.org>
 <4a4c96df-b145-5bb7-ad91-e5d3644f704c@linux.intel.com>
 <5b10ad71-44f0-d0f7-431e-18447e11596b@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27b526b6-9432-f014-d639-d3c80af191d3@linux.intel.com>
Date: Thu, 18 Mar 2021 07:40:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5b10ad71-44f0-d0f7-431e-18447e11596b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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


> Am trying to load FE dais from topology file along with the graph 
> definition.
> 
> Ex:
> Lets say we have a dai link in soundcard which has cpus->dai_name 
> pointing to an FE dai ("MultiMedia1") available in topology file.

Why would you want to do this? You are hard-coding an FE dailink in the 
machine driver, when it can be described in the topology.

Look at the SOF machine drivers, they have ZERO FEs hard-coded, 
precisely because we want the topology to define FEs.

And for legacy machine drivers, we also skip all FE dailinks and only 
use the ones from the topology.

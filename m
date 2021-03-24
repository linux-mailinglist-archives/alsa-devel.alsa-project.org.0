Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1176347C9B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E9941692;
	Wed, 24 Mar 2021 16:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E9941692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616599839;
	bh=BDivL1dqCC2YL/EKoozjWfLJ6v43uAGn13AGcdHgcy8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sln/7KHnuyfmxDmwID8AyD1TX3+n9nMla7KmzizVFnHrLlxySr6PQhKSRW4cnp0MJ
	 F5XmN+54ZdF7dWiZGl4PVQGlHc+x2WWSIoHIM7v2PICuoVn109aG7bADpW9wzV1y9k
	 c/kg0DKBGyBl/rNdZTsO+ivzcjnOy5Bd5j6pqpGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5985EF801D5;
	Wed, 24 Mar 2021 16:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 196EDF8016B; Wed, 24 Mar 2021 16:28:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C0B1F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C0B1F800FF
IronPort-SDR: 3EGhOkxq/yy+ijDrtWzzPhFMVH64JCZsTqr1vqP4pG4JobKW5Cdxbmuz6iaFxbRKDcW/hsIuwP
 MCLJ9gR5eD4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190822637"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="190822637"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:28:27 -0700
IronPort-SDR: er4V/IKDDaAmR7rV06PSvxdd4lrYBvh7XsGshGR0sfWHXCMc3L7/x+jYrtpKIvi+b6UuWtryNt
 leyVWupht4Lw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="608142641"
Received: from mailunda-mobl.amr.corp.intel.com (HELO [10.209.33.48])
 ([10.209.33.48])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:28:26 -0700
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
To: Codrin.Ciubotariu@microchip.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <7364fb08-fe43-167d-a083-db4a6234222c@linux.intel.com>
 <2e9d903f-dd76-5b22-77ea-5fc42be306fd@microchip.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <95d0f1c1-5a89-837f-b1dc-42482a3b1250@linux.intel.com>
Date: Wed, 24 Mar 2021 10:28:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2e9d903f-dd76-5b22-77ea-5fc42be306fd@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gustavoars@kernel.org, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, mirq-linux@rere.qmqm.pl
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


> I am using hw_params_fixup, but it's not enough. The first thing I do is
> to not add the BE HW constraint rules in runtime->hw_constraints,
> because this will potentially affect the FE HW params. If the FE does
> sampling rate conversion, for example, applying the sampling rate
> constrain rules from a BE codec on FE is useless. The second thing I do
> is to apply these BE HW constraint rules to the BE HW params. It's true
> that the BE HW params can be fine tuned via hw_params_fixup (topology,
> device-tree or even static parameters) and set in such a way that avoid
> the BE HW constraints, so we could ignore the constraint rules added by
> their drivers. It's not every elegant and running the BE HW constraint
> rules for the fixup BE HW params can be a sanity check. Also, I am
> thinking that if the FE does no conversion (be_hw_params_fixup missing)
> and more than one BEs are available, applying the HW constraint rules on
> the same set of BE HW params could rule out the incompatible BE DAI
> links and start the compatible ones only. I am not sure this is a real
> usecase.

Even after a second cup of coffee I was not able to follow why the 
hw_params_fixup was not enough? That paragraph is rather dense.

And to be frank I don't fully understand the problem statement above: 
"separate the FE HW constraints from the BE HW constraints". We have 
existing solutions with a DSP-based SRC adjusting FE rates to what is 
required by the BE dailink.

Maybe it would help to show examples of what you can do today and what 
you cannot, so that we are on the same wavelength on what the 
limitations are and how to remove them?


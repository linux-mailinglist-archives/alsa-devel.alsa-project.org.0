Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD855BAEF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 18:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA451680;
	Mon, 27 Jun 2022 17:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA451680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656345637;
	bh=ENJbuXj656pbEAK4xDMrx8tuaKh/RuP4LbBqC0yn8/s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8Ru73TInsQjJ8HIPZx0hWU5NWzCr20RNBoj7REg0F9Sztt37AwQBocZI/dNN38ED
	 fktq32KE7ZlQZBSAGPDU3wym1RwRzCcM6LZ4avxdZ6R/4JbkiK3eNhydeqB+sfpLDU
	 U7gvGQ+INgNifyfNWHaxgWQZIYJwE/u+ZVu7BNWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 629A1F8028D;
	Mon, 27 Jun 2022 17:59:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D613F8028B; Mon, 27 Jun 2022 17:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDA8F80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDA8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cY1iaIQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656345573; x=1687881573;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ENJbuXj656pbEAK4xDMrx8tuaKh/RuP4LbBqC0yn8/s=;
 b=cY1iaIQZtVoiI+5Unj8V3MNjb3FFU8eBoTsJl6tgwPqpZYBXBCWeHXIA
 37nKPgOZ9TGwtbg0bw2Vmculme7uZ6R2bo8RnvQdzSoeMmZAEBPYKhUIU
 a8uc/VEjRaZFYPfg3M+L547wIbqAnzIUuvxn8sZq1FiQri0D1oUdvfVlW
 Cb3u+UOibkK/D9wC821n/MbEZ4FFyhliOkltQ1XLU2pXNq1mP3wyfrDM7
 BDWETfwVAMocblNr+biCZgU0LO+lCR/+l61CswNy/A14uvEjdaSSIAvwB
 qsGVKENMRkjCq5fOAbtxTeSKIMssYpkRBK7ojQqCEaHLX8yXaLAPfbUJq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="280238447"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="280238447"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:59:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="622589630"
Received: from vthayala-mobl.amr.corp.intel.com (HELO [10.209.144.177])
 ([10.209.144.177])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:59:24 -0700
Message-ID: <650468f2-4a68-d1fa-157c-827fda5f1ed5@linux.intel.com>
Date: Mon, 27 Jun 2022 10:59:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
 <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
 <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
 <c668f83e-d9fb-35dc-a06d-6563d20ddc8c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c668f83e-d9fb-35dc-a06d-6563d20ddc8c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 6/27/22 10:41, Cezary Rojewski wrote:
> On 2022-06-27 4:45 PM, Pierre-Louis Bossart wrote:
>> On 6/25/22 03:29, Cezary Rojewski wrote:
> 
>>> Hmm.. that's a good feedback. Isn't ASoC's FE<->BE treated as a single
>>> PCM substream in sound/core/pcm_native.c though? If so, does it even
>>> make sense for card's BE DAI to be atomic, if it's FE counterpart is
>>> nonatomic already? Especially if it is specifying platform and cpu_dai
>>> that matches Intel's components which we know communicate using IPCs.
>>
>> I guess it depends on the cpu_dai implementation. Not all
>> implementations implement a delay in the .trigger callback and/or rely
>> on IPCs.
>>
>>> Warning is one thing, but will you be also getting rid of the
>>> if-statement in soc-pcm.c that actually forces nonatomic=1 on BE when FE
>>> is already declared as such? If the if-statement stays, I believe the
>>> declaring BE DAIs 'correctly' in the way to go.
>>
>> I meant just removing the dev_warn() only.
>>
>> See https://github.com/thesofproject/linux/pull/3723
> 
> So the framework is still fixing the flag for the driver. Ideally we
> would like to have all the drivers assign correct values to ->nonatomic
> flag themselves.
> 
> Now when I think about it, the message seems useful - at least as
> dev_dbg(). It _guides_ driver developer to the desired approach: setting
> the ->nonatomic flag for BE to '1' if the corresponding FE is already
> configured as such.

that would result in unnecessary changes to all machine drivers to get
rid of the message...

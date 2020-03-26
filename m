Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 166BD19423E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 16:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A701670;
	Thu, 26 Mar 2020 16:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A701670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585234920;
	bh=NEsefb6KXBbtCUvnJ15vHGn1PKiWmXbT+Jr42oXkRSE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnH+O6qOGk21x+ua0U+ylSkJJWe41eVWRqDytcAf2oVxCR7blsonQ2lNMrbShR+03
	 krLmvxRtTefbIGZXVOKT4V3mrd6Oyr4o/8l1qrCvr273Yqp31WL/AtJrB1YmQCG7jO
	 XEUPtNuuv2Y8xz+xcS1IFKRBBkC4qxXXZzmSE5mY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AB3F801F9;
	Thu, 26 Mar 2020 16:00:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A9CF80227; Thu, 26 Mar 2020 16:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7763F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 16:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7763F80095
IronPort-SDR: iuZh6NIWjdAm4k3liF5E+OJHqRAtWdATBtgHSKaSjHtj/SaCIwRtCNJ8/NOI3FgsvPYS4b8kE7
 Vzk3fEdI+O1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 08:00:10 -0700
IronPort-SDR: D4WI8SF2LckJyfFTetYlvAUTycmPhkVjJKllsaLHS5Dyp6ZvL5ECzq3sElRovdqSm2Kq8Frw3d
 K3ghitsJPyHg==
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; d="scan'208";a="240981478"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.212.133.193])
 ([10.212.133.193])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 08:00:09 -0700
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200325122230.12172-1-mateusz.gorski@linux.intel.com>
 <70860cdd-0017-7e6c-3a87-85e125e236fe@linux.intel.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <49890f9b-f6db-c989-6072-312014a1a1f2@linux.intel.com>
Date: Thu, 26 Mar 2020 16:00:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <70860cdd-0017-7e6c-3a87-85e125e236fe@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


> That's progress but is this complete?
>
> skl->i2s_dev->name is the name of the machine driver, I don't see the 
> part where this is modified to deal with the number of dmics?
>
> In your topology patches, the names are: hda_dsp_noDMIC 
> hda_dsp_DMIC_2ch hda_dsp_DMIC_4ch
>
> How would the relevant file be found based on the number of DMICs on 
> the platform? I must be missing something here?
>

The intention of this patch was not to deal with the different DMIC 
configurations problem. It only simplifies the topology binary 
selection. As you mentioned in one of previous mails, currently there 
are two options:

- name based on NHLT, which is pretty complicated, especially for end 
user, and is also depending on things like OEM name so the same topology 
will need to be renamed multiple times different devices (additionally, 
there are laptops on the market that do not have NHLT table at all)

- dfw_sst.bin, which is only a fallback binary name and should not be 
actually used because it could be misleading for users/distro intergrators

This change adds the third option, which is, in my opinion, the right 
way to deal with this problem. This name is simpler, does not depend on  
existence of NHLT, and makes life easier for users/distros.


And as for the mentioned DMIC confguration problem - I am doing a 
research to find the simplest way to deal with this.


Mateusz


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006234EDD2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 18:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77D171682;
	Tue, 30 Mar 2021 18:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77D171682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617121751;
	bh=mTKM7t7+Lb5d1ZDqyHSd5kQkZd7M2RCjubq0cv8rW2o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DiN7YHqSVC3DUl826sKQ3KFwnBFb4h4LhLsrFoM+cV/6tczraMFkcPsqd++GIM6cm
	 /umZE+fPu2AHuF6jHNU1Zjuyb235Fti32xWCv3VXvME29uHuMkfRa0RgcOo0VoyjAy
	 Bzu7+uw94zxr+mh2mfwVhNHxeINUWq9ZVgZGEBu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A943EF8026B;
	Tue, 30 Mar 2021 18:27:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E00FF80240; Tue, 30 Mar 2021 18:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD22F80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 18:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD22F80141
IronPort-SDR: ePQIgg+qne7XWrjWvWSJQymjU8ipM0rXEzttrklt66j6HzBGwTwhTJ3GYyAyHwnfE3ZTY8ONvd
 OIcRSZvjCAJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191905093"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="191905093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 09:27:36 -0700
IronPort-SDR: rALFS58bsnZc5hncT56uEWexYkHiT78FgWZUhcfa6HK7mP//UDKSJXPUBuGq7qT1R5wnbu5fVl
 178aX246NBfg==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="455091940"
Received: from leekevi1-mobl.amr.corp.intel.com (HELO [10.209.2.33])
 ([10.209.2.33])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 09:27:34 -0700
Subject: Re: [PATCH] ASoC: amd: Add support for ALC1015P codec in acp3x
 machine driver
To: Mark Brown <broonie@kernel.org>,
 "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
References: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
 <82817878-a30d-2b0c-07f8-48bcca3ebc80@linux.intel.com>
 <a55c7a75-22ab-31fc-81b3-ed8fa24027f4@amd.com>
 <20210330153534.GF4976@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cd0d87e0-caa5-b671-9c91-1c5f35c2f017@linux.intel.com>
Date: Tue, 30 Mar 2021 11:27:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330153534.GF4976@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Tzung-Bi Shih <tzungbi@google.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexander.Deucher@amd.com, shumingf@realtek.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 flove@realtek.com, Akshu Agrawal <akshu.agrawal@amd.com>
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



On 3/30/21 10:35 AM, Mark Brown wrote:
> On Tue, Mar 30, 2021 at 09:12:11PM +0530, Mukunda,Vijendar wrote:
>> On 3/30/21 7:52 PM, Pierre-Louis Bossart wrote:
> 
>>>>    static const struct acpi_device_id acp3x_audio_acpi_match[] = {
>>>>        { "AMDI5682", (unsigned long)&acp3x_5682},
>>>>        { "AMDI1015", (unsigned long)&acp3x_1015},
>>>> +    { "AMDP1015", (unsigned long)&acp3x_1015p},
> 
>>> This isn't a valid ACPI ID. AMDP does not exist in
> 
> ...
> 
>>> There was a similar issue with Intel platforms using this part, we had
>>> to use a different HID.
> 
>> Is it okay if i use "AMDI1016" for ALC1015P?
> 
> That's valid, though obviously you might regret that later on if someone
> releases a CODEC with a 1016 name (equally well ACPI being what it is
> there's no good options for naming).

wish granted, the 1016 already exists :-)
you may want to align with what we did for Intel and use the same HID: 
RTL1015

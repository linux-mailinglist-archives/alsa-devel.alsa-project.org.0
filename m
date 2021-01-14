Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A042F68FF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 19:08:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DDA16A8;
	Thu, 14 Jan 2021 19:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DDA16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610647720;
	bh=M2lHVWcXXUvPTNAj2SPbydq3PryXe7UZJW51G3RK1Ac=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mF1eizrrZvX40auxKeV4ekQqY9+vJpMq+G3/XUz0s6OsZR/aXeSMJ1Cne8zzXUd+s
	 m94xXno6Rbn8suswPMeGbogyppuhHxLPvmgFRRcNMLRXXjtpD98bVlV/dYJ7zCPak+
	 QoIw6oLabZvygCKVK5yp7qV9U6nT450VDJUIWD0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDEB6F804AA;
	Thu, 14 Jan 2021 19:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F183EF8025E; Thu, 14 Jan 2021 19:07:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09027F80113;
 Thu, 14 Jan 2021 19:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09027F80113
IronPort-SDR: XLfQH4TbACqltRhWqGRlXUv/5rUiMFYy3GcEfjFVYhzhDXFlkS+njMizGVhuKckCEHNWAsNqGf
 +qQzOiKu1h8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="178505916"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="178505916"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 10:07:07 -0800
IronPort-SDR: Va8hRLnaZRfDY91UW1iUE9xz4iXJaGkp1Z0hlGNZ0SYVGwkzOGJIziPRg+SClfgnyrm/y/Urvf
 9OG67BbkJY2g==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="382356824"
Received: from dvarelam-mobl1.amr.corp.intel.com (HELO [10.212.182.202])
 ([10.212.182.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 10:07:05 -0800
Subject: Re: [Sound-open-firmware] [PATCH 1/2] [v2] ALSA: hda: fix
 SND_INTEL_DSP_CONFIG dependency
To: Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
References: <20210112203250.2576775-1-arnd@kernel.org>
 <CAK8P3a0+YmZTzYYk0D5HpBEB7Kp=ryx1U4KRKCyz4XYM3v9rAQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4ad60e25-b1d5-9be1-a2bc-8bec9e4e85c1@linux.intel.com>
Date: Thu, 14 Jan 2021 12:07:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0+YmZTzYYk0D5HpBEB7Kp=ryx1U4KRKCyz4XYM3v9rAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rander Wang <rander.wang@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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



On 1/14/21 9:09 AM, Arnd Bergmann wrote:
> On Tue, Jan 12, 2021 at 9:32 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>
> 
>> ---
>> v2: fix various build issues in the first version, now passes
>>      all randconfig builds I tried
> 
> Please disregard this version, while I have a tree that passes
> the randconfig builds now, this was not the patch from it that
> I wanted to send...

No worries, I reworked the PCI case completely. Still running tests to 
make sure there's no regression
https://github.com/thesofproject/linux/pull/2683



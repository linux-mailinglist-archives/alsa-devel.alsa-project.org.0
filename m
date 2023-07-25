Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E757617AF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54262152F;
	Tue, 25 Jul 2023 13:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54262152F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286027;
	bh=wt30PyyiUGKguLZ/4q3Z0Vuj8Tz6MCttN0LhOD4lre0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=krDcTync3iNtLr+P85X7IkEg8p0FkMuu9tbIch6FwZERnmrVwS5uXifMiaKmS+Ttk
	 oQYvd/dOzvBDuTO4HmuPA0ly6M1DjiqpwFJ+pLkxN28c/7gDmUOhd2b9GAXB2gq21A
	 LGKYrvY05H9M2xhgd21x/6dDTIUwSJTZesSMjBdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 130C9F8057C; Tue, 25 Jul 2023 13:51:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7068DF80571;
	Tue, 25 Jul 2023 13:51:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E5D8F80163; Tue, 25 Jul 2023 12:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62B43F80149;
	Tue, 25 Jul 2023 12:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B43F80149
Message-ID: <bf495f63-0dcb-e680-4b74-0c4d1ff3463e@linux.intel.com>
Date: Tue, 25 Jul 2023 12:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/9] ALSA: hda/i915: Allow xe as match for
 i915_component_master_match
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-5-maarten.lankhorst@linux.intel.com>
 <518bb7a9-3a85-2c13-68bf-63baaff176ef@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <518bb7a9-3a85-2c13-68bf-63baaff176ef@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GK2YQGJV3ZTW6MZUU5JPAZBLPQSPAPCZ
X-Message-ID-Hash: GK2YQGJV3ZTW6MZUU5JPAZBLPQSPAPCZ
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:51:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GK2YQGJV3ZTW6MZUU5JPAZBLPQSPAPCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On 2023-07-24 12:28, Pierre-Louis Bossart wrote:
> 
> 
> On 7/19/23 18:41, Maarten Lankhorst wrote:
>> xe is a new driver for intel GPU's that shares the sound related code
>> with i915.
>>
>> Don't allow it to be modprobed though; the module is not upstream yet
>> and we should exclusively use the EPROBE_DEFER mechanism.
> 
> I can't figure out what this comment means.
> 
> how would the -EPROBE_DEFER mechanism help if the driver that will
> trigger a new probe is not upstream?
> 
> Not following at all what you intended to explain.

What I mean is that there is code inside the current code that does 
request_module("i915"), the comment meant I didn't try to add any logic 
for request_module("xe"), as the driver is not merged yet.

Additionally I am removing the request_module logic, but this comment 
was written when I first tried the simple solution of request_module("xe").

Turns out telepathy is hard, and using -EPROBE_DEFER is much simpler. :-)

Cheers,
~Maarten

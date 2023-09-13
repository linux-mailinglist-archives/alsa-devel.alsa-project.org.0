Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B379E94D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 15:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1471A950;
	Wed, 13 Sep 2023 15:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1471A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694611851;
	bh=o/yVG3pyAXACRfoRhgjuzyNFC0OYGB4XpXCwmstK5eI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YA+H6ow7j4nkQVagkp6dllu/abJ2OrpAs8vORT7abW8nCkX4SPHj60ouVKts3s9YO
	 4KoKiMPELCyRC961FzN3IQ3iMhwbNqywcMyr5WVBfsMjkCw2OxKwoxcNKlEG7GPNI5
	 Sg+DQ0JCnxyRhkup6n0dPwlOjxROwJHUManii3Ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B68A4F80212; Wed, 13 Sep 2023 15:29:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BDD8F80246;
	Wed, 13 Sep 2023 15:29:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC937F80425; Wed, 13 Sep 2023 15:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28EE2F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 15:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28EE2F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YpzQ2i2g
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38DCdvpp018783;
	Wed, 13 Sep 2023 08:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=jXUkuWQRgGnRREjnzrofeKJfs0TPp9/gwDU2O5wQCg8=; b=
	YpzQ2i2g4IlRzlkclLHl3bOgjyAntZx6RoqJedRanb9RS2hyGaSaRYs33JWsqjFL
	R2GrWb1jciGZ++6wADquCiftZTodBFNn/3e8vtI858UlYt0YO1YZJZJZuJsgfrzO
	jXy27hJbDduoB7dNiJn/MRsIKtYi+D2ODhdYM8XjiByiPEzcHqvgNI8G/sf8WVNt
	9Hx90O+LEZ80gifdi7S8136cBi2bcUNrxtF5KTgtE6lEAQNXgTeGWXSNwlFkENKe
	/fOy68y62dEmO/Hsu7p/W7N00ar2ySFUc0GgUggkhvag7WtSgxbQ2ecADrL/bn4b
	KdmYu7rXVoqRlA9ZL7t5dA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sgs97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 08:29:15 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 13 Sep
 2023 14:29:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 13 Sep 2023 14:29:13 +0100
Received: from [198.90.251.125] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7AA743560;
	Wed, 13 Sep 2023 13:29:13 +0000 (UTC)
Message-ID: <07967d0b-043b-2541-b293-5a61056339eb@opensource.cirrus.com>
Date: Wed, 13 Sep 2023 14:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] ASoC: soc-card: Add storage for PCI SSID
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>
CC: <pierre-louis.bossart@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
 <20230912163207.3498161-2-rf@opensource.cirrus.com>
 <92b2b69e-3175-651f-45bb-d9ae11eaec82@linux.intel.com>
 <66a4381b-1a35-495f-a74a-1da0af1334c1@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <66a4381b-1a35-495f-a74a-1da0af1334c1@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lxkA8S7jqudGOIYlsfZm9QtcFAekX3PY
X-Proofpoint-ORIG-GUID: lxkA8S7jqudGOIYlsfZm9QtcFAekX3PY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FIIYZC7646CCHWWOA6ISMGA6MVA5DFMJ
X-Message-ID-Hash: FIIYZC7646CCHWWOA6ISMGA6MVA5DFMJ
X-MailFrom: prvs=4620548a1c=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIIYZC7646CCHWWOA6ISMGA6MVA5DFMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/09/2023 13:58, Mark Brown wrote:
> On Wed, Sep 13, 2023 at 12:56:03PM +0200, Amadeusz Sławiński wrote:
>> On 9/12/2023 6:32 PM, Richard Fitzgerald wrote:
> 
>>> +#ifdef CONFIG_PCI
>>> +	/*
>>> +	 * PCI does not define 0 as invalid, so pci_subsystem_set indicates
>>> +	 * whether a value has been written to these fields.
>>> +	 */
>>> +	unsigned short pci_subsystem_vendor;
>>> +	unsigned short pci_subsystem_device;
>>> +	bool pci_subsystem_set;
>>> +#endif /* CONFIG_PCI */
>>> +
>>>    	char topology_shortname[32];
>>>    	struct device *dev;
> 
>> This looks bit weird to me, snd_soc_card is _generic_ struct which is not
>> device specific in any way, and now you add fields for PCI, can't this
>> somehow be done using drvdata or something?
> 
> You're right that it's a bit messy but if we use driver data then it
> becomes specific to a particular driver and there's a goal here to share
> with subfunction drivers.  I was thinking we could refactor to a union
> or otherwise extend if we find other users with a similar need.

Yes, I was trying to avoid multiple custom ways of passing the same
data around. A significant advantage of explicitly passing the SSID
(if it's available) rather than a more abstract identifier (such as a
char *) is that's it's very well defined exactly what a PCI SSID is so
we know we can use it verbatim. A more abstract identifier creates an
implied trust (or mistrust) between the machine driver and the component
receiving it whether it's unique and in a useful format.

I could de-ugly it a bit by moving it out into a separate struct/union
and having just a member of that struct type in snd_soc_card.

An alternative was to add a function like the existing
snd_soc_component_set_whatever() family but that means adding a callback
pointer to struct snd_soc_component_driver, which is creating more
space overhead than one value in the snd_soc_card.

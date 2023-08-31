Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C378F032
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 17:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 761331E8;
	Thu, 31 Aug 2023 17:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 761331E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693495440;
	bh=OfP4tbSZiDrBz9B3wfzO6LQNA1SNsJGkyCdWdtpOMN8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ItVx12W4axDfg6Ssum297XfqkBLQyF1i+Sb2SMpEE/zFhCbxzChPKm6ZjG5c/B1Yv
	 nZEbqVxaSPp5f4ozyR+e0aksUnAyVzHVKzt2GwQjsBfUWbx/r+Pu7JGbwSdufluClG
	 yZJoXf3Jzfzyf6XxUltlkKW/0FL8R50GiCgsunXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83561F80094; Thu, 31 Aug 2023 17:23:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F03FF800F5;
	Thu, 31 Aug 2023 17:23:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9BFEF80155; Thu, 31 Aug 2023 17:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63480F80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 17:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63480F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=h5XOtMhd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37VF9ufQ010374;
	Thu, 31 Aug 2023 10:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=QoTHImQpsUztV6bLsl45NRd1IskeAu8gfDTm3hK83sI=; b=
	h5XOtMhdIQ0asEr+VqgFjVwcJKOh79dFS3hJJ78egH0SiTGImzyJz42p4GTH+yUm
	JtZBTHwTaRUme3LH8gvSogiPbRbmhLtUAOwiM+Gd0ypPJ3Fi8rtW6qtLC3O/Kytl
	JrQKcNfIW8nARdN7lIF8LssSmEESGmBW9SE+wMNAsFhfd6ecvxXDc58FaV0gyYND
	rvvfP1Y0//SOeHxe6UsBseY7a6rDkuFB2edCS38s8pzaZhkz4dJvof8M0h7wih90
	I8aUK9+pV32hvl/7BjgdAW46+IpX8A+iJ6onVo3cWmJWXAowIsuFv03TNgQMvpnC
	PzNfwfyPoLSmA+lJ9catAQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyejaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 10:22:55 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 31 Aug
 2023 16:22:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 31 Aug 2023 16:22:52 +0100
Received: from [198.61.65.91] (EDIN4L06LR3.ad.cirrus.com [198.61.65.91])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BA2911D4;
	Thu, 31 Aug 2023 15:22:52 +0000 (UTC)
Message-ID: <d97094c6-1534-05ad-0452-c627d7c45802@opensource.cirrus.com>
Date: Thu, 31 Aug 2023 16:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
To: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>,
        Mark Brown
	<broonie@kernel.org>
CC: Vlad Karpovich <vkarpovi@opensource.cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
 <737c4114-5b54-444c-8a6a-de4e98566513@sirena.org.uk>
 <5B0EB2A2-2048-4A71-A4A9-D5167C7AB5EC@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5B0EB2A2-2048-4A71-A4A9-D5167C7AB5EC@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: On9qX7pPhbKz3vjHwmY6N5R3bWS16DnF
X-Proofpoint-GUID: On9qX7pPhbKz3vjHwmY6N5R3bWS16DnF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UEYWQMTTGXQLRCHG3DPOCJX5J74XMNKV
X-Message-ID-Hash: UEYWQMTTGXQLRCHG3DPOCJX5J74XMNKV
X-MailFrom: prvs=4607a3c195=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEYWQMTTGXQLRCHG3DPOCJX5J74XMNKV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/8/23 15:56, Rivera-Matos, Ricardo wrote:
> Hello Mark,
> 
>> On Aug 30, 2023, at 3:59 PM, Mark Brown <broonie@kernel.org> wrote:
>>
>> On Wed, Aug 30, 2023 at 02:55:33PM -0500, Vlad Karpovich wrote:
>>> Checks the index computed by the virq offset before printing the
>>> error condition in cs35l45_spk_safe_err() handler.
>>>
>>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>>> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
>>
>> Who actually wrote this patch?
> 
> I am the original author, allow me to clarify how and why this is supposed to work.
> 

I think Mark's comment is that the Signed-off-by chain doesn't match
the patch author. The s-o-b order implies that Ricardo wrote it and
Vlad is upstreaming it - but in that case this email should start with
a From: line to say that the author is Ricardo.


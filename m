Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CEF6ACAF6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:44:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C06113C;
	Mon,  6 Mar 2023 18:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C06113C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124680;
	bh=U5ExwUpQzbVSCRKCDOeNeyXPKdkOUbX+g5gHurJeJTI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UpY8zBbcE7mYgxTImArtMTIPkhX5SEBylVKVFQqkoZKYR2+ZcI9rn6E9OWQ0B6QS9
	 4bIWSth+5KC4WsxdaxZp5hnnBOV5MqkmPxhzv9FFm+yfsUhFEDm/vEk5CVvwaDaj7F
	 c6vrxlAwM1RZ0En+nmVp5nqa2ryz9OthZeUXtgkg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02423F804B1;
	Mon,  6 Mar 2023 18:40:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9018F80266; Thu,  2 Mar 2023 18:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FE9DF80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 18:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE9DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=guDveCFA
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3226u9RS031295;
	Thu, 2 Mar 2023 11:59:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=hfZGSmFBT/xzIYEjag0JyBPNqsj8KWXPKjm4UN+XDHs=;
 b=guDveCFAYEc3Qgm0TSx1rv909VdBAhqiYuKzzGGE7go69ldpWZ2UrqfpSCZLLhOJU5/W
 6b/wNFxok+lPxOhf4rwEQ0eH49ya0aLmy3UZRraAw+JIUcvCBN+5uii3aGCZwYcavF+z
 QzM89Hq6QxbWACiGTa7Ax9+t/Z3sHYDpn/HP28yccR3Il+LTptWcLVBREFlqiEaKEuRx
 2m2G+jYXlmcGms0PApwJxvOy2utIYdyEnpAejfsxAe2p8FtFMkCI4+lUeFsctHuTMiYj
 9qXkO7sC+BTLQEvZgd2/Z7BQ+DOCgAn2ACB0vF9m9AgLbHP/ncZpLgIxocCvmQzU/hpC cg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nyfmt94bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 11:59:08 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 2 Mar
 2023 11:59:06 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Thu, 2 Mar 2023 11:59:06 -0600
Received: from [141.131.206.93] (vkarpovich-ThinkStation-P620.ad.cirrus.com
 [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C40FA11AC;
	Thu,  2 Mar 2023 17:59:05 +0000 (UTC)
Message-ID: <6f34d2c8-21b5-5b75-a3cd-15f88ba0f760@opensource.cirrus.com>
Date: Thu, 2 Mar 2023 11:59:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] ASoC: cs34l45: Hibernation support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230302171154.2342527-1-vkarpovi@opensource.cirrus.com>
 <20230302171154.2342527-5-vkarpovi@opensource.cirrus.com>
 <8aef2c0c-9bd0-4c3a-86e1-7732ddedabfd@sirena.org.uk>
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
In-Reply-To: <8aef2c0c-9bd0-4c3a-86e1-7732ddedabfd@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sYWc5fOdMqr9WDkM3aoyWZyDTRU7qa_5
X-Proofpoint-GUID: sYWc5fOdMqr9WDkM3aoyWZyDTRU7qa_5
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8425611b2f=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6SOINNGCXTKSI432JX3PFBHPVZBMQ7OO
X-Message-ID-Hash: 6SOINNGCXTKSI432JX3PFBHPVZBMQ7OO
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:40:30 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SOINNGCXTKSI432JX3PFBHPVZBMQ7OO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L45 features a low-power Hibernation State. In this state, all 
register contents are lost, but the contents of
RAM are retained. In the Hibernation State, only always-on digital 
functions to support wake-up are enabled.
Entry to this state is achieved via the register interface (either by an 
external driver using the control port, or the
programmable DSP). Exit from this state is triggered by activity on 
device GPIO pins, intended SPI transaction, or I2C
transaction with intended slave address

On 3/2/23 11:19, Mark Brown wrote:
> On Thu, Mar 02, 2023 at 11:11:54AM -0600, Vlad Karpovich wrote:
>> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
>>
>> Adds support for the amplifier hibernation controlled by
>> DSP firmware.
> What is amplifier hibernation?

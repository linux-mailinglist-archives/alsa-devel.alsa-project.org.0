Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B458237C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 11:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695FC844;
	Wed, 27 Jul 2022 11:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695FC844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658915519;
	bh=H6fYuC0QNly62Q6UUf4+k5qW/1r3OMVgEe3S6YkSsHc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ywv4Qi7MSKzVORc9GOcHDd3bh2ymApFJkBFlRyYvgdArGQ7V+ycWqL6XNGx4DCjKA
	 23FFCboBFUHKUzKk6LxIF5EtY1RboZkUBoGw/3/2vvXWdsoNsKnxxnkXImePl2PdXz
	 U//b+2mq7OKvADg0q/aIDva6bwihzP1v1gmazNOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB2E6F80171;
	Wed, 27 Jul 2022 11:50:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A583F8015B; Wed, 27 Jul 2022 11:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C86E5F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C86E5F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aMLXa261"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R4fJco006636;
 Wed, 27 Jul 2022 04:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=HM5eFBZGRCdHvLCsHt6IMA/yn3ZNWVn2pGGu0+bjhKQ=;
 b=aMLXa2610H3t15JJZd2/oDXNpeP6kE9XaYY4WUWkD7jAqFUL8YhzL6pZEdsRlj2hNeLL
 2RXlz3W2uU9DseKxZh70Bb+si4TnQUAtBtF3ccKUakKqDN6GOeIXfH9Am4GXcVnemosD
 0Elmh0RX2uA9isK78wK9QhclNP6XsnzdGDKOT4nqPr1a1uzb8CvYZ6+5DlfDi1zMFVls
 rH4ccCbad034zITNk2uFyMjOvPLmrX7B2HvDLVwLIC/u34YtbycLtUCOOHJYvaZZf79W
 TxvYCP2M8VHM59mbmAzbhKDUYnnKCV9j/bUUPn6sovp5P9+hP97i1EGcEZbIQ4hpE7ob kw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp4q3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 04:50:45 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 04:50:43 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Wed, 27 Jul 2022 04:50:43 -0500
Received: from [198.61.65.94] (unknown [198.61.65.94])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3C4272D4;
 Wed, 27 Jul 2022 09:50:43 +0000 (UTC)
Message-ID: <b942ecbb-2334-cd9f-3569-a4dad1504d2b@opensource.cirrus.com>
Date: Wed, 27 Jul 2022 10:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Add support for CLSA0101
Content-Language: en-US
To: Cameron Berkenpas <cam@neo-zeon.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
 <91e34de4-1c85-073f-9c24-ce3133394fe6@neo-zeon.de>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <91e34de4-1c85-073f-9c24-ce3133394fe6@neo-zeon.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: thaaJHwGFhnlMKE2LYvvBLI2rIGxQiKo
X-Proofpoint-ORIG-GUID: thaaJHwGFhnlMKE2LYvvBLI2rIGxQiKo
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 7/26/22 16:35, Cameron Berkenpas wrote:
> Hello,
> 
> I can confirm this does _not_ work.
> 
> More specifically, with these patches, the original behavior still occurs:
> 1. You get left channel audio from the right speaker only.
Hi, yes, I did forgot the scan and multi instantiate part.
I will send V2 with the fix.

> 2. No sound at all after resuming from sleep.
> 3. You get sound after resuming from hibernate, but only as described in 
> #1.
This is a different issue, that will be fixed in the future.

> 
> If you apply a patch like this: https://paste-bin.xyz/71355
> 
> You  get properly working audio until you put the laptop to sleep or 
> hibernate. Upon resuming from either state, you get no audio at all.
> 
> On 7/26/22 03:11, Lucas Tanure wrote:
>> Add Support for the CLSA0101 laptop, an Intel version of CLSA0100.
>> This patch has been tested using the CLSA0100, ensuring it
>> doesn't break the sound for it.
>> We appreciate it if someone with CLSA0101 could verify that this
>> the patch works for them.
>>
>> Lucas Tanure (2):
>>    ALSA: hda: cs35l41: Use the CS35L41 HDA internal define
>>    ALSA: hda: cs35l41: Support CLSA0101
>>
>>   sound/pci/hda/cs35l41_hda.c   | 67 +++++++++++++++++++++--------------
>>   sound/pci/hda/patch_realtek.c | 12 +++++++
>>   2 files changed, 53 insertions(+), 26 deletions(-)
>>
> 


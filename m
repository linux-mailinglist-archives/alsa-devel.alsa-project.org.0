Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500B3E984A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D851191E;
	Wed, 11 Aug 2021 21:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D851191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628708780;
	bh=ZPGvdAiCmx53s1KkaKeYSBV9ItgFSnLQuUI5ZAbG/og=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbwzO34ueRQHGkJcNEYx0OKExPDVg7FNWWUAACfHcUo7QphM1Gh+liKRpj8i3G7hh
	 1wKq0cHLrI6zSCO4YYGj1JijbsQijmmrEUQlGasYWuDAKXpF8oxqLjQO3mB55v4FVH
	 bphnImRvkMywV5TL8oK+vz/cO2z/TBHLBwNWw4Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB112F804B0;
	Wed, 11 Aug 2021 21:04:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABE52F8032D; Wed, 11 Aug 2021 21:04:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E5CF8020D
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E5CF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Tcq5bmPN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9h6i2011884; 
 Wed, 11 Aug 2021 14:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=v5Vu9aZBmdP+Jr7hBzk15imFcZepXERnAkfrfZhtuN0=;
 b=Tcq5bmPNSj6da9PLgEgELcUNG7zA94JWT9v4PaVnCcMZmqJbxbQbKO1G/p951nKKyRw1
 Xifk1aTwMmGUON2pTL3ExISdKlUG5WYNON8O/ZL6Lgiy9tVCC2ols0r79Y+WpIRi/eCJ
 6Qh6+cMpBRIjTda0I5/GIJ4aXLiATtVcHnZMIWxRmjZhb/VWDxjXGvzsZ1zhcq/j95Rz
 SPEDYBuhhqWkx//0wJ0Z31/uMRkdWB/PxGtxJsEZ13BhFXTH3poCMR4uAUtkdrrMNXjm
 srmDzOE7YvxRIaCKfOCb+CI4fe5Jg7RiLVMTxPKTD13asGDrbUH4/rDwGsLF17QRKtbf jw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngp6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:03:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:33:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:33:49 +0100
Received: from [198.90.238.180] (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 59D1145D;
 Wed, 11 Aug 2021 18:33:37 +0000 (UTC)
Subject: Re: [PATCH v3 13/27] ALSA: hda/cs8409: Dont disable I2C clock between
 consecutive accesses
To: Takashi Iwai <tiwai@suse.de>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
 <20210730151844.7873-14-vitalyr@opensource.cirrus.com>
 <s5h7dh51thw.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <499860c1-bf6f-969a-a987-3302820b66af@opensource.cirrus.com>
Date: Wed, 11 Aug 2021 19:33:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h7dh51thw.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-ORIG-GUID: rOFeh5WWX3Sx3NKLHQtwpYVvFBDZHmBR
X-Proofpoint-GUID: rOFeh5WWX3Sx3NKLHQtwpYVvFBDZHmBR
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=763 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110130
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

On 01/08/2021 9:03 am, Takashi Iwai wrote:
> On Fri, 30 Jul 2021 17:18:30 +0200,
> Vitaly Rodionov wrote:
>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>
>> Only disable I2C clock 25 ms after not being used.
>>
>> The current implementation enables and disables the I2C clock for each
>> I2C transaction. Each enable/disable call requires two verb transactions.
>> This means each I2C transaction requires a total of four verb transactions
>> to enable and disable the clock.
>> However, if there are multiple consecutive I2C transactions, it is not
>> necessary to enable and disable the clock each time, instead it is more
>> efficient to enable the clock for the first transaction, and disable it
>> after the final transaction, which would improve performance.
>> This is achieved by using a timeout which disables the clock if no request
>> to enable the clock has occurred for 25 ms.
>>
>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>> ---
>>
>> Changes in v2:
>> - Improved delayed work start/cancel implementation, and re-worked commit message
>>   adding more explanation why this was required.
>>
>> Changes in v3:
>> - Cancel the disable timer, but do not wait for any running disable functions to finish.
>>   If the disable timer runs out before cancel, the delayed work thread will be blocked,
>>   waiting for the mutex to become unlocked. This mutex will be locked for the duration of
>>   any i2c transaction, so the disable function will run to completion immediately
>>   afterwards in the scenario. The next enable call will re-enable the clock, regardless.
> This looks almost fine, but just a couple of thoughts:
>
> - cancel_delayed_work_sync() means to it might keep the i2c enabled
>    after that point (just cancel the pending work).
>    Would it cause a inconsistency afterwards?
>
> - A similar procedure is needed for suspend callback to cancel / flush
>    the work.
>    The shutdown is another question, but usually it's fine to without
>    any special handling as long as the resource is kept.

Hi Takashi,

Thank you very much for your comments. It all make sense.

We will make further improvement and submit next version.

Thanks,

Vitaly

>
> thanks,
>
> Takashi



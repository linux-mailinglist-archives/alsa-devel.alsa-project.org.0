Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5433C020
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 16:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47701716;
	Mon, 15 Mar 2021 16:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47701716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615822755;
	bh=pltk3hQnIPZxUjaC/WfQGdXqEew++Qz6okQjuA0hCsE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mWXao5kUMIEDEiDpSGOOKXE/Wso2ORUpdjfpdBysZQHwwMWCt8sXYWnVSMd/qHG7E
	 i92MA1TY64QDiAJh4RW30TJvTKoJIZeTuaMuMCA/f/bWbVzfGAy+gKdO03QomLTxiY
	 y7Pew+qC8jOOOXxh20yqU0vO94dU0hUCYyOoHLAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D309F80163;
	Mon, 15 Mar 2021 16:37:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 050ECF80171; Mon, 15 Mar 2021 16:37:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DAF9F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 16:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DAF9F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="L9UFULic"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FFFxwn008883; Mon, 15 Mar 2021 10:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=g8rloe0vgTg2LzKu5YWaK0xwsmf5wmO0oYcImlEhJtw=;
 b=L9UFULicz1nA5C15zBeRwN6+6FTHDu41/15vwQxqkgvHsTSGBmk3f7vNXS6o//R4qaF4
 7XxW8Scu3Iv0UDLzLzNfAXGy07A2hHanugY7x+tDx3pIeX7sN+eoUQLchaMydEQzYoIY
 QPajqtBR9HKaZc7ot1fk8v23eveUaEcibeQVI9dhTera16bGhoeMJvl9KDJTkxSmHTCk
 BOUuzErKplCYahFhfxI3bGp5f12Na3r7A8WOK5Ue6g9Hyz+cEpwA8Zl/W4UwfG07fLTf
 KKdnRlcScSKFGvN9hVcNnLUmA0T2CAAZbWJOjet60sbw3lgQG9+qExdgkriNd9vO7WtQ kQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3790bs26vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 10:37:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 15:37:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 15:37:33 +0000
Received: from [198.90.238.45] (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F19B11D6;
 Mon, 15 Mar 2021 15:37:33 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] ALSA: hda/cirrus: Add error handling into CS8409
 I2C functions
To: Takashi Iwai <tiwai@suse.de>
References: <20210313113410.90088-1-vitalyr@opensource.cirrus.com>
 <20210313113410.90088-2-vitalyr@opensource.cirrus.com>
 <s5htupcrhc3.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <f9306811-5b69-ac11-2311-55656d11bddb@opensource.cirrus.com>
Date: Mon, 15 Mar 2021 15:37:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5htupcrhc3.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150110
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On 15/03/2021 7:45 am, Takashi Iwai wrote:

Hi Takashi,
Thanks a lot for your comments.

> On Sat, 13 Mar 2021 12:34:07 +0100,
> Vitaly Rodionov wrote:
>> @@ -1508,7 +1508,7 @@ static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int flag)
>>   static int cs8409_i2c_wait_complete(struct hda_codec *codec)
>>   {
>>   	int repeat = 5;
>> -	unsigned int retval = 0;
>> +	unsigned int retval;
>>   
>>   	do {
>>   		retval = cs_vendor_coef_get(codec, CIR_I2C_STATUS);
>> @@ -1520,78 +1520,82 @@ static int cs8409_i2c_wait_complete(struct hda_codec *codec)
>>   
>>   	} while (repeat);
>>   
>> -	return repeat > 0 ? 0 : -1;
>> +	return !!repeat;
>>   }
> If the return value of the function has changed, it's nicer to
> comment, e.g. a brief function description would be helpful.
> Also now this looks rather like a bool?
Yes, agreed , we will add comments to describe parameters and return values
>
>
>> @@ -1881,13 +1896,15 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
>>   	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
>>   	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
>>   
>> -	/* Clear interrupts */
>> +	/* Clear interrupts, by reading interrupt status registers */
>>   	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
>> -	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
>> -	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
> Why those two calls are removed?
This 2 call are redundant as we already did read these 2 registers in a 
code few lines above.
>
>>   	mutex_unlock(&spec->cs8409_i2c_mux);
>>   
>> +	/* If status values are < 0, read error has occurred. */
>> +	if ((reg_cdc_status < 0) || (reg_hs_status < 0) || (reg_ts_status < 0))
>> +		return;
> Parentheses around the comparison are superfluous, you can remove
> them.
Will fix.
>
> thanks,
>
> Takashi



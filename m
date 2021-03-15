Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43C33C028
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 16:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E88F01755;
	Mon, 15 Mar 2021 16:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E88F01755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615822862;
	bh=tANNBIccSa2Sai6rdNuctSG6VK1LsEkosGPtioxiIHA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TByEVjA1sY6+hKBjDdd2JrHAeRwIvjhIsYvjkftPfbpnYY0y24lfBTDB+fdQZzHEE
	 9OLS7dHJzfblqlWwugfzGl7x5EASmBpN/IggEP5inWZMtnri5ER7QzLIfXJ30p6j0c
	 ICIABekcDfxOpTubuUm8NSIdi7vVfFxA8s1AJyuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 753C6F80163;
	Mon, 15 Mar 2021 16:39:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0249AF801F7; Mon, 15 Mar 2021 16:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 645A9F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 16:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 645A9F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SMSM1Mxv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FFFx3k008868; Mon, 15 Mar 2021 10:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=0A7AcxMf6UOqUDVa39Cytpo/grM8iUnprLulx9C6ZM4=;
 b=SMSM1Mxvu7Kmi0nvpLeLKc/0rAWiPU+B2tkFjgmIsutlBdJtm5qtZCbs5lFKdxqaQYcU
 XYbkPsSCcvXe+g/2Dum8L7QhZKrhNh1HVrEGmeBDnYj1VPGggVMlCy7rGg4SjkbVZFzs
 n0YBSEM3oUf261Zosc6E/wbmH7fnG25DtWeHZQ+91yYkgYWnL2S08QfReML0rzzccGOW
 7MzyPEwGdutv8vDHDFntXwkKSZ6CU/6oavVCsi9xZJE/7BS1cet9tZMH4Vq6j+uRRTGn
 LZnjb0NIAHMrvXP3QgrXkeUJoy0aQcNbxWw5r98m12WlYd7HSJLsPRSpDcGek/32DVwX 6Q== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3790bs26xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 10:39:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 15:39:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 15:39:16 +0000
Received: from [198.90.238.45] (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C234E11D6;
 Mon, 15 Mar 2021 15:39:14 +0000 (UTC)
Subject: Re: [PATCH v1 4/4] ALSA: hda/cirrus: Make CS8409 driver more generic
 by using fixups.
To: Takashi Iwai <tiwai@suse.de>
References: <20210313113410.90088-1-vitalyr@opensource.cirrus.com>
 <20210313113410.90088-5-vitalyr@opensource.cirrus.com>
 <s5hsg4wrh3v.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <9dc404d3-9824-ab8a-7b7d-816aa05a5986@opensource.cirrus.com>
Date: Mon, 15 Mar 2021 15:39:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hsg4wrh3v.wl-tiwai@suse.de>
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

On 15/03/2021 7:49 am, Takashi Iwai wrote:
> On Sat, 13 Mar 2021 12:34:10 +0100,
> Vitaly Rodionov wrote:
>> @@ -1357,6 +1362,22 @@ static const struct hda_verb cs8409_cs42l42_init_verbs[] = {
>>   	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0080 },     /* I2C mode */
>>   	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x005b },     /* Set I2C bus speed */
>>   	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0200 },     /* 100kHz I2C_STO = 2 */
>> +	{ 0x24, AC_VERB_SET_CONFIG_DEFAULT_BYTES_0, 0xF0 }, /* Widget node ASP-1-TX */
>> +	{ 0x24, AC_VERB_SET_CONFIG_DEFAULT_BYTES_1, 0x20 },
>> +	{ 0x24, AC_VERB_SET_CONFIG_DEFAULT_BYTES_2, 0x21 },
>> +	{ 0x24, AC_VERB_SET_CONFIG_DEFAULT_BYTES_3, 0x04 },
>> +	{ 0x34, AC_VERB_SET_CONFIG_DEFAULT_BYTES_0, 0x50 }, /* Widget node ASP-1-RX0 */
>> +	{ 0x34, AC_VERB_SET_CONFIG_DEFAULT_BYTES_1, 0x20 },
>> +	{ 0x34, AC_VERB_SET_CONFIG_DEFAULT_BYTES_2, 0xa1 },
>> +	{ 0x34, AC_VERB_SET_CONFIG_DEFAULT_BYTES_3, 0x04 },
>> +	{ 0x2C, AC_VERB_SET_CONFIG_DEFAULT_BYTES_0, 0xF0 }, /* Widget node ASP-2-TX */
>> +	{ 0x2C, AC_VERB_SET_CONFIG_DEFAULT_BYTES_1, 0x00 },
>> +	{ 0x2C, AC_VERB_SET_CONFIG_DEFAULT_BYTES_2, 0x10 },
>> +	{ 0x2C, AC_VERB_SET_CONFIG_DEFAULT_BYTES_3, 0x90 },
>> +	{ 0x44, AC_VERB_SET_CONFIG_DEFAULT_BYTES_0, 0x90 }, /* Widget node DMIC-1 */
>> +	{ 0x44, AC_VERB_SET_CONFIG_DEFAULT_BYTES_1, 0x00 },
>> +	{ 0x44, AC_VERB_SET_CONFIG_DEFAULT_BYTES_2, 0xA0 },
>> +	{ 0x44, AC_VERB_SET_CONFIG_DEFAULT_BYTES_3, 0x90 },
> Those widgets are all pin widgets, right?  If so, setting via the
> pincfg table would be more suitable, as it's cached and exposed via
> sysfs for debugging.

Yes, you are right, actually we already have these widgets in pincfg 
table, so this code is redundant.

Will fix in next version.

>
>
> thanks,
>
> Takashi



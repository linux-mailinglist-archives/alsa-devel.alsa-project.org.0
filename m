Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DFD32D994
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 19:47:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83BE21752;
	Thu,  4 Mar 2021 19:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83BE21752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614883621;
	bh=uAkhLJvLfjH1XwFdghRDLMjLFmwhZw71dfBW2OftlxY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDtnDoLSadJmrN3gtZvIi9a+BmSCgFK7JhoBTVtkxb0HDfZaH6nlE1PxNw6uKTbkk
	 Q8ZVyn8qSMrtQBJLEhgW4YxaPco/YK/58KOjqGlw96uV2U6cLKMcdVgdK16t2UKyKr
	 MkDkOaNHpmGL5wuEiG/t1EOnnmjFB5JpZf7MGRGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB7C5F80271;
	Thu,  4 Mar 2021 19:45:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4027AF80269; Thu,  4 Mar 2021 19:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0CE2F800ED
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 19:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CE2F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LYe1luI6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124IWCCx016648; Thu, 4 Mar 2021 12:45:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=9YnOQSjZf3bbcOgBfkersI4f1qMN4YhWlYOh/26S/JE=;
 b=LYe1luI6zW5yjuK19/Gm5UTOpk2Pe2yyIg8ljE+UgJ8C7KLnHR4dDEzEW6LgYHMpFGTF
 alU+pjZbppWp6MYQnR2DMqPR7H52UlgkwVtXm5BR45rS30Vk0DWH37i0TPx+3j2KtGpr
 7vux2BwTOEwsegrh6Zp1aPyFYjprCS02TMrONyNB7ENMY+xQO94xz6E9r37R6a62hF2U
 j8q5V10bzTy72gpF8LdRLlsPvfPK2pfgmOcp/aqAb8PqPTXcDHKhoNzxHeUlLEW2e++k
 Mm6tXZ/fj6K1jUGbyuJEHEQQumgBcalYtmUamzUmKpIf7gNWfXkaP9/8/+iyZcqzbdX+ lQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6y49m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 04 Mar 2021 12:45:16 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 4 Mar 2021
 18:45:14 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 4 Mar 2021 18:45:14 +0000
Received: from [198.90.238.45] (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF55711D0;
 Thu,  4 Mar 2021 18:45:13 +0000 (UTC)
Subject: Re: [PATCH 4/4] ALSA: hda/cirrus: Add Headphone and Headset MIC
 Volume Control
To: Takashi Iwai <tiwai@suse.de>
References: <20210303182959.5322-1-vitalyr@opensource.cirrus.com>
 <20210303182959.5322-5-vitalyr@opensource.cirrus.com>
 <s5h5z279ggk.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <d2b64cb9-895e-f6ab-d95d-8c2d5962d64c@opensource.cirrus.com>
Date: Thu, 4 Mar 2021 18:45:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5h5z279ggk.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=975 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040088
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
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

On 04/03/2021 1:49 pm, Takashi Iwai wrote:
> On Wed, 03 Mar 2021 19:29:59 +0100,
> Vitaly Rodionov wrote:
>> +static int cs8409_cs42l42_volume_get(struct snd_kcontrol *kcontrol,
>> +				 struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
>> +	hda_nid_t nid = get_amp_nid(kcontrol);
>> +	int chs = get_amp_channels(kcontrol);
>> +	long *valp = ucontrol->value.integer.value;
>> +	char vol = 0;
>> +
>> +	codec_dbg(codec, "%s() nid: %d\n", __func__, nid);
>> +	snd_hda_power_up(codec);
>> +	switch (nid) {
>> +	case CS8409_CS42L42_HP_PIN_NID:
>> +		mutex_lock(&cs8409_i2c_mux);
>> +		if (chs & 1) {
>> +			vol = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
>> +				CS8409_CS42L42_REG_HS_VOLUME_CHA, 1));
> Better to cache the values instead of i2c read at each time?
> Then the unnecessary power up/down sequence can be avoided, too.
Yes, agree. Will be fixed in next version of patch.
>
>
> thanks,
>
> Takashi

Thank you,

Vitaly


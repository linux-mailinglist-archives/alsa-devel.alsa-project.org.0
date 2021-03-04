Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9532D984
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 19:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D654D173F;
	Thu,  4 Mar 2021 19:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D654D173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614883104;
	bh=e4SZNrGBGQP/CGyhEXUSRHpCQ+ASS/jEstBtz09O5dc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2+6syXRF91O6+A9J1K5DFEAY6XJjblJIgLcYU/Y6BOSl3MilDAqPEvXCFoo5ZK0Q
	 MNa9jnknJrXzMMoQqX6tnIogqAmd57rsJe52uBsJQ7DAw6136OxuJacCRfMIMwPKuP
	 mYxEssj7XBHwdhnrlYR+vsBh6Xz7im6WZaKSmARE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A48BF8007E;
	Thu,  4 Mar 2021 19:36:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2C0AF80269; Thu,  4 Mar 2021 19:36:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E96CF8007E
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 19:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E96CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GYYcfl/Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124IWDI4016684; Thu, 4 Mar 2021 12:36:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=y5RLHNSdtnzCMlzZSME/Unj9ujfO7H/pzlZ40xq7j7o=;
 b=GYYcfl/ZenBv2hqpC/aM9+53kUyn7y3CSaS+QqkxaIFFWu/AcdSxvT/h5Qj1XqS6nJ6D
 MP8CMWiwEfq2NT01thIMlHFGwZN/3XYBOmw5cmjwb/ezlKuVAlOPqeEIpSCgiTYdCvAv
 CCPhF/AXon7L8hkUDInkqV4DYvmw9ABMSW3RCK5fjyqKs+jzsNEOfmrFbS8z0Gzrmlvc
 GVXB+7ysek3xkyqeQ9UqCraY8WwuBHfAJrwXP4sFjkR4QkE4hRlZeVGbB7dxHPkcIOrT
 BSsTcD5q1kGllg7u73iaoMLBwhIgiSyAflBP4zmmjN4ow9jAe+jE+XQmvmDJ8W+fRKjK 6A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6y41k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 04 Mar 2021 12:36:38 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 4 Mar 2021
 18:36:36 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 4 Mar 2021 18:36:36 +0000
Received: from [198.90.238.45] (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 39FBC11CB;
 Thu,  4 Mar 2021 18:36:36 +0000 (UTC)
Subject: Re: [PATCH 2/4] ALSA: hda/cirrus: Add support for CS8409 HDA bridge
 and CS42L42 companion codec.
To: Takashi Iwai <tiwai@suse.de>
References: <20210303182959.5322-1-vitalyr@opensource.cirrus.com>
 <20210303182959.5322-3-vitalyr@opensource.cirrus.com>
 <s5h8s739gxf.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <3e50185b-d674-4890-8173-7bdd54c4eafb@opensource.cirrus.com>
Date: Thu, 4 Mar 2021 18:36:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5h8s739gxf.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1011 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=972 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040088
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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

On 04/03/2021 1:39 pm, Takashi Iwai wrote:
Thank you very much for quick response!
> On Wed, 03 Mar 2021 19:29:57 +0100,
> Vitaly Rodionov wrote:
>> +static const struct hda_verb cs8409_cs42l42_init_verbs[] = {
>> +	{ 0x01, AC_VERB_SET_POWER_STATE, 0x0000 },    /* AFG: D0 */
> I guess this power state change is superfluous.  The AFG node is
> already powered up when the codec probe or init is called.
Yes, This should be removed
>
>> +	{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x0020 }, /* GPIO 5 out, 3,4 in */
>> +	{ 0x01, AC_VERB_SET_GPIO_DATA, 0x0000 },      /* GPIO  data 0 */
>> +	{ 0x01, AC_VERB_SET_GPIO_MASK, 0x003f },      /* Enable GPIO */
> Those are handled in spec->gpio_dir, gpio->data and gpio->mask
> fields.
Will handle via spec fields.
>
>> +	{ 0x01, AC_VERB_SET_GPIO_WAKE_MASK, 0x0018 }, /* WAKE from GPIO 3,4 */
>> +	{ 0x47, AC_VERB_SET_PROC_STATE, 0x0001 },     /* Enable VPW processing  */
>> +	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x0002 },     /* Configure GPIO 6,7 */
>> +	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0080 },     /* I2C mode */
>> +	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x005b },     /* Set I2C bus speed */
>> +	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0200 },     /* 100kHz I2C_STO = 2 */
> Those remaining verbs are good in the init verbs.  But I suppose they
> have to be applied at the resume as well?  But...
This was added in the next patch, but you are right we should handle it 
here.
>
>> +static int cs8409_cs42l42_fixup(struct hda_codec *codec)
>> +{
>> +	int err = 0;
>> +	struct cs_spec *spec = codec->spec;
>> +	unsigned int pincap = 0;
>> +
>> +	/* Basic initial sequence for specific hw configuration */
>> +	snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
> ... it seems applied only at the fixup call at parsing?
>
> Ditto about cs8409_cs42l42_hw_init(codec).
Yes, needs to be fixed. I will make v2 patch set.
>
>
> thanks,
>
> Takashi



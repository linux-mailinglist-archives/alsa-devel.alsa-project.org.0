Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A72FB50F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803B1187D;
	Tue, 19 Jan 2021 10:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803B1187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611050010;
	bh=u6vd0WH8Jkh2ZtT/Km3GMAnv6EYJMf8Jei5+9GKAl68=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4q00iLItSYfMHGxLH+ioWmCh9mZizPPyDffxjZnheOYedHAZeg82w5HttN1zrRTk
	 EMXjE+VjaYs8tx5xv2+1nIT2IVBKNDIi+a9/Vuo4UV1agcwwyHDv+7UF1EHkKw9s4i
	 eZd5D46O6YYS0qvQ5DBHAqeHR6YhceGMCNUyvIqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B57F80137;
	Tue, 19 Jan 2021 10:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07A9FF80257; Tue, 19 Jan 2021 10:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C158F80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C158F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="E0FLQ5IM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10J9poiF017510; Tue, 19 Jan 2021 03:51:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=ZGcMmV8ud8RsHGVG+9fWIXTvDt1zAVWYEvH2Lib4jVI=;
 b=E0FLQ5IMWCry+Mfo6u3aruWZbOGbkgCf5ivhN9bPBatcRSsUC23rbZ/0dEjXNZWThb9w
 wZi8T0ROP1rZ9E0mqKjoU19GwrVHFtFfF2kcepgO6LuFzeva57UYD/XhAISQIe5olW1I
 aX5+WU8g/4hur2QF4ISPcjdgXx0WMXdY73NzYedr5dq199O9Nc/gB8FlIuzxEuNjMesX
 1+haR7jWn0j9o00um2j/6DXTf3qcTiG9R4Dd986tFzHlG0SSUZt18WM3onJ0vqRZZPV2
 j1NNVT/6qMCTI450P9AFWCfKUJbWu8O7Mua0kl1Mdt6XkQq5f9JtANGOtvrXlgOXYF4v 3w== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 363xe7avy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 Jan 2021 03:51:50 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 19 Jan
 2021 09:51:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 19 Jan 2021 09:51:48 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.215])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 84AA311CB;
 Tue, 19 Jan 2021 09:51:41 +0000 (UTC)
Subject: Re: [PATCH v2 08/12] ASoC: arizona-jack: convert into a helper
 library for codec drivers
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-9-hdegoede@redhat.com>
 <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
Date: Tue, 19 Jan 2021 09:51:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=937 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190059
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On 18/01/2021 17:24, Andy Shevchenko wrote:
> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Convert the arizona extcon driver into a helper library for direct use
>> from the arizona codec-drivers, rather then being bound to a separate
>> MFD cell.
>>
>> Note the probe (and remove) sequence is split into 2 parts:
>>
>> 1. The arizona_jack_codec_dev_probe() function inits a bunch of
>> jack-detect specific variables in struct arizona_priv and tries to get
>> a number of resources where getting them may fail with -EPROBE_DEFER.
>>
>> 2. Then once the machine driver has create a snd_sock_jack through
>> snd_soc_card_jack_new() it calls snd_soc_component_set_jack() on
>> the codec component, which will call the new arizona_jack_set_jack(),
>> which sets up jack-detection and requests the IRQs.
>>
>> This split is necessary, because the IRQ handlers need access to the
>> arizona->dapm pointer and the snd_sock_jack which are not available
>> when the codec-driver's probe function runs.
>>
>> Note this requires that machine-drivers for codecs which are converted
>> to use the new helper functions from arizona-jack.c are modified to
>> create a snd_soc_jack through snd_soc_card_jack_new() and register
>> this jack with the codec through snd_soc_component_set_jack().
> 
> ...
> 
>> +int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
>>   {
>> -       struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
>> +       struct arizona *arizona = info->arizona;
>>          struct arizona_pdata *pdata = &arizona->pdata;
> 
>> +       int ret, mode;
>>
>>          if (!dev_get_platdata(arizona->dev))
>> -               arizona_extcon_device_get_pdata(&pdev->dev, arizona);
>> +               arizona_extcon_device_get_pdata(dev, arizona);
>>
>> -       info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
>> +       info->micvdd = devm_regulator_get(arizona->dev, "MICVDD");
> 
> I'm wondering if arizona->dev == dev here. if no, can this function
> get a comment / kernel-doc explaining what dev is?
> 

pdev->dev would be *this* driver.
arizona->dev should be the MFD parent driver.

I think these gets should be against the dev passed in as argument
(I assume that is the caller's pdev->dev). So they are owned by this
driver, not its parent.


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B315D8B0926
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 14:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0FC826;
	Wed, 24 Apr 2024 14:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0FC826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713961288;
	bh=bABuUtxtwMiaDJEDth6yYKqkY4fMD7xJ78zqRkijgc0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gq2PpBM8JDi2DsM7XkCf5TpmDTMTOgd5KtkgJ1/lXbX/+F9WqwBZvad+RlnkIds2z
	 2UvELN0DAzjZ25XOlxsT8jLdnePNrY+mgH9w/B0jP3is8nvyWiFTRuM99Bm+7gkXef
	 ALc0jMI9AMeLPQ6Kr+CAhy+fW/pPGNiCzSp7pNsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FEBCF8057B; Wed, 24 Apr 2024 14:20:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC12CF805A0;
	Wed, 24 Apr 2024 14:20:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FC8F80423; Wed, 24 Apr 2024 14:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16B41F801C0
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 14:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B41F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=oPBxCIqj
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43OC4omW029734;
	Wed, 24 Apr 2024 14:20:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=hkSUB26Hij3YoH4d4gONssMZiD9lhMIi9MYuoDahbc0=; b=oP
	BxCIqjZqjU5yIPdolezp3gucfYE43BpO2moF0boJpv1s74317nNrf8tTbYX5usOd
	rlKx/FhS1Qy6Jkjea82P6nnIhij2k6RtqQ72RGkfOKHZzW/rYU1jige7eN6glRBm
	Gr/fYnvQ0nI1FFIhwyV+FpQcOob58VqnssUOpcpR/bfBeTjXY5MTu8NY0VN5oLNt
	baPC6vo+Z6OwTORIZk9BIz6pJZyBiWpxinx+vs127hpTMIh3Q7+NTYQB11bqSkWu
	wTRZ/tTR1dd1WWC/yQviBRPlU7NtgpxHp9kyOZz9PzdXYOFqZatkp9e4ugAKrRJ2
	ZAcLVNQAQ/E+lH5KwgDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmrnj5npa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 14:20:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 16FD54002D;
	Wed, 24 Apr 2024 14:20:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C4C621A91F;
	Wed, 24 Apr 2024 14:19:21 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 14:19:18 +0200
Message-ID: <a0bd94ce-3ddb-4448-ada9-7070323cc98f@foss.st.com>
Date: Wed, 24 Apr 2024 14:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/13] of: property: fw_devlink: Add support for
 "access-controller"
To: Saravana Kannan <saravanak@google.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
CC: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Rob Herring <robh@kernel.org>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <20240105130404.301172-7-gatien.chevallier@foss.st.com>
 <CAGETcx8HdnspNfDEJP+cqShJPsDryzGkOVq6B99cFQzkZi3dMg@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: 
 <CAGETcx8HdnspNfDEJP+cqShJPsDryzGkOVq6B99cFQzkZi3dMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_10,2024-04-23_02,2023-05-22_02
Message-ID-Hash: F5XCZZUKI3DJJOCZHT7DKK3P7KP4VS2Q
X-Message-ID-Hash: F5XCZZUKI3DJJOCZHT7DKK3P7KP4VS2Q
X-MailFrom: prvs=4844e329ba=alexandre.torgue@foss.st.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5XCZZUKI3DJJOCZHT7DKK3P7KP4VS2Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Saravana

On 4/24/24 07:57, Saravana Kannan wrote:
> On Fri, Jan 5, 2024 at 5:03 AM Gatien Chevallier
> <gatien.chevallier@foss.st.com> wrote:
>>
>> Allows tracking dependencies between devices and their access
>> controller.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Please cc me on fw_devlink patches. Also, this patch is breaking the
> norm below. Please send a fix up patch.
> 
>> ---
>> Changes in V9:
>>          - Added Rob's review tag
>>
>> Changes in V6:
>>          - Renamed access-controller to access-controllers
>>
>> Changes in V5:
>>          - Rename feature-domain* to access-control*
>>
>> Patch not present in V1
>>
>>   drivers/of/property.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/of/property.c b/drivers/of/property.c
>> index afdaefbd03f6..7f737eac91b2 100644
>> --- a/drivers/of/property.c
>> +++ b/drivers/of/property.c
>> @@ -1268,6 +1268,7 @@ DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>>   DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>>   DEFINE_SIMPLE_PROP(panel, "panel", NULL)
>>   DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
>> +DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller-cells")
>>   DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>>   DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>>
>> @@ -1363,6 +1364,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>>          { .parse_prop = parse_regulators, },
>>          { .parse_prop = parse_gpio, },
>>          { .parse_prop = parse_gpios, },
>> +       { .parse_prop = parse_access_controllers, },
> 
> All the simple properties are listed before the suffix ones as the
> suffix checks are more expensive. So, you should have inserted this
> right before the suffix properties. Also, there's a merge conflict in
> linux-next. So make sure you take that into account when sending the
> fix up and picking the order.

I'm fixing the stm32-next branch by inserting

         { .parse_prop = parse_access_controllers, },
just before

	{ .parse_prop = parse_regulators, },


> 
> -Saravana
> 
>>          {}
>>   };
> 
>>
>> --
>> 2.35.3
>>

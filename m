Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6178656FB7
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 22:08:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D035D4592;
	Tue, 27 Dec 2022 22:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D035D4592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672175294;
	bh=Xl77FY8t9sQpj7q9gW1/p836bgMhaFrlUN3tLO0mwVg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ffMs826ClHtkFwDH3IEgo11jTdKFNg4Y0oF0m76j802yElmpHSjV/SgOhheKWpHjU
	 2WA7Jec7oBlgGd0nqtiD2tdswlstZDY8y5jfqyPT2J7hZ3AjmByWk/vr4F3SNgWNg6
	 DFd50mOGqA6RMwXt1rPgHmNRoQKwJaaBIsO//mpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A2BF8023B;
	Tue, 27 Dec 2022 22:07:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64BA5F80535; Tue, 27 Dec 2022 22:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A50F2F804FB
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 22:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50F2F804FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oDXqDyMh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRKrAxv005531; Tue, 27 Dec 2022 21:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=33cI4kCZpU9jHyUxIKbVSh4H+8vw4e4ZvFaKA1z1Xl8=;
 b=oDXqDyMhJMLOorTlS4H/ZcOeV2yQ0HVKovXmaijUwtIiBuvFbLzMq/X9mAN/caHPH84W
 +tDHzBKEqHDvYkmgLdyok7lvek7uvTiwoOMFe6SdzDfE+pf5iSSAbxQdSTcXYq4XYf36
 wrcAM6Jc/muicbC5jwL4UTztcQIvKx3+cuZA7VHzaPNLqMl71ttcEdAByIe4rOdf0/5W
 Ec2qVcDVFxrsruvW0PWHuFhOtJzHdxqxp7Ue0pBDlqQWbRzinBoll97wHZwKW+TOtd4H
 aK+L8up4jbYPLXyy0kGw6NQb1oH2M4v+Mmm98b4B+aizFHO12dA1Qx1Q+sQ8t3Ne26YL mQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mntqf5g97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:07:08 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRL77v5028849
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:07:07 GMT
Received: from [10.110.31.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 13:07:06 -0800
Message-ID: <730d8cbc-c391-6d77-2374-713f539d38b6@quicinc.com>
Date: Tue, 27 Dec 2022 13:07:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 04/14] sound: usb: card: Introduce USB SND vendor op
 callbacks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-5-quic_wcheng@quicinc.com>
 <CAA8EJprFD53zmECHJ44FpjztRjwsMym2QP_Gk-JWya-SL_ryHA@mail.gmail.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <CAA8EJprFD53zmECHJ44FpjztRjwsMym2QP_Gk-JWya-SL_ryHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7CZl33Ocf1ue6_djQegt5-iJFt_uzPMd
X-Proofpoint-ORIG-GUID: 7CZl33Ocf1ue6_djQegt5-iJFt_uzPMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_16,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=959 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270176
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Dmitry,

On 12/24/2022 3:03 AM, Dmitry Baryshkov wrote:
> Hi,
> 
> On Sat, 24 Dec 2022 at 01:33, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>>
>> Allow for different vendors to be notified on USB SND connect/disconnect
>> seqeunces.  This allows for vendor USB SND modules to properly initialize
>> and populate internal structures with references to the USB SND chip
>> device.
> 
> The commit message definitely needs some improvement. We do not notify
> vendors on SND connect/disconnect events.
> 
> 
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 22 ++++++++++++++++++++++
>>   sound/usb/card.h |  7 +++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 26268ffb8274..212f55a7683c 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -117,6 +117,21 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>>   static DEFINE_MUTEX(register_mutex);
>>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>>   static struct usb_driver usb_audio_driver;
>> +static struct snd_usb_vendor_ops *vendor_ops;
>> +
>> +int snd_usb_register_vendor_ops(struct snd_usb_vendor_ops *ops)
> 
> platform ops?
> 

Will change it.

>> +{
>> +       vendor_ops = ops;
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_register_vendor_ops);
> 
> What happens if several platforms try to register different ops? I saw
> from the patch 09/14 that you register these ops unconditionally. If
> other devices follow your approach there is an obvious conflict.
> 

Thank you for the review.

That is true.  I don't think there is a proper need to have multiple 
vendor ops being registered, so maybe just returning an error for if ops 
are already registered is sufficient.

Thanks
Wesley Cheng

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA3681F42
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 00:01:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F7FDFA;
	Tue, 31 Jan 2023 00:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F7FDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675119693;
	bh=+zjXQxEoxn4tcPQYQulz2rSi6Mg+LtUKA3MI9jJfLI4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XEmlP2wAJi6d3CKp4NUerdOWl60HxRyt4Xn84ndcOEAO6g0TgSMJMXcf2/ETsa6tq
	 0U2/W8JloCr85f4+X2/LCYa4kGUSDj0W5H6fALasom8zikbsB84ZHWG1MWsx2te/if
	 jzbyYtCfdMdA5LyUf+H5bncyjphzZ4XDWwRtvFs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02C48F80236;
	Tue, 31 Jan 2023 00:00:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 003FCF8032B; Tue, 31 Jan 2023 00:00:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8625F800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 00:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8625F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=f5lINehj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UM2b88009878; Mon, 30 Jan 2023 23:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=99WODW3J7GhU0EkcLJZeiwYlNeOFNhO6mFi3Lr6ZqLM=;
 b=f5lINehjc3BTKPiZNHGnx0WFVoTqm+4+cqwjKKBY+kA29Kg7/ev3gnwX2Ef0ZGHZA1Kw
 qw3OgxJIBoxWwC0qYW7zq1YS61CrQQWjfzRZ3iShGL8z6fImX91e+ZW9qPs/um8MsluP
 CuCkCUoIod02UaiqX3YDE86E4yj3wOPDQ1oQ3IT7LnkiNiR74uPPCEhqTiZKP/d7Tt+5
 vi/Vf0oyKyo85kZMy3+KNdvX5qCgX3suhtrx3NtQR8qO/r01o7lqO+BA6FNWJ8HGQrWO
 nUw+yGVhFpp1yEM3M/gOsmHqe1Dq2/pXkUkJzLccu2lv6hXzzHa3gXAHq7aYYGsLjqoD 2Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncuxamtj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 23:00:34 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30UN0XQ1023427
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 23:00:33 GMT
Received: from [10.110.113.14] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 15:00:32 -0800
Message-ID: <63ef99b7-c6c4-497d-da08-a3966291de9f@quicinc.com>
Date: Mon, 30 Jan 2023 15:00:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform
 op callbacks
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
 <1013f667-c11f-25a2-ab2b-87b9368ad456@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1013f667-c11f-25a2-ab2b-87b9368ad456@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YxBG3Jnkvw4vvbPrO9t0zF_PiC2Ra7GI
X-Proofpoint-GUID: YxBG3Jnkvw4vvbPrO9t0zF_PiC2Ra7GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxlogscore=762 impostorscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301300211
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre,

On 1/26/2023 7:50 AM, Pierre-Louis Bossart wrote:
> 
> 
> 
>> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
>> +{
>> +	if (platform_ops)
>> +		return -EEXIST;
>> +
>> +	platform_ops = ops;
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
>> +
>> +int snd_usb_unregister_platform_ops(void)
>> +{
>> +	platform_ops = NULL;
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
> 
> I find this super-racy.
> 
> If the this function is called just before ...
> 
>>   
>>   /*
>>    * disconnect streams
>> @@ -910,6 +928,10 @@ static int usb_audio_probe(struct usb_interface *intf,
>>   	usb_set_intfdata(intf, chip);
>>   	atomic_dec(&chip->active);
>>   	mutex_unlock(&register_mutex);
>> +
>> +	if (platform_ops->connect_cb)
>> +		platform_ops->connect_cb(intf, chip);
>> +
> 
> ... this, then you have a risk of using a dandling pointer.
> 
> You also didn't test that the platform_ops != NULL, so there's a risk of
> dereferencing a NULL pointer.
> 
> Not so good, eh?
> 
> It's a classic (I've had the same sort of issues with SoundWire), when
> you export ops from one driver than can be removed, then additional
> protection is needed when using those callbacks.
> 
> 

Yep, will take a look at this a bit more to improve it.

Thanks
Wesley Cheng

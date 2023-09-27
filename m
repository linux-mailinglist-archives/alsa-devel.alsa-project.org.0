Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B827B0D2F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 22:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC999A4C;
	Wed, 27 Sep 2023 22:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC999A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695845503;
	bh=d1pOJZrEdh6TIE0NyhOC81uvz8nfnXiEl3tHE/e5Hwk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G2tDBWF7RD4hDbzjp2kuAP+Nn8xNzO9GCeoixMx+rvYpsw8vbwm6Q+eh4GLphMlAu
	 yn980cHu8S6shykbUwnppGQ1GJr718/96VC8xHLSLU5xB68v2nOzXCkY8E9T3wtBYH
	 UY64yQw9y6KCZwhN9bj7sB09SD34psq4AIwEAtDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18284F80551; Wed, 27 Sep 2023 22:10:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB5BEF80166;
	Wed, 27 Sep 2023 22:10:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54995F8016A; Wed, 27 Sep 2023 22:10:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1FF8F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 22:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FF8F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=p2XOg6Yc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RJwqTa021844;
	Wed, 27 Sep 2023 20:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=90q9NOxzqefCLLb/rXZtD8+r2D3ym/pWfk2IUKZ2P14=;
 b=p2XOg6YcZGZGLpHOOt7i4Uo+22v250jwhaoPSt6xZpfZecBiXmB5+2pVpi9xwsdUV9Ue
 ImSn8bX2NDyelCp289GDLFnxMO+B4XUQzmV7cg3tGQV5Xz7bZvAwOAiO3Oiszf4GIgzt
 RyuLvcBLQQ8e4atLfGeOLthwQd1VcGxCh6Itk73mjTh7nrqtIiKqFRwL2n4CqmNeDTf1
 lquhW1BN4dOS95+Sc+VKeWTdUGPnHAnRCW6DtQGnEXWWveZXAwk0NWjZrcX/KqlA7rt3
 j4061mbSJmPp4CJDuNi0VeSR8YeBMUkMF10rx32/qxatSwoapIAo3L0HK1zOpLigjzHc pg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcda7sy83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:10:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38RKAfkE031384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:10:41 GMT
Received: from [10.110.25.80] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 27 Sep
 2023 13:10:40 -0700
Message-ID: <191e6429-bb47-625b-a074-fa67ee052f03@quicinc.com>
Date: Wed, 27 Sep 2023 13:10:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 29/33] ASoC: qcom: qdsp6: Add SND kcontrol for fetching
 offload status
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-30-quic_wcheng@quicinc.com>
 <ZRRD8eFZugh/+dex@finisterre.sirena.org.uk>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZRRD8eFZugh/+dex@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: blIC-0fzkR4GdcVTYsm5N-g6sY1MOCnu
X-Proofpoint-GUID: blIC-0fzkR4GdcVTYsm5N-g6sY1MOCnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_12,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=783 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270171
Message-ID-Hash: YGPNXXU2UXGB76SVAF72BHC7AY2NUTNK
X-Message-ID-Hash: YGPNXXU2UXGB76SVAF72BHC7AY2NUTNK
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGPNXXU2UXGB76SVAF72BHC7AY2NUTNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On 9/27/2023 8:02 AM, Mark Brown wrote:
> On Thu, Sep 21, 2023 at 02:48:39PM -0700, Wesley Cheng wrote:
> 
>> Add a kcontrol to the platform sound card to fetch the current offload
>> status.  This can allow for userspace to ensure/check which USB SND
>> resources are actually busy versus having to attempt opening the USB SND
>> devices, which will result in an error if offloading is active.
> 
>> +static int q6usb_prepare(struct snd_pcm_substream *substream,
>> +               struct snd_soc_dai *dai)
>> +{
>> +       struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>> +
>> +       mutex_lock(&data->mutex);
>> +       data->status[data->sel_card_idx].running = true;
>> +       mutex_unlock(&data->mutex);
> 
> These updates of running should really have a snd_ctl_notify() so that
> UIs can know to update when the value changes while they're open.
> 

Sure, me review some of the APIs again and add the notify call where 
necessary.

>> +static int q6usb_mixer_get_offload_status(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
> 
>> +	running = q6usb_find_running(data);
>> +	if (running < 0) {
>> +		card_idx = -1;
>> +		pcm_idx = -1;
>> +	} else {
>> +		card_idx = running;
>> +		pcm_idx = data->status[running].pcm_index;
>> +	}
>> +
>> +	ucontrol->value.integer.value[0] = card_idx;
>> +	ucontrol->value.integer.value[1] = pcm_idx;
> 
> This feels a bit messy but I'm not sure what we'd do that's better so
> unless someone else has better ideas let's go with this.  Possibly we
> should standardise this as a new control type for joining cards up so at
> least if there's further needs for this we can use the same solution?

I'm all ears for any suggestions from other users :).  I think its a bit 
difficult to tell since this is the first iteration of adding this 
feature.  Pierre gave me some great feedback from the 
userspace/application level, and tried my best to accommodate for those 
requirements since it would be the main entity interacting with these 
controls.

Thanks
Wesley Cheng

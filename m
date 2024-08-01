Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE79454CE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 01:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CAE63A9F;
	Fri,  2 Aug 2024 01:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CAE63A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722553922;
	bh=yi8KpVxNcIf5YHxoeXQGLtFB31e6KiwZl0CwWBdzZqk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ptbF6pGw4GNzUFHQCPo1sMQA+06mdiT1eZNGXKFvRHTMreojxZ9sb4uZeKs2+6dPn
	 VknQlN/anyAyYDP1EWrZubkohEA7pirqzOla1BcsC525I3O/YajMvnocdRqrZHsKay
	 fDwCa4KVA68fftssOzyK19Yho+op/8wdTzbVKk2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDB0AF805B2; Fri,  2 Aug 2024 01:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BC52F805AF;
	Fri,  2 Aug 2024 01:11:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A9AAF8026A; Fri,  2 Aug 2024 01:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B0FBF8019B
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 01:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0FBF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=IE8pL9G/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 471LaAgY009955;
	Thu, 1 Aug 2024 23:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7sFS96b9Nrhzms9CFZDvZZzdzQm/xXxadPg2syXGPk=; b=IE8pL9G/F8tc8k68
	hsBudRVPhDpBI44vQhO5LH1vM8leRlpxiHLbpAIeTxPJBrD+1lTWE0ZSPGjPhOLg
	SWRBX5sTwIrd7EpARqfxFqdDDREOdxv0fiCjghL7D8PUa7CWqUdCK9h0+htn5cug
	K3y//UhRxy1XFLw55fgwQ4MwhHiPcAZKlj4XLuDxf8eLUWs9/AoxfuV35zndmOjN
	KxMGF6zB5Q7I+74+rbgcgt0Wn62ykr+m85vvTUQ2VfxAOVJlExQJ45np9lQtvPI4
	rDEczFDvPPqmdBexy7I2SmI+bU1cR1yYMB4ZaPcWvjJUSr/roqujFxWCo8zUS7wA
	pgdXJw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje204ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 23:11:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471NB0uA029525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 23:11:00 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 16:11:00 -0700
Message-ID: <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
Date: Thu, 1 Aug 2024 16:10:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 17/34] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-18-quic_wcheng@quicinc.com>
 <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hQDGrD7cDUhEfYLSjo0qNE7E1pifnf-y
X-Proofpoint-ORIG-GUID: hQDGrD7cDUhEfYLSjo0qNE7E1pifnf-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010155
Message-ID-Hash: 7YIVNPFBMIK5DSVXSAT3B2TXTF7CFR5E
X-Message-ID-Hash: 7YIVNPFBMIK5DSVXSAT3B2TXTF7CFR5E
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YIVNPFBMIK5DSVXSAT3B2TXTF7CFR5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/1/2024 1:40 AM, Pierre-Louis Bossart wrote:
>
>
>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>> +			   struct snd_pcm_hw_params *params,
>> +			   struct snd_soc_dai *dai)
>> +{
>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct q6afe_port *q6usb_afe;
>> +	struct snd_soc_usb_device *sdev;
>> +	int ret;
>> +
>> +	/* No active chip index */
>> +	if (list_empty(&data->devices))
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&data->mutex);
>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>> +
>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>> +	if (IS_ERR(q6usb_afe))
>> +		goto out;
>> +
>> +	/* Notify audio DSP about the devices being offloaded */
>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>> +						sdev->pcm_idx);
>> +
>> +out:
>> +	mutex_unlock(&data->mutex);
>> +
>> +	return ret;
>> +}
> Humm, multiple questions here
>
> a) is this intentional that the params are not used in a hw_params routine?
Think this was answered in patch#34.
> b) if yes, could this be replaced by a .prepare callback
>
> c) along the same lines as b), is suspend-resume during playback
> supported? Usually this is handled with a .prepare callback to restore
> connections.

I don't see us supporting that throughout any of the QC based DAI drivers, so this probably isn't implemented yet.  In terms of supporting system PM suspend for this USB offload path, we're going to explicitly stop the audio stream from the USB offload driver (qc_audio_offload) before we suspend the usb device. (refer to qc_usb_audio_offload_suspend())

Thanks

Wesley Cheng

>> +
>> +static const struct snd_soc_dai_ops q6usb_ops = {
>> +	.hw_params = q6usb_hw_params,
>> +};
>

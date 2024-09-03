Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4A96AA7D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 23:42:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0D2845;
	Tue,  3 Sep 2024 23:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0D2845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725399755;
	bh=uoNkzLOA4+bEXXauGFDuvi535BjiyR9hC+LwDmtgCi0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qM3uUtMq/TF1vOFfmt52o74o+JV29DWKT0cEi6HrCPxS9MDtxo4Xgj1HqVgrNj/Dc
	 WzfryHLPjNeyK2pjXU5ywZJ1L7GheQuE5qDRkM8CvSJqvnOO+JNCVVuvPaOb1lJMSX
	 Nthz3j5QbVgcM80C+X1e+5XredfCQBnckdbQTpRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C7FAF80536; Tue,  3 Sep 2024 23:42:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B59E8F805B3;
	Tue,  3 Sep 2024 23:42:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 081D2F80199; Tue,  3 Sep 2024 23:42:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D58A4F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 23:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58A4F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=EuvPBfsF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 483K9d8N001873;
	Tue, 3 Sep 2024 21:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4kb4yVx+3sH1ZmXJNcJnqmzTK7YhWN2/t9HdImh6b0=; b=EuvPBfsFHXRwOXwL
	qOi16J/OHKzUTy/gG+tMz4HUXwHK2KaaGSH/Pokkl9Mqe+XSWTnMknoPGnU4CSP2
	dmlpbGjhY2gxbIDzBwk8yIx1k/8X9D6L6t00YqQ4UzP2JC3Ee2R7TqflVnO5whHR
	6xBRAzu4tuQgGS/P008pSf6KcsP/6CUY2MwrmRkH9qeSRcNh9Cr0dA03LfeB1/wp
	fcowbu0YUSQKz/eUq1P708Z2jmkr8/6WkUPNBQ0/VXdtZMbDNJDaYjoN5Jfu3gOL
	oQE5DBRAyK18qfhGPMZG5VQNdEqwMAM93YcjXf743I6I5o0vzGdu+oT7+ecJ+oYW
	p6P9Mg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy226se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 21:41:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 483LfspF010185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 21:41:54 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 14:41:53 -0700
Message-ID: <abc9713f-3230-4a5d-98fd-f1cb293bc26a@quicinc.com>
Date: Tue, 3 Sep 2024 14:41:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 22/33] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-23-quic_wcheng@quicinc.com>
 <39e1e90e-116c-4f13-b223-84e6991c8a32@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <39e1e90e-116c-4f13-b223-84e6991c8a32@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GItmiVfHicGlp-DsAfCqnyYQEbqHxlPh
X-Proofpoint-ORIG-GUID: GItmiVfHicGlp-DsAfCqnyYQEbqHxlPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_09,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=837 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030174
Message-ID-Hash: NDALTHEWUSECDXCMCNVZKRAQYUTOGYOV
X-Message-ID-Hash: NDALTHEWUSECDXCMCNVZKRAQYUTOGYOV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDALTHEWUSECDXCMCNVZKRAQYUTOGYOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:27 AM, Pierre-Louis Bossart wrote:
>
>>  		/* Selects the latest USB headset plugged in for offloading */
>> +		if (data->hs_jack && list_empty(&data->devices))
>> +			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
>> +
> with the list_empty check, this looks like only the first connected
> headset will be handled, not the last?

Sorry, the comment is misplaced.  It should be meant to explain:

/* Selects the latest USB headset plugged in for offloading */
list_add_tail(&sdev->list, &data->devices);

The above IF check is to say that we'll only notify the USB jack if there is an available USB audio device (capable of offloading) connected.  I guess it might make sense to notify the snd jack on every USB audio device connection.  Currently, it will notify on the first device identified (present) and the last device removed (not present).

Thanks

Wesley Cheng

>>  		list_add_tail(&sdev->list, &data->devices);
>>  	} else {
>>  		list_del(&sdev->list);
>> +
>> +		if (data->hs_jack && list_empty(&data->devices))
>> +			snd_jack_report(data->hs_jack->jack, 0);
>>  	}
>>  	mutex_unlock(&data->mutex);
>>  
>>  	return 0;
>>  }

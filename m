Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AC7A2CFE
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441ABE7B;
	Sat, 16 Sep 2023 03:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441ABE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694827057;
	bh=xEq8AY4fuiaalxjAN4RLrs2a1IBrzOuLaWPlfDlk6OM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B/Xd+/81DBfTHNHlgazz/EiwUfNYRRyy0B5Xgag2SBMmdFyjLC8Nsokq8oAJz6DMv
	 R9iyGBQ/WLuV3zv9aPJQUp1ceaKMx8PvKpvteQlceomPTDNh5vYtseoRFtUQuNd3Wf
	 Z3pEkXNFssbUZb7qPqSfWe7YBqny2/WVu4fa8zJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B02F6F80246; Sat, 16 Sep 2023 03:16:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A34CF80246;
	Sat, 16 Sep 2023 03:16:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D19DF80425; Sat, 16 Sep 2023 03:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96C52F8007C
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C52F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Ycfwhlm5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38G19HRm021822;
	Sat, 16 Sep 2023 01:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lzUInNfZ/+GSqx3Doaa3+ebCwEy1pXDvPNHjtdmQEjg=;
 b=Ycfwhlm5luFeuKHDm7B+4ETyXypXu4ky7g+6Oe6MKh8HP7SkmGoLSALaaENrx7DKyKi4
 xWOSYcK4+6/X2jXmiSdf4TxvMcNOkfpzTRV8sCPskaHRiaTc9IYY4CFzbGaFzlgeUW7Y
 spQu7RW6b/2qNIeiEfzbYlbvrX1DcFOUDbqYsBTgtxdMCpHJMWzN4bVcKAu3bHODv3E/
 Vdx/uGNNO+4FXDjrk9Am2f0/QAk4rsSExwwC0+NReOXpdAmotpfROhXn91AG+WOvI0sq
 ubB3y5kL9ZoEPPMKG6xIde+8fPT+TSDBXHNMhwi3roasyHPlr2ms0bUf4uUM6x0yb5lL EA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g072n8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 01:16:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38G1GFgO019026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 01:16:15 GMT
Received: from [10.110.47.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 18:16:14 -0700
Message-ID: <ae5a603f-459b-84af-239b-aca34c61e95d@quicinc.com>
Date: Fri, 15 Sep 2023 18:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 10/33] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-11-quic_wcheng@quicinc.com>
 <fc3cecda-72dd-4b7f-8839-95bd04481038@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <fc3cecda-72dd-4b7f-8839-95bd04481038@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zEvQ2eMYk9JPuewhMCOPnOY4ErObID6W
X-Proofpoint-ORIG-GUID: zEvQ2eMYk9JPuewhMCOPnOY4ErObID6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=772 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309160010
Message-ID-Hash: YM7R4OIVCWQDGKW7NGJZGWTNTEPZZNTL
X-Message-ID-Hash: YM7R4OIVCWQDGKW7NGJZGWTNTEPZZNTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YM7R4OIVCWQDGKW7NGJZGWTNTEPZZNTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Konrad,

On 9/15/2023 5:34 PM, Konrad Dybcio wrote:
> On 16.09.2023 02:10, Wesley Cheng wrote:
>> Create a USB BE component that will register a new USB port to the ASoC USB
>> framework.  This will handle determination on if the requested audio
>> profile is supported by the USB device currently selected.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> [...]
> 
>> +	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
>> +	if (ret < 0)
>> +		data->priv.sid = -1;
>> +	else
>> +		data->priv.sid = args.args[0] & SID_MASK;
> SID masking is done in the devicetree.
> 

Not sure I get this point, but let me explain the use case of this 
parameter, and maybe you can help clarify.

In this case, we are saving and passing the SID info so that the buffers 
being mapped within the QC offload driver can be communicated to the 
audio DSP.  So in short, the SID masking that is done here is just to 
extract the SID from the iommus property.

Thanks
Wesley Cheng

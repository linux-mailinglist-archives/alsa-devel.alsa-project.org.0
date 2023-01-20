Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14103674E38
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD882E5A;
	Fri, 20 Jan 2023 08:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD882E5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674200295;
	bh=B6Kxjq+MaHtAv8vtoRKQymp8UXhlkMgsuOFH7tc4q8M=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvye33XwWyszOvUaw7giT1tH4sLVeIYUcFZ5Ylfe2YanrMKKHMxtDH+GuLegaWqD9
	 urRzwa4FSl/NWgJXaVH8iIXzWd5J9qqzY5xob2vD2XsOXkoHhDZGEPhhI6SWgsZGms
	 B3dthaIGmMjJ4cl0Pv2RGkv7tYL7m1sHVp6vx02Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CB5BF80246;
	Fri, 20 Jan 2023 08:37:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69706F8024C; Fri, 20 Jan 2023 08:37:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2C13F8024D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C13F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=STsjpiGb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30K7UiDM012953; Fri, 20 Jan 2023 07:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=T+HRskxYu1v9Bh5a0v2OBHQYbed3GESNbOqvsftlHyk=;
 b=STsjpiGbsSLJL3G0unLvsaid7PcrnqNTLqFarwvimj/7T10gfdMX77q2yeIYr3fi16mH
 k3GnioLhekiZgDb7w8xagGCIc5Aq7QA1RhN5+jvBJh2SPBuBl1Y8CrdwIHmmmRPqhUo+
 7UCGaq5E7AeAvOkVnVuToedgl1CHMw8cMMuReQvABicycaI3mXvTmFojgnDi/5C6PiKK
 p5DaOue+6WpFLsiOCoclhUnA2LV81ZKl1hFYaPZ5hNUyvx+oeWVHm3rYuxq5CGVFTX2g
 sbclNx2ejdcXkkX0FPGi0YklMkduIlrP1BOqo/lo/qDbHjzHoXfP7WyLRBC6oNME7hVI RA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6xktkaag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 07:37:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30K7b1f0000598
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 07:37:01 GMT
Received: from [10.216.43.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 23:36:55 -0800
Message-ID: <9c4d2ce8-11e0-bfbb-7062-078255d1d60b@quicinc.com>
Date: Fri, 20 Jan 2023 13:06:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ASoC: google: dt-bindings: sc7280: Add platform
 property
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
 <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <devicetree@vger.kernel.org>
References: <1674108674-8392-1-git-send-email-quic_srivasam@quicinc.com>
 <1674108674-8392-3-git-send-email-quic_srivasam@quicinc.com>
 <f0c5e40e-e59d-152d-31f1-1ad3da0a6d34@kernel.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <f0c5e40e-e59d-152d-31f1-1ad3da0a6d34@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _wR1aeK0lfk6LSFW66KY625n85nZc-Ax
X-Proofpoint-GUID: _wR1aeK0lfk6LSFW66KY625n85nZc-Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301200071
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 1/19/2023 5:43 PM, Krzysztof Kozlowski wrote:
> On 19/01/2023 07:11, Srinivasa Rao Mandadapu wrote:
>> Update sc7280 machine driver bindings with platform property for
>> supporting ADSP based platform's DAI links.
> Subject:
> ASoC: dt-bindings: google,sc7280-herobrine:
>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Tested-by: Ratna Deepthi Kudaravalli <quic_rkudarv@quicinc.com>
> This tested tag is a bit unusual. How were they tested? If
> dt_bindings_check why this is not the same person as you (submitter)?
Okay. Will remove Tested-by tag.
>
>> ---
>>   .../devicetree/bindings/sound/google,sc7280-herobrine.yaml    | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>> index 869b403..ccf1b1d 100644
>> --- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>> @@ -75,6 +75,17 @@ patternProperties:
>>   
>>           additionalProperties: false
>>   
>> +      platform:
>> +        description: Holds subnode which indicates platform dai.
> Neither commit msg nor this here explains why do you need it and what it
> really represents. Basically description repeats "platform" name of
> property - there is no single new information.
Will modify accordingly and re-spin.
>
>> +        type: object
>> +        properties:
>> +          sound-dai: true
> maxItems
Sorry. why max items required here?
>
>> +
>> +        required:
>> +          - sound-dai
>> +
>> +        additionalProperties: false
>> +
>>       required:
>>         - link-name
>>         - cpu
> Best regards,
> Krzysztof
>

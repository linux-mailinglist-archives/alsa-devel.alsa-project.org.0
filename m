Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3D7C5F1C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 23:29:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D49E72;
	Wed, 11 Oct 2023 23:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D49E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697059774;
	bh=1ve8LtG3NXV87jvNQPL3WmMLFReoLt3u51LYipJjPdE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ciVidsxqr+nfQFmMEmOh0dlQRJ/6SFDDNFBTC6Cx9yFws2TCG+VDZ+WvC6j8xccKx
	 o5ThQ0V/ceyw1tala2uLrZL5KzdTDs3MQjbNBVdISKhCKF4iUtuovmFe/B/3SyDbSI
	 TKsMPCEN8lUUeoVEW212KFt1Qq8TNb9YOnW7C8xA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC6FF80557; Wed, 11 Oct 2023 23:28:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BD8F8027B;
	Wed, 11 Oct 2023 23:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0715EF802BE; Wed, 11 Oct 2023 23:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90AF4F8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 23:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90AF4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Nol6CFDo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BLLorF026505;
	Wed, 11 Oct 2023 21:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YV+V1QT7WH4TWPolqZP1tvIu4h5bgrG/c8p+KKr0FoQ=;
 b=Nol6CFDoHUzR4MONkVTbjPlDGX8jVqu+DqjvbqlByQojNsd+P5PUQji3uQkMkNyEx/2S
 5L8blqit0HWXQxoVAeP1EZs/iVACZdp8Ta+QIe4RPdY1umbSFP4kGotR6AFmcncynZnk
 oahwPh5qBb7S4BzteERSwdbC/8Soe6MKEqc2CmEUyU6jDd1k8Mdxoo8bWCuklBuUdBKI
 MKvabTmCS2Bar6e2adlK6oMnL8Nu2Q5voYPAzqGKGnn1TDISOEWh4O5m1zsSzp63XONF
 xJj0JAeOIR0GtT+EEmgyj8qGZxecN8tjDe4nkXpSULibMPnY9zLne8cR6F9A6iGBgU/y Ig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnsmq1nmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 21:28:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39BLSC9L011144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 21:28:13 GMT
Received: from [10.71.115.198] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 14:28:12 -0700
Message-ID: <a9b172cd-1840-2949-2244-9a75d2bb7990@quicinc.com>
Date: Wed, 11 Oct 2023 14:28:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 25/34] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <bgoswami@quicinc.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <conor+dt@kernel.org>,
        <linux-usb@vger.kernel.org>, <andersson@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <srinivas.kandagatla@linaro.org>,
        <linux-kernel@vger.kernel.org>, <agross@kernel.org>,
        <mathias.nyman@intel.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-msm@vger.kernel.org>
References: <20231011002146.1821-1-quic_wcheng@quicinc.com>
 <20231011002146.1821-26-quic_wcheng@quicinc.com>
 <169699146438.2560961.3220166947763848754.robh@kernel.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <169699146438.2560961.3220166947763848754.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Mx5Ycg9ohRBABrFQFgGJzpQmgg0YzsHa
X-Proofpoint-ORIG-GUID: Mx5Ycg9ohRBABrFQFgGJzpQmgg0YzsHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_16,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110189
Message-ID-Hash: SFQ3W5WOZLBKTN3BVNWZBHSZMW5U6ZHR
X-Message-ID-Hash: SFQ3W5WOZLBKTN3BVNWZBHSZMW5U6ZHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFQ3W5WOZLBKTN3BVNWZBHSZMW5U6ZHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On 10/10/2023 7:31 PM, Rob Herring wrote:
> 
> On Tue, 10 Oct 2023 17:21:37 -0700, Wesley Cheng wrote:
>> Add an example on enabling of USB offload for the Q6DSP.  The routing can
>> be done by the mixer, which can pass the multimedia stream to the USB
>> backend.
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
> make: *** [Makefile:234: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231011002146.1821-26-quic_wcheng@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Would you happen to know what the error is in this case?  I made sure I 
was running the latest dtschema (v2023.9) and had yamllint installed as 
well.  When I took a look at the DTB and DTS output it looked ok...

             usb-dai-link {
                 link-name = "USB Playback";
                 cpu {
                     sound-dai = <&q6afedai USB_RX>;//--->syntax error?
                 };

                 codec {
                     sound-dai = <&usbdai USB_RX>;
                 };

                 platform {
                     sound-dai = <&q6routing>;
                 };
             };

I didn't make any changes to this in between v7 and v8, but v7 passed:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230921214843.18450-25-quic_wcheng@quicinc.com/

Thanks
Wesley Cheng

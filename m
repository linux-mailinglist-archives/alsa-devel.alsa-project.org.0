Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E257681D71
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 22:53:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37B6DDEC;
	Mon, 30 Jan 2023 22:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37B6DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675115637;
	bh=KA/Zm4n7aGzTwIIZacPrZqr73AGWUao3rmfYUvqpbQw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TscIWTyK96ucrQib+Cw8i2rrXJtwFpWiZgoQ/2xGE7Ie9lGEg45kloo11+U3vh4Gu
	 u98O6mVx+ShOjGf5rWm6VPX+kW8cMXKWbE3PHCgo7YFhEseJrKlFuKpKxogY94LV+U
	 ImesZDNvLBdwQFDSZ3mUyaQZ5hz9HsnrPQgLD17s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B853EF80496;
	Mon, 30 Jan 2023 22:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA76F8047D; Mon, 30 Jan 2023 22:53:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28F24F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 22:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28F24F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=RbLeJmbC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UHmtRR011612; Mon, 30 Jan 2023 21:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qudzAMrZbd7azpkah8g2SJrTMXVcZj9v+kNdtX9wKs8=;
 b=RbLeJmbCE1ECwKEYfszYJAJBVShpwxFbOB502z7qMwH1jfsBauVwThO3GlXwxpl5DynC
 h/6KbNgvELhFvstLlc3MFQSNvGo+Uth9rVd5C0TLAjkrNl7NXmLWoUM9AZJ12iYpO1d/
 lHdeKdK1Djvb2J/b3hRGf9AImZx/Ay6hV3q79b3SW5VJgK+ch4bQOJToRSHLytaUHlCg
 FTDHAHkRIr17MQrjO35RYJiDFXfpOgY0qemuG3qpNLCfgN5W+fbib7uuYb4Dq7QVBudF
 xTnVxfZWQcuAD2w1BhawsUEiO0HzcFIWC5hjWwGoyMoDHYECRClGn5SUpKOhqmVcXfAO UQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncvfpcmjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 21:52:58 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30ULqv9L028311
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 21:52:57 GMT
Received: from [10.110.113.14] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 13:52:56 -0800
Message-ID: <1f48b69d-d727-8453-01b0-0ffeb01a011b@quicinc.com>
Date: Mon, 30 Jan 2023 13:52:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 08/22] ASoC: dt-bindings: Add USB_RX port
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-9-quic_wcheng@quicinc.com>
 <62207c21-38f2-eb37-ea1d-2f6eef2202ff@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <62207c21-38f2-eb37-ea1d-2f6eef2202ff@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cqq5Uzm1peeX_7CEIorL75kNcKH8Q4Tt
X-Proofpoint-ORIG-GUID: cqq5Uzm1peeX_7CEIorL75kNcKH8Q4Tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=630 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300201
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

Hi Krysztof,

On 1/26/2023 3:55 AM, Krzysztof Kozlowski wrote:
> On 26/01/2023 04:14, Wesley Cheng wrote:
>> Q6DSP supports handling of USB playback audio data if USB audio offloading
>> is enabled.  Add a new definition for the USB_RX AFE port, which is
>> referenced when the AFE port is started.
> 
> Subject prefix:
> ASoC: dt-bindings: qcom,q6dsp-lpass-ports:
> 
> because you are not adding USB_RX port to all bindings in ASoC.
> 

Thanks will fix this on the next revision.

Thanks
Wesley Cheng

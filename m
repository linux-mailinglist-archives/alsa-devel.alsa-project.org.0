Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C768CBD3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 02:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CECBB1FA;
	Tue,  7 Feb 2023 02:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CECBB1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675732619;
	bh=6hq4blZU/lc26xLJNDUnC2WHtSiPjm3g18jsmO2yq18=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z5sHvbF+gSt9aj8jpWvXJLspwmjMeJ0yuTfd/LBRFTHWnPAHXV9YIacFqE9CnYGnc
	 1tAXo8pnJF0L8mFLuGlZgQXVdqcXLTK6PcU7D1m3Et6LVDY9hm1lwcrUP/Aex80Yl0
	 r2i53E4bz8PJIzHq2/a3HGgLANV/VHSBX1VChSqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1206F800E3;
	Tue,  7 Feb 2023 02:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1A4AF804F1; Tue,  7 Feb 2023 02:15:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A8DDF8014B
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 02:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8DDF8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=XhoEX7o9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3170u5kg027900; Tue, 7 Feb 2023 01:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pWHPnYskouJSq6CSoAtrMJ75+OdE0EBnxXlivgcyd5I=;
 b=XhoEX7o9jcfBXy0ElrrJBc06ZCyxh2NOlmG+swz7xyLQeNl4QclsYLoT5oSLqoNNHvIC
 NgqZkzWJt65ZGbEKH7AshoOdLiy0CVR75SFtuW5a+TkELBDxjImaX3e71dKseNC2uDSv
 nY0XVs8Ecq/yYu/zdWMZkxTIgtNffmNhBfr7Ru1BkztylYd3/coFUhl8vnYGQ+UZnirh
 PgiAZPkOt5TPfnsmxs7u5Cf8z10fKtAOraqQHBFbm0n02laBwabfFoCMIvbIN7VU6Hi9
 DrQ3EltZGRjwCZIwt4FHdhut1yKBdPXMqRI3iRu5JrRdDt+MCOU3Qwrrpn2bpJ361yVZ Fg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhechd6wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 01:15:51 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3171FooG017472
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Feb 2023 01:15:50 GMT
Received: from [10.110.82.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 17:15:49 -0800
Message-ID: <b26c9e4c-5a9c-a2ff-19a7-78419c6b81df@quicinc.com>
Date: Mon, 6 Feb 2023 17:15:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 20/22] sound: usb: Prevent starting of audio stream
 if in use
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-21-quic_wcheng@quicinc.com>
 <557f8f76-38f5-5e07-905e-774e03120bd2@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <557f8f76-38f5-5e07-905e-774e03120bd2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xQxQtllAUmy7Yzc4Em6kIZDvjXU0oiky
X-Proofpoint-ORIG-GUID: xQxQtllAUmy7Yzc4Em6kIZDvjXU0oiky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=789 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070010
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

On 1/26/2023 8:12 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 1/25/23 21:14, Wesley Cheng wrote:
>> With USB audio offloading, an audio session is started from the ASoC
>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>> readily available for use, in case the non-offload path is desired.  In
>> order to prevent the two entities from attempting to use the USB bus,
>> introduce a flag that determines when either paths are in use.
>>
>> If a PCM device is already in use, the check will return an error to
>> userspace notifying that the stream is currently busy.  This ensures that
>> only one path is using the USB substream.
> 
> It's good to maintain mutual exclusion, but it's still very hard for an
> application to figure out which card can be used when.
> 
> Returning -EBUSY is not super helpful. There should be something like a
> notification or connection status so that routing decisions can be made
> without trial-and-error.
> 

The USB offload driver does have access to the USB substream that is 
being utilized/offloaded.  Maybe in addition to this check, we can also 
set the PCM runtime state as well (for that particular substream)?  That 
way userspace can fetch information about if the stream is busy or not.

Thanks
Wesley Cheng

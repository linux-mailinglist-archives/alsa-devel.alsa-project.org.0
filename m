Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875B67E7B1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 15:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A40DE5;
	Fri, 27 Jan 2023 15:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A40DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674828317;
	bh=flV0ZFcXLzLLJXPeiD5J/9i1lme43Ue7agYHh5A/oFY=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c6vuSYfdN7CW2Vu9DZI4XhkFqeGWMfaqMb3nnX30XPd9rDnWN5I1kwenyIpwkg7Lu
	 Dl2Exz/kWftzgR+E1nAAnYcQ6pdAzN7LkCoVk9kD/Ag7IR028Oh7xhpeC1D0akEr/h
	 /9xpGVkBmpujmWAiDXRt/5ky3TkH21lKA8ngddEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C5EF80154;
	Fri, 27 Jan 2023 15:04:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C90DAF80224; Fri, 27 Jan 2023 15:04:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26FA0F80224
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 15:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26FA0F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ad69Aurf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RDbju5027613; Fri, 27 Jan 2023 14:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=content-type :
 message-id : date : mime-version : to : from : subject; s=qcppdkim1;
 bh=SX3vNXpbmr7FlLbzr4GL851ZyNaygbNF6+mwKnuAv6w=;
 b=ad69AurfyKoU2yejoGEwDulovSualwAgs5y6zlTdQJIbhGzSUvVchN3V04Vs4nb32xPm
 5YzFPRz22pScsPnyiDW2hdpOKNyeuqM5DzCqvjLfJGQSupqttZB6xQUYfVGgUi3Kql6y
 9nR/91zMsbCQts0OZlewHTvd4fzQ80NwtXNvlX7/I8rG6/vR5/KD1+sIxUydJQOaL3fY
 OsJNmzu5CCjfxp4YRcwIxj7sxO9FxIbcV2504LUxU/d4+hQs+IOlG5pa9N+/4+mF5cIu
 v/k8VKTQ7WA5zcSPNxINRRGIautbKwhZrVQ/EwqRoG3HzyU3WGW8j6hzABXFUJyTPyZY rA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nbyma1grk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 14:04:05 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30RE44XQ011628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 14:04:04 GMT
Received: from [10.216.48.131] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 06:04:02 -0800
Message-ID: <271019c5-cfba-fa77-12e0-df97034f25b3@quicinc.com>
Date: Fri, 27 Jan 2023 19:33:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>
From: Raghu Ballappa Bankapur <quic_rbankapu@quicinc.com>
Subject: Query on get_time_info
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: D5cRVyugT9EF2IoGuJMhRM9z-o8e4O7P
X-Proofpoint-GUID: D5cRVyugT9EF2IoGuJMhRM9z-o8e4O7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxlogscore=681 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301270132
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

HI All,


We see get_time_info is not enabled from ALSA core. ay reason behind?

we enabled like below with some more code, we are able to get_time_info 
to lower driver.

static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
                 struct snd_soc_pcm_runtime *be, int stream)
@@ -2907,6 +2927,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, 
int num)
                 rtd->ops.hw_free        = dpcm_fe_dai_hw_free;
                 rtd->ops.close          = dpcm_fe_dai_close;
                 rtd->ops.pointer        = soc_pcm_pointer;
+               rtd->ops.get_time_info  = soc_pcm_get_time_info;
         } else {
                 rtd->ops.open           = soc_pcm_open;
                 rtd->ops.hw_params      = soc_pcm_hw_params;
@@ -2915,6 +2936,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, 
int num)
                 rtd->ops.hw_free        = soc_pcm_hw_free;
                 rtd->ops.close          = soc_pcm_close;
                 rtd->ops.pointer        = soc_pcm_pointer;
+               rtd->ops.get_time_info  = soc_pcm_get_time_info;
         }

Is this ALSA limitation or any other approach is followed to enable this 
implementation.

Thanks

Raghu Bankapur

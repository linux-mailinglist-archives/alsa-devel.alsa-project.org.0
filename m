Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919C5FF972
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Oct 2022 11:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A427E8B;
	Sat, 15 Oct 2022 11:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A427E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665825864;
	bh=3+jYI6eYFrkUyBHSR2OmESGrRYElF+iIN3/OnJvcFRE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3n94N+pUvVXYkdtZFQbEF14yTPwMgdAYenePipuFsCbeEFHi51QFhBRpc7eurhth
	 fy/YE6pXpKIUYPCM+E8/34bV6yQTj9/E01Hx1Jlbi5MeadBdGxw8eUKd9AIwjtckRo
	 53D1Povak6FvRuYIvbs4IVI0BaO+yhXsOXmVxRk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 769BDF801F7;
	Sat, 15 Oct 2022 11:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ABDAF800C1; Sat, 15 Oct 2022 11:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A199F800C1
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 11:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A199F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="FZMKy17Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29F9Lm49019199;
 Sat, 15 Oct 2022 09:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZiQWBQqxGDHFAKWGI6Zhru9TemqX1gmSzeo4Kkz9Cyo=;
 b=FZMKy17Q6UVNT0+f1+wj51lnkasnPQ5N4SlP/93mcfkpiOxuvRRszSxNhPxixdkNlSE8
 xL5rUN0Jwi6/RADI1YB9OUOjPE1YSXrvA5SBZzpbqUIpUHMDRii/poMY6Wpqp3S9O1/C
 5s/cFECsnwwi8jvcR0vGmZGi5aIBSlb6fb4Lgx+In52a9NACeHJwPB70D64LB3wLegNm
 CCUPYI+0/pAQmTI8FKjXmJpLJ3dsViUO1cvApa84jTPR8UgWEweIa25jvNp4nNMUwcIL
 ixljgRnna4XauWC0jeoaR5CVNJdzrSPLtB+hmt8Sql7APFqasePfalp92xvVrsY/OzmR 0Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7m6u8kuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Oct 2022 09:23:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29F9NHFo008435
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Oct 2022 09:23:17 GMT
Received: from [10.216.53.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sat, 15 Oct
 2022 02:23:12 -0700
Message-ID: <b0cbb2a4-088a-3f9a-8918-b95687ef2acd@quicinc.com>
Date: Sat, 15 Oct 2022 14:53:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: mark HDMI TX registers as
 volatile
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <andersson@kernel.org>,
 <bgoswami@quicinc.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>,
 <quic_plai@quicinc.com>, <quic_rohkumar@quicinc.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1665637711-13300-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53W3+MgRzpkV-9kBc6Pcvzta+ear3oxgMA-0rpNyJyJwQ@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n53W3+MgRzpkV-9kBc6Pcvzta+ear3oxgMA-0rpNyJyJwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TGOfFq2HQkAB1AB9oduswYFG-uTnrxiD
X-Proofpoint-GUID: TGOfFq2HQkAB1AB9oduswYFG-uTnrxiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-15_05,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210150053
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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


On 10/15/2022 2:41 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2022-10-12 22:08:31)
>> Update HDMI volatile registers list as DMA, Channel Selection registers,
>> vbit control registers are being reflected by hardware DP port
>> disconnection.
>>
>> This update is required to fix no display and no sound issue observed
>> after reconnecting TAMA/SANWA DP cables.
>> Once DP cable is unplugged, DMA control registers are being reset by
>> hardware, however at second plugin, new dma control values does not
>> updated to the dma hardware registers since new register value and
>> cached values at the time of first plugin are same.
>>
>> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
> I found that another patch in this area hasn't been applied[1]. Is it
> still relevant? We're still carrying it in the chromium tree. If it is
> relevant can you please resend it.
>
> [1] https://lore.kernel.org/all/1602596728-11783-1-git-send-email-srivasam@codeaurora.org/

Thanks for Notifying this untracked patch.

Resent the patch.
     - 
https://patchwork.kernel.org/project/alsa-devel/patch/1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com/


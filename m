Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2D656FBF
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 22:09:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE647E1B;
	Tue, 27 Dec 2022 22:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE647E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672175346;
	bh=H170DsCJzoO+h74Ufu0ZkBEW1ovm8XzNo3WMyPXwPMU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hykZ1holOSuSZ0sDwyrpjeX0OjF5eEJ9pEeauQANtK4WzpHTZSNKUz9Wh9vcAenN0
	 i/O+nDdozkTOu7RXlX/qc8A6McL4eRjOncZ5nfFAm4AlrUD8ECq0OpJzkkQ/0P9zRk
	 fLLCdIzSFLVNNmDnVYF568IOdm6CuUMCymowrco0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9972AF804E7;
	Tue, 27 Dec 2022 22:08:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FDE9F80537; Tue, 27 Dec 2022 22:08:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C7FAF804E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 22:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C7FAF804E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oVg79oWZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRL6aAH016227; Tue, 27 Dec 2022 21:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z7IPld7pNR/Me68apmq1qcL3SI5Eme59PhyOq61jRlg=;
 b=oVg79oWZh8Z4Oh1qpcE8+AVRqZ3AC9faBFWMk6GNnPVAZqE5FBG8wrSPmoS3F3hpXxta
 G+OOpegM+2Nj29AdteT5UPi8KXlPEYcc7YyiSIIVEUqnLxWKW0IO5JJlxpN/HSY4oGzP
 8ESd98VJgcAgE+STql5y1SAkDRc9RToNgqcg6bs96pZTr2BKLQgIj2qCZF8q+qaeSLhZ
 FOkIfSy2E1vySv3CElsWP34FYnQhuPeIOPwhxLzvMmrECk9b7/10Vuey0XXKgAAlWfIH
 OBskU/7yk0K+C9ZijWVRzvOJcyvPxWueqr9Te5GdPf6cToJeS+/Ru8dOG97RbAGKkX1y 0A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnrd1dk6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:08:01 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRL80Je022245
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:08:00 GMT
Received: from [10.110.31.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 13:07:59 -0800
Message-ID: <6a64be2e-212f-bd2b-f1e3-7abdc991c258@quicinc.com>
Date: Tue, 27 Dec 2022 13:07:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 10/14] sound: usb: card: Check for support for
 requested audio format
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-11-quic_wcheng@quicinc.com>
 <Y6a/VWOg4mBMtUOr@kroah.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Y6a/VWOg4mBMtUOr@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: T8dn1tsUM-iD7DriSN4UZCxn8Mthqrw3
X-Proofpoint-GUID: T8dn1tsUM-iD7DriSN4UZCxn8Mthqrw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_17,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212270176
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
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Greg,

On 12/24/2022 12:59 AM, Greg KH wrote:
> On Fri, Dec 23, 2022 at 03:31:56PM -0800, Wesley Cheng wrote:
>> Allow for checks on a specific USB audio device to see if a requested PCM
>> format is supported.  This is needed for support for when playback is
>> initiated by the ASoC USB backend path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 19 +++++++++++++++++++
>>   sound/usb/card.h |  3 +++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 396e5a34e23b..9b8d2ed308c8 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -133,6 +133,25 @@ int snd_usb_unregister_vendor_ops(void)
>>   }
>>   EXPORT_SYMBOL_GPL(snd_usb_unregister_vendor_ops);
>>   
>> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction)
>> +{
>> +	struct snd_usb_stream *as;
>> +	struct snd_usb_substream *subs = NULL;
>> +	const struct audioformat *fmt;
>> +
>> +	if (usb_chip[card_idx] && enable[card_idx]) {
>> +		list_for_each_entry(as, &usb_chip[card_idx]->pcm_list, list) {
>> +			subs = &as->substream[direction];
>> +			fmt = find_substream_format(subs, params);
>> +			if (fmt)
>> +				return as;
>> +		}
>> +	}
> 
> Where is the locking here?  How can you walk a list that can be changed
> as you walk it?
> 
> And what about reference counting?  You are returning a pointer to a
> structure, who now "owns" it?  What happens if it is removed from the
> system after you return it?
> 
>> +	return 0;
> 
> Didn't sparse complain about this?  You can't return "0" as a pointer,
> it should be NULL.
> 
> Always run basic tools like sparse on code before submitting it so that
> we don't have to find errors like this.
> 

Got it...I didn't get a chance to run that, but will do it on future 
submissions.  Will also address the locking and pointer reference you 
mentioned.

Thanks
Wesley Cheng

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0140296AA94
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 23:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE5C1FA;
	Tue,  3 Sep 2024 23:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE5C1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725400193;
	bh=VMG3qT0Yzmc4lt1WjY38IVxUgVpcn4n4TgfIjXzMm+Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byqGAVW2iTZrDI2XX0IrESKBBsnKGR0bOhauXXVysEC9Aa/ItJ+ZoTxzNozhHmlK2
	 iy0h1uPVb84W1jEo4WYq91RxKZBpB9kmIeUIUQxdxY2nIiamal0IpAvmMOndJRu+b1
	 lXwI9IeRkVKzQ4XKst0H3p/WkdOyHxT8NJGl+Brc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2CA0F804F3; Tue,  3 Sep 2024 23:49:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EDB9F805AF;
	Tue,  3 Sep 2024 23:49:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADDC9F80199; Tue,  3 Sep 2024 23:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E575F80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 23:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E575F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=NxDg7u+T
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 483BG7ZT032362;
	Tue, 3 Sep 2024 21:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Juw95hWlQh+vulyTYbRH3E+f2hj1jPIPe4v2666ocbk=; b=NxDg7u+TIkYWhNAP
	LPdqsA1+kyLVLja50JCyFxmcB+w1+3vJgxUOpHfbMLRHLLClASULqTvmTtRrVudu
	FXxBKLyoE7OgEektgp0DMyKy/8zU7U9Tsa/XZJeIzfESbLWAonKtwDW2DxUNhtG4
	NrZEfJaHjQK9KoccdU3LAf5C9IoHJ/9OwWC5DT3Ye7N7Kl5WWSs4SF4ppCuhUV0K
	brSoEdXqYl8grLhTnQHKeiFpAfGD0krfoMCJa66iNWA2tx8sVHWxVrwNwKzcEcnf
	UzItbu+pWWOvdEZnWap++PfuqDJ+NJpxs1i/viyP+bS8MNHyu4nOXOjcK0SlJy1I
	zNIJUA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe332k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 21:49:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 483LnARn020162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 21:49:10 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 14:49:09 -0700
Message-ID: <7d83df41-86f0-403a-b298-b8db9086fe9b@quicinc.com>
Date: Tue, 3 Sep 2024 14:49:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 23/33] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
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
 <20240829194105.1504814-24-quic_wcheng@quicinc.com>
 <87b06b92-8e58-414d-ba53-db7c88ac525a@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87b06b92-8e58-414d-ba53-db7c88ac525a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TJ4YgTd8SkdJ6d6th9aP9xfOcURTE2a_
X-Proofpoint-ORIG-GUID: TJ4YgTd8SkdJ6d6th9aP9xfOcURTE2a_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_09,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030175
Message-ID-Hash: GB5WPFHJISDE5CCIVTFZ77WTYDVBEW73
X-Message-ID-Hash: GB5WPFHJISDE5CCIVTFZ77WTYDVBEW73
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GB5WPFHJISDE5CCIVTFZ77WTYDVBEW73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:34 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> The USB SND path may need to know how the USB offload path is routed, so
>> that applications can open the proper sound card and PCM device.  The
>> implementation for the QC ASoC design has a "USB Mixer" kcontrol for each
>> possible FE (Q6ASM) DAI, which can be utilized to know which front end link
>> is enabled.
>>
>> When an application/userspace queries for the mapped offload devices, the
>> logic will lookup the USB mixer status though the following path:
>>
>> MultiMedia* <-> MM_DL* <-> USB Mixer*
>>
>> The "USB Mixer" is a DAPM widget, and the q6routing entity will set the
>> DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
>> the Q6USB backend link can fetch the PCM device number from the FE DAI
>> link (Multimedia*).  With respects to the card number, that is
>> straightforward, as the ASoC components have direct references to the ASoC
>> platform sound card.
>>
>> An example output can be shown below:
>>
>> Number of controls: 9
>> name                                    value
>> Capture Channel Map                     0, 0 (range 0->36)
>> Playback Channel Map                    0, 0 (range 0->36)
>> Headset Capture Switch                  On
>> Headset Capture Volume                  1 (range 0->4)
>> Sidetone Playback Switch                On
>> Sidetone Playback Volume                4096 (range 0->8192)
>> Headset Playback Switch                 On
>> Headset Playback Volume                 20, 20 (range 0->24)
>> USB Offload Playback Route PCM#0        0, 1 (range -1->255)
>>
>> The "USB Offload Playback Route PCM#*" kcontrol will signify the
>> corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
>> If the USB SND device supports multiple audio interfaces, then it will
>> contain several PCM streams, hence in those situations, it is expected
>> that there will be multiple playback route kcontrols created.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6usb.c | 104 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
>> index 10337d70eb27..c2fc0dedf430 100644
>> --- a/sound/soc/qcom/qdsp6/q6usb.c
>> +++ b/sound/soc/qcom/qdsp6/q6usb.c
>> @@ -132,6 +132,109 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
>>  	return ret;
>>  }
>>  
>> +static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd;
>> +	struct snd_soc_dai *dai;
>> +
>> +	for_each_card_rtds(w->dapm->card, rtd) {
>> +		dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +		/*
>> +		 * Only look for playback widget. RTD number carries the assigned
>> +		 * PCM index.
>> +		 */
>> +		if (dai->stream[0].widget == w)
>> +			return rtd->num;
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_dapm_path *p;
>> +
>> +	/* Checks to ensure USB path is enabled/connected */
>> +	snd_soc_dapm_widget_for_each_sink_path(w, p)
>> +		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
>> +			return 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int q6usb_get_pcm_id(struct snd_soc_component *component)
>> +{
>> +	struct snd_soc_dapm_widget *w;
>> +	struct snd_soc_dapm_path *p;
>> +	int pidx;
>> +
>> +	/*
>> +	 * Traverse widgets to find corresponding FE widget.  The DAI links are
>> +	 * built like the following:
>> +	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
>> +	 */
>> +	for_each_card_widgets(component->card, w) {
>> +		if (!strncmp(w->name, "MultiMedia", 10)) {
>> +			/*
>> +			 * Look up all paths associated with the FE widget to see if
>> +			 * the USB BE is enabled.  The sink widget is responsible to
>> +			 * link with the USB mixers.
>> +			 */
>> +			snd_soc_dapm_widget_for_each_sink_path(w, p) {
>> +				if (q6usb_usb_mixer_enabled(p->sink)) {
>> +					pidx = q6usb_get_pcm_id_from_widget(w);
>> +					return pidx;
>> +				}
>> +			}
> Humm, there should be a note that the design assumes that the USB
> offload path exposes a single PCM per endpoints - same as the
> non-offloaded path. If the ASoC card has multiple PCMs for each
> endpoint, possibly with different processing on each PCM, then the
> mapping would fail.
Sure I'll add a note within the comments on the above.
> The other question is whether you need to walk in the DAPM graph, in
> theory DPCM has helpers to find which FEs are connected to which BE.

Hmm...Yes, I've tried to see if I could utilize some of the helpers that were present, but none of them was able to fetch the DAPM widget that was associated with the FE, hence why I had to implement the lookup that would work for our current design.

Thanks

Wesley Cheng


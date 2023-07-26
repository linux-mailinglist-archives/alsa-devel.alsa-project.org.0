Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236276273E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 01:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A753E7;
	Wed, 26 Jul 2023 01:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A753E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690327156;
	bh=RnKX8XE2PTpVmTJ5r4nyEmDTCIafnM8t/IGUhuUZ9C8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sKgfkk+SmX+tRAVX3qFHQL5S7eSr9GCZv+d1ob3sryMT/T+zGUQLWTwQSI304/bU4
	 xuJoPgHC2Rq41cW/2TQFUT3yZPUW1xwylkpiEhnFpKcZiGcviHdrNm1XhUeT7hWbC9
	 76GFDRce7mA/5g6gtRUKXyxiX1Hv48TjNxQQ4FXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10EA5F8053B; Wed, 26 Jul 2023 01:18:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7A5F80153;
	Wed, 26 Jul 2023 01:18:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8043F8019B; Wed, 26 Jul 2023 01:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E607F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 01:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E607F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=A/8Eh6NU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36PNDIAD000405;
	Tue, 25 Jul 2023 23:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UMPzc15goQAkKTvtJQP8mTOXbx53Fh755mAgUKkn7NA=;
 b=A/8Eh6NU7hbAYFO38boyndeemQnUR7GSAKFGhhRbLSzjFHv02fdbMjuf/8o0RGcfmggI
 +Ey+sKcLiion2iLezUjmZOAbLWBBZoColEfw1mPQuNWKs5tfdArK7srwQjr9qjPe2WAd
 QRWolZfJrHw2g8rUGKXjsWKgR7B+u2FpKnQoVGKbzLWWnbNu0fosZSo0fl2pp4k0hOjF
 SAphLIByDogpGagDAPkmN8PUbmsFf//F3tC0cmsP7WHQhGRDj6p4QE9vt+e032npsUMM
 mzMBpujc1oiuXMlN/dg6eJxqPjPx8FMk5mrDG5aNLdoiSmQTYF2HwNMYivzO/todAz3T Xg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s29xmj2k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 23:18:00 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36PNHx6w016007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 23:17:59 GMT
Received: from [10.110.23.161] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 16:17:58 -0700
Message-ID: <8ae1928e-4b38-e7e1-162b-144a07efde9f@quicinc.com>
Date: Tue, 25 Jul 2023 16:17:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 06/32] ASoC: Add SOC USB APIs for adding an USB backend
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <oneukum@suse.com>,
        <albertccwang@google.com>, <o-takashi@sakamocchi.jp>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-7-quic_wcheng@quicinc.com>
 <9e391c7d-f45b-42f4-fae4-72fba32482db@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9e391c7d-f45b-42f4-fae4-72fba32482db@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HLJLsNhZptWr3FYhyaZw9fl2vAXuZvXW
X-Proofpoint-GUID: HLJLsNhZptWr3FYhyaZw9fl2vAXuZvXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxlogscore=823 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250197
Message-ID-Hash: KY236RXXD6B66EW2VMB2A2Y6FEI36FZH
X-Message-ID-Hash: KY236RXXD6B66EW2VMB2A2Y6FEI36FZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KY236RXXD6B66EW2VMB2A2Y6FEI36FZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 7/25/2023 1:10 AM, Pierre-Louis Bossart wrote:
> 
>> +/**
>> + * struct snd_soc_usb
>> + * @list - list head for SND SOC struct list
>> + * @dev - USB backend device reference
>> + * @component - reference to DAPM component
> 
> ASoC component, not DAPM.
> 

Thanks for the detailed review. Will fix this.

>> + * @connection_status_cb - callback to notify connection events
>> + * @priv_data - driver data
>> + **/
>> +struct snd_soc_usb {
>> +	struct list_head list;
>> +	struct device *dev;
>> +	struct snd_soc_component *component;
>> +	int (*connection_status_cb)(struct snd_soc_usb *usb, int card_idx,
>> +				int connected);
> 
> It's not clear what 'connected' really refers to, is this a boolean
> really or is this a "connection_event?
> 
> 

I'll change it to boolean for now, since its currently only 
connected/disconnected.  If more states are required, then we can add 
that in the future.

>> +	void *priv_data;
>> +};
>> +
>> +int snd_soc_usb_connect(struct device *usbdev, int card_idx);
>> +int snd_soc_usb_disconnect(struct device *usbdev);
>> +void snd_soc_usb_set_priv_data(struct device *dev, void *priv);
> 
> this function is not part of this patch, is this intentional to have a
> get but not a set?
> 
>> +void *snd_soc_usb_get_priv_data(struct device *usbdev);
> 
> you are using 'usbdev' and 'dev' for the same type of parameters, why
> not align on one set of definition with a consistent naming.
> 
> 

I'll take a look at this and see what happened.  I think Greg mentioned 
something similar and I made the change to remove the set priv, and 
moved it elsewhere.

>> +static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
>> +{
>> +	struct device_node *node;
>> +	struct snd_soc_usb *ctx = NULL;
> 
> this init doesn't seem required?
> 

Yes, not needed.

>> +
>> +	node = snd_soc_find_phandle(dev);
>> +	if (IS_ERR(node))
>> +		return NULL;
>> +
>> +	mutex_lock(&ctx_mutex);
>> +	list_for_each_entry(ctx, &usb_ctx_list, list) {
>> +		if (ctx->dev->of_node == node) {
>> +			of_node_put(node);
>> +			mutex_unlock(&ctx_mutex);
>> +			return ctx;
>> +		}
>> +	}
>> +	of_node_put(node);
>> +	mutex_unlock(&ctx_mutex);
>> +
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * snd_soc_usb_get_priv_data() - Retrieve private data stored
>> + * @dev: device reference
>> + *
>> + * Fetch the private data stored in the USB SND SOC structure.
>> + *
>> + */
>> +void *snd_soc_usb_get_priv_data(struct device *dev)
>> +{
>> +	struct snd_soc_usb *ctx;
>> +
>> +	ctx = snd_soc_find_usb_ctx(dev);
> 
> so in this function you walk through the usb_ctx_list with locking...
> 
>> +	if (!ctx) {
>> +		/* Check if backend device */
>> +		list_for_each_entry(ctx, &usb_ctx_list, list) {
> 
> ... and here you walk again through the list without locking.
> 
> Something's weird here, if this was intentional you need to add comments.
> 

Yes, needs a lock here.

>> +			if (dev->of_node == ctx->dev->of_node)
>> +				goto out;
>> +		}
>> +		ctx = NULL;
>> +	}
>> +out:
>> +	return ctx ? ctx->priv_data : NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_get_priv_data);
>> +
>> +/**
>> + * snd_soc_usb_add_port() - Add a USB backend port
>> + * @dev: USB backend device
>> + * @priv: private data
>> + * @connection_cb: connection status callback
>> + *
>> + * Register a USB backend device to the SND USB SOC framework.  Memory is
>> + * allocated as part of the USB backend device.
>> + *
>> + */
>> +struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,
>> +			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
>> +			int connected))
>> +{
>> +	struct snd_soc_usb *usb;
>> +
>> +	usb = devm_kzalloc(dev, sizeof(*usb), GFP_KERNEL);
>> +	if (!usb)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	usb->connection_status_cb = connection_cb;
>> +	usb->dev = dev;
>> +	usb->priv_data = priv;
> 
> back to my comment above, you don't seem to need the set_priv_data() ?
> 

And yes, this is where I moved the priv data setting.

>> +
>> +	mutex_lock(&ctx_mutex);
>> +	list_add_tail(&usb->list, &usb_ctx_list);
>> +	mutex_unlock(&ctx_mutex);
>> +
>> +	return usb;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
> 
>> +/**
>> + * snd_soc_usb_connect() - Notification of USB device connection
>> + * @usbdev: USB bus device
>> + * @card_idx: USB SND card instance
>> + *
>> + * Notify of a new USB SND device connection.  The card_idx can be used to
>> + * handle how the USB backend selects, which device to enable offloading on.
> 
> "USB backend" is confusing, not sure if this is the same concept as DPCM
> "backend" or something else. Please try to avoid overloaded terms.
> 

Sure, I meant DPCM backend.

>> + *
>> + */
>> +int snd_soc_usb_connect(struct device *usbdev, int card_idx)
>> +{
>> +	struct snd_soc_usb *ctx;
>> +
>> +	if (!usbdev)
>> +		return -ENODEV;
>> +
>> +	ctx = snd_soc_find_usb_ctx(usbdev);
>> +	if (!ctx)
>> +		return -ENODEV;
>> +
>> +	if (ctx->connection_status_cb)
>> +		ctx->connection_status_cb(ctx, card_idx, 1);
> 
> so either the 'connected' value is 1...
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
>> +
>> +/**
>> + * snd_soc_usb_disconnect() - Notification of USB device disconnection
>> + * @usbdev: USB bus device
>> + *
>> + * Notify of a new USB SND device disconnection to the USB backend.
>> + *
>> + */
>> +int snd_soc_usb_disconnect(struct device *usbdev)
>> +{
>> +	struct snd_soc_usb *ctx;
>> +
>> +	if (!usbdev)
>> +		return -ENODEV;
>> +
>> +	ctx = snd_soc_find_usb_ctx(usbdev);
>> +	if (!ctx)
>> +		return -ENODEV;
>> +
>> +	if (ctx->connection_status_cb)
>> +		ctx->connection_status_cb(ctx, -1, 0);
> 
> ...and here it's zero.
> 
> should this 'connected' parameter be a boolean then with true/false
> value, or do you want to add enums/defines for more flexibility down the
> road?
> 

As mentioned above, will switch to boolean for now.  I don't see a need 
to have other enums.

Thanks
Wesley Cheng

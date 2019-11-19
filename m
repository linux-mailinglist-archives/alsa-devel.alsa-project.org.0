Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B9101E3E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 09:45:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 492A7166D;
	Tue, 19 Nov 2019 09:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 492A7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574153114;
	bh=exWxRuEh3x+2UzyLwrDwQ2zibFS+Jcbmkn/wMxkIWcE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwuKt0/954JbIXEBEQE8I7kL+LX6Rt8miblmzFRf8AQe6nSCf4KyC+kS1gv6s6t2y
	 0gtSU/qh1zLc3JTuvkvkJVOoaMmtTSt9PY3cITt7hxKq2QYHJOiSkearM1rcBHqkUB
	 NP4xJTck4aXVr9hP8+dhOoSQQDWuPycMeAI+5QU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E7A5F80139;
	Tue, 19 Nov 2019 09:43:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF3CEF80137; Tue, 19 Nov 2019 09:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AA42F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 09:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AA42F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="otmly/1v"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3ab280000>; Tue, 19 Nov 2019 00:43:20 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:43:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:43:23 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:43:21 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191114033704.18171-1-nmahale@nvidia.com>
 <20191114033704.18171-4-nmahale@nvidia.com> <s5ho8xen2s3.wl-tiwai@suse.de>
 <9a6f7ac2-998f-23ff-c606-a780c4804eba@nvidia.com>
 <s5hd0dumwg5.wl-tiwai@suse.de>
 <5eb1ef50-e129-c188-0996-cd74de6a5025@nvidia.com>
 <s5hr229jutr.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <d36a7bd1-f7f5-2364-d7b5-a4ab3591a6fa@nvidia.com>
Date: Tue, 19 Nov 2019 14:13:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5hr229jutr.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574153000; bh=xRFtiELBTahvMrViTs5P0vf5X58HbX7Oj29lCIxi2vQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=otmly/1vrTqtScGw8C7qeFrdN6zuo6qi+prZt6xNv4PjUR/1Rd1ALPCg8TGCBlt3V
 Mu/hh93O2GIodk787vb8G0ZQ2GfjQT3Z24vOcreP9OE1tALeJnRsRYkvqvUVnPz9kI
 HKvoZ0KpHgy8thbWRs0+ZiFxEsV9mzBtiRYQCv+9g23LCo5tJddSH2jTjkcA2WBiRV
 sMNerdGaK6vb95rbAjQ20xRzNrdqUoA+ZLz41BCUpG9qEpxIntd1s+8vM1jvviiwLZ
 ceoNV5oAchAQdIbcP/AIABHeSy3AjcIFf7P0GdTnl+nFc2jnARlNDWV2EgXHZagKSL
 28JLOytkEMqJQ==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v1 3/5] ALSA: hda - Add DP-MST conn list
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



Thanks,
Nikhil Mahale

On 11/15/19 4:00 PM, Takashi Iwai wrote:
> On Fri, 15 Nov 2019 10:52:30 +0100,
> Nikhil Mahale wrote:
>>
>> On 11/14/19 6:44 PM, Takashi Iwai wrote:
>>> On Thu, 14 Nov 2019 12:47:36 +0100,
>>> Nikhil Mahale wrote:
>>>>
>>>> On 11/14/19 4:27 PM, Takashi Iwai wrote:
>>>>> On Thu, 14 Nov 2019 04:37:02 +0100,
>>>>> Nikhil Mahale wrote:
>>>>>>
>>>>>> Document change notification HDA040-A for the Intel High Definition
>>>>>> Audio 1.0a specification introduces a Device Select verb for Digital
>>>>>> Display Pin Widgets that are multi-stream capable. This verb selects
>>>>>> a Device Entry that is used by subsequent Pin Widget verbs,
>>>>>> including the Get Connection List Entry verb.
>>>>>>
>>>>>> This patch queries the current Device Select value, associates it
>>>>>> with the connection list, and updates the connection list management
>>>>>> code to consider dev_id along with nid.
>>>>>
>>>>> I don't get why this is needed.  This is the list that is added only
>>>>> from snd_hda_override_conn_list(), and you don't change that call
>>>>> pattern, so dev_id is always zero.
>>>>
>>>> In follow-on patch "ALSA: hda - Add DP-MST support for non-acomp codecs",
>>>> hdmi_read_pin_conn() calls into snd_hda_set_dev_select() before
>>>> running into code path -
>>>>   
>>>>   snd_hda_get_connections()
>>>>    |-> snd_hda_get_conn_list()
>>>>         |-> read_and_add_raw_conns()
>>>>              |-> snd_hda_override_conn_list()
>>>>                   |-> add_conn_list()
>>>>
>>>> If I understand spec correctly, conn_list need to read/write/track
>>>> along with device entry set into AC_VERB_SET_DEVICE_SEL verb, right?
>>>
>>> AFAIK, the device connection list itself is same no matter which
>>> device entry is.  The pin widget may choose the route per device
>>> entry, but the available routes should be same.
>>
>> Section 7.3.3.42 of https://www.intel.com/content/dam/www/public/us/en/documents/specification-updates/high-definition-audio-multi-stream.pdf says that 'Get Connection List Entry' control should be per-device!
> 
> Hrm, right.  It's a bit concern that this may lead to the unlimited
> number of data, though.
> 
> Since the necessity is only for HDMI codec, if that's the only place
> we need the connection list, the call there can be replaced with
> snd_hda_get_raw_connections() so that the result won't be cached in
> HD-audio core side.
Ok, I am addressing this in 3rd version of patch set.

Thanks,
Nikhil Mahale

> Takashi
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

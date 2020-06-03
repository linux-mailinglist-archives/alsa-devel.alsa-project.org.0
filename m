Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5E1EC650
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 02:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F711665;
	Wed,  3 Jun 2020 02:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F711665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591144708;
	bh=kPpxDGE0vgcxRDGmwfpNYYgjRENjwfwaS9372OPV4MM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kAVeysakrykp5LlYauJDMFHCiRlZIn/PLOPwtRCxg65j/ArCLPVMfadwVhBhQPz+q
	 4WhbeTeNr3YC+DZi0BfZYIfFkdcRVdyca5js+kQJzv71NGgsUAKkD8EJHZ3fqdSIxT
	 t5HDzlha/y8ykVTTPRPp9mQnYjhNMiruGSoj1MeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE63F80260;
	Wed,  3 Jun 2020 02:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CC38F8026F; Wed,  3 Jun 2020 02:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3681BF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 02:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3681BF800BC
Received: from [114.253.255.123] (helo=[192.168.2.109])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jgHOS-0005mw-8X; Wed, 03 Jun 2020 00:36:32 +0000
Subject: Re: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
To: Jaroslav Kysela <perex@perex.cz>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
 <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <da8b6e1e-fd29-fb99-07a7-d5fd8c7b78f9@canonical.com>
Date: Wed, 3 Jun 2020 08:36:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 2020/6/3 上午3:39, Jaroslav Kysela wrote:
> Dne 02. 06. 20 v 19:57 Mukunda, Vijendar napsal(a):
>> We recently up streamed ACP PDM driver for Renoir APU.
>>
>> Our ACP IP has an internal PDM Decoder block where DMIC is directly 
>> connected.
>> There are no KControls defined for PDM Driver.
>>
>> Our platform supports on board DMIC and South bridge Azalia (HD Audio 
>> ) endpoint .
>> By default, DMIC endpoint is used as audio input device.
>> When Headset Mic jack connected, it's not switching to External Mic.
>
> Make sure that the Headset Mic priority port in pulseaudio is is 
> greater than the one for DMIC.
>
>> How does audio endpoint will switch in gnome when external mic is 
>> connected?
>>> From our understanding, UCM conf file for HDA driver is also 
>>> required for 
>> configuring mixer controls for HD Audio capture device.
>> Similarly when External Mic is removed , it has to switch to internal 
>> dmic .
>
> An configuration example for UCM (DMIC connected to DSP, HDA codec for 
> rest):
>
> https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/sof-hda-dsp
>
> If you need a help to create a new configuration for your hardware, 
> show the output from the alsa-info.sh script, please.
>
>                     Jaroslav

This audio design is  a bit different from sof-hda-dsp, the dmic is on a 
standalone sound card. Please see the alsa-info.txt:

https://pastebin.ubuntu.com/p/4kprhDZYbg/

Thanks,

Hui.


>
>>
>> Need help in resolving this issue.
>>
>> Thanks,
>> Vijendar
>>
>>
>
>

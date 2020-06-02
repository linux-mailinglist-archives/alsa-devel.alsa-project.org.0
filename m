Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8351EC2FC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 21:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EE7165D;
	Tue,  2 Jun 2020 21:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EE7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591126922;
	bh=sOm24cOmxxzEhnvZ6YiMek5r7wQg33WJCM8D62E4hvA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kt+lIBkFMD9sIUxIwZHiU21uUOzsd3HzxQoPz9elCk3SksOMsNZ8s9ne7ZXsdTDqj
	 AjPzY/YreJjvlyPs+aK/DwZW9W03zVF+zaZVeNSy4KH0U1zkSJMsFLN8An0e8kziZR
	 3eXnRzD/Cr54tnm6fccUX0mnse6vJJATlrAwCVTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD611F800B8;
	Tue,  2 Jun 2020 21:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ADD4F8026F; Tue,  2 Jun 2020 21:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6EA6F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 21:39:56 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A4F73A003F;
 Tue,  2 Jun 2020 21:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A4F73A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591126793; bh=k7UgsCID/aLiq6VrJjg7DzcBS6fxtQXpN1hJoa346Ew=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vYkq/9rIekVQvml4tORl5BDjgIBAySS20xKIyjAGvaZRL2rqOSZQpy75X3aXQxAw7
 LGQ44D/g51KiLNIL94yN+did/9lAG9/XtzgYtpk0goTv2XlGt6G7UAHJokaVv4Z7/1
 VLIbS3j1FA6aqx/RxnmwTG8A7/xe1a5jj8I5Lbiw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  2 Jun 2020 21:39:50 +0200 (CEST)
Subject: Re: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
Date: Tue, 2 Jun 2020 21:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hui Wang <hui.wang@canonical.com>
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

Dne 02. 06. 20 v 19:57 Mukunda, Vijendar napsal(a):
> We recently up streamed ACP PDM driver for Renoir APU.
> 
> Our ACP IP has an internal PDM Decoder block where DMIC is directly connected.
> There are no KControls defined for PDM Driver.
> 
> Our platform supports on board DMIC and South bridge Azalia (HD Audio ) endpoint .
> By default, DMIC endpoint is used as audio input device.
> When Headset Mic jack connected, it's not switching to External Mic.

Make sure that the Headset Mic priority port in pulseaudio is is greater than 
the one for DMIC.

> How does audio endpoint will switch in gnome when external mic is connected?
>>From our understanding, UCM conf file for HDA driver is also required for 
> configuring mixer controls for HD Audio capture device.
> Similarly when External Mic is removed , it has to switch to internal dmic .

An configuration example for UCM (DMIC connected to DSP, HDA codec for rest):

   https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/sof-hda-dsp

If you need a help to create a new configuration for your hardware, show the 
output from the alsa-info.sh script, please.

					Jaroslav

> 
> Need help in resolving this issue.
> 
> Thanks,
> Vijendar
> 
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

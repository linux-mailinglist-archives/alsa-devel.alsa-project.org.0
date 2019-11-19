Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C2101E46
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 09:46:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76081695;
	Tue, 19 Nov 2019 09:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76081695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574153160;
	bh=U0OuoCvCjEwVIbZSlYdir13yAX/ZWkDlkKBWa2OojdE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QdO3MApr/ESHGC6a/AL5dQ/l6u9jY8E9uHq54vYBJ8w8szM76OBI1TniQST07Aizq
	 tlLyN+R4V5DODPdcHIr0Lx2Yx+mc/bDSGAR4ZSg/CQzsq408//h0j8hEFfvAVx25+I
	 sD5K64h8bQV67snHLtQHOpAy/aHpLfV/VReTZrkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E224F80137;
	Tue, 19 Nov 2019 09:44:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61893F80146; Tue, 19 Nov 2019 09:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D239DF80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 09:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D239DF80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="mt02lXCI"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3ab5a0002>; Tue, 19 Nov 2019 00:44:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:44:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:44:07 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:44:06 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191115095606.22392-1-nmahale@nvidia.com>
 <20191115095606.22392-6-nmahale@nvidia.com> <s5hbltdjn5u.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <7b7ef72e-fe95-eafd-9b62-6c28136c39b0@nvidia.com>
Date: Tue, 19 Nov 2019 14:14:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5hbltdjn5u.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574153050; bh=HP+sA1Xz6qqe2TchT2h21K301z7/SFDM31VlcjN2NSc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mt02lXCIuzI0eNrVVS0YalajSS1UiL5gVo/NDOOPBXWzG3KmKAvBE6msPY6h/10p7
 cdTQTxVGDY7c+1/+n1sNAgQCX3zb2nx8P6cGGmEXKDVMqAyO3GKOGHiB/DLS6cAx7E
 R+U3x2cWawfQIJUYxi3GQivQCazIrFT5Z/GDyzr1kTCamxUwZfXfxxxZIeZwXxcCpJ
 j0fsSIWb05p0ASd4Q+8GAiL6gEuURXTG5bNzfpNpHCL6XPViQ7pK6CKqETwnnQQBCP
 1YxkuIVTQZAeUTZUvERIvmT3NdJ+pcDwgIeO+YvLQfLQV6i3ye2UHMDA6oneb1pDSt
 2K2Llp8xeZn2g==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 5/5] ALSA: hda - Add DP-MST support for
	NVIDIA codecs
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

On 11/15/19 6:45 PM, Takashi Iwai wrote:
> On Fri, 15 Nov 2019 10:56:06 +0100,
> Nikhil Mahale wrote:
>> @@ -33,6 +33,8 @@
>>  #include "hda_local.h"
>>  #include "hda_jack.h"
>>  
>> +struct hdmi_spec;
>> +
> 
> This became superfluous.
Yeah, I am removing this in 3rd version of patch set.

Thanks,
Nikhil Mahale

> 
> thanks,
> 
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

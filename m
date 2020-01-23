Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1E146C41
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 16:04:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE66168E;
	Thu, 23 Jan 2020 16:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE66168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579791842;
	bh=9bhVGW4zNf2ar+2YFVXbM5o75WIVFTrj/T61yMnlCOM=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hYIlhmmdpdKcUsI0XDGioqcuFTxSLL/dPEZVxFqLvCp7JTW7AqIe6uR/fyxCIaxD5
	 hBB+SMpg6/dVet8V+zdq4GW93WFtONEtKgioUBKr5DIhPnaxuIG3EFPmkBBw2Xr++G
	 iaFgTaUBEki+550XP5qHKwKGyvKS5c88lmlUcUwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC10F801EC;
	Thu, 23 Jan 2020 16:02:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A1CF801D9; Thu, 23 Jan 2020 16:02:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from server.feix.family (server.feix.family [80.240.19.227])
 by alsa1.perex.cz (Postfix) with ESMTP id 51454F800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 16:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51454F800BA
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
 <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
 <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
 <103d4b4e-f234-5704-310d-ad6286575aa1@linux.intel.com>
From: Michal Feix <michal@feix.family>
Message-ID: <ba922286-a882-1ed4-3b62-8d8acee971fd@feix.family>
Date: Thu, 23 Jan 2020 16:02:06 +0100
MIME-Version: 1.0
In-Reply-To: <103d4b4e-f234-5704-310d-ad6286575aa1@linux.intel.com>
Content-Language: cs
Subject: Re: [alsa-devel] ASUS T100TAM UCM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> 
>> Thanks Pierre. I'm aware of the work done previously on Asus T100. Not sure, if Asus T100TAM is any significantly different. Just tried your suggested commands as root user:
>>
>> # alsaucm -c bytcr-rt5640 set _verb HiFi set _enadev Headphones
>> ALSA lib ucm_subs.c:215:(uc_mgr_get_substituted_value) variable '${CardComponents}' is not defined in this context!
>> ALSA lib main.c:960:(snd_use_case_mgr_open) error: failed to import bytcr-rt5640 use case configuration -22
>> alsaucm: error failed to open sound card bytcr-rt5640: Invalid argument
>>
>> # alsaucm -c bytcr-rt5640 set _verb HiFi set _enadev Speaker
>> ALSA lib ucm_subs.c:215:(uc_mgr_get_substituted_value) variable '${CardComponents}' is not defined in this context!
>> ALSA lib main.c:960:(snd_use_case_mgr_open) error: failed to import bytcr-rt5640 use case configuration -22
>> alsaucm: error failed to open sound card bytcr-rt5640: Invalid argument
>>
>> I also tried this:
>>
>> # alsaucm listcards
>> ALSA lib utils.c:261:(uc_mgr_config_load) could not open configuration file /usr/share/alsa/ucm2/HDA Intel PCH/HDA Intel PCH.conf
>> alsaucm: error failed to get card list: No such file or directory
>>
>> There really is no such file "HDA Intel PCH.conf" in HDA Intel PCH directory, but I do not see any such file in the alsa-ucm-conf package downloaded from origin Alsa site.
> 
> can you point us to the alsa-info results then? It could indeed be a completely different hardware, where you only have HDaudio support (no I2S codecs), in which case you shouldn't need UCM.

http://alsa-project.org/db/?f=e5f8088e73917cfeddca95344aef7debf1498fa1

Thanks,

--
Michal
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

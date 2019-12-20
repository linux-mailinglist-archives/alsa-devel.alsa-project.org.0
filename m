Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D733127B75
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 14:02:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306A9168E;
	Fri, 20 Dec 2019 14:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306A9168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576846949;
	bh=0D2/eAPwERXpsbqYALxLbrnd9Se3MjfPk7VGE3tnw64=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sq0JqooUdx4PsKvvM0VvGBN2Fdeog77x79tRSohX9EkWgGyHXULnnV1c8QDBPMd3S
	 t56zTootXLTMxX0i7Miqz3odX6NtPOnTG4ZngkpJAczIAQcS6Of3nG2RcMDmdN5lgJ
	 UhY2yQhCyM0xfIFn2+u2LQZ2+9R69DeeotiVklJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF04EF8014F;
	Fri, 20 Dec 2019 14:01:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CA2BF8015A; Fri, 20 Dec 2019 14:01:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CA02F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 14:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA02F800B5
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47fTQh3DlNz1rhZr;
 Fri, 20 Dec 2019 14:01:32 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47fTQh1j3Sz1rYZN;
 Fri, 20 Dec 2019 14:01:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ykk33nqTz-H8; Fri, 20 Dec 2019 14:01:30 +0100 (CET)
X-Auth-Info: jxv/HLLFfqHyKNojEYvmaHSkEtVrSr+mHmu7W+pQUcE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 20 Dec 2019 14:01:30 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
References: <20191219213257.366145-1-marex@denx.de>
 <20191220130030.GE4790@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
Message-ID: <8769149d-99c4-f577-bc9b-c621c4f3eba4@denx.de>
Date: Fri, 20 Dec 2019 14:01:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191220130030.GE4790@sirena.org.uk>
Content-Language: en-US
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, alsa-devel@alsa-project.org,
 festevam@gmail.com, Igor Opaniuk <igor.opaniuk@toradex.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sgtl5000: Fix VDDA and VDDIO
	comparison
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

On 12/20/19 2:00 PM, Mark Brown wrote:
> On Thu, Dec 19, 2019 at 10:32:57PM +0100, Marek Vasut wrote:
> 
>>  #include "sgtl5000.h"
>>  
>> +#include "../../../drivers/regulator/internal.h"
>> +
> 
> This sort of peering inside the internals of the framework is obviously
> not OK, please add an interface for this if it's needed.

It's needed, unless there is a better way to compare two regulators in
the driver already. Is there ?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

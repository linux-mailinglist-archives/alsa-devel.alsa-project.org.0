Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12D92CFA76
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:07:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8390C18CF;
	Sat,  5 Dec 2020 09:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8390C18CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155646;
	bh=VsRX+xGb8tfXxMSIDzsaHw6m6ALj/pSpVp3B7fsiqck=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+XwWtY9mu4/cog6p9t8xthycboJ1C3oQocaYnQ3pQfR3PLpvE5PDJAwIbRqyStnb
	 yrgNZNKGxnWtQN2vU5TbUo9EneLEAuah8Q44na/BoK1Z04IeeBqbDROMJY2mdM8bqM
	 pGCDRJdv0n1SiDTNdwsniK8dZ1YuPivOfcCFLKhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F54CF804ED;
	Sat,  5 Dec 2020 09:03:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DABFF8016D; Thu,  3 Dec 2020 07:46:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49468F800E8
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 07:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49468F800E8
IronPort-SDR: 5wsRvo4KB5tludE9CiMBsOqzqS8dJZP/Kgxxw7WUGtA1UPcNl0Y4j8a4iLP+0yF0lQPrIsFGCq
 mnulkaDGdNbeTHdgzQom2mxRUL+qEaOIKO04WFtk999NipYZd5bdP0XAy+e+W+ohxy9EtIy3xD
 o7TamFR01ui6QgVrDprXh6B7zp6BLOIfCV+OOEbbFLJWXTcjzTe25CzLq9d/dHAq0/ad3jFo4G
 uncjW7Cm7IC9jUmi2A0q5o3VayLTWskb7wb+SzMYjDqHrWm+aC/oFLpNH56JzyXVTjUP1dK3VH
 oyI=
X-IronPort-AV: E=Sophos;i="5.78,388,1599552000"; d="scan'208";a="55726689"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 02 Dec 2020 22:46:21 -0800
IronPort-SDR: gJMY6Y/MU+UaXt3QljKs5RRVRB7NvxgCIP09XQgQH74ALAsBuRzPslp00xEDEHiAgJSdmPu3x0
 DudZT/WjjAXTKiAMZGLzyrUDhytFPmTYpDf5gg45240zJ2zkN4LKAmCVOw5/epkVMsFCJFXcN7
 o3NIKio6ASxnrn19ZZcqYwLSIoAozvEmfbvICzJCZiCZPa+8nLg3iHp6AD2m2vFLVSLwDAIHEy
 cQcoWcd9fj4mDKQ8qxevS9aefXecPsOslNNoBVYWpWeFGxHHAg9WGUg5VPiBMqSCHIsDW/pMY8
 WnU=
Subject: Re: [PATCH v0] ASoC: rsnd: core: Check convert rate in rsnd_hw_params
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1606907286-32104-1-git-send-email-mikhail_durnev@mentor.com>
 <87sg8nbz4o.wl-kuninori.morimoto.gx@renesas.com>
From: Mikhail Durnev <Mikhail_Durnev@mentor.com>
Message-ID: <866c9619-757b-831b-6955-9245a6071adc@mentor.com>
Date: Thu, 3 Dec 2020 16:46:13 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87sg8nbz4o.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:14 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 03.12.2020 08:57, Kuninori Morimoto wrote:
> I think you want to add "fallthrough" between case 1/3/4 and case 0 ?
Hi Morimoto-san,

Yes, I will add it in the updated version of the patch. Thanks.
The checkpatch script did not tell me about that.

Best regards,
Misha

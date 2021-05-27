Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06292392B47
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 11:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30BB170A;
	Thu, 27 May 2021 11:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30BB170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622109548;
	bh=HZhvLY/gI1Im/TenbWb6ybkbEX5T6VkkxE/K0GOc+GU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQ2pHgJ9kDqlwDqL4UMI9fTUFKpUDxv9w37maMHsKNLtmIlJ18SZYhz39gTZZ2ons
	 Bz9SCFR+Aec4aJ2xxbvGrrxtXUs1TAgQUNbRBfu0wRvCojKgISd7R2G6hqDWDiUfWJ
	 NuZkMNVlvwztjJ+2IHUXjgsIl4eoRNdeCnzyYLIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2893AF80147;
	Thu, 27 May 2021 11:57:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C895F8012E; Thu, 27 May 2021 11:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,TRACKER_ID,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E85F800F9
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 11:57:30 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DA6FFA0040;
 Thu, 27 May 2021 11:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DA6FFA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1622109449; bh=8/Vo/ExtAjJzJndQOLCZHTYXFAjg5nRJEFBMuP8RCI8=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=M51o+u3GJ4ZEOMDGY9EdvG2HeX5tJPo+KuzYuU5ZP39WeWBlhm0scQJTTb+QdeECt
 gJGL/uiL7HwRHr71pPHmBKjyeDRv512v23RXKi8gYN9D/ezg1og4vgrRDnEx7cOoXB
 +0qll7uOG9pwG16sCnyqH/Skq9sIom4DwNmdTELU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 27 May 2021 11:57:27 +0200 (CEST)
Subject: Re: Internal microphone does not work with 5.12 (Tiger Lake, X1 Nano)
To: Nico Schottelius <nico.schottelius@ungleich.ch>
References: <874keoijzh.fsf@ungleich.ch>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz>
Date: Thu, 27 May 2021 11:57:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <874keoijzh.fsf@ungleich.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 27. 05. 21 11:50, Nico Schottelius wrote:
> 
> Hello,
> 
> it seems that the internal microphone does not work anymore with
> 5.12.6/5.12.7. I am somewhat sure it used to work within the 5.11.x
> series and that sound did not work at all on 5.10.
> 
> I have uploaded the hardware information on
> 
> http://alsa-project.org/db/?f=f1a2b32db122695b2cf736db27cb6ed2fa8a9042
> 
> The microphone of a plugged in headset however *does* work.
> 
> Is this a known bug/regression and is there anything I can do to debug
> it?

Could you check, if the Intel SOF driver is enabled in your kernel?

CONFIG_SND_SOC_SOF_TIGERLAKE

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

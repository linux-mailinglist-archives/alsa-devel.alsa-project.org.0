Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E384559B27
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AABAF185A;
	Fri, 24 Jun 2022 16:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AABAF185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656079939;
	bh=mnEYEHDD5TaNcI+N7dlWyd+t1JqjzS42DWSkdMEki7Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qHQAa1UYnsKCrcP2W5dEt7A5f/+I5B6mwqTzczpGUE/2bcfbbLFIoNQGNZzFVResA
	 rP7e2UFL5K/+ZxNfUIVrmAwTTD7Fq8HHZeGrn4pWOgbwogEZMbAK9mrOtPwMAv0SsO
	 zXRUPuIaZx/jtSQrPqWpKZO6PB3XCPKuaWyKXb30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00812F80109;
	Fri, 24 Jun 2022 16:11:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD2B1F80139; Fri, 24 Jun 2022 16:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EDC3F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EDC3F80107
Received: from [217.155.36.16] (port=41166 helo=[192.168.1.22])
 by mailhub-hex-d.mythic-beasts.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <john-linux@pelago.org.uk>)
 id 1o4k1g-009ZSl-NS; Fri, 24 Jun 2022 15:11:12 +0100
Message-ID: <bd2dfa08-3eca-0b0b-4120-074169cef922@pelago.org.uk>
Date: Fri, 24 Jun 2022 15:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Quirks for MacroSilicon MS2100/MS2106
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
 <878rpnncov.wl-tiwai@suse.de>
From: John Veness <john-linux@pelago.org.uk>
In-Reply-To: <878rpnncov.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
Cc: alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>,
 Takashi Iwai <tiwai@suse.com>
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


On 23/06/2022 06:58, Takashi Iwai wrote:
>> Nonetheless, as I say, with the following kernel patch the captured
>> audio certainly sounds right, so is a big improvement and makes these
>> dongles usable:
> 
> So as a first step, we can merge the patch as is.  The rest needs more
> consideration.
> 
> In anyway, for merging the patch, it has to be submitted properly in a
> right format, especially including your Signed-off-by tag.  Please
> refer to Documentation/process/submitting-patches.rst for details.
> 
> thanks,
> 
> Takashi

Thank you, or the others, for the encouraging comments. I have just 
submitted the patch in the proper format... I hope!

John Veness

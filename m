Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA491DE141
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 09:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 347121873;
	Fri, 22 May 2020 09:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 347121873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590133760;
	bh=bYTPZpDl47Ag+NsXO+PL1xXJoo+FAzTbcXsOPorA/bY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHjrBWJNkmOP+dFmaCV+FSZNVYi8Oa8v1CsBEzOuBzVq6HVWhc/DLFAftynT7bl9I
	 x+1OzIgv9nlgjvG6ooIet6KKH7SWQP21WaKVh6Z1a+GCeKR+Z1n1xUBSAxEGq7vuJy
	 KNG8JLh0cfJ/FyaqMDelJ/XOazEPr3YMtuq6+MNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32DE1F80140;
	Fri, 22 May 2020 09:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E17CF801F9; Fri, 22 May 2020 09:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9CD1F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 09:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9CD1F80140
Received: from [123.114.63.221] (helo=[192.168.2.109])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jc2Ov-0001mo-8a; Fri, 22 May 2020 07:47:29 +0000
Subject: Re: [PATCH for-5.8] ASoC: amd: doesn't print error log if the return
 value is EPROBE_DEFER
To: Mark Brown <broonie@kernel.org>
References: <20200521144434.14442-1-hui.wang@canonical.com>
 <20200521154356.GD4770@sirena.org.uk>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <9062728e-cd0b-ec1c-e001-f191f3a351bc@canonical.com>
Date: Fri, 22 May 2020 15:47:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521154356.GD4770@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
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


On 2020/5/21 下午11:43, Mark Brown wrote:
> On Thu, May 21, 2020 at 10:44:34PM +0800, Hui Wang wrote:
>> The machine driver module and codec driver module don't have
>> dependency, it is possible that the machine driver is loaded ahead of
>> the codec driver, then the register_card() will fail and return
>> EPROBE_DEFER, in this case the driver should not print error log since
>> this is not a real failure.
> This isn't helpful to people who are trying to figure out why the driver
> isn't loading - if we silently fail then the user will struggle to
> determine what the problem that causes their driver to fail to bind is.

Yes, you are right. If the codec module is not loaded, the machine 
driver will fail silently.

There are many modules in the kernel, no other modules print the -517 
error or warning, so if this driver prints it, it really confuses users 
(according to my test, the audio works but the kernel prints this error 
with 100% chance, and within ubuntu, the error message is read color, it 
is very easily caught by users).

How about we put off the registering the machine device, this can 
guarantee everything is ready when machine driver's probe is called. I 
will send a V2 according to this idea.

Thanks,

Hui.


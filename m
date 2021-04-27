Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75C36C732
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 15:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD9316E5;
	Tue, 27 Apr 2021 15:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD9316E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619531123;
	bh=daGL0gBvqp960aN2/U34XLo/KiIz1BCJ7JEwwI1jCcM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D0H4SwNE01M0QkIs3btEuTiRjNfizNDruftqhP8EIjHLROM20cPbsNv34L5nCOxh2
	 GspY4gNuYVcAisdEUc6xqgq4u1RQt+1Tj6rDfTzQNNIFMuXZdwYqACQz/zJZQud2QS
	 3wv35v/pG+OGL99nNkKnon25n9dgXuoozFPiNXT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EBFF801EC;
	Tue, 27 Apr 2021 15:43:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA2EF801D8; Tue, 27 Apr 2021 15:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 353D1F800C0
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 15:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 353D1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="kjI5xZWw"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2DA2322235;
 Tue, 27 Apr 2021 15:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619531024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ze37HUrwcuaMM/+Jzy68z8algoMq0xuZK6yTkRT4q8M=;
 b=kjI5xZWwFd2IVvSaXVY2fvDhN/Wtg11m4WXlgu9YGwKstX3v4SodNqo5eFvRQ0qJmXdEX/
 JSwoVVTOnEgtzjHklTev48pVZP3/CoQ8Vh2byAOApYJL12U8+F37vqnxIoJvNVbebzloCI
 WROTvUuE83KYkhVODGdu5F8SZLvIaAQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Apr 2021 15:43:42 +0200
From: Michael Walle <michael@walle.cc>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: broonie-sound/for-next bisection:
 baseline.bootrr.asoc-simple-card-probed on kontron-sl28-var3-ads2
In-Reply-To: <ea2b6dae-3087-67d3-8473-410255a51e23@collabora.com>
References: <6080e82c.1c69fb81.cd60c.2a13@mx.google.com>
 <3ca62063-41b4-c25b-a7bc-8a8160e7b684@collabora.com>
 <877dkp5141.wl-kuninori.morimoto.gx@renesas.com>
 <20210426144242.GF4590@sirena.org.uk>
 <8735vc4r59.wl-kuninori.morimoto.gx@renesas.com>
 <20210427101926.GA4605@sirena.org.uk>
 <ea2b6dae-3087-67d3-8473-410255a51e23@collabora.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e20b9c8a2715b5d091a8d1f37ba890b4@walle.cc>
X-Sender: michael@walle.cc
Cc: Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, kernelci-results@groups.io,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Heiko Thiery <heiko.thiery@gmail.com>, Thierry Reding <treding@nvidia.com>
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

Hi,

Am 2021-04-27 14:51, schrieb Guillaume Tucker:
> +Heiko +Michael
> 
> On 27/04/2021 11:19, Mark Brown wrote:
>> On Tue, Apr 27, 2021 at 07:28:34AM +0900, Kuninori Morimoto wrote:
>> 
>>>>> If so, all sai1 - sai6 are using "fsl,vf610-sai",
>>>>> all saiX doesn't have .name. I think it should have different name.
>>>>> In your case, at least, sai5 / sai6 needs to have
>> 
>>>> You could send a patch along with re-adding the three patches I 
>>>> dropped?
>> 
>>> Thanks, I can do it.
>>> But I want to confirm above first.
>>> Let's keep Guillaume's happiness :)
>> 
>> This board is in the Kontron lab - KernelCI is just reporting results
>> from it, we'd need to connect with someone from Kontron for system
>> specific questions.  Guillaume, I don't know what e-mail they wanted 
>> to
>> be used here?
> 
> 
> We can have KernelCI tests re-run with extra kernel patches in
> any lab, but yes for discussing actual changes related to the
> platform it's best to ask Kontron folks directly.
> 
> Heiko, Michael, is this something you can please help with?

Sure, just put me on CC and I can test the patches manually.

-michael

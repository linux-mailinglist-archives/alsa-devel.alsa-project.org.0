Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5262D4441
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 15:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE1E16BE;
	Wed,  9 Dec 2020 15:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE1E16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607524052;
	bh=tWZfwuHpYnAzdWIvVyQMm6pm27Sb6JmeEuYNRE4b0r4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=quHnjLIMwWIkHQHOaf/wMlaKVBcQJ7at9L1HblXZIrvZGpfvUB5BInBHkx7MbyHoy
	 ntlMQLiEHjP3IDdtjwTvV2bCZYc/y16bzcQROXG73JcgFColZ57fLIToIfZYTN5krP
	 QIUzEzLPygoS+JV9M0AHYUN1Je6wASyzvkFpthUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF57F8012C;
	Wed,  9 Dec 2020 15:25:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD81F8020D; Wed,  9 Dec 2020 15:25:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1440F801D8
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 15:25:46 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 55416A003F;
 Wed,  9 Dec 2020 15:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 55416A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607523945; bh=kZltQRPibv+9K1DdZsEKYdbPhvdjwqUtT/9m5dO92AU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jAE0axALkzjVT14hoOPIghTn7kJ/ejKrqPTB9Gr2T3f5FP/PG3kMN3s8/vyl0A9Ur
 cssGM6dPAw/Mbt3+IYNQ7marXW5o4dqY8Y65G1UiJPzTzTkoweNXVelOMyhdRT86aY
 nBaxR4bAGmBQqjjASkURXUhjYAOz64caKOnJG5uY=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  9 Dec 2020 15:25:42 +0100 (CET)
Subject: Re: [RFC][PATCH 0/2] design a way to change audio Jack state by
 software
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20201209124344.219158-1-hui.wang@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <575811fc-cb64-c7d4-bf6b-5044949a326c@perex.cz>
Date: Wed, 9 Dec 2020 15:25:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201209124344.219158-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 09. 12. 20 v 13:43 Hui Wang napsal(a):
> After we change sth in the userspace audio stack like alsa-ucm or
> pulseaudio, we want to perform remote audio auto test to verify if the
> change introduce the regression or not, some of the tests are about
> the defaut_sink/default_source or active_port switching, this needs
> the audio jack state to be changed to trigger the userspace's audio
> device switching.
> 
> So far, there is no software ways to change the audio jack state, this
> block the auto test.

I'm not convinced to pollute the kernel space with this code. You can use
LD_PRELOAD and simulate this via a shared library or the alsa-lib may be extended.

Also, the first patch can be omitted if you just create another
snd_jack_report() function for the user API and put the common code to the
static function in jack.c.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

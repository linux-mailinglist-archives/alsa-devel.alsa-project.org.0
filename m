Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3741113DBA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:23:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8D11672;
	Thu,  5 Dec 2019 10:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8D11672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537806;
	bh=HBljXcy4P2uyYiGql/m/Xi9g4xo8ib8xIH5LanEvTeY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9rhN3kTp8Aas8EXiXdVQ7nSx25iEbKPiynZ+zorxRcn7KeAJ9LMBve1rLTk1nkeq
	 I6xfZAIAOcAdmQNUWBzjwH7alD/5638AFABWZG7urQX2B/AGQuRUNN73ir8Hw2GYEY
	 NC0Pbo9W3IB01DttPVQzlr9Yz9p0vqCVCNYdSg5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A05A1F80253;
	Thu,  5 Dec 2019 10:21:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C39EF80249; Thu,  5 Dec 2019 10:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 34907F80240
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34907F80240
Received: from [10.10.222.226] (unknown [194.162.236.226])
 by mail.bugwerft.de (Postfix) with ESMTPSA id E5E362E4FA3;
 Thu,  5 Dec 2019 09:15:10 +0000 (UTC)
To: Takashi Iwai <tiwai@suse.de>
References: <20191205081428.611572-1-daniel@zonque.org>
 <s5h4kyfdvr7.wl-tiwai@suse.de>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <e3ecf1c3-e45b-79ed-4e0f-32be757bbcc5@zonque.org>
Date: Thu, 5 Dec 2019 10:21:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <s5h4kyfdvr7.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] ALSA: core: add
	snd_pcm_format_by_name()
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

On 12/5/19 9:25 AM, Takashi Iwai wrote:
>> +snd_pcm_format_t snd_pcm_format_by_name(const char *name)
>> +{
> 
> Could you give the proper document in kernel-doc style?
> We try to provide some documentation at least for public API
> functions.
> 
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(snd_pcm_format_names); i++)
>> +		if (strcasecmp(name, snd_pcm_format_names[i]) == 0)
>> +			return i;
>> +
>> +	return -ENOENT;
> 
> snd_pcm_format_t is with __bitwise, hence this would lead to some
> warning for sparse, I guess.

Ah, right. Thanks for the review!

v2 coming up.


Thanks,
Daniel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

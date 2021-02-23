Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90462323169
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 20:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A981678;
	Tue, 23 Feb 2021 20:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A981678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614108358;
	bh=3oMqTaruJrUd6/AkAOlo1zFS2cKjUTbrE5XrJOxtreA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2X9y3Jq/4fcOZ73y2eTdRcZw3VjgZAqre3ObmY7+t2pAMmYM1YSeI38tWPkLj1h/
	 SZtoSCOqLA3o1PBjxqOUBRFXA8eQv9/mRxVLnoQbfBwuOo2GBxWxhIEsv7Sn3fBLwo
	 8wTsJ9SRLXCjIT383CE4/yLPaUzAiIXjNRikvQQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CCF0F8016D;
	Tue, 23 Feb 2021 20:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A6EF8016A; Tue, 23 Feb 2021 20:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6D8DF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 20:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D8DF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NoPZXNuf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CB4464E60;
 Tue, 23 Feb 2021 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614108255;
 bh=3oMqTaruJrUd6/AkAOlo1zFS2cKjUTbrE5XrJOxtreA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NoPZXNufX7P1IJOj1zLBB6fPnlcdZdirD2ZdFKO06gj3OJ1XBlfI6xbcoUdIp6m+f
 k3Kay/wVI6gbE0d75SY723I78ChajDSzRfedhhHswJh7RGoD2qKleNEJB6Y4k25ySI
 WhoPyHpH+8BrvkTm/5kH1K9iJXbz40AnzaoVm7fVlEkkvTb1HneXRw2B5h7UxLzQKF
 f7bWGC53SZKINMidIfZd92+rZy7mtyhxZdE4MsHqLbwOQpQU8vBt7o61IkSM3LlE0d
 C2BmQ50oUjp196M5txI3JWjYEOxgWoPb3k7nXiKc60mXBCJmNvyqBzzdviV4AJLmGX
 nSXVLua6vY+2Q==
Subject: Re: [PATCH v2 6/6] ASoC: samsung: tm2_wm5510: remove shadowed variable
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <CGME20210222213327eucas1p270af686a642a4cd31852635eed870c0c@eucas1p2.samsung.com>
 <20210222213306.22654-7-pierre-louis.bossart@linux.intel.com>
 <2625c1b1-1e05-9d04-e414-252674688eee@samsung.com>
 <31e6f8a8-8346-0cd7-9f35-035f097b9cb5@linux.intel.com>
 <CAJKOXPe2xjRd=zdCVkCLtY4cG2675Bh=-tqvnUNB3RocO5OSUw@mail.gmail.com>
From: Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <bb9027c9-d4a4-4804-65e4-ee4932b404fc@kernel.org>
Date: Tue, 23 Feb 2021 20:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPe2xjRd=zdCVkCLtY4cG2675Bh=-tqvnUNB3RocO5OSUw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On 23.02.2021 19:29, Krzysztof Kozlowski wrote:
> On Tue, 23 Feb 2021 at 19:20, Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> On 2/23/21 5:25 AM, Sylwester Nawrocki wrote:
>>> On 22.02.2021 22:33, Pierre-Louis Bossart wrote:
>>>> Move the top-level variable to the lower scope where it's needed.
>>>
>>> Actually I like your original patch better as there is really no need
>>> for multiple lower scope declarations in that fairly small function.
>>
>> I have no opinion, just let me know what the consensus is.
> 
> I proposed to have both variables local scope, to reduce the size of
> function-scope variables. Their number tends to grow in probe() a lot,
> so when a variable can be localized more, it makes the code easier to
> understand. No need to figure out who/where/when uses the variable.
> Local scope makes it much easier.

I don't have strong opinion, let's keep it local then as in current patch.


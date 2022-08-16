Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE83595BD3
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 14:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E4D1640;
	Tue, 16 Aug 2022 14:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E4D1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660653419;
	bh=R05V47m7aCmsUtL7hJbnstEfckujRWwV10S2j0yWqn8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aRsKMetmpojVrhfUu7BbzAnZQ7VlDQRtvPRByrhSwZjTif/CpYRk3EUkZmIdD48FY
	 Jr49rnMZpoz3jg4KWC2LLt42mvfGwW2puYoOlNdQTxNNsmQsBIkfmhwJsXlLE0vYK6
	 /1R3QXGI7xNbs9+/shBmDOhlMwFVlgw7mKvNstWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05097F80082;
	Tue, 16 Aug 2022 14:36:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E651DF8032D; Tue, 16 Aug 2022 14:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E2DFF80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 14:35:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6A9E7A003F;
 Tue, 16 Aug 2022 14:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6A9E7A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1660653351; bh=YAwwQYNX0fH2seFIOAI3S7AIx7FYqJt6Mz/DXEwoIoA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hi/KdaW29RaOFTpNyVYsINpUMQq7ZEledEc5ggbgrqGnbPaaPXp8w6POuB1dXVCoA
 0nGMhc0utXHhX23kW76nQQelLMwr/t+7TYylxVEPpvky9CDm/RYrzGPCmrScd9ti2n
 7tu7qXXT4qqIt0gVfc+Ydrt8aaWaForH3EVRZ018=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 16 Aug 2022 14:35:42 +0200 (CEST)
Message-ID: <c85a4a76-c7e6-10d9-eec7-2e9fd04f60a7@perex.cz>
Date: Tue, 16 Aug 2022 14:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/6] ALSA: hda: Unify codec construction
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
 <e8e9eb65-3095-ac5a-ce96-55eaa34ef895@intel.com>
 <87tu6cy0dm.wl-tiwai@suse.de>
 <78315088-9aa5-2134-fc0f-12bee612e600@intel.com>
 <Yvtx4q9Nwryf6mRZ@sirena.org.uk> <87r11gxysr.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87r11gxysr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

On 16. 08. 22 12:33, Takashi Iwai wrote:
> On Tue, 16 Aug 2022 12:30:58 +0200,
> Mark Brown wrote:
>>
>> On Tue, Aug 16, 2022 at 12:08:12PM +0200, Cezary Rojewski wrote:
>>> On 2022-08-16 11:59 AM, Takashi Iwai wrote:
>>
>>>>> "recover them from the void" or should I resend the entire series as:
>>>>> "[RESEND PATCH v2]" as see how it goes this time?
>>
>>>> I guess the full resubmission would be better.
>>
>> Note that if you do whatever upset the server again it'll happen again.
> 
> If this happens, we need to investigate.  alsa-devel ML is maintained
> outside vger by Jaroslav personally.  Let's see...

It seems that it was a temporary issue with the DNS resolver. The resend is fine.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

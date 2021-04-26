Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5601136B517
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 16:40:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBAC01687;
	Mon, 26 Apr 2021 16:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBAC01687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619448026;
	bh=OOMklKZxWWtUuwqs0ewTzMFFQy5IsC5NU3OtTmSoU3o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5v1ARGIc/WZRTNeUprXGqC5ucJY7YYfPamcFir29ryyt52RROl3GiOkPgV9qM6LG
	 cH/5dZ4ftzoUxjhPkyNOhkiKBZ9Lo1XdEXQAYxUEEojNmhwWw/NK1L87trOSJ3i4sG
	 5/W2RLmxTMdnAqEDRNKFojekKMVol7c1lJjYL+A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 377ECF80171;
	Mon, 26 Apr 2021 16:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DFE3F8016C; Mon, 26 Apr 2021 16:38:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E1DEF8012A
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 16:38:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4AFD9A0040;
 Mon, 26 Apr 2021 16:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4AFD9A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1619447927; bh=6XnVk6uucelw2ilTlLHMXVhROA8TS7AQk5AvvyBmftc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gUvHkg/fJ+SwnkMUGiKgRcGrnu4U+4zEClSjWG12Pnr11QJyoYrjrsW+er01XwtWu
 fz/3d2Em5SXNQWyw3dgTLQktu0rbY8BNbiGCDoOtcp2UfHlENf6bIikAshuKOq8Gmi
 efyXknkBXi+JOSeotQadSw/YGYEjOdW02TeMeGvE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 26 Apr 2021 16:38:42 +0200 (CEST)
Subject: Re: [PATCH] sound/isa/sb/emu8000: Fix a use after free in
 snd_emu8000_create_mixer
To: Takashi Iwai <tiwai@suse.de>, Lv Yunlong <lyl2019@mail.ustc.edu.cn>
References: <20210426131129.4796-1-lyl2019@mail.ustc.edu.cn>
 <s5ha6pl2kh8.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <af5a6764-76ee-3184-2622-a756c23fbc98@perex.cz>
Date: Mon, 26 Apr 2021 16:38:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <s5ha6pl2kh8.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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

Dne 26. 04. 21 v 16:23 Takashi Iwai napsal(a):
> On Mon, 26 Apr 2021 15:11:29 +0200,
> Lv Yunlong wrote:
>>
>> Our code analyzer reported a uaf.
>>
>> In snd_emu8000_create_mixer, the callee snd_ctl_add(..,emu->controls[i])
>> calls snd_ctl_add_replace(.., kcontrol,..). Inside snd_ctl_add_replace(),
>> if error happens, kcontrol will be freed by snd_ctl_free_one(kcontrol).
>> Then emu->controls[i] points to a freed memory, and the execution comes
>> to __error branch of snd_emu8000_create_mixer. The freed emu->controls[i]
>> is used in snd_ctl_remove(card, emu->controls[i]).
>>
>> My patch set emu->controls[i] to NULL if snd_ctl_add() failed to avoid
>> the uaf.
>>
>> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> 
> Thanks, applied now.
> 
> The bug was hard to be seen due to the coding style, so we'd need a
> cleanup, but it's a different story...

Yes, it would be better to assign the return value from snd_ctl_new1 to a
local variable and set emu->controls[i] only when everything succeeds.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E3199742
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 15:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330A7166D;
	Tue, 31 Mar 2020 15:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330A7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585660829;
	bh=0/pzuXErb+0KkvBO+E2ZTaoF5Zls9Ls0iUiUcCffoMI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sQusE0baGMoTIaibiveUcJJjzvavLVjeJ+QfbwXDdGKaAoAv3s75Eyf9oY6RYNEa8
	 BRL9bGvScN9Bmv92LX5oraef/PNwJ9p8U3FyX8SUte61H4GvUSJEiEM1b897i2gaqn
	 x4zAS6GNykNR/9G+PbDtcDLPaY1vV+x7Ce9kZ9RY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6ADEF8014F;
	Tue, 31 Mar 2020 15:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 874B6F80146; Tue, 31 Mar 2020 15:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 395A7F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 15:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 395A7F800AA
Received: from [222.130.137.59] (helo=[192.168.2.112])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jJGmp-0002G4-HN; Tue, 31 Mar 2020 13:18:36 +0000
Subject: Re: [PATCH] ALSA: hda/realtek - a fake key event is triggered by
 running shutup
To: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.de, stable@vger.kernel.org
References: <20200329080642.20287-1-hui.wang@canonical.com>
 <20200331131130.0A72620757@mail.kernel.org>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <67aedfb4-a7c0-7127-b468-99e302863053@canonical.com>
Date: Tue, 31 Mar 2020 21:18:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331131130.0A72620757@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Kailang Yang <kailang@realtek.com>
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


On 2020/3/31 下午9:11, Sasha Levin wrote:
> Hi
>
> [This is an automated email]
>
> This commit has been processed because it contains a "Fixes:" tag
> fixing commit: 78def224f59c ("ALSA: hda/realtek - Add Headset Mic supported").
>
> The bot has tested the following trees: v5.5.13, v5.4.28, v4.19.113.
>
> v5.5.13: Build OK!
> v5.4.28: Build OK!
> v4.19.113: Failed to apply! Possible dependencies:
>      10f5b1b85ed1 ("ALSA: hda/realtek - Fixed Headset Mic JD not stable")
>      2b3b6497c38d ("ALSA: hda/realtek - Add more codec supported Headset Button")
>      8983eb602af5 ("ALSA: hda/realtek - Move to ACT_INIT state")
>      c8a9afa632f0 ("ALSA: hda/realtek: merge alc_fixup_headset_jack to alc295_fixup_chromebook")
>      d3ba58bb8959 ("ALSA: hda/realtek - Support low power consumption for ALC295")
>      e854747d7593 ("ALSA: hda/realtek - Enable headset button support for new codec")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?

Please apply this patch to v5.5.13 and v5.4.28. Drop this patch from 
v4.19.113.

thanks.

Hui.

>

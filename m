Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB26CB098
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 23:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD9520B;
	Mon, 27 Mar 2023 23:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD9520B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679952188;
	bh=xdxFVQ23VXsicKqsyoUsdwDbDN0xUQmbpZ/k555xexs=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LYujZdIdyB9U8w4a1hn9t9AqdeGhfX8Zoj7KqDDTA5+kBDpkhAvmaaKKnvDdSv1Nk
	 FOevtKA75UJO3+//zAfNERp/b7E3mkym/fZhaHHl8ScUO4pbOSpG6y3ZrCIg1Mr3Dv
	 H4annPEialSN+B01+2kNwsYlw3WgPyygHgoaosZU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9432BF8024E;
	Mon, 27 Mar 2023 23:22:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC615F80272; Mon, 27 Mar 2023 23:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A43EEF80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 23:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43EEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=IneOlJqP
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 3A32016C004C;
	Tue, 28 Mar 2023 00:22:05 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRwPyVH3Lsy0; Tue, 28 Mar 2023 00:22:04 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1679952124; bh=xdxFVQ23VXsicKqsyoUsdwDbDN0xUQmbpZ/k555xexs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IneOlJqPs2/eKISDZnyh0/gPXQGrU2LAlNtcU5e/iTffI90ZeQKbxOlklphIh+6F2
	 73oQVoMea4cnfsksBQml7Qoo6GNp6UonEu/aylbTbek1O62y8ggcOi3UuXgueunI5h
	 tX/V4F6GAPAf/v5gSMee5vPHfy/m5UxUZfx0y9KY=
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
In-Reply-To: <ZBty1CdPaWm0IcRi@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
 <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
 <87lejpwxzf.fsf@mutex.one> <ZBr9rJn50ovG1w9W@sirena.org.uk>
 <87ttycjyw3.fsf@mutex.one> <ZBty1CdPaWm0IcRi@sirena.org.uk>
Date: Tue, 28 Mar 2023 00:20:55 +0300
Message-ID: <87r0t9uc08.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: KL3AQFCOL5RTJ5ZQY474FHJ7BT4H5IA5
X-Message-ID-Hash: KL3AQFCOL5RTJ5ZQY474FHJ7BT4H5IA5
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>,
 yangxiaohua <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KL3AQFCOL5RTJ5ZQY474FHJ7BT4H5IA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mark Brown <broonie@kernel.org> writes:

>> >> This is needed because if suspending the laptop with the headphones
>> >> inserted, when resuming, the sound is not working anymore. Sound stops
>> >> working on speakers and headphones. Reinsertion and removals of the
>> >> headphone doesn't solve the problem.
>
>> >> This seems to be caused by the fact
>> >> that the GPIO IRQ stops working in es8316_irq() after resume.
>
>> > That's a bug that should be fixed.
>
>> Agreed, but I don't know how easy it is to fix, and I would like to
>> first offer users of these laptops a working sound driver.
>> Afterwards this issue can be analyzed and properly fixed.
>
> Surely if nothing else a good first step would be to have the
> CODEC driver do whatever disabling the jack does on suspend
> without needing the machine driver to bodge things?

I would go for properly analyzing what is going on and try to correctly fix it,
but it's going to take some time for me to do it. During this time
people with these laptops will not have working sound. Wouldn't it make
more sense to first deliver a working solution(even though it's not
perfect) than to make them wait? Also this workaround is already present
in the kernel, so it's not that critical that another driver uses it.

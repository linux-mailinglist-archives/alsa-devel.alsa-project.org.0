Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8756F6CF5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4C41922;
	Thu,  4 May 2023 15:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4C41922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683207115;
	bh=xi0KZeBOnhErsJ04hzAQbP1VsC5piCJgrO5ZBm7URwI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kYfr5VsIM7bVQDecQfk4VnaRKUlCyocShprI1QExVD1NMLWhIAds421TU7p3S0Juu
	 YxAbdkHv64+ncjnyaPO1yYknYfMRln2YO9DAaDtd3lSaDeIO30XySYkGZ27fwPv00N
	 /wPGMamxmBQgSdnH0b7RI0s1EsX8JEJoWGfz8V6g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 187F2F80114;
	Thu,  4 May 2023 15:31:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C80F8052D; Thu,  4 May 2023 15:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C1C0F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1C0F80114
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AF4C323FB4;
	Thu,  4 May 2023 09:30:57 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puZ2v-HK2-00; Thu, 04 May 2023 15:30:57 +0200
Date: Thu, 4 May 2023 15:30:57 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Message-ID: <ZFOzkYDs7w+0P36E@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <266661e5-ac86-1590-55d9-5f14e6486557@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <266661e5-ac86-1590-55d9-5f14e6486557@perex.cz>
Message-ID-Hash: 5H37CUZOGH2IAWUWVOR2U7KQJEV22QTJ
X-Message-ID-Hash: 5H37CUZOGH2IAWUWVOR2U7KQJEV22QTJ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5H37CUZOGH2IAWUWVOR2U7KQJEV22QTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 03:08:14PM +0200, Jaroslav Kysela wrote:
>On 04. 05. 23 15:00, Oswald Buddenhagen wrote:
>> So we logically revert some bits from commit 9f656705c5faa ("ALSA: 
>> pcm:
>> rewrite snd_pcm_playback_silence()"), but we retain the bug fixes and
>> try to make the code paths congruent.
>
>It would be better to revert the broken patch and make changes on top of the 
>original code. This is really difficult to review.
>
the diff to the old code is just as big, which is a somewhat inevitable 
effect of it being the middle way between both.

the best way to review it is with `git show -b`.

regards

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D306F5B6A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 17:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF36612E9;
	Wed,  3 May 2023 17:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF36612E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683128463;
	bh=mx4NSQSFZxZH7LNLupsmO8efuuFMdxZthTu0nfY532g=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/aOjnYn8MRxPARUsQVHyL480kqdhIvMPtbz45AOIQr7bEh2O3LuuTUdCEtH/+gCc
	 ngkjF05tiMXN/XFxKfXfbf9omQkUdACu3BBsGgISRzm6+1Nn5vMOSBTEO6zdrTbH91
	 XSBD3h+J5NObrk9QI3Jn8qxA3I8oyNhz2Xtghy1s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E1EF80137;
	Wed,  3 May 2023 17:40:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E561EF8032B; Wed,  3 May 2023 17:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07188F800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 17:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07188F800EC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9E95624222;
	Wed,  3 May 2023 11:39:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puEaF-tLD-00; Wed, 03 May 2023 17:39:59 +0200
Date: Wed, 3 May 2023 17:39:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 2/4] pcm: hw: add drain_silence configuration
 keyword
Message-ID: <ZFKATxawYUtOvkd7@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-3-perex@perex.cz>
 <ZFJEers7NBjf5dCu@ugly>
 <433f4a7c-a55b-6aa4-d2a3-100188c86960@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <433f4a7c-a55b-6aa4-d2a3-100188c86960@perex.cz>
Message-ID-Hash: T7Q52RXK3L4RINWIKB5QCVHAGL474SOA
X-Message-ID-Hash: T7Q52RXK3L4RINWIKB5QCVHAGL474SOA
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7Q52RXK3L4RINWIKB5QCVHAGL474SOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 03, 2023 at 04:22:03PM +0200, Jaroslav Kysela wrote:
>On 03. 05. 23 13:24, Oswald Buddenhagen wrote:
>> what i could imagine _hypothetically_ making sense is making the 
>> 1/10th
>> sec "overshoot" configurable, as it's hardware-dependent. but in
>> practice, i don't see how that would be actually useful, as the cost of
>> doing too much is negligible, and the default you chose seems more than
>> safe enough.
>
>The positive value is a bit bonus. I just picked an easy understandable way. 
>But looking to this issue for the second time, I changed the meaning for the 
>positive value to milliseconds. In this way, it's time/rate related.
>
i think it's a bad idea to add "bonus" features that have no clear use 
case. it's basically dead code, and you can't use these values for 
something actually useful later.

>Thanks for the review of all patches - I picked some proposals and 
>pushed changes to the alsa-lib repository:
>
well, and you ignored some of them for no obvious reason.

generally, i don't think maintainers should be exempt from replying to 
comments and posting v2+ patchsets.

regards

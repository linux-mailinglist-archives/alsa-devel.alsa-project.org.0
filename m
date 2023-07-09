Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A591274C41D
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Jul 2023 14:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A5E9206;
	Sun,  9 Jul 2023 14:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A5E9206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688906049;
	bh=5x6xKUeBEcGoluwYqew+DkhtRk6qF3j/K+HJS7ErQIo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z9pcHiYqype77VN1cGDBcGX0+rISh/WYG2NULDcxrU7949WcIKkrbbJf9X8ZOIJo2
	 5LhiJtmDPJyRpRplM/fshrNDBdWDp3F5G8bNHMmxvK2T8BwZjxDcizV3bW3U+kxr+e
	 coB2B2WZPa5+i98IaE4L6Q8kAsRGwxL3fpAOOSpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A43D9F8053B; Sun,  9 Jul 2023 14:33:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EAA1F80236;
	Sun,  9 Jul 2023 14:33:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50332F80249; Sun,  9 Jul 2023 14:32:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD2B7F800E4
	for <alsa-devel@alsa-project.org>; Sun,  9 Jul 2023 14:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2B7F800E4
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B7B672074D;
	Sun,  9 Jul 2023 08:32:03 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qITa7-3h0-00; Sun, 09 Jul 2023 14:32:03 +0200
Date: Sun, 9 Jul 2023 14:32:03 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	tiwai@suse.com, perex@perex.cz
Subject: on (not) breaking user space
Message-ID: <ZKqow+jPg4HGyV6R@ugly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Message-ID-Hash: KYXBBI5H6GL5CDYRUPBOBGKL2JKXKLX3
X-Message-ID-Hash: KYXBBI5H6GL5CDYRUPBOBGKL2JKXKLX3
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYXBBI5H6GL5CDYRUPBOBGKL2JKXKLX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

hi linus,

the alsa maintainers seem to be applying a reading of "we don't break 
user space" that i find counter-productive. so i would appreciate you 
clarifying your position on that matter (once more ...)

to be clear, we're not arguing over changing any abi, but simply 
exercising one somewhat more than before. the claim is that this would 
likely have unacceptable consequences. i disagree.

context:
> Due to hardware constraints, changing the clock multiplier (CM) 
> changes the available audio ports and the number of available 
> channels. [...] Therefore, we do dynamic reconfiguration (DR) of the 
> mixer in response to changing the CM.

arguments:
> DR is somewhat controversial, as it has the potential to crash poorly 
> programmed applications.
> But that in itself isn't a very convincing argument against it, as by 
> that logic we'd have to ban all hot-plugging. (1)
> Such crashes would also not really qualify as regressions, as the 
> D.A.S. mode is a new opt-in feature, and therefore no previously 
> stable setups would be impacted. (2)

the full text is at 
https://lore.kernel.org/all/20230630144542.664190-7-oswald.buddenhagen@gmx.de/

the preceding discussion is at 
https://lore.kernel.org/all/87v8fren1k.wl-tiwai@suse.de/T/#u

regards,
ossi

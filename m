Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DD707CDF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 164C31FE;
	Thu, 18 May 2023 11:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 164C31FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684402202;
	bh=7kad5S8DbQwZW8oqySsplT++egGUiZY6pu8oDgI2kDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jHaXRF719GJ+lzVt6ntYO7hEis6v4MVgp6ySQ1spcUceVu7LOXwrkCArye3hl9ech
	 bxlTdqkxQ+f7AyudbkmLKr5I+iwkhoX3fVXwEQT+Wccla5lsBD9ksejvvMOlrEsfm/
	 UyBw2t/wVQIRK31ySFF1LO2ebwSCmS72FvBCA7JQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 749FCF80272; Thu, 18 May 2023 11:29:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3BDBF8025A;
	Thu, 18 May 2023 11:29:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67121F80272; Thu, 18 May 2023 11:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2623FF80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2623FF80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D1EC1241CA;
	Thu, 18 May 2023 05:29:00 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZwS-VxF-00; Thu, 18 May 2023 11:29:00 +0200
Date: Thu, 18 May 2023 11:29:00 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 9/9] ALSA: emu10k1: fix PCM playback buffer size
 constraints
Message-ID: <ZGXv3O1aCuDTrVz3@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
 <20230518092224.3696958-9-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230518092224.3696958-9-oswald.buddenhagen@gmx.de>
Message-ID-Hash: VBYDBMOZDLU35N3OHIAHJW4PK54KWLIT
X-Message-ID-Hash: VBYDBMOZDLU35N3OHIAHJW4PK54KWLIT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBYDBMOZDLU35N3OHIAHJW4PK54KWLIT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

sorry for the "flood", i forgot to adjust the declaration of the series 
in my tool. you can ignore the other patches; they didn't change from 
what you already applied.

regards

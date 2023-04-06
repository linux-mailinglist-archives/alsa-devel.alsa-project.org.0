Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54C6D9190
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 10:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2B8A83B;
	Thu,  6 Apr 2023 10:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2B8A83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680769816;
	bh=li0BESbwVWnrhA0D5qrvlE4wZbMM9TFXvAWjmLGcA2I=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kuiFrOWknEwzvS4CNQyn3BLc2eKh4OtNSqDOm5nFADo1L+N8AKh77Jt6yIlGYCpSE
	 5IfJGZahRJ0YfJvqA5puXtgtT0yyf2keAosOAg+odhUQSHJ9lP5E0j9mU2pvAGALft
	 GYA/vg4KSkeR6ghwF/esn7y5GL7ItgikYK/KW9Yw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 343FCF8015B;
	Thu,  6 Apr 2023 10:29:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BA79F80246; Thu,  6 Apr 2023 10:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46E67F80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 10:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E67F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 203A724184
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 04:29:11 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkKzW-Kuk-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 10:29:10 +0200
Date: Thu, 6 Apr 2023 10:29:10 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] docs: sound: hda: drop mentions of hda-analyzer
Message-ID: <ZC6C1v5kxYSxTNGW@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201220.2197848-1-oswald.buddenhagen@gmx.de>
 <87v8i9v8h5.wl-tiwai@suse.de>
 <119dd23f-8cb2-3a64-fc16-8429ca029983@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <119dd23f-8cb2-3a64-fc16-8429ca029983@perex.cz>
Message-ID-Hash: YDRB3HSI4UG2PRIXXAFFJ7XPD5TOTRYF
X-Message-ID-Hash: YDRB3HSI4UG2PRIXXAFFJ7XPD5TOTRYF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDRB3HSI4UG2PRIXXAFFJ7XPD5TOTRYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 10:08:58AM +0200, Jaroslav Kysela wrote:
>The gitweb was misconfigured on the ALSA server after upgrade.
>
ah, that explains a lot. i thought it moved to github entirely.
(i'm kinda getting lost in the various wiki pages, which isn't made any 
better by google turning up some heavily outdated ones, even though they 
aren't linked top-down any more. feel like doing some cleanup work?)

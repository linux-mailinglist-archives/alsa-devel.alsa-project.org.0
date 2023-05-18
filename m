Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68810707B7C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6046B204;
	Thu, 18 May 2023 09:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6046B204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684396756;
	bh=axCOCLYCnlKryDT5aq4X4mbqUqH64STqHNMCdz7j6wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NFzAfgFJQfJL3L52B2Qzuz3nFjn/EvQcaVfgfmJRZEeuaVmlYMYAaoyjLJ0WEV24y
	 dTAwR0Y65CVYnTHMHIAtn1DOOx+gWOcjkqu55vitTLTBhLs7RnKZrmitpCKSkNdrmr
	 wiZIVWSFI3E/Q+sZ0I2bCxFnMhAoVo4/ZRhl2r6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4322FF80544; Thu, 18 May 2023 09:58:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B1BF8025A;
	Thu, 18 May 2023 09:58:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A117AF80272; Thu, 18 May 2023 09:57:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C555AF8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C555AF8016D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 925DF2421A;
	Thu, 18 May 2023 03:57:51 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzYWF-T8c-00; Thu, 18 May 2023 09:57:51 +0200
Date: Thu, 18 May 2023 09:57:51 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/9] ALSA: emu10k1: fix PCM playback buffer size
 constraints
Message-ID: <ZGXaf0IKe4xDgLmH@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
 <20230517174256.3657060-6-oswald.buddenhagen@gmx.de>
 <874joa1zab.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <874joa1zab.wl-tiwai@suse.de>
Message-ID-Hash: 6OLTEN5F2TF665PUD7XMLRQR2LIKDXVI
X-Message-ID-Hash: 6OLTEN5F2TF665PUD7XMLRQR2LIKDXVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OLTEN5F2TF665PUD7XMLRQR2LIKDXVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 17, 2023 at 10:25:00PM +0200, Takashi Iwai wrote:
>On Wed, 17 May 2023 19:42:53 +0200,
>Oswald Buddenhagen wrote:
>> 
>> The period_bytes_min parameter made no sense at all, as it didn't
>> correlate with any hardware limitation.
>
>Does the device really work with less than 64 bytes period size?
>I meant not in theory but in practice.
>
somewhat predictably, not.

>Without any value set,
>dumb applications may try to set 4 bytes for period size,
>
the "try to" is key here. it will fail, because the frame-based 
constraint will prevent it from doing so.

alsa's constraint system is really quite impressive, probably the 
technically most interesting part of the whole. :-)

regards


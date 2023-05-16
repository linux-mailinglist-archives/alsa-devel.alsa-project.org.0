Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53F704809
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 10:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C2874C;
	Tue, 16 May 2023 10:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C2874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684226433;
	bh=+ojXbLsKu7Z1jJDl9vKOzG228kGizJ2knQUihDwRXn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lsjUUSDqRCUSsg1ifZujRZJkZiEbjXsDe5Osa6sncB6gwmD7qg9ABkcC+yim99FUs
	 sEDa015+JQ/aSbGLn5fPwrUHsZ8eSVOqac1lkdDbyAt5MLbOgFg0/OuF+cyomeghK4
	 gi1IgMHl8UlRdoH3geOawGPQirUUmC+NwlUkVE3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA37FF8016D; Tue, 16 May 2023 10:39:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F9B7F80087;
	Tue, 16 May 2023 10:39:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A845EF80272; Tue, 16 May 2023 10:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72A9CF80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 10:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A9CF80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B95B523FEE;
	Tue, 16 May 2023 04:39:29 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyqDR-oy3-00; Tue, 16 May 2023 10:39:29 +0200
Date: Tue, 16 May 2023 10:39:29 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/7] ALSA: emu10k1: various improvements to the
 DSP-based mixer code
Message-ID: <ZGNBQUZTLrq0689G@ugly>
Mail-Followup-To: tiwai@suse.de, alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <877ct9pdeb.wl-tiwai@suse.de>
Message-ID-Hash: KSBI7URK6DVJYE4X7HE2GBOR2OOKZIIV
X-Message-ID-Hash: KSBI7URK6DVJYE4X7HE2GBOR2OOKZIIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSBI7URK6DVJYE4X7HE2GBOR2OOKZIIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Applied all seven patches now.  Thanks.
>
the last patch ("enable bit-exact playback, part 2: voice attenuation") 
seems to have got lost.

regards

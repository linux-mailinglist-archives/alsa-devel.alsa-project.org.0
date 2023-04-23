Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346456EBDC2
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Apr 2023 09:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46F2F1A;
	Sun, 23 Apr 2023 09:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46F2F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682236155;
	bh=5MC9i52X1tLXEqtNik1D8hEqIZbiSJMLq6OMwZidTMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e2D7NTk95AupCG5OcNPLQaMNZ+38VzafIwjtVCfyWfV6Pr95XbiQPdQ10QuEyV1YT
	 ol5JxvN/XXVFZC2qsmmT1OlD5Z5aRUwKtsDfPJavh0n+tMbgKRTrRGiiHOqH2/VLrT
	 PWG33nb++k1nmmCFDzf78EpM5h9zxkJkohaA9DlY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F38F8018A;
	Sun, 23 Apr 2023 09:48:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A7D5F80236; Sun, 23 Apr 2023 09:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DE91F800F8
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 09:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE91F800F8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1FC0524212;
	Sun, 23 Apr 2023 03:48:15 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqUSE-AiK-00; Sun, 23 Apr 2023 09:48:14 +0200
Date: Sun, 23 Apr 2023 09:48:14 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/2] ALSA: emu10k1: fix SNDRV_EMU10K1_IOCTL_SINGLE_STEP
Message-ID: <ZETivvAQCIDptxHi@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230422161021.1144004-1-oswald.buddenhagen@gmx.de>
 <871qkboxuo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <871qkboxuo.wl-tiwai@suse.de>
Message-ID-Hash: PJEA627KX2N7K26QX7OBLT2BQD4P7LJB
X-Message-ID-Hash: PJEA627KX2N7K26QX7OBLT2BQD4P7LJB
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJEA627KX2N7K26QX7OBLT2BQD4P7LJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Apr 23, 2023 at 09:34:55AM +0200, Takashi Iwai wrote:
>Although 0-day bot caught some build error, I couldn't reproduce it,
>so took as is.  Let's see whether it's broken at some config combo.
>
undeclared logical dependency on the "fixup DSP defines" patch, i think.

but even without that mistake the bot would croak, because i made my 
tooling describe deps in a human-readable way rather than sha1 + 
patch-ids. i guess i'll have to include both to make it bot-friendly ...

regards

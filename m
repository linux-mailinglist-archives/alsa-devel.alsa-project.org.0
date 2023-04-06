Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4F6D914A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 10:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB32F83D;
	Thu,  6 Apr 2023 10:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB32F83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680768885;
	bh=uHW+9DlLgHWLN3Df13GkaCwp2VGkxTJH0P43U1wb318=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bJp3GhbQ4MmRe90ghQXqBW6/RKOKRLDUCbanlHEvuLd+3ST8mJagQxNFcAPkS4h5s
	 VRRDzHgtcc4RfvFM6P0AQD87lLxBRxaXYa21slccoF7SuP64ABbmu0ScnUGNjSBQme
	 pUTrhmg9p9XKrznuQZ5C70UCpArfX2VytFubORoI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 230ADF80171;
	Thu,  6 Apr 2023 10:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ADE0F80246; Thu,  6 Apr 2023 10:13:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 57FF4F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 10:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FF4F8015B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7F0AA2420B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 04:13:44 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkKka-KSu-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 10:13:44 +0200
Date: Thu, 6 Apr 2023 10:13:44 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 polishing
Message-ID: <ZC5/OHCWkJImeQ2a@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201220.2197863-1-oswald.buddenhagen@gmx.de>
 <87pm8hv6sg.wl-tiwai@suse.de>
 <ZC511SOI1BH6xKpo@ugly>
 <87fs9dv3zd.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87fs9dv3zd.wl-tiwai@suse.de>
Message-ID-Hash: 2RFQOHL2MSFXDDVMUKSGGV3EDYXE5ONL
X-Message-ID-Hash: 2RFQOHL2MSFXDDVMUKSGGV3EDYXE5ONL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RFQOHL2MSFXDDVMUKSGGV3EDYXE5ONL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 09:56:06AM +0200, Takashi Iwai wrote:
>No, the point is that, if an irq handler misses the multiple period
>updates, it has to handle the situation in a single shot, and the
>offset gets corrected to the value within the period size;
>
i know. my point is that if that happens, something must have gone more 
or less terribly wrong already, and we should be thinking about how to 
prevent that, rather than how to "reliably" paper over the problem. but 
i suppose we can give the hardware some slack ... if more than two 
periods are configured.

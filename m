Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD06D9715
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 14:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B23AEA;
	Thu,  6 Apr 2023 14:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B23AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680784536;
	bh=CI6kMUP4hkdr5iSxlk7AUGGQKqNGTYwhCdHhj0Kr6tI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=beOE8sCF4JwIq9pp6sq6aFPNhckj4Qn67Rz9+tJFfEqNs2D61meFAr/WlxsFj6DBd
	 dKvA9qQdJazGkIbx0cwmylZ0hRhKXbIbv36zlKafafOI6gsaZPBYgamaLvN0T3Mm67
	 s4IP3v/dRLSiecHyN5yHBUKEMsY3TDOoY/v/LBIE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2BAF80171;
	Thu,  6 Apr 2023 14:34:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE5D7F80246; Thu,  6 Apr 2023 14:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AC98F8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 14:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC98F8013D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B32D924196
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 08:34:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkOp2-R5Z-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 14:34:36 +0200
Date: Thu, 6 Apr 2023 14:34:36 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: document that struct __snd_pcm_mmap_control64
 is messed up
Message-ID: <ZC68XIBgypE9x/qA@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <87h6ttv4br.wl-tiwai@suse.de>
 <20230406111545.2240797-1-oswald.buddenhagen@gmx.de>
 <87ttxttcqv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttxttcqv.wl-tiwai@suse.de>
Message-ID-Hash: GPWDECIRVASWQ3YRW6DWGAYQZB5AOHRC
X-Message-ID-Hash: GPWDECIRVASWQ3YRW6DWGAYQZB5AOHRC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPWDECIRVASWQ3YRW6DWGAYQZB5AOHRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 02:29:44PM +0200, Takashi Iwai wrote:
>Care to resubmit v2 patch?
>
that *was* a v2 patch - you can git-am the mail with --scissors (at 
least if i got it right). not acceptable?

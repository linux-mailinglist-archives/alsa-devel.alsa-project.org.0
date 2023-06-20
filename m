Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C11736D65
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 15:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6791E83A;
	Tue, 20 Jun 2023 15:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6791E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687267846;
	bh=t0CypdlXxfttsQ8W9NUs83+S7bZKUrmo44naGksTl0c=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HuUbkRoh0HNzGQ9E/y2M0+L7IbXlSBNf6FbEBiI23e35pF/Ge2yYFG+VFWxGhstOF
	 f3xCqij9PTnQna1yNzicZCzbYsaoglOZ0FxxJg69kH+LirgjSypwr9hbwD97ui0f4C
	 R6k4GLm9n1GkQt1ylRcn++IEjvK2luBevr58xMfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C326AF801F5; Tue, 20 Jun 2023 15:29:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E0AF80132;
	Tue, 20 Jun 2023 15:29:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E5DF80141; Tue, 20 Jun 2023 15:29:50 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id E73B0F80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 15:29:49 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 20 Jun 2023 13:29:49 -0000
Message-ID: <168726778987.22.3291129206408701069@mailman-web.alsa-project.org>
In-Reply-To: <87ilbl5evw.wl-tiwai@suse.de>
References: <87ilbl5evw.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: UCBVEYB7AMHLGQBTOVYOINJ5YBSRX7D5
X-Message-ID-Hash: UCBVEYB7AMHLGQBTOVYOINJ5YBSRX7D5
X-MailFrom: happy.debugging@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCBVEYB7AMHLGQBTOVYOINJ5YBSRX7D5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All kernel 6.2 files build successfully ! P.S. I saw a reference to you on the NAMM  booth. :-) Thank you so much !

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5063477728D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 10:14:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95686950;
	Thu, 10 Aug 2023 10:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95686950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691655263;
	bh=Qa96yBAKUnXyUei71tjPzj0H42t4ARnaDzk4wBlSIxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VB20R+SKc+eDyeWNUCOB+2TuFwfitsaPNigSsxj2+bJvpu9aoiYrUWB4JDRcYi0u3
	 KqbuNCfNFJ7OlmaFb4B7QBs4EJBuY7sEkzcEDssSXf4YUbkNzAoqogStwcVH46m01X
	 0kvXo7su+Gm7ypjHNwOKC4VZinSnTW48F2kcyD0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99BB0F8059F; Thu, 10 Aug 2023 10:12:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 272C9F80549;
	Thu, 10 Aug 2023 10:12:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C46E9F8059F; Thu, 10 Aug 2023 10:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C42DF80549
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 10:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C42DF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Hc1+ibl7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=f2QhrtGO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E92871F749;
	Thu, 10 Aug 2023 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691655152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AVsvZy7gIrq3LIL5HaNPRqsj7q9/IcWES4+Xwj6+1jA=;
	b=Hc1+ibl758eFDVA0h4R6rI/JdeShJaC2TX8mgdF0CO16syI3pbYrUpTCezAlXpkkBumng7
	wJDJ/HJRRSeoJtvf0BbX3z8u5OmixUxLhX3uyB13VG6yPhwYaiJryrINr3A/uIQGIdILil
	Q12ttb/DzMr7EqOHflGT7TX4xb+u3JQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691655152;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AVsvZy7gIrq3LIL5HaNPRqsj7q9/IcWES4+Xwj6+1jA=;
	b=f2QhrtGOLDkdvYiNm1N6+JYwpCFDHwtX5NkS0zu8q1NyYtPcq9XAd9NFKDf5DzEEHwSk/L
	zaBY505JRSA0G9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7839138E2;
	Thu, 10 Aug 2023 08:12:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9rH+K/Cb1GSmXAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 10 Aug 2023 08:12:32 +0000
Date: Thu, 10 Aug 2023 10:12:32 +0200
Message-ID: <87bkffco3z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] Add HP G11 Quirks and update Dell Oasis Quirks
In-Reply-To: <20230809142957.675933-1-sbinding@opensource.cirrus.com>
References: <20230809142957.675933-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: N62TZHA5LHDCHDL57RDIPYL3Z7XPSZCK
X-Message-ID-Hash: N62TZHA5LHDCHDL57RDIPYL3Z7XPSZCK
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N62TZHA5LHDCHDL57RDIPYL3Z7XPSZCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 16:29:55 +0200,
Stefan Binding wrote:
> 
> Add quirks to support HP G11 using CS35l41 HDA, using both SPI and I2C.
> One older HP laptop has an SSID removed.
> In addition, all Dell Oasis laptops using CS35L41 have been switch to
> use SPI, with one SSID removed.
> 
> Changes from v1:
> - Add fixes tags
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add quirks for HP G11 Laptops
>   ALSA: hda/realtek: Switch Dell Oasis models to use SPI

Applied both patches now.  Thanks.


Takashi

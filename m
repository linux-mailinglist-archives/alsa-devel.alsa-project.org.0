Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88B75B148
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 16:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE6711F2;
	Thu, 20 Jul 2023 16:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE6711F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689863560;
	bh=CqO5YWBbw8n1P1faXZyvg5hy+Qco7+T6ja3vCyoQb7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AuH5C1thEaQtMk5Bx7+OoE6tqnYHLIvDX19WtSoV/Xssqgwfz4LXub7WosBlKXzoU
	 DqlZKqvyNcpxsakoo1SbPBELzoPxOEuANR+2BKRX3wHRQJlaSOVgnk1pehm2jeSOIX
	 uIRY9RgEo7Pz05K8ldlXJK8PuWYyptP1diTgdT/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2848F80535; Thu, 20 Jul 2023 16:31:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6155DF8032D;
	Thu, 20 Jul 2023 16:31:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDEDCF8047D; Thu, 20 Jul 2023 16:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 380E8F8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 16:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 380E8F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ymE+5yww;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NT9tS8Vm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A958E2069D;
	Thu, 20 Jul 2023 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689863498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVLUkyWn20vHpC6jEqLeH59z1mg9rTbYpOdnXjKAqk8=;
	b=ymE+5yww3+AmRHeq68rZv1MlkoA37+/7WT9uIKVBz0g4QnVbxOi14KzXDZxIF3b/7stdmC
	zXggOrolIOJbrLNJYeoUbpKVIVHyKhSnVRrNxnt8zRL8MF4njzBskHZ0Mp9DJJWxiOPUqE
	GesfIYVKcXtjy1nQNJdQk6OBmPf11A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689863498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVLUkyWn20vHpC6jEqLeH59z1mg9rTbYpOdnXjKAqk8=;
	b=NT9tS8VmZdn4iPp3JF0B0izeNsTPyF8vl5YzL5Nbwa7elwdoM1PooQp14jEHQbkRijyHaT
	PqsAYHWWRRqNsLDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85E6C138EC;
	Thu, 20 Jul 2023 14:31:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VOfUH0pFuWQMdgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 14:31:38 +0000
Date: Thu, 20 Jul 2023 16:31:37 +0200
Message-ID: <87sf9iirhy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.5-rc1-2
In-Reply-To: <3cda87c3-f502-4034-99a5-394c8e4195cc@sirena.org.uk>
References: <20230720130519.D1DFEC433C7@smtp.kernel.org>
	<87351ik9da.wl-tiwai@suse.de>
	<3cda87c3-f502-4034-99a5-394c8e4195cc@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KC3IUFXX3KXHBROKVSZCBLLRAVUBY4OH
X-Message-ID-Hash: KC3IUFXX3KXHBROKVSZCBLLRAVUBY4OH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KC3IUFXX3KXHBROKVSZCBLLRAVUBY4OH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jul 2023 16:07:06 +0200,
Mark Brown wrote:
> 
> On Thu, Jul 20, 2023 at 03:20:17PM +0200, Takashi Iwai wrote:
> > On Thu, 20 Jul 2023 15:05:08 +0200,
> 
> > The shortlog is confusing as if this contains so many changes,
> > although it's basically only three no-merge commits.
> 
> It got confused since I sent you an earlier pull request that hasn't
> gone to Linus yet - not sure what the best way of handling that is, just
> using your branch as the base blows up badly if I merge Linus' tree to
> get platform fixes.

It's no big problem, but it'd be helpful if you can tell me that for
avoiding a surprise at the next time.


thanks,

Takashi

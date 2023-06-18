Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8327345A3
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Jun 2023 10:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2683832;
	Sun, 18 Jun 2023 10:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2683832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687078625;
	bh=x4v43+g6tDvWkK7EsCbNkr4UX8AdD5gLwP1xFNPzb/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qi6nwrhQjBuH3T4ihPVr/4EIhhqL/ZHFD4k+TmQcRNTal0OiR/BMS8eFtk/e976kx
	 YEcG5fQyYFsPO/rtZQKb7xvim5Amg+uxfCXmAHS4YAzdXQtptnnQkEvOWIjec1zDJp
	 1AkLrv0smfkqSc6P2OEFvY802/EMAOyxLufOJmYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC1BF80529; Sun, 18 Jun 2023 10:56:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D9EF80130;
	Sun, 18 Jun 2023 10:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4B9EF80132; Sun, 18 Jun 2023 10:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8EB6F80093
	for <alsa-devel@alsa-project.org>; Sun, 18 Jun 2023 10:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8EB6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xE8I5v3J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yr16ZY/T
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B37441F38A;
	Sun, 18 Jun 2023 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687078499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FT3mn2qzcNMTkI/P4/aIdcOfQfuLckeSNTYFpfPGk8E=;
	b=xE8I5v3JWCNJ0vYEbboNO1pvIxUBTHvd0QBOquQ14qSBezVOpzZK6tZZ3V8K1fa0us69t0
	PDpNqLe8HyuU6Wh8v3H1WrU70kVi/KCYqju+ZjLksQniNSGwxek7CxyK4vrjoO7ZdBk3Le
	ENhx+pyYniWk0MPEba+cIbatI2N9wOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687078499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FT3mn2qzcNMTkI/P4/aIdcOfQfuLckeSNTYFpfPGk8E=;
	b=yr16ZY/T+wbBseiEXMD10KD4mCMr0JMr5ude9kuZhrhr0lMilEQx5OYRK4ssernp4RzRJA
	23qMufJk0HkSieDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97F7913489;
	Sun, 18 Jun 2023 08:54:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1pQSJGPGjmRgawAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 18 Jun 2023 08:54:59 +0000
Date: Sun, 18 Jun 2023 10:54:59 +0200
Message-ID: <87ilbl5evw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Symbolic Debugger" <happy.debugging@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
In-Reply-To: 
 <168701447604.22.7960672689503331502@mailman-web.alsa-project.org>
References: <168692503857.22.5904642104496232941@mailman-web.alsa-project.org>
	<168701447604.22.7960672689503331502@mailman-web.alsa-project.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RRDEZMZ6GJVZ2Q2JU2IM5XHDIHVHAUB6
X-Message-ID-Hash: RRDEZMZ6GJVZ2Q2JU2IM5XHDIHVHAUB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRDEZMZ6GJVZ2Q2JU2IM5XHDIHVHAUB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 17 Jun 2023 17:07:56 +0200,
Symbolic Debugger wrote:
> 
> An Attempt to replay the changes to 6.2 :
> starting with linux-next (On branch next-20230614) as master
> According to tag 6.4-rc2 the  commit for it is  f81fe2a4874338a1bfc599cae903a6101217b0a5
> # reset the  master to 6.4-rc2:
> $git reset --hard  581fe2a4874338a1bfc599cae903a6101217b0a5
> $git checkout v6.2
> Previous HEAD position was f1fcbaa18b28 Linux 6.4-rc2
> HEAD is now at c9c3395d5e3d Linux 6.2
> $git rebase master
> Successfully rebased and updated detached HEAD.
> $git checkout master
> Switched to branch 'master'
> Your branch is up to date with 'origin/master'.
> $git merge master
> Already up to date.
> Running menuconfig, there are no option for MIDI 2.0 / UMP,  though the Makefile shows 6.4-rc6 and the ump files are in the source tree.

Try the following:

% cd /somewhere/linux-next
% git reset --hard febdfa0e9c8a5d3a3d895245d1c294c26787daef
% git rebase --onto v6.2 v6.4-rc2

The commit febdfa is the topmost commit of MIDI 2.0 stuff.
This will plant the MIDI 2.0 stuff onto 6.2.

Alternatively:

% cd /somewhere/linux-stable
% git fetch /somewhere/linux-next febdfa0e9c8a5d3a3d895245d1c294c26787daef
% git reset --hard FETCH_HEAD
% git rebase --onto origin/linux-6.2.y v6.4-rc2

This will be onto the latest 6.2.y stable, instead.
If v6.4-rc2 tag isn't found, replace it with f1fcbaa18b28.


Takashi

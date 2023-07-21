Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CE75C562
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 13:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0573E7;
	Fri, 21 Jul 2023 13:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0573E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689937464;
	bh=pGN1C9k5witF7QmpTkCIBSuAEYsSja9ip7YMDWfyjIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=krvs8q0Ba/5tiEO1TBtW82+aTrliq9Fha7UQT+aOYsV46z5Tylp01OvLaRBD4aY8e
	 atc305VOzTutupKtwwDIEfexj0jCxUBaE5q9gmu/bGoQe0lPU2BQolx7PWHakpChWB
	 6E6TzWvTotd5nFaicezayARgxCeJOiwuoYjrNfNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04AD4F8053B; Fri, 21 Jul 2023 13:03:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E81F8047D;
	Fri, 21 Jul 2023 13:03:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD8BF80494; Fri, 21 Jul 2023 13:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C245F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 13:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C245F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WjJgJI+X;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QCpKEJiM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31F161F6E6;
	Fri, 21 Jul 2023 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689937405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCuaQhWEsP1NXDGU35TWO8S/HThDPaI8AQ7C9jyi/oQ=;
	b=WjJgJI+XTtLNg6+3uvRmK7wGKGb5H8aWaYaeZ9F+BY6YojSaIT4ltTujIxByoQTHXlELw4
	3fxP7K3Nav56CxYefiPk6QhQ3K31vGxVddyhOA6j8gcZ7L7DWuH/LnsNFEBfNPkHHBTBeR
	MBS94V+/so7DqCopt+K8LsZIKmPlDNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689937405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCuaQhWEsP1NXDGU35TWO8S/HThDPaI8AQ7C9jyi/oQ=;
	b=QCpKEJiMo8DEl/e3FAoRAw6dqYJB22Qy22EDKS/j/vGRMQq1rIL8zr3T23EkbhM8uEDzai
	5fB/NsTwS3WneRAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09F46134B0;
	Fri, 21 Jul 2023 11:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sMB3Af1lumTRIQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 11:03:25 +0000
Date: Fri, 21 Jul 2023 13:03:24 +0200
Message-ID: <87sf9hfrwj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wang Weiyang <wangweiyang2@huawei.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] ALSA: seq: remove redundant unsigned comparison to
 zero
In-Reply-To: <20230721103124.18522-1-wangweiyang2@huawei.com>
References: <20230721103124.18522-1-wangweiyang2@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7E6664SHJIUJUD5JZ5VNHFUNPLTNURP7
X-Message-ID-Hash: 7E6664SHJIUJUD5JZ5VNHFUNPLTNURP7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7E6664SHJIUJUD5JZ5VNHFUNPLTNURP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 12:31:24 +0200,
Wang Weiyang wrote:
> 
> Since struct snd_ump_block_info::first_group is unsigned char, comparison
> to zero is redundant
> 
> Signed-off-by: Wang Weiyang <wangweiyang2@huawei.com>

Thanks, applied with a proper Fix tag now.


Takashi

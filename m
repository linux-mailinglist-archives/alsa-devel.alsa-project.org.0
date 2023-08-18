Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AD78062D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 09:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9379DE5;
	Fri, 18 Aug 2023 09:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9379DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692342872;
	bh=OC1b3obOzmIoxxmacZMlWTgH0ig+ZWvqkTpxtbu1ioU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QaxiKHiIVxunSbBuhwtLsPLHMQSoCysIccGl9S3woieR/JtzOvxt9EHi5yeBDlYOp
	 PUVSXJ19J0FFJXrNtf/WwFea2k4AvYT9jZCN7IE/G7r9ryuzhR5Eoga2PHpj+ARzph
	 khJZ/AZJPlzlotMNiSIpyHEUetyqr3eEAVTrg5fE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A05F3F8055C; Fri, 18 Aug 2023 09:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F072CF80549;
	Fri, 18 Aug 2023 09:12:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C2BF801EB; Fri, 18 Aug 2023 09:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C11AAF800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 09:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C11AAF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=I3qRxu2C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UYuUsaed
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D33AC1F8AC;
	Fri, 18 Aug 2023 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692342640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O2SQY0+azLFMWoS+9wQ0ppfuZyWlF6Z+dxMPmG1qgoU=;
	b=I3qRxu2CBbyZCi0WHNjYvROixv/Gj4FFnxURzGsuOqU3Mmzltz0RiIMvQP37ELTdXTTqQw
	LxH38bXS98cqAxhMFA3we8NuXAj0LlyEW9BAGAlpk6jJANQaY0tQecsR/xRjm08UDa3Z1X
	y5SsChSjpG0Ve0D1s+eDCOks4+35mIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692342640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O2SQY0+azLFMWoS+9wQ0ppfuZyWlF6Z+dxMPmG1qgoU=;
	b=UYuUsaedCiQwYISnYsuQxC/wSnQGKm2/wXfjYMQUG2Xa8r5SsEs1w1hU4/YKMhH9zGRhYj
	PRYuGl2Js6gg3rBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D00D13441;
	Fri, 18 Aug 2023 07:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7uacI3AZ32RsZAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 18 Aug 2023 07:10:40 +0000
Date: Fri, 18 Aug 2023 09:10:40 +0200
Message-ID: <878ra8ltan.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: <alsa-devel@alsa-project.org>,
	<ivan.orlov0322@gmail.com>,
	<schnelle@linux.ibm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH -next v2] ALSA: Make SND_PCMTEST depend on DEBUG_FS
In-Reply-To: <20230817093740.1732738-1-ruanjinjie@huawei.com>
References: <20230817093740.1732738-1-ruanjinjie@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4JDYDABKPSEFC2LOJOTKIDGTU2ZDGOIV
X-Message-ID-Hash: 4JDYDABKPSEFC2LOJOTKIDGTU2ZDGOIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JDYDABKPSEFC2LOJOTKIDGTU2ZDGOIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023 11:37:39 +0200,
Ruan Jinjie wrote:
> 
> Since pcmtest is a test module that manipulates or gets
> notification via debugfs, without DEBUG_FS it can not work fine.
> So make SND_PCMTEST depend on DEBUG_FS.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
> v2:
> - make it depend on DEBUG_FS instead of dropping error check.

Applied now.  Thanks.


Takashi

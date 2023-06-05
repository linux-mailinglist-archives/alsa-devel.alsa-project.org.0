Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA217721F9D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:33:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29C1836;
	Mon,  5 Jun 2023 09:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29C1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685950409;
	bh=t9HMZjxIZcz/H46A6N+x7KkMufC67zqpLBgHfAeTNmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gpw8J7e9RmSyzcF+aADGdXmuw3q9h+2YD0EzXymWoz02HrM+GWNezn/qQjiUmpK3/
	 7LFqtpBCkl2yW/1wsTSXxPM1+jh6u3g4tK6HAfmxBbUCQA+fBndcOiDhk/9n4Dl86s
	 IHu9NbixkxRClLAW+h/pCrEzOGE6eEbH+8geR5kQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE44F80544; Mon,  5 Jun 2023 09:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B322F8016C;
	Mon,  5 Jun 2023 09:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B35F80199; Mon,  5 Jun 2023 09:32:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90796F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90796F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NP1zKJgc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=l1Zf3BbC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6269521B1D;
	Mon,  5 Jun 2023 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685950353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57M37fyxh1YkYLKE2PhzOEP2RTj9ANL0igBPimHfv4s=;
	b=NP1zKJgcuXUczExHCEzN3DRcw4+U2KbBTqxvzHix1xcAolPepTJ6y4RBl8uk/COEewYY6b
	KztnLViAMKvigJx7cDdmLjA6btOcfuqA7dq2KyPgvAU23YJPt8hlMVpEY4HA2i2qKOlSzr
	EpEVOKtLhCiCPtQnamPuJIuaa1ihBCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685950353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57M37fyxh1YkYLKE2PhzOEP2RTj9ANL0igBPimHfv4s=;
	b=l1Zf3BbCJ11om+I8FGwwsBUNNehhADAcGysMErD6fDsQnfj49hH7Upli9ROL7yLFVRY2lN
	UMGTRpEOtsnJj8CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1500F139C7;
	Mon,  5 Jun 2023 07:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eJodBJGPfWRZbgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:32:33 +0000
Date: Mon, 05 Jun 2023 09:32:32 +0200
Message-ID: <87ttvmictr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	tcrawford@system76.com,
	andy.chi@canonical.com,
	tangmeng@uniontech.com,
	luke@ljones.dev,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add a quirk for HP Slim Desktop S01
In-Reply-To: <20230526094704.14597-1-aichao@kylinos.cn>
References: <20230526094704.14597-1-aichao@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: EJFUG4CENT3GYDPWBFHX2YAG23BVXSUH
X-Message-ID-Hash: EJFUG4CENT3GYDPWBFHX2YAG23BVXSUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJFUG4CENT3GYDPWBFHX2YAG23BVXSUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 May 2023 11:47:04 +0200,
Ai Chao wrote:
> 
> Add a quirk for HP Slim Desktop S01 to fixup headset MIC no presence.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thanks, applied now (with Cc-to-stable).


Takashi

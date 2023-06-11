Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09D72B0A4
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 09:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB07827;
	Sun, 11 Jun 2023 09:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB07827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686469561;
	bh=4mpVpURJOdWfZKq4zBwfs+iv/J6PhUSiJ0Jv7xFL9GU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KGq93m8IbB2dAt0xbeH/TkqQtkF9UNK6noeWFDst/0JKmBEwfaF4mf2vrhsoTQu9t
	 7d6C6+4nJyajxIrmKad6Us5QnMoJ9I9MhPr6UtZ7vY5+Wvv9AR+qoA4uDd2+bsvtxx
	 XiVkGx1JkjZ++NGzUhV7buSaN4y6/GQvB9u9TsjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49800F80552; Sun, 11 Jun 2023 09:44:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B43F80544;
	Sun, 11 Jun 2023 09:44:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14FAAF80149; Sun, 11 Jun 2023 09:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BB7BF80093
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 09:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB7BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gsgeAoro;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1CmOQGvU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 569A5219A7;
	Sun, 11 Jun 2023 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686469042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ht1moEiKe2mowb9MlH2b9Vmj+2RLTYGg26q+yAc5nKA=;
	b=gsgeAoroOzvMxCnuB2RcUN38d/55jWbwO0I2LKZSwEHovlrTK9h8Q/lqRE/2wDSvtwk8Yx
	mC2i3jzdmhgWtlbMOe1kfh0VVjlM1SdseuGeWJQpOAug87AFKmycJM0Wrf/3pv9HQtmQtA
	+l+7u71b+wWisHPCaQopmvU3cJ4tfwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686469042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ht1moEiKe2mowb9MlH2b9Vmj+2RLTYGg26q+yAc5nKA=;
	b=1CmOQGvURrvxCP5w1u+fkUh3iRTME3I3bsVmJODFc4qJK2nbB2mx07W00bH6hKHl2pYKnC
	/XWMw+616UTyViCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E80B13466;
	Sun, 11 Jun 2023 07:37:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zKJaCrJ5hWQIPgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 11 Jun 2023 07:37:22 +0000
Date: Sun, 11 Jun 2023 09:37:21 +0200
Message-ID: <87v8fua1qm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
In-Reply-To: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JHCJDBZLUBE7SDKZO5EZLIZLOJIITSSY
X-Message-ID-Hash: JHCJDBZLUBE7SDKZO5EZLIZLOJIITSSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHCJDBZLUBE7SDKZO5EZLIZLOJIITSSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Jun 2023 16:26:37 +0200,
Mark Brown wrote:
> 
> HDA can only support single register read and write operations so does not
> benefit from block writes. This means it gets no benefit from using the
> rbtree register cache over the maple tree register cache so convert it to
> use maple trees instead, it is more modern.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks, applied to for-next branch.


Takashi

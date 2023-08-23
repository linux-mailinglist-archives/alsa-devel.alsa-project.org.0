Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB96785AE8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 16:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA927F1;
	Wed, 23 Aug 2023 16:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA927F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692801501;
	bh=bPDSkEWvrZxj7TuA6wdXLGG+jDDcq/6E/GrJStm7d/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PQE1M1DvWE5ljCFcz4fc3fs6DEJXqjsjlVlNgBuuWif3YpNIeKQBkRlj6QKgfWoq+
	 R+G5U4RqBkfOR/PDL98/30r7EgI9AqEH+TsvON5ePgzCtqesc1zLslkc7ACxFeLa9I
	 q2E7+opq5dWBufHveonEZSPlxmfypcbNUIHdFl8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA2F5F80536; Wed, 23 Aug 2023 16:37:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1A1F800F5;
	Wed, 23 Aug 2023 16:37:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D17FAF80158; Wed, 23 Aug 2023 16:37:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 647A6F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 16:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647A6F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zo4tA3JA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=l5Qvd95M
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C39782089E;
	Wed, 23 Aug 2023 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692801439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YQmfngXtmZejVEeBJjUH8MBFQJSfsmQsxJxZLFJgWw=;
	b=zo4tA3JAAexJz3fT1AyEABYRwYCbQ5KAOb+yc83T55CroziOfpfC02gy1uzagko8UORMai
	VDY2uncVQBC87lg5rACSXPq2wq2iI/uK8iyJfkl+denuIyCfN3/4odX6vy8d7RCKAnYU+Y
	NlBnvppN04Yn0PYX1o8ffh4jecK9OlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692801439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YQmfngXtmZejVEeBJjUH8MBFQJSfsmQsxJxZLFJgWw=;
	b=l5Qvd95Mbt3cxcIVQ6AfKXoApEomKVI3bTLRFUU6k9FLzNmZW2vvPgyKr0v87XTMCMQ/C8
	rMKW2Hs6UcAsvaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD37C1351F;
	Wed, 23 Aug 2023 14:37:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FeGvKZ8Z5mSsEgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 23 Aug 2023 14:37:19 +0000
Date: Wed, 23 Aug 2023 16:37:19 +0200
Message-ID: <878ra1hlk0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Su Hui <suhui@nfschina.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	maciej.szmigiero@oracle.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: ac97: Fix possible NULL dereference in
 snd_ac97_mixer
In-Reply-To: <49247018-20fe-8a04-75f2-dad4524aa3a3@wanadoo.fr>
References: <20230615021732.1972194-1-suhui@nfschina.com>
	<49247018-20fe-8a04-75f2-dad4524aa3a3@wanadoo.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IOVU7DAF5UJCKWA62J5YT3ILI4Q4BII5
X-Message-ID-Hash: IOVU7DAF5UJCKWA62J5YT3ILI4Q4BII5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOVU7DAF5UJCKWA62J5YT3ILI4Q4BII5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 22 Aug 2023 22:07:40 +0200,
Christophe JAILLET wrote:
> 
> Le 15/06/2023 � 04:17, Su Hui a �crit�:
> > smatch error:
> > sound/pci/ac97/ac97_codec.c:2354 snd_ac97_mixer() error:
> > we previously assumed 'rac97' could be null (see line 2072)
> > 
> > remove redundant assignment, return error if rac97 is NULL.
> 
> Hi,
> 
> why is the assigment redundant?

It's misleading, yeah.  Basically all callers are with non-NULL, hence
we took rather make it mandatory.  Maybe it should have been with
WARN_ON() to catch the NULL argument for an out-of-tree stuff. 

> Should an error occur, the 'struct snd_ac97 **' parameter was garanted
> to be set to NULL, now it is left as-is.
> 
> I've checked all callers and apparently this is fine because the
> probes fail if snd_ac97_mixer() returns an error.
> 
> However, some drivers with several mixers seem to rely on the value
> being NULL in case of error.
> 
> See [1] as an example of such code that forces a NULL value on its
> own, to be sure.
> 
> So, wouldn't it be safer to leave a "*rac97 = NULL;" just after the
> added sanity check?

Yes, we need the NULL initialization.
Care to submit an additional fix patch?


thanks,

Takashi

> 
> 
> CJ
> 
> 
> [1]:
> https://elixir.bootlin.com/linux/v6.5-rc7/source/sound/pci/atiixp.c#L1438
> 
> > 
> > Fixes: da3cec35dd3c ("ALSA: Kill snd_assert() in sound/pci/*")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >   sound/pci/ac97/ac97_codec.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
> > index 9afc5906d662..80a65b8ad7b9 100644
> > --- a/sound/pci/ac97/ac97_codec.c
> > +++ b/sound/pci/ac97/ac97_codec.c
> > @@ -2069,8 +2069,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
> >   		.dev_disconnect =	snd_ac97_dev_disconnect,
> >   	};
> >   -	if (rac97)
> > -		*rac97 = NULL;
> > +	if (!rac97)
> > +		return -EINVAL;
> >   	if (snd_BUG_ON(!bus || !template))
> >   		return -EINVAL;
> >   	if (snd_BUG_ON(template->num >= 4))
> 

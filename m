Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610677B87C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C2C84A;
	Mon, 14 Aug 2023 14:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C2C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692015541;
	bh=XaGZxo8yk85+rXZhH1aX48Kf00jFhzk69/WDfdX2Gas=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DA6YHllGWff3umkGzfMl8CTPZiyslTp8A8gCv5pORquwuH74SapoW8L+KreLzed7T
	 qLIa8JpJ8HnOBaA6b72WlN5LuQy9tTBk637GHVsQ6Lobr9yatAgd4nVRv4gNqPapZr
	 /ysYsXP0i5I3LOQhE2txIpH2fCfvRxuhDrXdpY4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83D31F80536; Mon, 14 Aug 2023 14:17:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC0E3F800EE;
	Mon, 14 Aug 2023 14:17:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B62F8025F; Mon, 14 Aug 2023 14:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2281FF80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 14:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2281FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NeU2N5Dm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2hJ5DMoJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A67421992;
	Mon, 14 Aug 2023 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692015463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkFZHWRTGqzX66j8p6Of71WuOMJLmAbWyoeXb4YfaPg=;
	b=NeU2N5Dmj4/v0AqmXUnQGKDgWODHUjvrXN+/ya4QfbC4nwb+UZ6wmis/d+whJjUIYCAWE7
	O7OJ3fZD0q9StP50FDVbrZyS8UcqLxC7bDRFXLBuhPNEgfcMZeqNpe1isFCCMQyaunCUtX
	LmQrvbCHSEvml8ZKrlXCId8uavhE++U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692015463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkFZHWRTGqzX66j8p6Of71WuOMJLmAbWyoeXb4YfaPg=;
	b=2hJ5DMoJjW3jk82oRrE9or7ZJnXBHUWxxlA6x3sPPQooN7MOSmnsVD/abSHafAo24qff3V
	zQCMM+9DxIPPEECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14F2F138EE;
	Mon, 14 Aug 2023 12:17:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9YsbBGcb2mS8OgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 12:17:43 +0000
Date: Mon, 14 Aug 2023 14:17:42 +0200
Message-ID: <87350l3jix.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ismael Luceno <ismael@iodev.co.uk>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 17/25] media: solo6x10: Convert to generic PCM copy ops
In-Reply-To: <ZNoa1jU7O08KwOJ6@pirotess>
References: <20230814115523.15279-1-tiwai@suse.de>
	<20230814115523.15279-18-tiwai@suse.de>
	<ZNoa1jU7O08KwOJ6@pirotess>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SDI4IOIEIQSWUH7FAXN5INLPU2YQPJS5
X-Message-ID-Hash: SDI4IOIEIQSWUH7FAXN5INLPU2YQPJS5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDI4IOIEIQSWUH7FAXN5INLPU2YQPJS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 14:15:18 +0200,
Ismael Luceno wrote:
> 
> On 14/Aug/2023 13:55, Takashi Iwai wrote:
> > This patch converts the solo6x10 driver code to use the new unified
> > PCM copy callback.  It's a straightforward conversion from *_user() to
> > *_iter() variants.  As copy_to_iter() updates the internal offest at
> > each write, we can drop the dst counter update in the loop, too.
> > 
> > Note that copy_from/to_iter() returns the copied bytes, hence the
> > error condition is inverted from copy_from/to_user().
> > 
> > Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
> > Cc: Anton Sviridenko <anton@corp.bluecherry.net>
> > Cc: Andrey Utkin <andrey_utkin@fastmail.com>
> > Cc: Ismael Luceno <ismael@iodev.co.uk>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  drivers/media/pci/solo6x10/solo6x10-g723.c | 38 +++-------------------
> >  1 file changed, 5 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> > index 6cebad665565..aceacb822cab 100644
> > --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> > +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> > @@ -204,9 +204,9 @@ static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *ss)
> >  	return idx * G723_FRAMES_PER_PAGE;
> >  }
> >  
> > -static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
> > -				  unsigned long pos, void __user *dst,
> > -				  unsigned long count)
> > +static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
> > +			     unsigned long pos, struct iov_iter *dst,
> > +			     unsigned long count)
> >  {
> >  	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
> >  	struct solo_dev *solo_dev = solo_pcm->solo_dev;
> > @@ -223,35 +223,8 @@ static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
> >  		if (err)
> >  			return err;
> >  
> > -		if (copy_to_user(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES))
> > +		if (!copy_to_iter(solo_pcm->g723_buf, G723_PERIOD_BYTES, dst))
> >  			return -EFAULT;
> > -		dst += G723_PERIOD_BYTES;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -static int snd_solo_pcm_copy_kernel(struct snd_pcm_substream *ss, int channel,
> > -				    unsigned long pos, void *dst,
> > -				    unsigned long count)
> > -{
> > -	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
> > -	struct solo_dev *solo_dev = solo_pcm->solo_dev;
> > -	int err, i;
> > -
> > -	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
> > -		int page = (pos / G723_FRAMES_PER_PAGE) + i;
> > -
> > -		err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
> > -				     SOLO_G723_EXT_ADDR(solo_dev) +
> > -				     (page * G723_PERIOD_BLOCK) +
> > -				     (ss->number * G723_PERIOD_BYTES),
> > -				     G723_PERIOD_BYTES, 0, 0);
> > -		if (err)
> > -			return err;
> > -
> > -		memcpy(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES);
> > -		dst += G723_PERIOD_BYTES;
> >  	}
> >  
> >  	return 0;
> > @@ -263,8 +236,7 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
> >  	.prepare = snd_solo_pcm_prepare,
> >  	.trigger = snd_solo_pcm_trigger,
> >  	.pointer = snd_solo_pcm_pointer,
> > -	.copy_user = snd_solo_pcm_copy_user,
> > -	.copy_kernel = snd_solo_pcm_copy_kernel,
> > +	.copy = snd_solo_pcm_copy,
> >  };
> >  
> >  static int snd_solo_capture_volume_info(struct snd_kcontrol *kcontrol,
> > -- 
> > 2.35.3
> > 
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

You meant Reviewed-by or Acked-by?  Signed-off-by is a tag used when
you carry a patch.


thanks,

Takashi

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35C77B895
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB79583A;
	Mon, 14 Aug 2023 14:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB79583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692016035;
	bh=EAxWg1mRui+L0RL6fvTm/qtJ7U8lPgyy04gcmCUWGtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eHSKZKzgBj1gz03wGEcIAdBufjC9J+15yyt8FnOxkWGdicGtfPHdXjWrNCHgZo3ra
	 R4kU1YZ7dnxEQrVADGAbYpwGfN1NCLEUHddsPA4y9prINp4PGMdcgl17olMTUF72R8
	 s7WnJwSHIO/nGZG/iUYm6l6KVX6SD8kz3hhyIDv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06E1EF800EE; Mon, 14 Aug 2023 14:26:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA8AF80254;
	Mon, 14 Aug 2023 14:26:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63AFBF8025F; Mon, 14 Aug 2023 14:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by alsa1.perex.cz (Postfix) with ESMTP id A70A3F800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 14:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70A3F800EE
Received: from pirotess (80.red-83-50-209.dynamicip.rima-tde.net
 [83.50.209.80])
	by iodev.co.uk (Postfix) with ESMTPSA id 8FBCA208939;
	Mon, 14 Aug 2023 14:26:18 +0200 (CEST)
Date: Mon, 14 Aug 2023 14:26:16 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 17/25] media: solo6x10: Convert to generic PCM copy ops
Message-ID: <ZNodaGnVsOkt3vje@pirotess>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-18-tiwai@suse.de>
 <ZNoa1jU7O08KwOJ6@pirotess>
 <87350l3jix.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87350l3jix.wl-tiwai@suse.de>
X-Spam: Yes
Message-ID-Hash: E2KBQVYF22GYU4PX5ON22TETNSBV5FA2
X-Message-ID-Hash: E2KBQVYF22GYU4PX5ON22TETNSBV5FA2
X-MailFrom: ismael@iodev.co.uk
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2KBQVYF22GYU4PX5ON22TETNSBV5FA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/Aug/2023 14:17, Takashi Iwai wrote:
> On Mon, 14 Aug 2023 14:15:18 +0200,
> Ismael Luceno wrote:
> > 
> > On 14/Aug/2023 13:55, Takashi Iwai wrote:
> > > This patch converts the solo6x10 driver code to use the new unified
> > > PCM copy callback.  It's a straightforward conversion from *_user() to
> > > *_iter() variants.  As copy_to_iter() updates the internal offest at
> > > each write, we can drop the dst counter update in the loop, too.
> > > 
> > > Note that copy_from/to_iter() returns the copied bytes, hence the
> > > error condition is inverted from copy_from/to_user().
> > > 
> > > Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
> > > Cc: Anton Sviridenko <anton@corp.bluecherry.net>
> > > Cc: Andrey Utkin <andrey_utkin@fastmail.com>
> > > Cc: Ismael Luceno <ismael@iodev.co.uk>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: linux-media@vger.kernel.org
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  drivers/media/pci/solo6x10/solo6x10-g723.c | 38 +++-------------------
> > >  1 file changed, 5 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> > > index 6cebad665565..aceacb822cab 100644
> > > --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> > > +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> > > @@ -204,9 +204,9 @@ static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *ss)
> > >  	return idx * G723_FRAMES_PER_PAGE;
> > >  }
> > >  
> > > -static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
> > > -				  unsigned long pos, void __user *dst,
> > > -				  unsigned long count)
> > > +static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
> > > +			     unsigned long pos, struct iov_iter *dst,
> > > +			     unsigned long count)
> > >  {
> > >  	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
> > >  	struct solo_dev *solo_dev = solo_pcm->solo_dev;
> > > @@ -223,35 +223,8 @@ static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
> > >  		if (err)
> > >  			return err;
> > >  
> > > -		if (copy_to_user(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES))
> > > +		if (!copy_to_iter(solo_pcm->g723_buf, G723_PERIOD_BYTES, dst))
> > >  			return -EFAULT;
> > > -		dst += G723_PERIOD_BYTES;
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int snd_solo_pcm_copy_kernel(struct snd_pcm_substream *ss, int channel,
> > > -				    unsigned long pos, void *dst,
> > > -				    unsigned long count)
> > > -{
> > > -	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
> > > -	struct solo_dev *solo_dev = solo_pcm->solo_dev;
> > > -	int err, i;
> > > -
> > > -	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
> > > -		int page = (pos / G723_FRAMES_PER_PAGE) + i;
> > > -
> > > -		err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
> > > -				     SOLO_G723_EXT_ADDR(solo_dev) +
> > > -				     (page * G723_PERIOD_BLOCK) +
> > > -				     (ss->number * G723_PERIOD_BYTES),
> > > -				     G723_PERIOD_BYTES, 0, 0);
> > > -		if (err)
> > > -			return err;
> > > -
> > > -		memcpy(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES);
> > > -		dst += G723_PERIOD_BYTES;
> > >  	}
> > >  
> > >  	return 0;
> > > @@ -263,8 +236,7 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
> > >  	.prepare = snd_solo_pcm_prepare,
> > >  	.trigger = snd_solo_pcm_trigger,
> > >  	.pointer = snd_solo_pcm_pointer,
> > > -	.copy_user = snd_solo_pcm_copy_user,
> > > -	.copy_kernel = snd_solo_pcm_copy_kernel,
> > > +	.copy = snd_solo_pcm_copy,
> > >  };
> > >  
> > >  static int snd_solo_capture_volume_info(struct snd_kcontrol *kcontrol,
> > > -- 
> > > 2.35.3
> > > 
> > 
> > Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> 
> You meant Reviewed-by or Acked-by?  Signed-off-by is a tag used when
> you carry a patch.
> 
> 
> thanks,
> 
> Takashi

Yes, sorry, I meant "Acked-by".

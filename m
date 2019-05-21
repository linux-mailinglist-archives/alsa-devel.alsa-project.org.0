Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B443724E58
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 13:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D484E;
	Tue, 21 May 2019 13:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D484E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558439425;
	bh=QHeLEryxTce/8FBTgucJC9Lca9uSA4cMDToK1pqzg74=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGCDJZ1rVsnXda5AVRJiJ6bjP6w4w2zctJ1AAEbpPkHxyQF/V3fewfwxyu0HT+6GO
	 6qcW04rWMk3A83TXcqhU2BDIq3zup4tIe1Cx41UE4K93DZez5eLx5xcluOSm0j8CXz
	 CHGN4v1jjSgRjBwvlfp/9S4DbCi64owN02Wel58c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCE9F8970E;
	Tue, 21 May 2019 13:49:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E00CF89709; Tue, 21 May 2019 13:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_14, SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC761F89633
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 13:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC761F89633
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4A1573C005E;
 Tue, 21 May 2019 13:48:54 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Gv7olPd_7u6; Tue, 21 May 2019 13:48:47 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 725D43C00DD;
 Tue, 21 May 2019 13:48:47 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Tue, 21 May 2019 13:48:47 +0200
From: "Miartus, Adam (Arion Recruitment; ADITG/ESM)" <amiartus@de.adit-jv.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [ALSA patch] FW: [PATCH - alsa-lib 1/4] pcm_file: add support
 for infile reading in non interleaved mode
Thread-Index: AQHVDyus+EZYnzfbK0mHJDSlsPfGXqZ0OV4AgADk3YCAAFl+gA==
Date: Tue, 21 May 2019 11:48:46 +0000
Message-ID: <B174E9FCEE9A8C46B11E4DF2E329936277F460@HI2EXCH01.adit-jv.com>
References: <1558370831-15960-1-git-send-email-adam.miartus@gmail.com>
 <B174E9FCEE9A8C46B11E4DF2E329936277F1EC@HI2EXCH01.adit-jv.com>
 <s5hv9y45i10.wl-tiwai@suse.de>
In-Reply-To: <s5hv9y45i10.wl-tiwai@suse.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.142]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ALSA patch] FW: [PATCH - alsa-lib 1/4] pcm_file:
 add support for infile reading in non interleaved mode
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> On Mon, 20 May 2019 18:49:34 +0200,
> Miartus, Adam (Arion Recruitment; ADITG/ESM) wrote:
> >
> > From: Adam Miartus <amiartus@de.adit-jv.com>
> >
> > add helper function to copy input file data to buffer mapped by areas, in
> case of an error, do not fill the areas, allowing device read buffer to be
> provided to api caller
> >
> > previously unused rbuf variable is reused for this purpose
> >
> > Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> > Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
> >
> > diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c index
> 3a19cef..7998b64 100644
> > --- a/src/pcm/pcm_file.c
> > +++ b/src/pcm/pcm_file.c
> > @@ -77,6 +77,7 @@ typedef struct {
> >  	snd_pcm_uframes_t appl_ptr;
> >  	snd_pcm_uframes_t file_ptr_bytes;
> >  	snd_pcm_uframes_t wbuf_size;
> > +	snd_pcm_uframes_t rbuf_size;
> >  	size_t wbuf_size_bytes;
> >  	size_t wbuf_used_bytes;
> >  	char *wbuf;
> > @@ -266,6 +267,37 @@ static int
> snd_pcm_file_open_output_file(snd_pcm_file_t *file)
> >  	return 0;
> >  }
> >
> > +/* fill areas with data from input file, return bytes red */ static int
> > +snd_pcm_file_areas_read_infile(snd_pcm_t *pcm, const
> snd_pcm_channel_area_t *areas,
> > +	snd_pcm_uframes_t offset, snd_pcm_uframes_t frames) {
> 
> Please follow the standard coding style.
> 
> > +	snd_pcm_file_t *file = pcm->private_data;
> > +	snd_pcm_channel_area_t areas_if[pcm->channels];
> > +	ssize_t bytes;
> > +
> > +	if (file->ifd < 0)
> > +		return -EBADF;
> > +
> > +	if (file->rbuf == NULL)
> > +		return -ENOMEM;
> > +
> > +	if (file->rbuf_size < frames) {
> > +		SYSERR("requested more frames than pcm buffer");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	bytes = read(file->ifd, file->rbuf, snd_pcm_frames_to_bytes(pcm,
> frames));
> > +	if (bytes < 0) {
> > +		SYSERR("read from file failed, error: %d", bytes);
> > +		return bytes;
> > +	}
> > +
> > +	snd_pcm_areas_from_buf(pcm, areas_if, file->rbuf);
> > +	snd_pcm_areas_copy(areas, offset, areas_if, 0, pcm->channels,
> > +snd_pcm_bytes_to_frames(pcm, bytes), pcm->format);
> 
> Wrong indentation.
> 
> 
> thanks,
> 
> Takashi

Sorry, my email client messed up the whitespace. I re-sent the patch using git send-mail.

Best Regards,

Adam
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

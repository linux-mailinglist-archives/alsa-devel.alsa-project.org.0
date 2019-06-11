Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4ED3C572
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 09:54:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E5116AB;
	Tue, 11 Jun 2019 09:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E5116AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560239662;
	bh=g+YChUuZeNG0TKzpfW8j1gexNYl0SgiYdocwWPEi+ko=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZAKErKOeQubgzNTB5G4d/9AzRT0hIgtHtz6OpImj3NmZP3GYeSw3hWHVYXZ66H3wM
	 /qVgufKkg4+miZnQoErjAUldL33c+wDO17+vcgxouVhnILSfjhWc9gijy918Ub0dAZ
	 UxIjP6lG0D03PzIVPnGo8Gkf4yzmdhorGHKO2/hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B000F896F1;
	Tue, 11 Jun 2019 09:52:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6FB1F806F5; Tue, 11 Jun 2019 09:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_14, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4A2CF806F5;
 Tue, 11 Jun 2019 09:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4A2CF806F5
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 8DEB63C00C6;
 Tue, 11 Jun 2019 09:52:26 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOMD8NjD3A2P; Tue, 11 Jun 2019 09:52:20 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id DCA5E3C00BE;
 Tue, 11 Jun 2019 09:52:20 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Tue, 11 Jun 2019 09:52:20 +0200
From: "Miartus, Adam (Arion Recruitment; ADITG/ESM)" <amiartus@de.adit-jv.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, "patch@alsa-project.org"
 <patch@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH 1/2] pcm_file: do not disrupt playback on
 output file write fail
Thread-Index: AQHVHilcmXYWES3Z9EywLOAi2ZX+UqaWF9Ww
Date: Tue, 11 Jun 2019 07:52:19 +0000
Message-ID: <B174E9FCEE9A8C46B11E4DF2E32993627A3EFA@HI2EXCH01.adit-jv.com>
References: <1559910203-29795-1-git-send-email-amiartus@de.adit-jv.com>
 <1559910203-29795-2-git-send-email-amiartus@de.adit-jv.com>
 <4418bd15-24a0-401a-9d86-709fc99d7b49@intel.com>
In-Reply-To: <4418bd15-24a0-401a-9d86-709fc99d7b49@intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.142]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 1/2] pcm_file: do not disrupt playback on
 output file write fail
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

> -----Original Message-----
> From: Cezary Rojewski <cezary.rojewski@intel.com>
> Sent: Samstag, 8. Juni 2019 20:38
> To: Miartus, Adam (Arion Recruitment; ADITG/ESM) <amiartus@de.adit-
> jv.com>; patch@alsa-project.org
> Cc: alsa-devel@alsa-project.org
> Subject: Re: [alsa-devel] [PATCH 1/2] pcm_file: do not disrupt playback on
> output file write fail
> 
> On 2019-06-07 14:23, Adam Miartus wrote:
> > previously playback could be interrupted by snd_pcm_file_add_frames:
> >      assert(file->wbuf_used_bytes < file->wbuf_size_bytes)
> >
> > in case snd_pcm_file_write_bytes fails to write full amount of bytes
> > to file, variable wbuf_used_bytes would not be fully decremented by
> > requested amount of bytes function was called with
> >
> > for the assert to trigger, multiple write fails need to happen, so
> > that wbuf_used_bytes overflows wbuf_size_bytes,
> >
> > this patch will allow application to report error code to api user
> > who might have an idea how to recover, before assert is triggered,
> > also reporting error along with the print out message might give user
> > a better idea of what is going on, where previously reason for
> > mentioned assert was not immediately clear
> >
> > Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> > ---
> >   src/pcm/pcm_file.c | 36 ++++++++++++++++++++++++------------
> >   1 file changed, 24 insertions(+), 12 deletions(-)
> >
> > diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
> > index 1ef80b5..a1d15d6 100644
> > --- a/src/pcm/pcm_file.c
> > +++ b/src/pcm/pcm_file.c
> > @@ -381,27 +381,31 @@ static void fixup_wav_header(snd_pcm_t *pcm)
> >
> >
> >
> > -static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
> > +/* return error code in case write failed */
> > +static int snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
> >   {
> >   	snd_pcm_file_t *file = pcm->private_data;
> > +	snd_pcm_sframes_t err = 0;
> >   	assert(bytes <= file->wbuf_used_bytes);
> >
> >   	if (file->format == SND_PCM_FILE_FORMAT_WAV &&
> >   	    !file->wav_header.fmt) {
> > -		if (write_wav_header(pcm) < 0)
> > -			return;
> > +		err = write_wav_header(pcm);
> > +		if (err < 0) {
> > +			SYSERR("%s write failed, file data may be corrupt",
> file->fname);
> > +			return err;
> > +		}
> 
> write_wav_header already dumps "Write error" on failure. Both messages
> are quite similar. Your message dumps filename though, so it's clearly
> more descriptive - consider updating write_wav_header SYSERR message all
> along while simplifying code here.
> 
> >   	}
> >
> >   	while (bytes > 0) {
> > -		snd_pcm_sframes_t err;
> >   		size_t n = bytes;
> >   		size_t cont = file->wbuf_size_bytes - file->file_ptr_bytes;
> >   		if (n > cont)
> >   			n = cont;
> >   		err = write(file->fd, file->wbuf + file->file_ptr_bytes, n);
> >   		if (err < 0) {
> > -			SYSERR("write failed");
> > -			break;
> > +			SYSERR("%s write failed, file data may be corrupt",
> file->fname);
> > +			return err;
> >   		}
> >   		bytes -= err;
> >   		file->wbuf_used_bytes -= err;
> > @@ -412,15 +416,18 @@ static void snd_pcm_file_write_bytes(snd_pcm_t
> *pcm, size_t bytes)
> >   		if ((snd_pcm_uframes_t)err != n)
> >   			break;
> >   	}
> > +
> > +	return 0;
> >   }
> >
> > -static void snd_pcm_file_add_frames(snd_pcm_t *pcm,
> > -				    const snd_pcm_channel_area_t *areas,
> > -				    snd_pcm_uframes_t offset,
> > -				    snd_pcm_uframes_t frames)
> > +static int snd_pcm_file_add_frames(snd_pcm_t *pcm,
> > +				   const snd_pcm_channel_area_t *areas,
> > +				   snd_pcm_uframes_t offset,
> > +				   snd_pcm_uframes_t frames)
> >   {
> >   	snd_pcm_file_t *file = pcm->private_data;
> >   	while (frames > 0) {
> > +		int err = 0;
> >   		snd_pcm_uframes_t n = frames;
> >   		snd_pcm_uframes_t cont = file->wbuf_size - file->appl_ptr;
> >   		snd_pcm_uframes_t avail = file->wbuf_size -
> snd_pcm_bytes_to_frames(pcm, file->wbuf_used_bytes);
> > @@ -437,10 +444,15 @@ static void snd_pcm_file_add_frames(snd_pcm_t
> *pcm,
> >   		if (file->appl_ptr == file->wbuf_size)
> >   			file->appl_ptr = 0;
> >   		file->wbuf_used_bytes += snd_pcm_frames_to_bytes(pcm,
> n);
> > -		if (file->wbuf_used_bytes > file->buffer_bytes)
> > -			snd_pcm_file_write_bytes(pcm, file-
> >wbuf_used_bytes - file->buffer_bytes);
> > +		if (file->wbuf_used_bytes > file->buffer_bytes) {
> > +			err = snd_pcm_file_write_bytes(pcm, file-
> >wbuf_used_bytes - file->buffer_bytes);
> > +			if (err < 0) {
> > +				return err;
> > +			}
> 
> Suggestion: drop unnecessary brackets.
> 
> > +		}
> >   		assert(file->wbuf_used_bytes < file->wbuf_size_bytes);
> >   	}
> > +	return 0;
> 
> Hmm. For snd_pcm_file_write_bytes you've chosen a different form:
> newline + return. Code looks more cohesive if it's "formatted" in the
> same fashion.
> 
> >   }
> >
> >   static int snd_pcm_file_close(snd_pcm_t *pcm)
> >

Thank you for the review, I removed the whitespace, brackets and moved the log to be printed at first error occurrence.

Should I send a new patch request or copy paste here is ok?

From 5f347b41ed78b5f033c6e5d62ae9bef944dbb1b0 Mon Sep 17 00:00:00 2001
From: Adam Miartus <amiartus@de.adit-jv.com>
Date: Tue, 11 Jun 2019 09:42:21 +0200
Subject: [PATCH] pcm_file: do not disrupt playback on output file write fail

previously playback could be interrupted by snd_pcm_file_add_frames:
    assert(file->wbuf_used_bytes < file->wbuf_size_bytes)

in case snd_pcm_file_write_bytes fails to write full amount of bytes
to file, variable wbuf_used_bytes would not be fully decremented by
requested amount of bytes function was called with

for the assert to trigger, multiple write fails need to happen, so
that wbuf_used_bytes overflows wbuf_size_bytes,

this patch will allow application to report error code to api user
who might have an idea how to recover, before assert is triggered,
also reporting error along with the print out message might give user
a better idea of what is going on, where previously reason for
mentioned assert was not immediately clear

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
---
 src/pcm/pcm_file.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/src/pcm/pcm_file.c b/src/pcm/pcm_file.c
index 1ef80b5..0a8d98d 100644
--- a/src/pcm/pcm_file.c
+++ b/src/pcm/pcm_file.c
@@ -346,7 +346,7 @@ static int write_wav_header(snd_pcm_t *pcm)
 	    sizeof(file->wav_header) ||
 	    write(file->fd, header2, sizeof(header2)) != sizeof(header2)) {
 		int err = errno;
-		SYSERR("Write error.\n");
+		SYSERR("%s write header failed, file data may be corrupt", file->fname);
 		return -err;
 	}
 	return 0;
@@ -381,27 +381,29 @@ static void fixup_wav_header(snd_pcm_t *pcm)
 
 
 
-static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
+/* return error code in case write failed */
+static int snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
 {
 	snd_pcm_file_t *file = pcm->private_data;
+	snd_pcm_sframes_t err = 0;
 	assert(bytes <= file->wbuf_used_bytes);
 
 	if (file->format == SND_PCM_FILE_FORMAT_WAV &&
 	    !file->wav_header.fmt) {
-		if (write_wav_header(pcm) < 0)
-			return;
+		err = write_wav_header(pcm);
+		if (err < 0)
+			return err;
 	}
 
 	while (bytes > 0) {
-		snd_pcm_sframes_t err;
 		size_t n = bytes;
 		size_t cont = file->wbuf_size_bytes - file->file_ptr_bytes;
 		if (n > cont)
 			n = cont;
 		err = write(file->fd, file->wbuf + file->file_ptr_bytes, n);
 		if (err < 0) {
-			SYSERR("write failed");
-			break;
+			SYSERR("%s write failed, file data may be corrupt", file->fname);
+			return err;
 		}
 		bytes -= err;
 		file->wbuf_used_bytes -= err;
@@ -412,15 +414,17 @@ static void snd_pcm_file_write_bytes(snd_pcm_t *pcm, size_t bytes)
 		if ((snd_pcm_uframes_t)err != n)
 			break;
 	}
+	return 0;
 }
 
-static void snd_pcm_file_add_frames(snd_pcm_t *pcm, 
-				    const snd_pcm_channel_area_t *areas,
-				    snd_pcm_uframes_t offset,
-				    snd_pcm_uframes_t frames)
+static int snd_pcm_file_add_frames(snd_pcm_t *pcm,
+				   const snd_pcm_channel_area_t *areas,
+				   snd_pcm_uframes_t offset,
+				   snd_pcm_uframes_t frames)
 {
 	snd_pcm_file_t *file = pcm->private_data;
 	while (frames > 0) {
+		int err = 0;
 		snd_pcm_uframes_t n = frames;
 		snd_pcm_uframes_t cont = file->wbuf_size - file->appl_ptr;
 		snd_pcm_uframes_t avail = file->wbuf_size - snd_pcm_bytes_to_frames(pcm, file->wbuf_used_bytes);
@@ -437,10 +441,14 @@ static void snd_pcm_file_add_frames(snd_pcm_t *pcm,
 		if (file->appl_ptr == file->wbuf_size)
 			file->appl_ptr = 0;
 		file->wbuf_used_bytes += snd_pcm_frames_to_bytes(pcm, n);
-		if (file->wbuf_used_bytes > file->buffer_bytes)
-			snd_pcm_file_write_bytes(pcm, file->wbuf_used_bytes - file->buffer_bytes);
+		if (file->wbuf_used_bytes > file->buffer_bytes) {
+			err = snd_pcm_file_write_bytes(pcm, file->wbuf_used_bytes - file->buffer_bytes);
+			if (err < 0)
+				return err;
+		}
 		assert(file->wbuf_used_bytes < file->wbuf_size_bytes);
 	}
+	return 0;
 }
 
 static int snd_pcm_file_close(snd_pcm_t *pcm)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

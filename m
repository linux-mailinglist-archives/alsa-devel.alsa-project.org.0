Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8E659D5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 17:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27AF115F2;
	Thu, 11 Jul 2019 16:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27AF115F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562857235;
	bh=rH2/zU05S0S4QG/0OelpDlaCJtdoKjVXuZHUd/13bsA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B0FW7HgdzRrFcOTr+AyM1J7fEF0vYz0Rbas4zKiSTL9yeVikpbuyphzUuodEyb/t7
	 6IVsxfrTfj86xfNy5+qMKp0ENrJAwNTQw2vwPhutP+thua0Zqfab2eQKBB0LYH5kH7
	 wSOMSIzv7GU26MP6GrqFZ8ZmPFWzcvjKeObtcKD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B58EF802FB;
	Thu, 11 Jul 2019 16:58:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3E55F802FB; Thu, 11 Jul 2019 16:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_14, SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055F7F801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 16:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055F7F801A4
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id B91273C00BA;
 Thu, 11 Jul 2019 16:58:42 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVl8UrfC2tqJ; Thu, 11 Jul 2019 16:58:36 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 721CB3C001F;
 Thu, 11 Jul 2019 16:58:36 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Thu, 11 Jul 2019 16:58:36 +0200
From: "Miartus, Adam (Arion Recruitment; ADITG/ESM)" <amiartus@de.adit-jv.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [ALSA patch] [PATCH 1/2] alsa: pcm: add unsupported OPS
Thread-Index: AQHVNlFY9fbmD69LkkCLTBR1rn718qbD8RtA///g/YCAAamUUA==
Date: Thu, 11 Jul 2019 14:58:34 +0000
Message-ID: <B174E9FCEE9A8C46B11E4DF2E32993627B83B9@HI2EXCH01.adit-jv.com>
References: <1562583889-2109-1-git-send-email-amiartus@de.adit-jv.com>
 <1562583889-2109-2-git-send-email-amiartus@de.adit-jv.com>
 <s5hy317tmxv.wl-tiwai@suse.de>
 <B174E9FCEE9A8C46B11E4DF2E32993627B7FCA@HI2EXCH01.adit-jv.com>
 <s5hftneq6ja.wl-tiwai@suse.de>
In-Reply-To: <s5hftneq6ja.wl-tiwai@suse.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.142]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Pape,
 Andreas \(ADITG/ESS1\)" <apape@de.adit-jv.com>
Subject: Re: [alsa-devel] [ALSA patch] [PATCH 1/2] alsa: pcm: add
	unsupported OPS
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
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Mittwoch, 10. Juli 2019 17:00
> To: Miartus, Adam (Arion Recruitment; ADITG/ESM) <amiartus@de.adit-
> jv.com>
> Cc: alsa-devel@alsa-project.org; Pape, Andreas (ADITG/ESS1)
> <apape@de.adit-jv.com>
> Subject: Re: [ALSA patch] [PATCH 1/2] alsa: pcm: add unsupported OPS
> 
> On Wed, 10 Jul 2019 16:58:06 +0200,
> Miartus, Adam (Arion Recruitment; ADITG/ESM) wrote:
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Dienstag, 9. Juli 2019 14:25
> > > To: Miartus, Adam (Arion Recruitment; ADITG/ESM) <amiartus@de.adit-
> > > jv.com>
> > > Cc: alsa-devel@alsa-project.org; Pape, Andreas (ADITG/ESS1)
> > > <apape@de.adit-jv.com>
> > > Subject: Re: [ALSA patch] [PATCH 1/2] alsa: pcm: add unsupported OPS
> > >
> > > On Mon, 08 Jul 2019 13:04:48 +0200,
> > > Adam Miartus wrote:
> > > >
> > > > From: Andreas Pape <apape@de.adit-jv.com>
> > > >
> > > > Signed-off-by: Andreas Pape <apape@de.adit-jv.com>
> > > > Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> > >
> > > No description isn't good at all.  There must be something you can
> > > explain in details here.
> >
> > Certainly, I will add explanation in patch v2.
> >
> > >
> > > About the changes:
> > >
> > > > +#define PCM_UNSUPPORTED_ERR (-ENOSYS)
> > > > +void snd_pcm_unsupported_dump(snd_pcm_t *pcm, snd_output_t
> > > *out)
> > > > +{
> > > > +	snd_output_printf(out, "unsupported\n");
> > > > +}
> > >
> > > IMO, we don't need to show anything if it's dummy.
> > > And, maybe it's more straightforward to let the PCM core allow NULL
> > > ops?
> > >
> >
> > If you agree I could add following in patch v2, then we could drop
> snd_pcm_unsupported_dump function altogether
> >
> > diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
> > index e0ceccc..4d91d4d 100644
> > --- a/src/pcm/pcm.c
> > +++ b/src/pcm/pcm.c
> > @@ -2277,7 +2277,8 @@ int snd_pcm_dump(snd_pcm_t *pcm,
> snd_output_t *out)
> >  {
> >         assert(pcm);
> >         assert(out);
> > -       pcm->ops->dump(pcm->op_arg, out);
> > +       if (pcm->ops->dump)
> > +               pcm->ops->dump(pcm->op_arg, out);
> >         return 0;
> >  }
> 
> I *guess* this would be simpler in the end, although I'm fine with
> your original idea, too.  Let's see and compare the both results.

Yes I agree, it would even be better to remove the pcm_unsupported.c altogether.
I had a look at how snd_pcm_ops_t and snd_pcm_fast_ops_t callbacks are used in alsa-lib
and in most cases (90% or more) it is assumed that the function pointer is valid without
checking for NULL.

Unfortunately, not all functions in ops and fast_ops share the same return type,
so checking for null pointer in a macro is not straightforward. One way I see is to add:

if (ops->callback == NULL)
	return -ENOSYS;

check in every occurrence of ops callback call in source code, then we could drop
pcm_unsupported.c file completely.

Optionally we could add a set of macros such as (it compiled both in gcc and in clang)

#define snd_callback_int(fpointer, ...) ({ \
	int result; \
	if (fpointer == NULL) \
		result = -ENOSYS; \
	else \
		result = fpointer(__VA_ARGS__); \
	result; \
})

For each ops function return types, currently these are:
int, void, snd_pcm_chmap_query_t**, snd_pcm_chmap_t *, 
snd_pcm_state_t, snd_pcm_sframes_t

So, the variants for macros would be:
snd_callback_void
snd_callback_int
snd_callback_ptr
snd_callback_sframes

This might seem like cumbersome approach but it would save lines of code
and provide a way to check for null callback pointer, which is currently not
done in most cases.

What do you think about these two approaches, what could you consider
correct and able to be merged?

Adam
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

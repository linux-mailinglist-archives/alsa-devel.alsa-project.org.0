Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C2648C4
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE6B1683;
	Wed, 10 Jul 2019 16:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE6B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562770808;
	bh=0o6rG6rvEMxVej2j5shuRj62r9sRHuXpdZ4m9bRzFS0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fECe5bQYpDOZ+SwZvpqTFw0IobOeDi0r7BpuQ+9M1ydsuNERJ8uAYjYrm+rK+zrE5
	 UbtBWTAg6Rw4x3RF9FRixK/pog0ACDaKK8rU1eSE8ocINVj5VJeOUiX+TCOJ7j9hhR
	 SI7VWPwlyZot7y12G/k21lRQv991inX9Dhk6ixZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4206DF802A1;
	Wed, 10 Jul 2019 16:58:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5720AF802A1; Wed, 10 Jul 2019 16:58:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_14, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7E60F800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 16:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E60F800DE
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id BDE583C00BA;
 Wed, 10 Jul 2019 16:58:13 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNE6q8Fo3imf; Wed, 10 Jul 2019 16:58:07 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id DE0D13C001F;
 Wed, 10 Jul 2019 16:58:07 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Wed, 10 Jul 2019 16:58:07 +0200
From: "Miartus, Adam (Arion Recruitment; ADITG/ESM)" <amiartus@de.adit-jv.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [ALSA patch] [PATCH 1/2] alsa: pcm: add unsupported OPS
Thread-Index: AQHVNlFY9fbmD69LkkCLTBR1rn718qbD8RtA
Date: Wed, 10 Jul 2019 14:58:06 +0000
Message-ID: <B174E9FCEE9A8C46B11E4DF2E32993627B7FCA@HI2EXCH01.adit-jv.com>
References: <1562583889-2109-1-git-send-email-amiartus@de.adit-jv.com>
 <1562583889-2109-2-git-send-email-amiartus@de.adit-jv.com>
 <s5hy317tmxv.wl-tiwai@suse.de>
In-Reply-To: <s5hy317tmxv.wl-tiwai@suse.de>
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
> Sent: Dienstag, 9. Juli 2019 14:25
> To: Miartus, Adam (Arion Recruitment; ADITG/ESM) <amiartus@de.adit-
> jv.com>
> Cc: alsa-devel@alsa-project.org; Pape, Andreas (ADITG/ESS1)
> <apape@de.adit-jv.com>
> Subject: Re: [ALSA patch] [PATCH 1/2] alsa: pcm: add unsupported OPS
> 
> On Mon, 08 Jul 2019 13:04:48 +0200,
> Adam Miartus wrote:
> >
> > From: Andreas Pape <apape@de.adit-jv.com>
> >
> > Signed-off-by: Andreas Pape <apape@de.adit-jv.com>
> > Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> 
> No description isn't good at all.  There must be something you can
> explain in details here.

Certainly, I will add explanation in patch v2.

> 
> About the changes:
> 
> > +#define PCM_UNSUPPORTED_ERR (-ENOSYS)
> > +void snd_pcm_unsupported_dump(snd_pcm_t *pcm, snd_output_t
> *out)
> > +{
> > +	snd_output_printf(out, "unsupported\n");
> > +}
> 
> IMO, we don't need to show anything if it's dummy.
> And, maybe it's more straightforward to let the PCM core allow NULL
> ops?
> 

If you agree I could add following in patch v2, then we could drop snd_pcm_unsupported_dump function altogether

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index e0ceccc..4d91d4d 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -2277,7 +2277,8 @@ int snd_pcm_dump(snd_pcm_t *pcm, snd_output_t *out)
 {
        assert(pcm);
        assert(out);
-       pcm->ops->dump(pcm->op_arg, out);
+       if (pcm->ops->dump)
+               pcm->ops->dump(pcm->op_arg, out);
        return 0;
 }

Please let me know if you agree with proposed changes and I will prepare patch v2.

Adam
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E21C78F1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 20:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D472D17AE;
	Wed,  6 May 2020 20:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D472D17AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588788536;
	bh=Al3obY+rj2Hw1zWFZMTvT9NG8jigKPqSdiu3kdOEbBg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KS8oHhw6xUKeGSvAg3GTOJouLgIQKiAWglJSqISCdPK02shZXPCq90iM2RW+eM/ao
	 GDS6VAu2RM/fnEj4+nXQp00LO3sKk18ywFpgOm3leyONq/z9dBFXXv/05tkq5CAXlK
	 KAFboI49NQ9HPK3yEJAtSNUjjlCfGD6Q4DITaQtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA387F80234;
	Wed,  6 May 2020 20:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D73ACF80249; Wed,  6 May 2020 20:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E13BF800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 20:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E13BF800DE
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 565014117E;
 Wed,  6 May 2020 20:07:00 +0200 (CEST)
Received: from zm-mbx05.u-ga.fr (zm-mbx05.u-ga.fr [152.77.200.19])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 5040B80F9E;
 Wed,  6 May 2020 20:07:00 +0200 (CEST)
Date: Wed, 6 May 2020 20:07:00 +0200 (CEST)
From: =?utf-8?B?RlLDiUTDiVJJQw==?= RECOULES
 <frederic.recoules@univ-grenoble-alpes.fr>
To: tiwai <tiwai@suse.de>
Message-ID: <1268362089.3495441.1588788420305.JavaMail.zimbra@univ-grenoble-alpes.fr>
In-Reply-To: <s5heerybib0.wl-tiwai@suse.de>
References: <20200427165707.17570-1-frederic.recoules@univ-grenoble-alpes.fr>
 <s5h4kt2ln5s.wl-tiwai@suse.de>
 <640422029.9300033.1588239716857.JavaMail.zimbra@univ-grenoble-alpes.fr>
 <771384288.121039.1588620316734.JavaMail.zimbra@univ-grenoble-alpes.fr>
 <s5heerybib0.wl-tiwai@suse.de>
Subject: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk
 interfaces
MIME-Version: 1.0
X-Originating-IP: [46.193.2.18]
X-Mailer: Zimbra 8.8.15_GA_3928 (ZimbraWebClient - FF72 (Linux)/8.8.15_GA_3928)
Thread-Topic: fix pcm_dmix_i386.h assembly chunk interfaces
Thread-Index: a0MVhytrvCEa+cg8LqNs9L2GTifEjA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 frederic recoules <frederic.recoules@orange.fr>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,=20

Thanks for your comments.=20
I addressed the style issues and I resubmitted the patches (V3).=20

Note about the MMX patch:=20
The mm1 register is read by the chunk, but its value is not used=20
(the instruction packssdw put the value of mm1 in the high 32 bits of mm0=
=20
but then, only the low 32 bits are used. My tool made an over-approximation=
=20
but it is now fixed).=20

By the way, the first 3 patches produce the same binary output as master.=
=20
However, I looked in the 'test' folder, but I do not know how to run a test=
 for=20
the pcm. For now, I have no time to investigate how alsa should be run till=
 the=20
next week.=20

> But there were some issues with the patch format. IIRC, the=20
> patch 2 couldn't be applied to the latest git tree cleanly (some space=20
> etter issues?), so I had to manually modify it.=20

Sorry for that, it looks like my text editor remove space at the end of the=
 line=20
automatically. It should not be the case with the new patches.=20

Regards,=20
Fr=C3=A9d=C3=A9ric=20


De: "tiwai" <tiwai@suse.de>=20
=C3=80: "FR=C3=89D=C3=89RIC RECOULES" <frederic.recoules@univ-grenoble-alpe=
s.fr>=20
Cc: "alsa-devel" <alsa-devel@alsa-project.org>, "frederic recoules" <freder=
ic.recoules@orange.fr>=20
Envoy=C3=A9: Mardi 5 Mai 2020 15:52:19=20
Objet: Re: [PATCH] [inline assembly] fix pcm_dmix_i386.h assembly chunk int=
erfaces=20

On Mon, 04 May 2020 21:25:16 +0200,=20
FR=C3=89D=C3=89RIC RECOULES wrote:=20
>=20
> Hi Takashi,=20
>=20
> I would like an update on the review process ([PATCH */6 V2] [pcm_dmix=20
> assembly])=20
>=20
> As a reminder, I split the changes in 6 distinct patches.=20
> The 3 first patches produce exactly the same binary output, so they do no=
t=20
> need testing.=20
> The 4th one has just some minor change due to the fact that I added an=20
> instruction -- I am highly confident it breaks nothing.=20

The compile tests passed with a few different compiler set, so that's=20
good. But there were some issues with the patch format. IIRC, the=20
patch 2 couldn't be applied to the latest git tree cleanly (some space=20
letter issues?), so I had to manually modify it.=20

Also, some style issues:=20

- Please avoid a prefix like "[configure]" in the subject.=20
The prefix with "[PATCH xxx]" is good, and this should remain, but=20
the next prefix should be "configure:" instead. Otherwise the=20
prefix with the brackets are pruned at applying a patch via git-am.=20

- Please give more texts about why the change is done.=20
In all your patches, there are no explanations why you change it.=20
It's often more important than describing what you're changing.=20
For example, the patch 2 "change the token by symbolic names". Why=20
is this needed to be symbolic names? Write some more information in=20
each patch description.=20

- We usually use #ifdef without space between "#" and "ifdef".=20
Let's keep that style consistently.=20

> If you need I test the 2 last ones (that reduce the size of the produced=
=20
> binary), could you point me out what test I should run?=20

We need at least some build tests with different compiler versions and=20
check whether dmix actually works (not necessarily on all of them but=20
some of those compiled results).=20

> Meanwhile, my deadline comes and I would really appreciate to see the pat=
ches=20
> applied by wednesday night.=20

If you can work on the above and resubmit v3 patchset, I'll happily=20
apply them.=20


Thanks!=20

Takashi=20

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27B59FA30
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 14:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E892163D;
	Wed, 24 Aug 2022 14:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E892163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661345062;
	bh=uys37k1nnGPERtBZWbJhA4SqZtqOroXQUrVqRHUtws8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0DNpikePahEtN+Ua7ZKcfO/vbh+8a9YmRmo0/i7Fo1qG3EFsrMLtjgMaCYnWTtU1
	 yUJf7kx/So+WHfEzWr7M3b1zR0k3LwNHQ+JTB1RDOBhEtl1qzf1VHIMYE6PmDizZVW
	 D60w360cRe0hkSTUT898S2PVFKS/kXJ1vVWy9zJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A8FF8014B;
	Wed, 24 Aug 2022 14:43:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC226F804BD; Wed, 24 Aug 2022 14:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com
 [148.163.139.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0098BF8014B
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 14:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0098BF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="ER04juSc"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
 by mx0b-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27OCSjn2014303
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 08:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type : content-transfer-encoding; s=pps01;
 bh=D1sVnyhjNhZK59/fbWTaKyX7HtGpPYoqbv4nJs/a7Hg=;
 b=ER04juScBxb0AOdIj4hQBHxBUv8ILi5B/aTZaiQNlZOrzXePQHC/zEOYs3d+ucRz8KID
 bmWGJFrgf4XdukbYjD+804bpZb7QjPeYwr5lr5qITcKFtOEhpQmscSIi+YtVXHeX9GEd
 y2JA7zNI1PICecMzTM0lXoCW2H7ZPTo7O8kCzSzYnvCcTo/TyUFAiICXAyHJPXPEPRQO
 NXjOCOwA+nVhrL0LWcpkpGNQUwbv604Hhn8S9c3QYppIIQ0YXA7EHnsJTaTfFD46lXK/
 dAg4q8jEnuYHG5whRZN0XG3KgOVAfpMwAPciK9CqbtuoTIB/tN9bAYG6zW/oDvF7M0QI kQ== 
Received: from sendprdmail20.cc.columbia.edu (sendprdmail20.cc.columbia.edu
 [128.59.72.22])
 by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 3j5ajj2e34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 08:43:11 -0400
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by sendprdmail20.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27OCghPh019548
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 08:43:10 -0400
Received: by mail-ua1-f71.google.com with SMTP id
 z29-20020ab05bdd000000b00387516e48a5so4494925uae.13
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 05:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=D1sVnyhjNhZK59/fbWTaKyX7HtGpPYoqbv4nJs/a7Hg=;
 b=CRNlbhqv/UEau7Du6fujzFzIick4Yf/O+183cqCc0uP1tb6NCl+Sthe1puiJntp/IC
 b3bqaDMg/fVXOBwNEn/VbvneMa/Xp7raC1FKRvxbccxZIyYA4MgLq0wOu+eRX7RwHO+t
 aKAPfnp4PPP6nTCCDjiVNBtJ6LdqgO5S4bNaW9rrge0+qEGQid1+SjBJzEMh7wiHntcg
 8aT/YdHmMQL2Ip/DpcJWqmecL6byeZ4vA6MyXctrqc5VokuKuz9mp2KJzEFKQekhSwCy
 rpgpT5J8xIaYmRLTKVfoY0DXwrKLdFDLP0m63JjxfhZJ4kOkYcjF836bFOzSELi2sMyw
 rAGw==
X-Gm-Message-State: ACgBeo0gFFG7w5k1DgcXFEYpPaXGNFB3eehvdO9nO8XmJPUApKQGOdzd
 f5Mop/Q4hwBe+pqsVUcBNBpOIQTtDdgHdIHrZ/SUvdagPAwyZd2RcoVw3ijfWC7ez0L0zVQ3Z4U
 QolQxjSqGWQb/XpTTJm5H2e6voz0OFfrNNy69exUe2jlpliQ=
X-Received: by 2002:a67:d493:0:b0:390:4c24:804c with SMTP id
 g19-20020a67d493000000b003904c24804cmr6740465vsj.71.1661344990368; 
 Wed, 24 Aug 2022 05:43:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Ta9H1dy1U3YxrNGSeRCUgkUK5fHdETocRYPzzyjbe2vbshp51oKjLiGxW0un+lUAyH4R08vvo8zKWAxzgLG0=
X-Received: by 2002:a67:d493:0:b0:390:4c24:804c with SMTP id
 g19-20020a67d493000000b003904c24804cmr6740449vsj.71.1661344989721; Wed, 24
 Aug 2022 05:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220823072717.1706-1-tiwai@suse.de>
 <20220823072717.1706-2-tiwai@suse.de> <87lerenpoq.wl-tiwai@suse.de>
In-Reply-To: <87lerenpoq.wl-tiwai@suse.de>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Wed, 24 Aug 2022 08:42:58 -0400
Message-ID: <CALbthtc7QH9Gvi_hpvyBEbV9eovoqXNoOMu9R_k0p9zeafPS3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: seq: Fix data-race at module auto-loading
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yaBt3wVSmFEa6_F-7Eowhsc2K1-xE5SY
X-Proofpoint-GUID: yaBt3wVSmFEa6_F-7Eowhsc2K1-xE5SY
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=10 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 bulkscore=10 impostorscore=10
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208240048
Cc: Abhishek Shah <abhishek.shah@columbia.edu>, alsa-devel@alsa-project.org
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

Apologies, I just realized the previous patch raised incompatible
integer conversion warnings on that line during compilation. In the
future I'll keep a closer eye out for relevant warnings when testing.

This patch still eliminates the race we initially reported.

Best,

Gabe

On Wed, Aug 24, 2022 at 2:03 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 23 Aug 2022 09:27:17 +0200,
> Takashi Iwai wrote:
> >
> > It's been reported that there is a possible data-race accessing to the
> > global card_requested[] array at ALSA sequencer core, which is used
> > for determining whether to call request_module() for the card or not.
> > This data race itself is almost harmless, as it might end up with one
> > extra request_module() call for the already loaded module at most.
> > But it's still better to fix.
> >
> > This patch addresses the possible data race of card_requested[] and
> > client_requested[] arrays by replacing them with bitmask.
> > It's an atomic operation and can work without locks.
> >
> > Reported-by: Abhishek Shah <abhishek.shah@columbia.edu>
> > Cc: <stable@vger.kernel.org>
> > Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kerne=
l.org_r_CAEHB24-5Fay6YzARpA1zgCsE7-3DH9CSJJzux618E-3DKa4h0YdKn-3DqA-40mail.=
gmail.com&d=3DDwIBAg&c=3D009klHSCxuh5AI1vNQzSO0KGjl4nbi2Q0M1QLJX9BeE&r=3DEy=
AJYRJu01oaAhhVVY3o8zKgZvacDAXd_PNRtaqACCo&m=3D5zfWpItqvL3lHhUMgi-DyAe7DauvB=
jWwe5UaP0CquJh8c8-phq2TFeGOm0TUvrBw&s=3DlnBmR8icRLp1uw0Gei6AgrBAaoROKuS3p0L=
fDWHyyD4&e=3D
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
>
> Gah, there was an obvious type in the patch.
> The correct version is below, and I merged it now.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH v2] ALSA: seq: Fix data-race at module auto-loading
>
> It's been reported that there is a possible data-race accessing to the
> global card_requested[] array at ALSA sequencer core, which is used
> for determining whether to call request_module() for the card or not.
> This data race itself is almost harmless, as it might end up with one
> extra request_module() call for the already loaded module at most.
> But it's still better to fix.
>
> This patch addresses the possible data race of card_requested[] and
> client_requested[] arrays by replacing them with bitmask.
> It's an atomic operation and can work without locks.
>
> Reported-by: Abhishek Shah <abhishek.shah@columbia.edu>
> Cc: <stable@vger.kernel.org>
> Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.=
org_r_CAEHB24-5Fay6YzARpA1zgCsE7-3DH9CSJJzux618E-3DKa4h0YdKn-3DqA-40mail.gm=
ail.com&d=3DDwIBAg&c=3D009klHSCxuh5AI1vNQzSO0KGjl4nbi2Q0M1QLJX9BeE&r=3DEyAJ=
YRJu01oaAhhVVY3o8zKgZvacDAXd_PNRtaqACCo&m=3D5zfWpItqvL3lHhUMgi-DyAe7DauvBjW=
we5UaP0CquJh8c8-phq2TFeGOm0TUvrBw&s=3DlnBmR8icRLp1uw0Gei6AgrBAaoROKuS3p0LfD=
WHyyD4&e=3D
> Link: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.=
org_r_20220823072717.1706-2D2-2Dtiwai-40suse.de&d=3DDwIBAg&c=3D009klHSCxuh5=
AI1vNQzSO0KGjl4nbi2Q0M1QLJX9BeE&r=3DEyAJYRJu01oaAhhVVY3o8zKgZvacDAXd_PNRtaq=
ACCo&m=3D5zfWpItqvL3lHhUMgi-DyAe7DauvBjWwe5UaP0CquJh8c8-phq2TFeGOm0TUvrBw&s=
=3DFye5MLoxP4koy4AoFB2JfMaHXzfH8QflMxB0mZrmXOs&e=3D
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: fix compile error
>
>  sound/core/seq/seq_clientmgr.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmg=
r.c
> index 2e9d695d336c..2d707afa1ef1 100644
> --- a/sound/core/seq/seq_clientmgr.c
> +++ b/sound/core/seq/seq_clientmgr.c
> @@ -121,13 +121,13 @@ struct snd_seq_client *snd_seq_client_use_ptr(int c=
lientid)
>         spin_unlock_irqrestore(&clients_lock, flags);
>  #ifdef CONFIG_MODULES
>         if (!in_interrupt()) {
> -               static char client_requested[SNDRV_SEQ_GLOBAL_CLIENTS];
> -               static char card_requested[SNDRV_CARDS];
> +               static DECLARE_BITMAP(client_requested, SNDRV_SEQ_GLOBAL_=
CLIENTS);
> +               static DECLARE_BITMAP(card_requested, SNDRV_CARDS);
> +
>                 if (clientid < SNDRV_SEQ_GLOBAL_CLIENTS) {
>                         int idx;
>
> -                       if (!client_requested[clientid]) {
> -                               client_requested[clientid] =3D 1;
> +                       if (!test_and_set_bit(clientid, client_requested)=
) {
>                                 for (idx =3D 0; idx < 15; idx++) {
>                                         if (seq_client_load[idx] < 0)
>                                                 break;
> @@ -142,10 +142,8 @@ struct snd_seq_client *snd_seq_client_use_ptr(int cl=
ientid)
>                         int card =3D (clientid - SNDRV_SEQ_GLOBAL_CLIENTS=
) /
>                                 SNDRV_SEQ_CLIENTS_PER_CARD;
>                         if (card < snd_ecards_limit) {
> -                               if (! card_requested[card]) {
> -                                       card_requested[card] =3D 1;
> +                               if (!test_and_set_bit(card, card_requeste=
d))
>                                         snd_request_card(card);
> -                               }
>                                 snd_seq_device_load_drivers();
>                         }
>                 }
> --
> 2.35.3
>


--=20
Gabriel Ryan
PhD Candidate at Columbia University

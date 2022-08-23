Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB059E587
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94ABA169F;
	Tue, 23 Aug 2022 17:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94ABA169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266860;
	bh=EBL9xZ/rwfP1uBOatSCsRHO5etKdD4ri8Q2+0wM/QAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loDB7aSgNU4SiJUsH+qqWKtCUK3Nqc/VJCtKvf9I//VZCDpC+JSOwJif4TuOKlcXS
	 dI73sXGKCq5fHMjtufL/AabEtCB6TrxR0JMQHxZWnBwYizrK8iQubBYpU5BRGMYbSl
	 yJLks4oQGdsRcz3D7rrds/GNRcWU/dUwphWdcpc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847DDF80535;
	Tue, 23 Aug 2022 16:58:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 883B2F80525; Tue, 23 Aug 2022 15:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93ADDF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 15:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93ADDF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="K/SUY/qV"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NDlKEn000318
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pps01; bh=XpcSKRmBM31iOTmtJtjEgukFOvgF3GXKFo6Os2xuMl4=;
 b=K/SUY/qV1LeaM1TrsvnuXcH5enNfMVL8njVXAe9LufWg29zYS+mW1akjy/BkwkaQGeLY
 i4KdIhCDMVo2EmR1sIEaJ5ArVdzqFq2ooQGLsDwcQ4gHPOwUH2X0IrNp36Y8RG9+b5jk
 1vpBvt+QzvqKpYV4CT+dQo/FWiwtbxyZAggNRjc6anYORa9J08SUkvkqBaqHz0rDIBYO
 2ys40hSvM5CVaXwAdeMT7hPJvkFy+cyvCOgrf8HxSlIaAq4r939L8J3rIzJ1H21FBY5g
 Rr3MwJWhGlPdPregsq1smc6Frmb+38wkvAF+od0mol2B8M+ZSfnxbK/b13KkHLQMfjLk SQ== 
Received: from sendprdmail21.cc.columbia.edu (sendprdmail21.cc.columbia.edu
 [128.59.72.23])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 3j4wmfh2jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:49:09 -0400
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by sendprdmail21.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27NDn4BX064043
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:49:08 -0400
Received: by mail-ua1-f69.google.com with SMTP id
 97-20020a9f22ea000000b00393a88dd65aso3291476uan.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XpcSKRmBM31iOTmtJtjEgukFOvgF3GXKFo6Os2xuMl4=;
 b=269j4hi6HQKQ1DlL7Kzw3h8nuUQj1haajAvTQvjvv5ureZ59ZZmV+2skdTZs3wN2hG
 Eu9sEiflVNJqWWDtRCryW9SWnQ25vo04MS7+PGJT445MYxfSa/EW9yYQqkfJKtijwEI/
 8cH9g3Q0z4CcA0YXv+AbCygnmzVfc8CgljuMn8Cs9Co7KQUTpk1gaM6M9+jG7Ng1oxll
 OW6AH6sEFxlAJXbwVnsvplHH6O3Ihj313twHjWOqLWU5hh81dEOoKWwrR1AVBivL2x6m
 nmcwUpIyI4ZY8olihNmtkPCjnxAizQyDIV8r3uVLDn4GDkNnSF40r1l+cznV0AZmAjeh
 AXWQ==
X-Gm-Message-State: ACgBeo18aA9mmDrDjwlUlY0Bb8HLHFlSwp8lzaJI/W7dMbdXbhZJ4kca
 Ia8cVNqFTLbGaC3GmxfwvYpe0Ni4tQOYubgbekQ8aDFYeKhzduaIB2E9Lfaktw42OhrqHeKI0Qy
 3T2FNsZ7gL4fn59Xu2AuYgFEwy7bPMj79Qd13BzgilLnyX/U=
X-Received: by 2002:a05:6102:5490:b0:380:3982:2f97 with SMTP id
 bk16-20020a056102549000b0038039822f97mr8986133vsb.84.1661262548151; 
 Tue, 23 Aug 2022 06:49:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4mP7YdW2Rpi4uUP8qfJRkpAeJ0+5UXaC0UMoUQZch9M5lszPf8GrjnBXOQRbDCpCXDWA2l4gNoZHRQZ2vSt/Y=
X-Received: by 2002:a05:6102:5490:b0:380:3982:2f97 with SMTP id
 bk16-20020a056102549000b0038039822f97mr8986121vsb.84.1661262547751; Tue, 23
 Aug 2022 06:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220823072717.1706-1-tiwai@suse.de>
 <20220823072717.1706-2-tiwai@suse.de>
In-Reply-To: <20220823072717.1706-2-tiwai@suse.de>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Tue, 23 Aug 2022 09:48:57 -0400
Message-ID: <CALbthtfyrPfmFLL7hsSRGiuGRmyExgp_HnMZ8kztpmEs0C7J8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: seq: Fix data-race at module auto-loading
To: Takashi Iwai <tiwai@suse.de>
X-Proofpoint-ORIG-GUID: bYPmrne1QeGmBZ1z0DY88-on2-cHtwO4
X-Proofpoint-GUID: bYPmrne1QeGmBZ1z0DY88-on2-cHtwO4
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=10 adultscore=0 lowpriorityscore=10 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=10
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208230054
X-Mailman-Approved-At: Tue, 23 Aug 2022 16:58:46 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

We have tested this patch and confirm it eliminates the race we initially
reported.

Best,

Gabe

On Tue, Aug 23, 2022 at 3:27 AM Takashi Iwai <tiwai@suse.de> wrote:

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
> Link:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_r_=
CAEHB24-5Fay6YzARpA1zgCsE7-3DH9CSJJzux618E-3DKa4h0YdKn-3DqA-40mail.gmail.co=
m&d=3DDwIDAg&c=3D009klHSCxuh5AI1vNQzSO0KGjl4nbi2Q0M1QLJX9BeE&r=3DEyAJYRJu01=
oaAhhVVY3o8zKgZvacDAXd_PNRtaqACCo&m=3DoPAvNa2pfJuUIAiwbiE1IJgoQhWb8AB7IBdJq=
WslhhuZ-LwBrrgAnFUthdapQska&s=3DK26ukWoQce9A8OzoQEGfRXynlOouHQ79dnAnD7xriNw=
&e=3D
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/seq/seq_clientmgr.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/sound/core/seq/seq_clientmgr.c
> b/sound/core/seq/seq_clientmgr.c
> index 2e9d695d336c..052a690b5e11 100644
> --- a/sound/core/seq/seq_clientmgr.c
> +++ b/sound/core/seq/seq_clientmgr.c
> @@ -121,13 +121,13 @@ struct snd_seq_client *snd_seq_client_use_ptr(int
> clientid)
>         spin_unlock_irqrestore(&clients_lock, flags);
>  #ifdef CONFIG_MODULES
>         if (!in_interrupt()) {
> -               static char client_requested[SNDRV_SEQ_GLOBAL_CLIENTS];
> -               static char card_requested[SNDRV_CARDS];
> +               static DECLARE_BITMAP(client_requested,
> SNDRV_SEQ_GLOBAL_CLIENTS);
> +               static DECLARE_BITMAP(card_requested, SNDRV_CARDS);
> +
>                 if (clientid < SNDRV_SEQ_GLOBAL_CLIENTS) {
>                         int idx;
>
> -                       if (!client_requested[clientid]) {
> -                               client_requested[clientid] =3D 1;
> +                       if (!test_and_set_bit(clientid, client_requested)=
)
> {
>                                 for (idx =3D 0; idx < 15; idx++) {
>                                         if (seq_client_load[idx] < 0)
>                                                 break;
> @@ -142,10 +142,8 @@ struct snd_seq_client *snd_seq_client_use_ptr(int
> clientid)
>                         int card =3D (clientid - SNDRV_SEQ_GLOBAL_CLIENTS=
) /
>                                 SNDRV_SEQ_CLIENTS_PER_CARD;
>                         if (card < snd_ecards_limit) {
> -                               if (! card_requested[card]) {
> -                                       card_requested[card] =3D 1;
> +                               if (!test_and_set_bit(card_requested,
> card))
>                                         snd_request_card(card);
> -                               }
>                                 snd_seq_device_load_drivers();
>                         }
>                 }
> --
> 2.35.3
>
>

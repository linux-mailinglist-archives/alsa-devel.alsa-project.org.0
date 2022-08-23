Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1A59E588
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6282A162F;
	Tue, 23 Aug 2022 17:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6282A162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266879;
	bh=KHLP2hfNrsTOqj7864INaNcCesiHIIuaXBtSHwrkjSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bThBAFpF0865dXNiGATlkUJhQN13whuudXVFlZn4Unnl70FIBK5ZQBhU4qHW76Zez
	 vGKq4pGi9AmlXVKbSR712JCq5JKc61dOHppm5dENC9Z6GyHWTp4YoUf/eTvgoGckrq
	 LHz1r+EtX2/s5YlieJHuPhxVIqlCRv8kwnNKJUgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41FCAF80548;
	Tue, 23 Aug 2022 16:58:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20EDCF8020D; Tue, 23 Aug 2022 15:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB0BBF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 15:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB0BBF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="JqWJ1Ais"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NDlwwn003686
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pps01; bh=98LWiUOoO/0cptBYctE3qRKyUwqsWVzJm24TMIdithQ=;
 b=JqWJ1AisRdpXYbUtBUoeNKADzvhB800r1NdjcZ3V7b+D+gRsgzGQEfiJCFHJ6TaYq5UF
 ENowdjtcVUGTtKN3ZYV9g2b6qX+9Bu7io6DjJvHSx2vI6D0/4VEkIAwLLD7aczgMrBsH
 bCPplYICTn5q81GyrPibdAAUsT6of5mODoiHui1ABCjGJF3zXK7wIbDwbjfuFCWD8MIr
 OGY5bWy1FpGuoK1NKS7Vv1MWY0yBLL6n/9xnWPBbxdn3MZxvADIJoGdgwQdVoOG3qQJs
 mfApT2i7LUhlMlOAlAclHcAlsMIN7fxxEGHS0Cg5t7KsUf50TSYqbnOB8uaVws84fxmP Iw== 
Received: from sendprdmail22.cc.columbia.edu (sendprdmail22.cc.columbia.edu
 [128.59.72.24])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 3j4wma93hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:50:33 -0400
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by sendprdmail22.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27NDoWam123217
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:50:32 -0400
Received: by mail-vk1-f200.google.com with SMTP id
 t131-20020a1f9189000000b003841482eeb2so2015366vkd.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=98LWiUOoO/0cptBYctE3qRKyUwqsWVzJm24TMIdithQ=;
 b=APEo2embq+HaCj2aKLFAm0dFoOJXkmKxhOw+vjcilXJJ6I1SImfLXfYtqio201rnB6
 AAmYAqNrUos4LGU2R/DcyGIFaCyayXI5+URjNWbDqPUuuqk7H2T1d5wgeUfj0ux+Ln5F
 5SHCCRG9hm37aP7ZfOhmPRrLNqrOvfkSGxwqgg9dhXKzUj5nVglHQP+UKu5LbqBmqtDQ
 7sLtmKiFkQw+rfKQSTNhhcjSHJO4iZN1+15vwCjN48NQ9NTZANq3SQIKwTP4O0IMMqY7
 i6xUvkOLllzVD8KttBcL+C7lSB/bZ4e6gkhxQN9mcAJsUiARg+MMkoVNh3OggnU2hv7A
 9F3w==
X-Gm-Message-State: ACgBeo0AeExhAOgKFrF7kMtKvrKQ4MRooI0SKmYSaMdJvut2q/arr9K5
 n9Oit+s3e4XJ1hIL+g1KC9NPyxxXVfiJmJCmYDyJxoU/4rpDEaxYAeISyaJm1NVVZhjuXdrAHq3
 63bgtaFW1PXQqNHTNDjrOyc77AO/EEcG8DN4aWsK5l7Ja/MU=
X-Received: by 2002:a67:d493:0:b0:390:4c24:804c with SMTP id
 g19-20020a67d493000000b003904c24804cmr4756235vsj.71.1661262632279; 
 Tue, 23 Aug 2022 06:50:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Lz9h4uY61mRqVarfd9qQWDcN0w/JaI5Z/VWo89ISvUO+FTYQLyqkouYYFTT+lZn9u5jkycrx+mCswYyjU8FU=
X-Received: by 2002:a67:d493:0:b0:390:4c24:804c with SMTP id
 g19-20020a67d493000000b003904c24804cmr4756222vsj.71.1661262631857; Tue, 23
 Aug 2022 06:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220823072717.1706-1-tiwai@suse.de>
In-Reply-To: <20220823072717.1706-1-tiwai@suse.de>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Tue, 23 Aug 2022 09:50:21 -0400
Message-ID: <CALbthtd6wJWWTQ0YM+cHW3-XcJPUzNszZdkpCg=9pnqj_hatRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ALSA: seq: oss: Fix data-race for max_midi_devs access
To: Takashi Iwai <tiwai@suse.de>
X-Proofpoint-GUID: 3TxYEdL1JqoprjL0ES-wDAd-47S68WIJ
X-Proofpoint-ORIG-GUID: 3TxYEdL1JqoprjL0ES-wDAd-47S68WIJ
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=10 impostorscore=10
 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=10 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230054
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

We have tested this patch and confirm it eliminates the race we observed on
max_mididev.

Best,

Gabe

On Tue, Aug 23, 2022 at 3:27 AM Takashi Iwai <tiwai@suse.de> wrote:

> ALSA OSS sequencer refers to a global variable max_midi_devs at
> creating a new port, storing it to its own field.  Meanwhile this
> variable may be changed by other sequencer events at
> snd_seq_oss_midi_check_exit_port() in parallel, which may cause a data
> race.
>
> OTOH, this data race itself is almost harmless, as the access to the
> MIDI device is done via get_mdev() and it's protected with a refcount,
> hence its presence is guaranteed.
>
> Though, it's sill better to address the data-race from the code sanity
> POV, and this patch adds the proper spinlock for the protection.
>
> Reported-by: Abhishek Shah <abhishek.shah@columbia.edu>
> Cc: <stable@vger.kernel.org>
> Link:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_r_=
CAEHB2493pZRXs863w58QWnUTtv3HHfg85aYhLn5HJHCwxqtHQg-40mail.gmail.com&d=3DDw=
IDAg&c=3D009klHSCxuh5AI1vNQzSO0KGjl4nbi2Q0M1QLJX9BeE&r=3DEyAJYRJu01oaAhhVVY=
3o8zKgZvacDAXd_PNRtaqACCo&m=3DCxIkVQqIvngOHaCRT98C_jGfJo6SNC38iwxKsCn-3yU1v=
AYynFqC_nB4PAgPegMm&s=3DB8XPQtfIHmyV0Z-NAEtd5FG1Indh15kFF_yJWOMLnz4&e=3D
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/seq/oss/seq_oss_midi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/core/seq/oss/seq_oss_midi.c
> b/sound/core/seq/oss/seq_oss_midi.c
> index 1e3bf086f867..07efb38f58ac 100644
> --- a/sound/core/seq/oss/seq_oss_midi.c
> +++ b/sound/core/seq/oss/seq_oss_midi.c
> @@ -270,7 +270,9 @@ snd_seq_oss_midi_clear_all(void)
>  void
>  snd_seq_oss_midi_setup(struct seq_oss_devinfo *dp)
>  {
> +       spin_lock_irq(&register_lock);
>         dp->max_mididev =3D max_midi_devs;
> +       spin_unlock_irq(&register_lock);
>  }
>
>  /*
> --
> 2.35.3
>
>

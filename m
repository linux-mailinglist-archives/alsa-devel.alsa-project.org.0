Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941CD6FA15E
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230D512AC;
	Mon,  8 May 2023 09:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230D512AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683531998;
	bh=45Urxui6lN+74rxWDPfvPxM4ulGuDPEXHPmmVSN7zns=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q3Jg9XpzOSrU+nlruYwRTX8xbNUmuWS43pReRhLOlfhrKkTRIy69cma2V1KgadJF9
	 Y80XBq+MSPiWr8fWxReLNqjpRviJ/jd1Ht56AlDZdG5iHhat4ZC1ZNiXs/3gzTFamA
	 bGNBARUxY2QrsVnwhDqvlnCEnLEP09v8OtIj48Xg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B048F8056F;
	Mon,  8 May 2023 09:45:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E1CDF8052D; Thu,  4 May 2023 15:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 737B9F80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 737B9F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dKmI1Re6
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-77d508ba6f1so142374241.2
        for <alsa-devel@alsa-project.org>;
 Thu, 04 May 2023 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683206760; x=1685798760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45Urxui6lN+74rxWDPfvPxM4ulGuDPEXHPmmVSN7zns=;
        b=dKmI1Re6g49Wo2s7cx2vhN7Tp9hZBhPbituB13/3/uNpA9AWN46/rYarJucdtkQrHk
         Q66qw1T3uxLeSuw3nKzQn+LBIOgOG93DkSP+sxp5UR2Oqy5drHXZUMfhCInHSDo2Fvu9
         o6eQwTGqVFgAa/Wc177MrQfA8hNVgbVutF4AoL+WTo6RwY872Uh/pZ41ywoAPpfMDP3O
         9T2heBJzHpbY9qTTR2U8bmRFAnryVaPXO4hZwP6TIC2ATnJcbAyTQVYH67XyJXwlJ4/w
         a6v1jBCNDxt3rzaXrAlUrFmPXdDSRzDObL50OfhzyokThvtqQizOeIH8B6W+3xG1/BAD
         a0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683206760; x=1685798760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45Urxui6lN+74rxWDPfvPxM4ulGuDPEXHPmmVSN7zns=;
        b=QXB9rK3Ty0gLHeQ5WB4r51UWU0iotDhBirZ9C9UiQ3m+giE/lMPM+oWXXrWD3IuB3r
         a7A5BJ0z1ZXSj4inrERNsTGkFRo0UPCVwj2WaYxKvtkRoz/SaCUCqmvANORau40J4rQV
         E+joV7Ko+c/Ky/cqoTjAvPO49M4aIjTWM2Fd2DsNSoQ6QM72stgJz+w5pYBQJykXk8DO
         v6H3ltlbmqwVSFmSWk5BFPQXpHGRJCmr+lFMQcqSRDqFOG4STn9kgI+gDY/lLwAec6U8
         DjsmshVykASN2DE7X/L5ALxDxnrDe9DYm/LGIUtTwTtrBkbkrwBq4XdfQhCF67avx6jB
         P7iA==
X-Gm-Message-State: AC+VfDwBbkl1/saiIPLsuNGJk4r0ubpeKFcFKysylxbKPYxjpKFJou1l
	dU5S8NiXO0dAxdYSV1sQVahjYUv+qpzQWHhZLQ8=
X-Google-Smtp-Source: 
 ACHHUZ4TkQQTi4FdRkQezw5u3gXIlXDSkPAOUsjJh9Piz08n5M2CNzQW8Zwt8EPbXRMUpzoelnZr2qZIV5RyPqFP5UI=
X-Received: by 2002:a67:f80f:0:b0:434:41aa:73af with SMTP id
 l15-20020a67f80f000000b0043441aa73afmr2534652vso.24.1683206759984; Thu, 04
 May 2023 06:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <266661e5-ac86-1590-55d9-5f14e6486557@perex.cz>
In-Reply-To: <266661e5-ac86-1590-55d9-5f14e6486557@perex.cz>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Thu, 4 May 2023 21:25:49 +0800
Message-ID: 
 <CAAJw_Zv4VZwDu-sEMAktn3b5Ycom=Yaa2swW4ZnzpohEfnSEXQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: jeff.chua.linux@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V63MY4TW7EOYR3MDCWX34EX77FS3W3JC
X-Message-ID-Hash: V63MY4TW7EOYR3MDCWX34EX77FS3W3JC
X-Mailman-Approved-At: Mon, 08 May 2023 07:44:53 +0000
CC: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V63MY4TW7EOYR3MDCWX34EX77FS3W3JC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 4, 2023 at 9:08=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wro=
te:
>
> On 04. 05. 23 15:00, Oswald Buddenhagen wrote:
> > Turns out that we cannot rely on the application pointer being updated
> > in top-up mode, as its primary purpose is to remain operational in
> > free-running mode as used by dmix.
> >
> > So we logically revert some bits from commit 9f656705c5faa ("ALSA: pcm:
> > rewrite snd_pcm_playback_silence()"), but we retain the bug fixes and
> > try to make the code paths congruent.
>
> It would be better to revert the broken patch and make changes on top of =
the
> original code. This is really difficult to review.

Just to confirm that the patch works. Thanks!

Jeff

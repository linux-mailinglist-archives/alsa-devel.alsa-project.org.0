Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D765C2AF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 16:07:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6F00E348;
	Tue,  3 Jan 2023 16:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6F00E348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672758421;
	bh=uMwgKhtSQHEKAfXVushGs26uoObSTZLsIG/pWS9jd0k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PlO1cJDExIZFUmrDEl/0DNdS+ZzJF3yaYAhad2+mfeuMdtcak76RxKV7q5VpNJIHl
	 4g7TpgNRXT2SascS1eiXDik88EnCHauWArdpxBuqLDKGYCJ3+ZZQw3UJfagm352DIV
	 u7T9faqYcRHz4NUvN/vdcx/0gv1AxSGbEB0Uwwqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46DBFF8003C;
	Tue,  3 Jan 2023 16:06:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C1AF8047B; Tue,  3 Jan 2023 16:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0BECF800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 16:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0BECF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=jbszDPxz
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so12236779fac.2
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ln3Hpxj04whwiUwy38KPHvXsJPvtlkVMO14jhU5Bin8=;
 b=jbszDPxzVNpLIap5ukIi81Ulb4x816IiBtHv+NmuSI5aUvrk96T7sfkGGtc/K08duO
 O6awQPQiJQsqvt8/R0i3rhF9kea9HKjVhk0LjVC1gjrdPL3+WcBsCSOAD2W8i/Rxjnu3
 YXVr13F+O3Fr8Lxtjcka7BtJz1eJuxgYCUOFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ln3Hpxj04whwiUwy38KPHvXsJPvtlkVMO14jhU5Bin8=;
 b=5mvT4K/AOJ2wfva+1sdwFhvuhtdR9eLpc6HRe8iwN5CyhYU/3UBh02cu9sksZ8d54F
 cIAKW7/sjf/V7oRveEfaE1kdLxnHGe1UV5/k7Tq8PkarKW8hDsfRem6oX+L4ckd1lJ2X
 mPzWk5cKPuLcWqcXzmvoVuGPlYETy9kD8Vnm5yvlfdRbZhy+p7IBBIVnc4qlDr7MJhOV
 EI/cjBGUagLu+9x5dkf80bzaYAwAgtTkyVt0YZxB/MCqyud+T2snxBtJMJ1Lh7BXgOWO
 NWAmopk1df6gg2DX3ChCoiGVBMm8H0dMiw/NkPRYZV0izobGgOPfbAL5LV2L/a3/SHM2
 MUcQ==
X-Gm-Message-State: AFqh2kpUu5GbjXI2dwxdxujMPH1IROu/gdRZ0jA65MrH3JnqQnJyNxEW
 cDk/joAywmnTmqsQpZWgqxo/70oTr9U2/ukc+rE6Eg==
X-Google-Smtp-Source: AMrXdXs7QoifFER29bfCAsB0Fub0McfhgnzUfkpUj9BvtbBuATd0zwtbAYjNm79RajNWkejZ1HwbX8j3KBol1iYbJp4=
X-Received: by 2002:a05:687c:189:b0:14f:a2ed:988f with SMTP id
 yo9-20020a05687c018900b0014fa2ed988fmr2107981oab.220.1672758355026; Tue, 03
 Jan 2023 07:05:55 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
In-Reply-To: <87sfgrrb5f.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:05:18 +1100
Message-ID: <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 4 Jan 2023 at 00:38, Takashi Iwai <tiwai@suse.de> wrote:
>
> Thanks; that's helpful.
>
> Could you try to revert the commit
> 9902b303b5ade208b58f0dd38a09831813582211
>     ALSA: usb-audio: Avoid unnecessary interface change at EP close
as a blind shot?
>
> Also, there has been a series of fixes for other issues, and it might
> be worth to try as well:
>   https://lore.kernel.org/r/20230102170759.29610-1-tiwai@suse.de
>

I built 3 kernels: one with the reverted commit, one with the patches
you linked, and one with both. These builds were based on 6.1.2.

None of them worked. Also, even though I continued to boot with
snd_usb_audio.dyndbg=+p, none of the kernel logs showed the debug
messages that the other versions did. I'm baffled why this is.

I did notice that the order that the detected sound devices appeared
in alsa was varying. That's probably not relevant though.

Links to logs:

Revert only
https://hastebin.com/avinasiruj.apache

New patches only
https://hastebin.com/aqepesokam.apache

Both
https://hastebin.com/igilaqujus.apache

--
Michael

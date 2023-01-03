Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4665C2D4
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 16:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DAEEE3CD;
	Tue,  3 Jan 2023 16:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DAEEE3CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672758991;
	bh=hLcII6jMGOCSjmx7dWL2WRwK1YhBhRy/4N8nf33bmio=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CGfe/vwDbYLjtDV4hg5RLy3k5z/+rC/XLyeS+t+Etp8SVVCJDXLe4I+vj1yovSX0O
	 /2/tiL+UiZ2jaRrvV9g2II4NIUBfSsAN4TGNpnqe/jIYUv91T0CMVYRu8cBSo+0zs3
	 iy5X9cMLhFUEDaJ1nAizUnpGis4dKhfEDS480I8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C100CF804AA;
	Tue,  3 Jan 2023 16:15:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D21F9F8047B; Tue,  3 Jan 2023 16:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBEE8F8003C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 16:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEE8F8003C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=JpRf7WA8
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1442977d77dso37061810fac.6
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6mpKJos/FPMtqgzKryfkykw/TumKk6Lc1MADv4VNDaw=;
 b=JpRf7WA8CR1VvL1u9d7F0pRpDV7B/2mtiBVwj/uQ0vvHj51xLPBBHZbcmZ4FhLc53e
 7MTRjmhjlpBEDDMygvniKGDlSK7EAeThLiVnzoHmLMiFBvVDG35zBj1ZPNrInrrEJEd4
 aUv8/wdm1CjSSywI58kB+2yx49Vsuc4aIPo2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6mpKJos/FPMtqgzKryfkykw/TumKk6Lc1MADv4VNDaw=;
 b=HL7XxgqBQlGpvLz5XpaJVJWFElVgHCabBMPlGE2iUYgB+7l5NX9RUU/C7Sw9L20uy9
 AlEgNusI2amO+XyzHynxkBDWw6O0l87QMdN8XKxmtZjGO69lIj6wW/M+udR6taI2VOG7
 f+22mHV+1R/yL8kL/Rxkz65DOUvkjqHvZSY7hcVBS9cleXiZ3+9ZhCg9/r8+g2Iv0O/5
 EPgVSDBrIQY2XVOFcMuPzq5RPzV9ILIM9MvDhoNjO+EtitUyTWj/2B/S9bB9MMYHETy2
 HAfuRwvCkAS79o+EPKiU8r36FVbJQ3VCoWwyA9F3G7wQmvc2+UBnpYT2LOfHVRmpDy5j
 YcNA==
X-Gm-Message-State: AFqh2ko2QGDH7+ktJkNhptPvxB+QtKKXDcYrHhgNueeqTm5olnwi9qm/
 olJWptAugGv0FPu9KI17CLCuMvSI5fZNS7K8+/g6gw==
X-Google-Smtp-Source: AMrXdXv3dQDnfdNBNw+MQp56Vjvne/Kn7e1ltujbhspbCMkGntbNdh9QTHMnc3OVzHwx4LzFX2C+gndhklK2kW3cefI=
X-Received: by 2002:a05:687c:189:b0:14f:a2ed:988f with SMTP id
 yo9-20020a05687c018900b0014fa2ed988fmr2110159oab.220.1672758933004; Tue, 03
 Jan 2023 07:15:33 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
In-Reply-To: <87bknfr6rd.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:14:57 +1100
Message-ID: <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
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

On Wed, 4 Jan 2023 at 02:13, Takashi Iwai <tiwai@suse.de> wrote:
>
> That's weird.  Is snd_usb_audio driver bound with the device at all?
> That is, does it appear in /proc/asound/cards?
>

Yes, it's there.

0 [V49            ]: USB-Audio - V49
                     Alesis V49 at usb-0000:08:00.1-3, full speed
1 [NVidia         ]: HDA-Intel - HDA NVidia
                     HDA NVidia at 0xfc080000 irq 154
2 [U192k          ]: USB-Audio - UMC404HD 192k
                     BEHRINGER UMC404HD 192k at usb-0000:08:00.1-4, high speed
3 [Generic        ]: HDA-Intel - HD-Audio Generic
                     HD-Audio Generic at 0xfca00000 irq 156

--
Michael

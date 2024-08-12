Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A519952A72
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D224A2BDD;
	Thu, 15 Aug 2024 10:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D224A2BDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710513;
	bh=lovVcsparyQLzbiTdzR4lipqejlHTuMFMVwgsKqkt5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j8KYTBRcscx8p9/v74UgUj080sOJyH7KlovPwau2Q5icvE8TmK+a517Vf5+pAwiAa
	 4avi/BfXirL26BonBBjz/6YgMNFNFQiStfaWHyvZkSSD0Gfq7+Ej8gMN5gpkwD4Mpb
	 3S+tSR5JG9u4yTfkSzQrdLdmEuIQNwU+86FRCjyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56EB7F80CBE; Thu, 15 Aug 2024 10:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA01F89616;
	Thu, 15 Aug 2024 10:24:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CBB6F80423; Mon, 12 Aug 2024 09:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FFA6F80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 09:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FFA6F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256
 header.s=default header.b=QumNQx4B
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 4D1B62E096D1
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 10:46:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1723448771;
	bh=lovVcsparyQLzbiTdzR4lipqejlHTuMFMVwgsKqkt5Y=;
	h=Received:From:Subject:To;
	b=QumNQx4BurKSTJTXjNLxeCRSqNhzbR/7PwnGIY6IjeqCRhgCq2DhDCyNUzeRwZnuK
	 FIY2ZpR8fmheaeii+yFmSHYe3ABVi/dn8C9tHMBeV3tOAItH70dBTyfcgBg00+SW9+
	 ICFYT9jly0NDf5uh0u/FJErbA6agianLE0j5gpbA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f1870c355cso39310721fa.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Aug 2024 00:46:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCULTkIb3cksyp8i2dcPlxZLqGTFqfgyb6syqNoC6Fo3kzwBkbPciLiPyu7PZN07ZZQ4vV/wC7yQ75LKqicnqZBfYBGehjZq2lw8r3g=
X-Gm-Message-State: AOJu0Yx8Y3YlWIB13FkMBm1MALsAn+F+8//y8OSg2emiBxeb/vz650yK
	lxvJxXbsWJ6cQKnEzeERJX1URpd8JcXYCdXv5gQ0atcenHzkT/7DqhrGcMnsmDvOxSnaT+4t5Ax
	iXUHbqH3oox8uI+ajTbLEkzXpteg=
X-Google-Smtp-Source: 
 AGHT+IEGDxiXteEGjvdwhj+3EgeaSWNthj1Z7EwZ38GB6EXFwI85n3rWFDPUxgr+Yz72Dce2gCSF873McunVeaAwslI=
X-Received: by 2002:a2e:6a02:0:b0:2ef:2b6e:f8c8 with SMTP id
 38308e7fff4ca-2f1a6cfa608mr57926631fa.42.1723448770481; Mon, 12 Aug 2024
 00:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240812045325.47736-1-jlobue10@gmail.com>
 <87frra2ocp.wl-tiwai@suse.de>
In-Reply-To: <87frra2ocp.wl-tiwai@suse.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 Aug 2024 10:45:59 +0300
X-Gmail-Original-Message-ID: 
 <CAGwozwF7aR5UypRTe7tNFR+xOfQ=rhqkzYUgBcYH4_LvO9_zXQ@mail.gmail.com>
Message-ID: 
 <CAGwozwF7aR5UypRTe7tNFR+xOfQ=rhqkzYUgBcYH4_LvO9_zXQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: tas2781: Fix ROG ALLY X audio
To: Takashi Iwai <tiwai@suse.de>
Cc: Jonathan LoBue <jlobue10@gmail.com>, perex@perex.cz, tiwai@suse.com,
	shenghao-ding@ti.com, kailang@realtek.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	derekjohn.clark@gmail.com, luke@ljones.dev, benato.denis96@gmail.com,
	Kyle Gospodnetich <me@kylegospodneti.ch>,
 Jan Drogehoff <sentrycraft123@gmail.com>,
	Richard Alvarez <alvarez.richard@gmail.com>,
	Miles Montierth <cyber_dopamine@intheblackmedia.com>, "Chen,
 Robin" <robinchen@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <172344877185.29889.6099517917494462069@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
X-MailFrom: lkml@antheas.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PI37BHTWAFU5JDNRFDJOSLOXHUKRCR4D
X-Message-ID-Hash: PI37BHTWAFU5JDNRFDJOSLOXHUKRCR4D
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:24:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3EAVBW3E5Y6D4E6OMLBB47KG7LE6HEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
I have spoken with Shenghao and Robin Chen (who I CC) from Texas Instruments.

There is no such thing as TAS2XXX1EB3. For Ally X, there are two firmware files:
TAS2XXX1EB30 and TAS2XXX1EB31. Both are licensed with GPL
according to Shenghao.

Since the linux driver has no concept of the 0 and 1 suffix, I propose
we symlink the
0 one to TAS2XXX1EB3. If required, the driver can be augmented in the future
to either choose the 0 or 1 file.

According to Robin Chen about the difference with the files:
> They are IO, I/F settings, audio tuning and speaker protection. In current cause, you can ignore them.

The only source we know of right now is the Windows executable.

I would be happy to upload those files in linux-firmware later this week.

We validated that this patch meets all basic functionality, including no pops
during sleep and mic operation.

Some users reported lower volume than windows, but perhaps that is due to
Dolby integration in windows, or using the 0 firmware file instead of 1 and
in any case a minor issue.

Best,
Antheas

On Mon, 12 Aug 2024 at 10:26, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 12 Aug 2024 06:53:25 +0200,
> Jonathan LoBue wrote:
> >
> > This patch enables the TI TAS2781 amplifier SoC for the ASUS ROG ALLY X.
> > This is a design change from the original ASUS ROG ALLY, creating the need
> > for this patch. All other Realtek Codec settings seem to be re-used from
> > the original ROG ALLY design (on the ROG ALLY X). This patch maintains the
> > previous settings for the Realtek codec portion, but enables the I2C
> > binding for the TI TAS2781 amplifier (instead of the Cirrus CS35L41 amp
> > used on the original ASUS ROG ALLY).
> >
> > One other requirement must be met for audio to work on the ASUS ROG ALLY X.
> > A proper firmware file in the correct location with a proper symlink. We
> > had reached out to TI engineers and confirmed that the firmware found in
> > the Windows' driver package has a GPL license. Bazzite Github is hosting
> > this firmware file for now until proper linux-firmware upstreaming can
> > occur. https://github.com/ublue-os/bazzite
> >
> > This firmware file should be placed in
> > /usr/lib/firmware/ti/tas2781/TAS2XXX1EB3.bin with a symlink to it from
> > /usr/lib/firmware/TAS2XXX1EB3.bin
> >
> > Co-developed by: Kyle Gospodnetich <me@kylegospodneti.ch>
> > Signed-off-by: Kyle Gospodnetich <me@kylegospodneti.ch>
> > Co-developed by: Jan Drogehoff <sentrycraft123@gmail.com>
> > Signed-off-by: Jan Drogehoff <sentrycraft123@gmail.com>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > Tested-by: Richard Alvarez <alvarez.richard@gmail.com>
> > Tested-by: Miles Montierth <cyber_dopamine@intheblackmedia.com>
> > Signed-off-by: Jonathan LoBue <jlobue10@gmail.com>
>
> Applied to for-next branch.
>
> Meanwhile, could you ask TI guys to include the missing firmware files
> in linux-firmware git tree, too?
>
>
> thanks,
>
> Takashi

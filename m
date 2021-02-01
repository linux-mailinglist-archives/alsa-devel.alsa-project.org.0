Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2630A768
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 13:18:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348551766;
	Mon,  1 Feb 2021 13:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348551766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612181895;
	bh=sdamcwCLI2S4TZqlwIYXxV4FrJsAzbGBOdggcN3shvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N820b3tUvDOfzL5dLwtOqTzJIMsSiF5kDCOmgyEJJ0EWiuy2sfp39i1Ow+9UGKzJ6
	 CPJi4UNz03fhTfUW7JntazMjtlucQMYLLLY4bTtEM04b3KRAwSxNSpEbuf/50bTYsF
	 WQoMHYR26gmwMzPOicKsKMha7Bfmvz0pYwgUVyzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FC2F800E9;
	Mon,  1 Feb 2021 13:16:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E542F80153; Mon,  1 Feb 2021 13:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE1AF80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 13:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE1AF80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G8Jhipht"
Received: by mail-wr1-x433.google.com with SMTP id c4so13613955wru.9
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 04:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oJabRfuTZeECePsHkmJf5HW1b5PdAIVWqevNIinvl8Q=;
 b=G8Jhiphtk8XwIw6iD4FdZHGkvygenNRGNM+WjY5BiAo7fHz4u1XswmFe9wAEZGGFju
 Fx6tWZ3Z2WHcqwZiK6T1jBWsm1W9nsmM9f2tT5JjyJVHIRjAt0FQpjESy4fWYdItUiDW
 CdjkW8WJ0HIGuy7T5lut9ww6biQr9AMxGKeZ61nc2f4xVCwlSfa3XqH2TgUGZm+s1J3t
 2tW57SVmkjqQLKm9iRmtnyK/+ZiIqJWGUUXBpgKX3L/JGanrJLR6gA5LDlYRNqMIsxuY
 aLlalXkufcc7YcdfawsjypWnnT9IUXePdjoj4jgNwuQraTA3ZX/WSCQcQy690cpbH6g8
 V0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oJabRfuTZeECePsHkmJf5HW1b5PdAIVWqevNIinvl8Q=;
 b=gnqUGKh7Y8Qh8PHc7+ltkSyEkb5Gjw8pHNr1SPK2nyiDpyUGG4wE3oklISh5ZC0tzK
 thVfOayTL6qkqRgalT2htX1t3oiAC8OrQfiqMnKzvFbvM/nUn+/RLpq4QOV/bBeY770q
 kjMtFoxb0Y8h5i8Ik0nRxineOR4I9RgihnBqMsfj8wrxMcbLYtNQntfRSrBuetzfc3ob
 32egW1PLXgG9i1Cv7MPbI1HQfJ2w6SbtfC5v8zXeb6NdjXmXpHXD1IMGJqLfcgynck08
 oyUVeuY8GGjtuvF6ZcqIxVRmbwALQlXDjE4Z6hXssoYbI8d0jsIAvSTeG+21C2/3b9LX
 eSvQ==
X-Gm-Message-State: AOAM533U4vjcZhSbFyra40vH4RLdZg5W3nZyJ9SfM8tAvnO9xTNCdERa
 d4hC/wN7gfO+yPB74ewbKyOPt7IBw75uae7dHdE=
X-Google-Smtp-Source: ABdhPJxK8qJ5CahqZe/ffBUqX/rfHLlY78dtxPHbgW380PZEKwltK8wpOq4XF1gJghr9iAOrH4Qk9XYedvW6p9HHEQQ=
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr17338087wrs.289.1612181799212; 
 Mon, 01 Feb 2021 04:16:39 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
 <CAJZ5v0h+Kwn5u293QO+H2rfGx-ZMBr18tMCLB7jHKHWWRaovOw@mail.gmail.com>
 <CAJZ5v0h8abkdrdN97RHouzxynPBFXBoAuMSb7Zy56+-sTXkPKQ@mail.gmail.com>
 <CA+GA0_vYdxFj_SPWgdkufo04VaOuWqcNTSck6gvnMfN07ZdO_Q@mail.gmail.com>
 <CA+GA0_vKyJZSQZ9bA6_BSDeGfRZ_nz86gj2aVHaOoy1h57CMzA@mail.gmail.com>
 <CA+GA0_u8NA90GmMSDO-Ejg-C2YEXCn8rnVZpk-_+eXcDm7XRpg@mail.gmail.com>
 <CAJZ5v0hqHihRdad16Djo+R1ezjFHt2YffgDg59TYYKJSSjmA4Q@mail.gmail.com>
In-Reply-To: <CAJZ5v0hqHihRdad16Djo+R1ezjFHt2YffgDg59TYYKJSSjmA4Q@mail.gmail.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Mon, 1 Feb 2021 13:16:16 +0100
Message-ID: <CA+GA0_s7atD4O_DP0NXwVUVvdia2NWwSEfW2Mcw-UoJ9effPvg@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Erik Kaneda <erik.kaneda@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

pon., 1 lut 2021 o 12:43 Rafael J. Wysocki <rafael@kernel.org> napisa=C5=82=
(a):
>
> On Fri, Jan 29, 2021 at 9:03 PM Marcin =C5=9Alusarz <marcin.slusarz@gmail=
.com> wrote:
> >
> > pt., 29 sty 2021 o 19:59 Marcin =C5=9Alusarz <marcin.slusarz@gmail.com>=
 napisa=C5=82(a):
> > >
> > > czw., 28 sty 2021 o 15:32 Marcin =C5=9Alusarz <marcin.slusarz@gmail.c=
om> napisa=C5=82(a):
> > > >
> > > > czw., 28 sty 2021 o 13:39 Rafael J. Wysocki <rafael@kernel.org> nap=
isa=C5=82(a):
> > > > > The only explanation for that I can think about (and which does n=
ot
> > > > > involve supernatural intervention so to speak) is a stack corrupt=
ion
> > > > > occurring between these two calls in sdw_intel_acpi_cb().  IOW,
> > > > > something scribbles on the handle in the meantime, but ATM I have=
 no
> > > > > idea what that can be.
> > > >
> > > > I tried KASAN but it didn't find anything and kernel actually boote=
d
> > > > successfully.
> > >
> > > I investigated this and it looks like a compiler bug (or something na=
stier),
> > > but I can't find where exactly registers get corrupted because if I a=
dd printks
> > > the corruption seems on the printk side, but if I don't add them it s=
eems
> > > the value gets corrupted earlier.
> > (...)
> > > I'm using gcc 10.2.1 from Debian testing.
> >
> > Someone on IRC, after hearing only that "gcc miscompiles the kernel",
> > suggested disabling CONFIG_STACKPROTECTOR_STRONG.
> > It helped indeed and it matches my observations, so it's quite likely i=
t
> > is the culprit.
> >
> > What do we do now?
>
> Figure out why the stack protection kicks in, I suppose.
>
> The target object is not on the stack, so if the pointer to it is
> valid (we need to verify somehow that it is indeed), dereferencing it
> shouldn't cause the stack protection to trigger.

Well, the problem is not that stack protector finds something, but
the feature itself corrupts some registers.

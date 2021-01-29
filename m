Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A026E308DF7
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 21:05:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 258741678;
	Fri, 29 Jan 2021 21:04:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 258741678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611950726;
	bh=wBi0Nz1O80vwG8bGhhZMFu+XDketPmPTQS1jkhAaSRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ot1xncyii1ZD6D+DrUyDbYGbvenVqP+Ll12sAQBcu+xbVDbmZX2kRoxt72Xo681MS
	 Sim3d5ndGjCrWhi3PB8b+3AFhyTHs6h+5jUdrexuMLeGveh6K+EB6qtEJq3gJoyS2y
	 e3dXFAG5ks4FeDZRhNWio2DwRDX5V3CPvpm9kIR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD96F8025F;
	Fri, 29 Jan 2021 21:03:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CECF7F80259; Fri, 29 Jan 2021 21:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 866BBF800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 21:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866BBF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RcgGsEXP"
Received: by mail-wm1-x336.google.com with SMTP id z16so5421627wml.2
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hug8S9/u6gukwSGFne0RtOBB1RjPUWO6spzpB//NDIE=;
 b=RcgGsEXPjG9NDhY/kb8KhPG2GwXxddsWdrfNG3GK0NYyNxX1sYKwkigcbscamZJPXv
 h1ZoRh6MkC50apjO/ivUgtgxr6v41vKr3Saiefm9V3D/7JR+VjuoP22z4x9mAWLFjogx
 0QWjOp/D/9aEoReb97nZAcb1suUEvw52Y6ul+1NcErvaieDQCaja57C2WOJQSx52/tva
 QHnVZpViHNZ2f+5hUvesjJYpzqxkaDt0Ck4CzlORvMDvD4Emp/PZ3I5sZ1oZ+KRFvE+q
 kcjYoCpTVSNADBGVanigV7vnSYAojWXAhn4+ekdE230w+hGAddBNsFPI5DUtgKhFdEvM
 1Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hug8S9/u6gukwSGFne0RtOBB1RjPUWO6spzpB//NDIE=;
 b=Un3fKmMGSJZa9hD/v1aLHB7LR78oG+AN8k2Zaj4llcOKBd3Qf3DP0zXU4ph6lXPvU4
 WMTBwivqzg1McQTDtIVrHaWAlioFu+wCEwYLotC7U0e2Gg12wQFyfpCOdRrMPB/Xr0lU
 VNgL8VyI8fRKSMefC0LqMXAa9vNxsMT3ZuufEvLlMydJkg6zdHVUsjEWAXlcZHS0UA8f
 3WjzYN9nH/fS3vo96OMaOnSC8Op7kh9TBlkGDQ462JXfbbYUk/jeIYvK1mDgnNqT+WS9
 IvKRxw5Cubw0hNWHGHaqgIvo8P6SIn9WCUZx+oCUkLeAt+XRp8FeSHKR8UuEnV734LZj
 emxA==
X-Gm-Message-State: AOAM531YYKLhIwZbTdvJIDKwsnXx13kLyO0CXM2fcXKUmeEQR27tWnKb
 B2xQ8tsc+mONDJqPjcAl89nnmMJOvth8C2x8Lws=
X-Google-Smtp-Source: ABdhPJzDwiUvbv5M+7BBhbm5J46MDckUR1Hu1LekLVacxnKwDlJ7m7Wv1XHttYBc1mE+ohvxHZuImIcqqG0EVFvFngE=
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr5282916wme.76.1611950616549; 
 Fri, 29 Jan 2021 12:03:36 -0800 (PST)
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
In-Reply-To: <CA+GA0_vKyJZSQZ9bA6_BSDeGfRZ_nz86gj2aVHaOoy1h57CMzA@mail.gmail.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Fri, 29 Jan 2021 21:03:18 +0100
Message-ID: <CA+GA0_u8NA90GmMSDO-Ejg-C2YEXCn8rnVZpk-_+eXcDm7XRpg@mail.gmail.com>
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

pt., 29 sty 2021 o 19:59 Marcin =C5=9Alusarz <marcin.slusarz@gmail.com> nap=
isa=C5=82(a):
>
> czw., 28 sty 2021 o 15:32 Marcin =C5=9Alusarz <marcin.slusarz@gmail.com> =
napisa=C5=82(a):
> >
> > czw., 28 sty 2021 o 13:39 Rafael J. Wysocki <rafael@kernel.org> napisa=
=C5=82(a):
> > > The only explanation for that I can think about (and which does not
> > > involve supernatural intervention so to speak) is a stack corruption
> > > occurring between these two calls in sdw_intel_acpi_cb().  IOW,
> > > something scribbles on the handle in the meantime, but ATM I have no
> > > idea what that can be.
> >
> > I tried KASAN but it didn't find anything and kernel actually booted
> > successfully.
>
> I investigated this and it looks like a compiler bug (or something nastie=
r),
> but I can't find where exactly registers get corrupted because if I add p=
rintks
> the corruption seems on the printk side, but if I don't add them it seems
> the value gets corrupted earlier.
(...)
> I'm using gcc 10.2.1 from Debian testing.

Someone on IRC, after hearing only that "gcc miscompiles the kernel",
suggested disabling CONFIG_STACKPROTECTOR_STRONG.
It helped indeed and it matches my observations, so it's quite likely it
is the culprit.

What do we do now?

Marcin

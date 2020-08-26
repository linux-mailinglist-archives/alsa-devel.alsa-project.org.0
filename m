Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D46252976
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 10:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47AB1730;
	Wed, 26 Aug 2020 10:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47AB1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598431791;
	bh=Ir9K1q+EBVi7X2mAOVKEkf0lDTwJilyfH2ZXmUiXANY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZneFYWFsM4iqEMh7GUmbFCDN998pMutQCreSkxCNIrrUlOi9QTwrKTRssaMgVMyd
	 kUdabcWBbo6TX0PWYe0EeNdkUjBVPZ06qmlL8g02lguNOVRpk0OiCj4UZ522iAgU2O
	 aB+bI/kTkbSSnkB1TG4Uh3xcDp/Y4eFXufCbwFcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 630DCF801D9;
	Wed, 26 Aug 2020 10:49:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B505CF80105; Wed, 26 Aug 2020 10:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC0C4F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 10:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC0C4F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RTIVb/G3"
Received: by mail-vk1-xa42.google.com with SMTP id o2so237913vke.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1g1n742d8OJ4X7KYtH9D0cu3M1BioF4LGKGrAv398i4=;
 b=RTIVb/G3FfB/XOfKgVpnTBmMNGaiaXH22ZbUMsHQo0d8b5FSllj5hZu+BZtpPlXSe4
 nAkI4ojtyu5a2+2ftSWsURxnsUjZ3x4Rds1SxHMh9zm25jYJ4Q8n2jlbu6G6fIXrOTXT
 7GLToEllAxPZW5SHJBl1wGBfV4C3LwXuSkdpzL5pPNeKDwXSAPmcbl4BtbIZziAqiOxC
 1cWz5uMfDfQegNS0rkM7lcPgLDyPomLeb9JSeS/a+DJ3MjQPEa0I4pVCvm5N2EBOKjwm
 0K+xfwE0B3/B1p599SPnakiYD2CgIz0ipnzQUS4Ub4lmJbLgnObBq7WoxYg6blgE3Ixq
 vNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1g1n742d8OJ4X7KYtH9D0cu3M1BioF4LGKGrAv398i4=;
 b=kl15wE4S8wKpzXCzWrvupQGo16x4yh/K3KjYSP9tVK93GaRazZZsJUd6jOypdUq6CA
 9FTfnlV2Mx4GdZtcJaon9LmJ5h1o1xAOqMNminisi/RiPoM+CMWGQUZrnx59TQakEftf
 /gnNVwf41kWbxejJr2+2M8IOkfsIUz7HL4/qbKmhFg2fOKrlz+413dIUZ4bTMfCpp7dx
 d14RFW/dC8YFrfCFN46B2xagV2FROjiG3nbKpRsyWw7gKyngE3F7YG6M0Af6Sdd3mCkh
 XZVeIsw0Gys+aSI8XWSB0d3tFjx1+Ktjjl390TgCATxE79f1cEp3K27fLpY97F3p/4Mk
 nA3w==
X-Gm-Message-State: AOAM533aSKNyb15Qe/GGTUIna1lKFdH9sIBb92H+a7uoGk24CqrmKNB5
 6eGGH4Io58NPydM1ji3oAfuE2ecT1T5qzo6ahWc=
X-Google-Smtp-Source: ABdhPJxWSz6hqSJLqX3XmFxpGEXFr8gG6R3yeuYuIEm0WN1oQhj/Z0gK+FpGjL0oBAhb0lXDHOlmDA2HTSDcTA+/2GQ=
X-Received: by 2002:a1f:5fcf:: with SMTP id t198mr8282844vkb.32.1598431729074; 
 Wed, 26 Aug 2020 01:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200826084014.211217-1-adrien.crivelli@gmail.com>
 <s5ho8mxu72w.wl-tiwai@suse.de>
In-Reply-To: <s5ho8mxu72w.wl-tiwai@suse.de>
From: Adrien Crivelli <adrien.crivelli@gmail.com>
Date: Wed, 26 Aug 2020 17:48:23 +0900
Message-ID: <CACjDtnLCxOSN_xksHMgk=vJrfK_9OHru5NH+XD6MHFaejMSc_A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
 NT950XCJ-X716A
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

Great, thanks!

On Wed, 26 Aug 2020 at 17:47, Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 26 Aug 2020 10:40:14 +0200,
> Adrien Crivelli wrote:
> >
> > The Galaxy Book Ion NT950XCJ-X716A (15 inches) uses the same ALC298
> > codec as other Samsung laptops which have the no headphone sound bug. I
> > confirmed on my own hardware that this fixes the bug.
> >
> > This also correct the model name for the 13 inches version. It was
> > incorrectly referenced as NT950XCJ-X716A in commit e17f02d05. But it
> > should have been NP930XCJ-K01US.
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207423
> > Signed-off-by: Adrien Crivelli <adrien.crivelli@gmail.com>
>
> Thanks, applied.
>
>
> Takashi
>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFC237A9F2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6EE17E9;
	Tue, 11 May 2021 16:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6EE17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620744860;
	bh=58cwU24EJpZN5CNazEG/nOfXidTbwXsjDOLowoD2RXw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mf86aqfQA4iREbm3DimhAzjOrxKxSPpoXJqbUrtT9GA7Ixfgt2uhRr2+mBwVr7y+l
	 PuMgsrWsmV/usJSEm9B02wCLSBfUioy7QGttCb16AhIwPvoUuahQvhOi8BxD4we+8F
	 YTNNEqhcMYeC8bteEakBn/eKFzGatd1+5zJtrxcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42AB3F800E9;
	Tue, 11 May 2021 16:53:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00102F80425; Tue, 11 May 2021 16:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A99B2F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A99B2F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KFezSXLk"
Received: by mail-ej1-x62c.google.com with SMTP id t4so30280045ejo.0
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=taLonWEHUFMpxXMU60wQyJ5XuQkg0OX8RWCfQzUPJ7o=;
 b=KFezSXLkO2sHs/zAiyEuEsZpt7FwPW738uHs7yBZ5RrNDQ7l5HwiABdMfDfzYJak0i
 O98xlr38hTdNTf6tJyZWBLAm5i29fOsa4DlRv3fZKJksyIVH7sM5mMXuyoQtQdw8V+L7
 1p6cTmt0OoeuuJzta+iTENQ+NWjdx/z9EqBFTwwHa3DNq7GhgLpFHemcth42ual0ciiH
 d6kqHHMj2tu8KAvvdMDVmf4aJ2bVY2AELAC4UatfR/UnznebwTyL65uQjAX1hiAlN2Ia
 Z4VYpqbNot2apAOqxXgfLYeqXFkR4hIcfLSte0+xY9l1CBlfvqs1DYf27khcw5A/qF3J
 M2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=taLonWEHUFMpxXMU60wQyJ5XuQkg0OX8RWCfQzUPJ7o=;
 b=p4+5GztwkzkWUOT39G4HroOvj8wGVQAJ/K1yQF07sMfn4XxKvH9ofwI4A+7XTRtSGR
 MxW2Qjo7kMGSR6zK/BYyJpOLCCVN+WOmDUG3YKPPY2mdUjJT59Xf+N5rRdzrK/Q8rw3x
 aGDyxftjFrM9l/S4NachXdCWcf3sAkKKs0UmALy1JPaE1TPn+rRE98E6n36Uooz4Is+3
 bUghuBjyD20gjEuRxtilghJDyjWC0mcdTGWxGpZ8xBJ3qtPXT//hej+940fnEKsXSzRv
 F13/vWYwj5mwslQ45uXLdzEBlkp1ILBULTo3zEWdt62pKUhPcMSgUciHXooKFvlyyXs4
 3qiA==
X-Gm-Message-State: AOAM533ZJ39I0aHxhMjfQEKcvU+IYOItOwCuGAA2cOtq8WnToRhk2+eR
 7xynqFhJhmu366IaY99RzZ8=
X-Google-Smtp-Source: ABdhPJwWWjtVUTwhsjCA1OE3X3hVuHufzQBBKlmL7agdW/bPGgkaJuvkTBQsC0lMrsE0Zt9sd7XNhQ==
X-Received: by 2002:a17:906:1701:: with SMTP id
 c1mr32219599eje.425.1620744801819; 
 Tue, 11 May 2021 07:53:21 -0700 (PDT)
Received: from [192.168.1.204] (host-79-47-116-73.retail.telecomitalia.it.
 [79.47.116.73])
 by smtp.gmail.com with ESMTPSA id u4sm1000077eds.1.2021.05.11.07.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:53:21 -0700 (PDT)
Message-ID: <475860dd2356cacc17d24fa32fcfea7823152ce3.camel@gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add fixup for HP Spectre x360
 15-df0xxx
From: Elia Devito <eliadevito@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 11 May 2021 16:53:19 +0200
In-Reply-To: <s5h1radcrjt.wl-tiwai@suse.de>
References: <s5ho8dhd4b3.wl-tiwai@suse.de>
 <20210511124651.4802-1-eliadevito@gmail.com> <s5h1radcrjt.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jian-Hong Pan <jhp@endlessos.org>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>
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

Il giorno mar, 11/05/2021 alle 15.45 +0200, Takashi Iwai ha scritto:
> On Tue, 11 May 2021 14:46:49 +0200,
> Elia Devito wrote:
> > 
> > Fixup to enable all 4 speaker on HP Spectre x360 15-df0xxx and
> > probably
> > on similar models.
> > 
> > 0x14 pin config override is required to enable all speakers and
> > alc285-speaker2-to-dac1 fixup to enable volume adjustment.
> > 
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=189331
> > Signed-off-by: Elia Devito <eliadevito@gmail.com>
> > ---
> > v2: Put the quirk entry in the PCI SSID order
> 
> Thanks, applied now.
> 
> 
> Takashi

Thanks for your time.

Elia


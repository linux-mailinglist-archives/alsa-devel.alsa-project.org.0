Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDCA10675B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 08:54:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96297181C;
	Fri, 22 Nov 2019 08:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96297181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574409296;
	bh=4DVQyzssG3vEMfTYV0U7Jx/G/xaYalbIw9NoduMh1cs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RmgheW6l+6s5JZGEj5BEwcZlT9rLaeSGREtfwBDAE/h9DV3fLP+ZhBe9uwXhvQLbA
	 EYB2+wNsdJN8uJUVmx90V1zHtECGSG9NaITySIwFA6R43wFWuwrZ2s2GKQl0kGaeiG
	 Siu+Lihtbmi9nZy1Om4tjchYOGeoLUDQwv4TJS9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1167EF80140;
	Fri, 22 Nov 2019 08:53:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45A72F80140; Fri, 22 Nov 2019 08:53:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C35EF800F0
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 08:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C35EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WrX3oYuG"
Received: by mail-il1-x143.google.com with SMTP id s75so6024660ilc.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 23:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ta9qbXYPfijUAYEwJEeMdsUA63Kl5GlKXveUih7tZ3A=;
 b=WrX3oYuGlMx1r90LY9203mMTn70rr548OAXyIOWVvpG2AWY6+RAtZIPM6rmOcRB2cw
 Vq1zeide76xwaf6AXvKrAruBj0vscBLaff7o4cXJ1hnzNoeFac6iP7asaXAr22THdrUh
 L1ZyiNHrExuVsh8wicyIABx32yPwGtX6qpLcF1XC40IlJkXEzdLZwuwYmw6Q/mhgji/o
 OIIN+/yCSXcY2B7QVRHTVZiHcnRPAnFRZQZ6ceMGz8z2xMHeGS8qz82jHtUOwSaiEClu
 egO9NWhHe4dFT6xkhwOMd452dpssbboOJRYmYE4AWnm+E1rtqqUlKamkQJujC1GMfSUf
 fN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ta9qbXYPfijUAYEwJEeMdsUA63Kl5GlKXveUih7tZ3A=;
 b=H92Qq0Wvz55e49emZHAXMX97Vv+uluMJAv6+26DGFKWT/sKLFo6hkTGUfkiVbTOe3V
 FYyOAV8SNEknu3/UNeQVO6Brr141J6EHme9PNX8+sIjUVbqQyZYEnkegVF8ZAq0rvRq5
 79xNU8j11TCcPkzjSO+T9J0wo+dY0S4D9bx3XO+Cuj0zTBE5idPW/3FrTgnlKOQT90PN
 qAR56BpyAC2taXd+S2sRiqEJ/qa3wsHAuX15Fj5pbPy+fCQPExdmo+D1jUImXxYdIxmt
 PErZ1i67zMN2bYPXcjUhfcTYNh1C51CcdiueBqPbLGzYJNEmLZTypgoJF2pdFQQ2Ru69
 8xWQ==
X-Gm-Message-State: APjAAAUuBwvN/EyUMx6vCe8r4UzwdshIsZCxJXBJ7ZfvznECFnFG9c0v
 lZN6B3t0lDztN4aqDiC2tRNmszgMhil7YvtfpRhYsA==
X-Google-Smtp-Source: APXvYqyt4813gPeSLvbOJfUEP66TLs0/PPyPdaPgqREhOo5ifU8VGlSBvD3NeeMrPaxvm301LqhYOxOVg2mJOeGpHZM=
X-Received: by 2002:a92:9903:: with SMTP id p3mr14059913ili.213.1574409186164; 
 Thu, 21 Nov 2019 23:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-4-tzungbi@google.com>
 <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
 <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
 <7f055263-01a6-e1cd-8085-1790222bb808@linux.intel.com>
 <CA+Px+wX2UtU3As-3Bf4rWn1kzqDMPw60xk508gDDaOPk6Q5dgw@mail.gmail.com>
 <d97b9724-27d0-f157-ce5d-ed6c75bafae8@linux.intel.com>
 <CA+Px+wUSpYibKbOdj-XCXCnH9QN8=OtbeYMkhbj4ZREMj7V6Sg@mail.gmail.com>
 <942ddeb1-762b-1e76-64cd-6450c6adc722@linux.intel.com>
In-Reply-To: <942ddeb1-762b-1e76-64cd-6450c6adc722@linux.intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 22 Nov 2019 15:52:54 +0800
Message-ID: <CA+Px+wWD0dfGTuMqRLzZYgFRwLQUwc2_RD5N+CHsZAsPSm=Amg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
	conditions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Nov 22, 2019 at 3:20 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> > Can we suppose CPUs always get ULK=1 if PLL is unlocked so that we can
> > simply ignore the case (2)?  Since we know the register is volatile
> > and read the register via I2C should be much slower than hardware
> > raise the bit.
>
> Your option B with the small change to sleep then retest is probably the
> better solution overall.

Have sent v2, https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/159050.html

> BTW did you test this on both Baytrail and BSW chromebooks? In the past
> I saw baytrail devices exposed this error a lot more than BSW.

I tested on a Baytrail-based chromebook which is easy to generate lots
of "PLL unlocked" on the console.  After applying this series and the
next series (https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158853.html),
I seldom see "PLL unlocked" on the console.  It still happens a few
times, but with very very low probability.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

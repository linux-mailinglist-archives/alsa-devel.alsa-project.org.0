Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51D1DD47A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 19:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3ED1851;
	Thu, 21 May 2020 19:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3ED1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590082372;
	bh=oCCuryYDlFG9YsC0tOz8Jhkle66x4DRPsKGwzs4uWUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nv4GWw0bgqp9CnCKlCQeXRbfHXGhcwCeA1KdZ+Phnr1mwpobR2+j3UUybPSCunafw
	 Za2Eov1lyxjLB29QKgpnOD5PE4Px5aUC08JXv5qqm1You4qGp7iqomg9iIz0ERblK5
	 nfXB5RKImcBWyafuuWtuLzZX0+52Wk7iYLZdX2j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66765F801A3;
	Thu, 21 May 2020 19:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F73FF801D8; Thu, 21 May 2020 19:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A2BF80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 19:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A2BF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="s+fpMnTF"
Received: by mail-qt1-x835.google.com with SMTP id z18so6155000qto.2
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oCCuryYDlFG9YsC0tOz8Jhkle66x4DRPsKGwzs4uWUY=;
 b=s+fpMnTFFKbXedSk7ek0RZ/NmBP09zX/j/kZh3APCiqxD3VYd3tyNmjbY2ApPNIlGN
 VQuv8NzLXi/wf23hNmcDqwGwhxS4MW3dA2FFR6bMX0zhXU/Zo1C9FmqECPyrRzcoLFw/
 sjyaScMHcTRYUj5k/d3WpxiCksLHpMmp7SsCMV3vFIR+L8F0ktzcm49jgxdjk2UMOS/T
 cOatk7DTmS2A9a7n6fi2V5CYbNy3vXKlqoy5sHvlpoq5ke0I1goOxpJ2gOmGqC4zWR5L
 1XONoL1+2rx7Qp/aZxO/aVPdP9r4X4kQ4R1/5cQdiCqMxTaweZy9NSPCJXY6uSJgtvsp
 2cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oCCuryYDlFG9YsC0tOz8Jhkle66x4DRPsKGwzs4uWUY=;
 b=UkR3Pa3UXtWfrtyIiUtP9mPpNlwYZFBpoYZ5t2QHmE3Umn/ZHMR75gS4JgAbEmpUK5
 HiS4teDhKgP8G/F5ud3ORxKt43/2MPrz4/jhcd9QIz+Ts7ygegoCAyFiuP66qc0LseU2
 7ltyv9Tgxpq1EMauq2O8GhTqIJSvrtnLAuGQYLX3zCYFMvYYsfyUi/wF6wTO7r9q4tBS
 disWXZ6uPuAlR5iUgoyMCSNEe+DIkMTc67fzgb8qWeY1DlCO0i3OYffMZ5uw342/QNh7
 xOFG5cD+wtQVuP+q246J4LyzkrZLRy03hSXuxskmFcy/3HSmRhYX8acsH8Z/dJtkJMiF
 toRQ==
X-Gm-Message-State: AOAM531YQZ/s8kOlv1KHspWOe1nKrmSPLcB0uHI6lKpCezhGFVrSZwyX
 Ejz3qTRAtGion6LtJdYkDyj8Zq/+ftaucpeFTihK7A==
X-Google-Smtp-Source: ABdhPJwtq62EZUQyrC/40B7qqncuvtCEeEnHVUBc2Y5SeI8XY5V7uRJHlrv8zqb1D1OrgskedaqEIMoG9MvNfFgCsow=
X-Received: by 2002:ac8:37a7:: with SMTP id d36mr12285965qtc.375.1590082259124; 
 Thu, 21 May 2020 10:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
In-Reply-To: <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Thu, 21 May 2020 19:30:48 +0200
Message-ID: <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>
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

Hi Pierre

If you will take a look at the original kabylake_ssp_fixup() you will
see that it is checking whether the related FE is "Kbl Audio Port",
"Kbl Audio Headset Playback", "Kbl Audio Capture Port" or "Kbl Audio
DMIC cap" - then for the first 3 cases it sets min/max channels to 2
while for the "Kbl DMIC cap" it can be 2 or 4, that's is why I'm
trying to split this, but maybe I'm missing here something.

Best regards,
Lukasz

czw., 21 maj 2020 o 19:17 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
>
>
>
> On 5/21/20 12:08 PM, =C5=81ukasz Majczak wrote:
> >>
> >> don't add a new dailink, this is not right.
> >>
> > Can you advise a better solution how to assign different fixup
> > functions to mic and to speakers? I was looking at "dmic01" dailink in
> > skl_nau88l25_max98357a.c as an example.
>
> I am not sure I follow. the DMICs are handled on a shared SSP, so how
> would one set a different fixup? The word length have to be the same.

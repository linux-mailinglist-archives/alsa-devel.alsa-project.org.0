Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89929B74
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 17:47:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24970172D;
	Fri, 24 May 2019 17:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24970172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558712845;
	bh=9rN0pRrKTHm2Tf6a2CT3aLIxNKklHyeqs0mU2kIgF4A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6Y+Bc1LJgztOKfeZixlzw3PIR/U3LIlWZPMSaKnT0rLoIjdN+yPVBIWeMPePAscb
	 hrdwMgp9WKnPsDRgrYnzJ+1dsKwILFPD0s0Sn91MFZFWrCCEwWFBhcdPSRlwJWAeJz
	 +BHZbnfWpo6PEWoLPGJ0GKnfreg+tNSDvLS93qYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C80F89630;
	Fri, 24 May 2019 17:45:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2027F89630; Fri, 24 May 2019 17:45:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C05DF80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 17:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C05DF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="GtXfc3B8"
Received: by mail-qk1-x743.google.com with SMTP id o2so7897601qkb.3
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4mDXdA5QFT1GK/rp6a2sK6KGRVTROtdwlxMEQukyB7A=;
 b=GtXfc3B8+tIMIxyHOgHH1LCW5Vxs/MDK/UG/ssYT0Oq5pMgLUIrK51tvZrIF+cjf2I
 A7+/jbEdicwG1CxAnwle02Wfx3UMXWJG9FKO9ACEc0C1uQEiI8h6JRRS7ThJx+ahI8n+
 joIxDfWkssj3xcQR3buzR6JRjwLNLY+ST7M+wx/CzecjxWM/WcTrjKvyPV6opJZj2YPO
 5tWiVb1vNsKcm0nYuk+mjdqe/FMWXH1jkq5DaQmfhrLZIFGnnB5mlxES0uL05ap82Yio
 6yUfcpZVMnl92G738APA9TBq22u7/9jkgp9iVaiBSVCKfX+cbuRGW2HCgLDImcJtSucV
 mbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mDXdA5QFT1GK/rp6a2sK6KGRVTROtdwlxMEQukyB7A=;
 b=NumZVfJ905Xwia/q9Xsirp5bxRzBJxq6FpdZXIP4OVN40SbJJ5Z9PXtGpap6ZBg2O0
 2eshZVHZ9RVSwdtQ2e7+h1F0LDfrjgCsIc9Tujw734YxcHNAJ73c3+xUUyrq2wNXy8a4
 wf2byH2jK2Sn69BXRq1ndq/zuQvRYj60tL84MX/V2N/SUzKf84nOROIrFFW08Y9V/mPw
 YLn2O2bzPx6lLHG7TG0FGIOT0NBCJnfy9W+a71zio0wFnUP476flQVG98KXmMHGyrXaH
 6lLTx91uL6mCuDlZyNRbB0N76QvpZ2tQ6nfTJ52S9rdqz3JpSGu/agcwTv/wf42FoMaC
 aW5A==
X-Gm-Message-State: APjAAAXEdipcODR0rVi19yP5NWczawkPr3lehp5cqgVUHk2kmR0KApDA
 zbsHMxyI6bOMCVGsrP4OMF59iS4OT5Z10SDC6/VDfQ==
X-Google-Smtp-Source: APXvYqw80wZdw4rxHcHLLyXbfD50xCsXnZWLbllIT4zXYaqi5ltx3n2DCUUufCHbJKBnAQDJS4nvMcMV8gBnGI1rjao=
X-Received: by 2002:a37:de07:: with SMTP id h7mr8496626qkj.41.1558712733119;
 Fri, 24 May 2019 08:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
In-Reply-To: <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
From: Daniel Drake <drake@endlessm.com>
Date: Fri, 24 May 2019 09:45:21 -0600
Message-ID: <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
	are detected
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

Thanks for the patches!

On Fri, May 24, 2019 at 7:26 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> I am not sure if it's a good idea to enable this by default, the
> experience of the first round showed it's risky to make assumptions on
> what BIOS vendors implemented.

Can you clarify what you mean here, are you saying you don't want to
enable this new DMIC hardware support by default?

Daniel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

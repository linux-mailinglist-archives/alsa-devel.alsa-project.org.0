Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176064749E0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE9620E2;
	Tue, 14 Dec 2021 18:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE9620E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639503702;
	bh=SYOb56O0FbcuAWrk5jCm0zPU5m7gkpWd9tRe2Z27drQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OLbuej7/UGYHoEaIm6NhPQ5s7WlZjwq2Tyf6yyGINg5ZHjGJ2kZRj9Jt9jrAoz8LA
	 PM+nsh/HTMfgAE2+fCd84vYRJlaCBsOOGaAVxMh2+6cqYmxffZq3KMPl5PlqBqOAXV
	 r3oZqBCHhPAXaOUhyApAeb15/fLlmfnV4+I3N8oM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A66CF8050F;
	Tue, 14 Dec 2021 18:40:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 446D6F80249; Tue, 14 Dec 2021 18:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28F55F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28F55F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VmSnB34E"
Received: by mail-wm1-x331.google.com with SMTP id 133so14865212wme.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SYOb56O0FbcuAWrk5jCm0zPU5m7gkpWd9tRe2Z27drQ=;
 b=VmSnB34E7yOOd9ZQ1y+KsocicIq2xJGnsyBwtpJoRadCzn1sQ6hGGhnQRot5MbDH68
 z+nxp/HLrD6noqT/ZBHVhH5QditXtINCAbkLC5HmkjQW1CUbaj7G9DPG/GKcQS20zF1i
 hAZkIA3Apnt6kPA3UUupEZ0tzlHUfBck/k6noMgHulm82p52fbaXzObOAx2/wvILfCpJ
 FsRAE6hEFnCB9qVhtIbUAVCXjZQe0hwXPImKvqpEP1pZsQi4/pf76ZmmXYyctJRacDiV
 tpKff84hYITiqyKv4Eyi0Y1RqNE0t+V1qzhlO/PH3VLiXHAQdnQNc0qvY7lIgkR6v9UZ
 sA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SYOb56O0FbcuAWrk5jCm0zPU5m7gkpWd9tRe2Z27drQ=;
 b=74Y2MI+54xjuHlUPH2KikzHsnlyWiD+xzNyc83poRLMbGQM4/i52jOWtdTcB963Jns
 jgZZTApESvr4bTVJ8f+8avwUI9SH3BlBqVvtga6/ZLtNEZ3MECwKyupjZ23qjGi+5sy5
 yh2UdEDvnsrngMtwySkFxxVSWaiodwBq9jyzsQhMnKGAB/TB74gtcVR7zPB9Wilqmduu
 7lkq/eV5Ulj1a9F599F48d4NCalpGxdh3AFOeQ70L9KrNB+iO8NCiOE2rBbgl2CaRr80
 ztzQNiO4pqKh0aGH50yIdCnBJOuVLHlYji1zWlKnD/Hmk4/ndNefDsgTGmOz47vrhPUo
 KKYQ==
X-Gm-Message-State: AOAM53058gKL6fdYfuFJ/XTmbuPQEiOgNg/DNKb2jeGTFqQbcQqcv1NA
 FjYbRlC1SdbdRYFt/lNLIJs6oVpgQ2u+OjQVnEk=
X-Google-Smtp-Source: ABdhPJxFJ6AUg234VZKFM1url5v9R3FOUw9tF5GF1bp3GgW+69uAKldnaJGy9qkVPAvrAkPDQPuxdH0AE0eQUMgSct8=
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr387662wmj.91.1639503624812;
 Tue, 14 Dec 2021 09:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20211214030215.3181149-1-broonie@kernel.org>
 <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
 <CAEnQRZB9E4uBDuUidiJ+QJnQhGZp43jig4q93Pkw3pSr=K48YQ@mail.gmail.com>
 <11ed7f0f-ad5a-cae1-035c-23e5d3736818@linux.intel.com>
In-Reply-To: <11ed7f0f-ad5a-cae1-035c-23e5d3736818@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 14 Dec 2021 19:40:12 +0200
Message-ID: <CAEnQRZBQdP53aHSCS35-SO6t_5fn3vX5OBqGtkwj9zP=sbwDMw@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 13 (SND_AMD_ACP_CONFIG)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Tue, Dec 14, 2021 at 7:26 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 12/14/21 11:21 AM, Daniel Baluta wrote:
> > Hi Randy,
> >
> > This should be fixed by https://github.com/thesofproject/linux/pull/3284
>
> no, this was precisely the change that exposed a new problem.
>
> https://github.com/thesofproject/linux/pull/3335 contains the suggested
> fix posted earlier. We should know tomorrow if the 0day bot finds any
> other issues.
>
> >
> > Let me quickly send this to alsa-devel.

Thanks Pierre. I have seen your PR now!

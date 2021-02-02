Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3030B549
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 03:32:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B571175C;
	Tue,  2 Feb 2021 03:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B571175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612233136;
	bh=QIpTOgzPdQ6YtC0rNK21Lw1lOKo/Ak0fXmEeIn6ftt0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ozuu18vheqmyfsmjf18jT2M+jqeomCe9YqhvKqu9pPFsFKZHQxcVikpEwcNLk7EtV
	 mpC0OKopdj2ooZ8IrEpT+2A5epKd3wpiOm5abK35fqeJSfluh04SECNKNlLVTj7dHR
	 1M/6OqwequRTIVY0WlYxsHM1ZwnD94VrsQSIpJPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED687F80155;
	Tue,  2 Feb 2021 03:30:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AE2FF80154; Tue,  2 Feb 2021 03:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C2DF800E2
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 03:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C2DF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Imeh8hlG"
Received: by mail-qv1-xf31.google.com with SMTP id n14so9250151qvg.5
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 18:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIpTOgzPdQ6YtC0rNK21Lw1lOKo/Ak0fXmEeIn6ftt0=;
 b=Imeh8hlGg2V38tVkhlaTGnS5NFabsC2q2pzv0il1Mwc1WnPzOyMh0/EbCCkdgSbAQX
 NemrZfPsXmukyK4M2YmP8R40paGEkRT2dctZMpVokXGFbGqgJj4+D31s7p7BgUbXGAMO
 3vjx9wNN1VoAleGONmrnuw7+Z/zR5YUvdNdNXHDJMvJhbpsSuTsMscSx67PrihFIL1e/
 ECxg89NsRYzgFmMxwc78wS6xAYtCUl8rhaxGJRgrzixds8p9fWDm23cTYcBnmZ4Sv0Xf
 Qi/eCCtkzyNzc5cVs2Nh6gdHmLtrYST7Rb/ZI1TblCA/NMbNFZwHrwc34bqTKN/xSLoW
 k2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIpTOgzPdQ6YtC0rNK21Lw1lOKo/Ak0fXmEeIn6ftt0=;
 b=n2agEx15T9+SZzOvNwegLPBvGlF1q03pTrPbGIoTFEPfXit3tCXGAV+fSxgSbmGP51
 WcdCKWbkY2XBtt9UUpHcVO/KloV2QsZfUYuR959hU2H0cJMAvmWTIFyDi61dg2PjSx0/
 0xw2Mbgitxibku3m30fAFWGEsCb3wSq31BjYBUM+oYIGg3bH06Ajkj3DCBCyFePu7uhn
 Epr1GOo2TjbhbCXcfyke95hKeyan42R9iEMgQg2kqKLJmQj+k4T6AZVw8eQsnH9n7fGw
 bvZfd6ghirGFt6aKItdih5bNY+XEA5vm3FyCkshqnUrvEAyZJxeqmbYBdiCCbWF1/UEt
 uxrw==
X-Gm-Message-State: AOAM532LpSIh5rMTrXzgjHZXYVmI3+Ns719+gppHTW6SevKwLI5ITwp4
 pKki21bUsOFPzG0mmp+vhRvH6VrtgmO15vUU4OA=
X-Google-Smtp-Source: ABdhPJxQYEVdgWApvJT9/ojTY/23tJijAEEqeJsLb013eOFzysMrFFbbydhH5M1amthAVT4PRbP7uWaVSdWA9kFcRLE=
X-Received: by 2002:a0c:be15:: with SMTP id k21mr18615044qvg.8.1612233033576; 
 Mon, 01 Feb 2021 18:30:33 -0800 (PST)
MIME-Version: 1.0
References: <1612166909-129900-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612166909-129900-1-git-send-email-yang.lee@linux.alibaba.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 2 Feb 2021 10:30:22 +0800
Message-ID: <CAA+D8ANQb4btyJo2DeVpr3W7vHz+gQTCQQJB-geV=wT5Sa0+yQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 p.zabel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Feb 1, 2021 at 4:08 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./sound/soc/fsl/fsl_xcvr.c:739:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC94E3AFB00
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 04:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DFDB1698;
	Tue, 22 Jun 2021 04:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DFDB1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624328262;
	bh=nb03Cre1SX8lGrapFgoB5qUMfwXXOtzwk2mSdLJAip4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJSXVIEgSSWNl7jVOtVqobvX9VgZyJLLPk271SDMbLDC4C6NCSKVO0pAFT67q6JuI
	 HJHLy09AU27sR+df7wbj+Wo6v3c9q0x3u6t780GV1JLP8EFNCaCO9CEZNG0OIG7DK/
	 SX+hHETcXsK1MEYcUUGuxq95qY+Z/i5Nc1h4LBqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C112BF804B4;
	Tue, 22 Jun 2021 04:16:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A22F1F80424; Tue, 22 Jun 2021 04:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7A2F80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 04:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7A2F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JTALaRfb"
Received: by mail-lj1-x235.google.com with SMTP id d2so27936885ljj.11
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 19:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uH43oKWAZxpslYVAdfEnkXLzWtnCAv3z3ny62+2EWkM=;
 b=JTALaRfb9HY9P+En5sSGe5RUQambcJhT8v2O/nCquiTozLmbSfB0cF/4OFZzr7DWLQ
 xjrb9mmE4+4tDlOAYjkR35nMFmL1ES4FtH3VhfSluC2VJZOniLhfzRpiRK3dDhJ2XhKn
 4YfYmBnL+/DIHxb0R1E2F4ReoABbaqZ9ay6PjaBVFw4EBvt1zQUFJt5LG/wELvbjIJpF
 SFYrPwIs3/1uMT9UpIQPex9Cz0VhiwtMXOSsMWCFVRCha8odC6JKgEwTOFAx4Yf2lhLb
 5QSYbjfK3DUTOUS+cHZQLwKtieKSOX94YqFCp2dTDgAd73G7gFc0fN4lT4+RfmvJS2Xj
 GMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uH43oKWAZxpslYVAdfEnkXLzWtnCAv3z3ny62+2EWkM=;
 b=qiE1nmPSSYezLxFtdvOc9FWLVQDZSlB4SfW8zbxNIebBCGde/5V5wMRu0FyAvagPT0
 bLYenQttEgXKDWoy62SstuYSGzbAjn5XucDT44qYtLwV1Gd1Tllx/ctP4rkBpke/cVjS
 zP7wD6GeZERR1+X0kL99pspnaldJ0xhVW7DGS3B7gD6v2L6jQQw32jS0/malWkanFABa
 WH+V7+Tr1qJsL3BTEsMsZLkQSKOvADUdaS6u2HxCwGhWKU8cYYEtfckwPKPaoWJ2ler5
 3vb9xBX1l6t1RZgZ5rnuB5cDCc6bgsGdeR9qDmszATNRPRjUQS2gGDRpJPHKZ2/yxv3y
 mg1Q==
X-Gm-Message-State: AOAM5311Aytip16XnU8jI3O76tUqAUAChEVWiF7/8CvkJuLadTqTV0bZ
 ZqMV9yBMjaomRpjEbc7S+85VWBNkxLv5ICHKkOk=
X-Google-Smtp-Source: ABdhPJxeG9iccGHA6DRH7csV1eHv/FBVdq7lad+GoU0gi82ueW4xDhFF6+9W1CvvNYTqkL/1UuZEnSBlxuaZh/IJhDc=
X-Received: by 2002:a05:651c:54f:: with SMTP id
 q15mr996055ljp.347.1624328194500; 
 Mon, 21 Jun 2021 19:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
 <CAA+D8AN4Nch5FMjCDN8vs2+Nqs88k8jvMEBZwQuUdG+9pt1yZA@mail.gmail.com>
In-Reply-To: <CAA+D8AN4Nch5FMjCDN8vs2+Nqs88k8jvMEBZwQuUdG+9pt1yZA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jun 2021 23:16:23 -0300
Message-ID: <CAOMZO5A=OrHNz0Bye+p3H6UbF2_wq2m9KquWurXez1E0-WBYuA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Mon, Jun 21, 2021 at 10:53 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

> so I think we can use the v1 one,  use dev_dbg instead.

Agreed. I have just reviewed v1.

Thanks

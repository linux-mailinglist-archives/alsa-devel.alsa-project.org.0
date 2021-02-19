Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC00531F419
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Feb 2021 03:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE421658;
	Fri, 19 Feb 2021 03:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE421658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613703419;
	bh=SXsmOxSrWmXM0bUxFvRmWQLOnN33ooEOiTdg5Q4odMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LNbxEL3Fj79G5MN5GGy5xELDEkCRj0vE7Avc84ji9yT/TViwoj3YivS/x8pbc3Cob
	 GKOUfsIz0Z1MnyO+a1Za6X3yL5PMe5hl2VrAK0dl1uQQDZFI90bBvsMzQn1wdVf/Uz
	 Z8QU7zQebG2qn9QymaqNUWhXfufA21gBPRAE8qvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA123F80258;
	Fri, 19 Feb 2021 03:55:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ACD0F8020B; Fri, 19 Feb 2021 03:55:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2890EF800C7
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 03:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2890EF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T9m4M0v6"
Received: by mail-qt1-x82b.google.com with SMTP id z32so3023105qtd.8
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 18:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SXsmOxSrWmXM0bUxFvRmWQLOnN33ooEOiTdg5Q4odMY=;
 b=T9m4M0v6mgpazSKltohLQcr/rW2NVMDggJ9g7GjsFF5db/b/UD8GTSpkyyiUTiYHFx
 294r5LAPbTZq+k5w2AzHMYawZNdI5UNoCHjqQW8megt0Tgf5wJCkMZUPUwVM3T9uaMGx
 DtI3QmKYKSwNJd352lPSW977nrZ2/+dorI+oqXKNaptw8XyAPC6HH76AFNX2HPTCDhXs
 ISPjUsKmFmutcOAW7lLwuyTNVY29gw48KKcIDz5knGxq/KqmnNQrV1OPRQOJXHW5lIL2
 ueN7CATQXXhsPk5lmwrIN8c26laAoBrvMjoNh7onl9BDiH9JXMUaS00AlheL6dBowevE
 nl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXsmOxSrWmXM0bUxFvRmWQLOnN33ooEOiTdg5Q4odMY=;
 b=DjRm4HscPJl0lMc6b+2Prqf5HNOD1WqmR4XxNp/j+avCwIqtsDFSFaNdgy6BtuspYC
 I8RWGt9+UFazDSf5/ZkqUOOGcxFBvdeSPAHy1tIfKPzO6q2+2YWxWLsenlBAl0TYlq4k
 EpYaPv5de6Pk6nR3whFoXT3OIlvzWRqm2k/ba0vlRAuOH/UwklnjAcSauXMlQRW4LzfJ
 Vy83A+9a/bVT0lOmfWH5c5aX9YaAhSzEOv0DTtD8TMQqQtextTw8KD5W7JGqvbIBfHZq
 HCG87m0uV9DpyjxiX/uXJHDqi4zDw3hlCv2gQu5VQ7mnNeolM0yjK3kYWXpzxgTPT+Hs
 qqww==
X-Gm-Message-State: AOAM532WUlRBp7VGAXeO/ka8z9nSnjjXS/TQg4JodPqMdCLI//7GhMt5
 GsuKtWV1mc6l973EA1lVBp8crcfG0EjsWc61gWM=
X-Google-Smtp-Source: ABdhPJxnUPVrdQEXZoI7sU2dVS1zAsmq96FAtT1sSw/T4+c3+v+d1GNYLgBwSnlkydQR6I+VIEWLFIKtHhXMcLeaJ2A=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr7127305qtv.360.1613703318340; 
 Thu, 18 Feb 2021 18:55:18 -0800 (PST)
MIME-Version: 1.0
References: <1612756287-4601-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1612756287-4601-1-git-send-email-tiantao6@hisilicon.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Feb 2021 10:55:07 +0800
Message-ID: <CAA+D8AOcKx0k355DhV5jYGhLAoQyG31u+ezz0zDqZQnJHKj84Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: no need to set .owner when using
 module_platform_driver
To: Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 s.hauer@pengutronix.de, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Feb 11, 2021 at 5:21 PM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> the module_platform_driver will call platform_driver_register.
> and It will set the .owner to THIS_MODULE
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

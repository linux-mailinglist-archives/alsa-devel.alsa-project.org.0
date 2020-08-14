Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B812244A53
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 15:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CF3F166D;
	Fri, 14 Aug 2020 15:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CF3F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597411214;
	bh=KGNLwjRd5GKalcTUHBTMfyv9qSkSWandogCiPLAfY0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJ3oMNleBo96WdeTUJUw+5GVXdFU0OKDGhgvKOnFjeNPb7mxW5+WzpkFsaxqxPemy
	 nyqLabVk5m9l86pOpnFiZBExgnUVJVHp3rtcUNT9GqA5aIDdQ0Wui5FXzfgsTH47vn
	 KXankUZ4xfDOmws0CANDeBxhM+x9vfEGKKDXqISo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC296F8022D;
	Fri, 14 Aug 2020 15:18:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F833F8022B; Fri, 14 Aug 2020 15:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BB39F80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 15:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB39F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="YI5fYDIx"
Received: by mail-io1-xd42.google.com with SMTP id k23so10659179iom.10
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2PB/319L1J3UbSsvQXsk+iqaXbh8YEkFfuDe3hnFHE=;
 b=YI5fYDIxlyNW2uGLyD7wh7pch8oOC4a9BM9XzcAV3uzZReGiSnYl8Fzr0GLs8CDPS8
 hbrlmLFTzWfNSKJxC4C7bPefxFdIhNnPRT407Vluos3iBg1hJMvtQHoXZln5na/PQ78L
 yPzVrnSv9VjO5zXwGXHhipg/o6uqzMv7JueLQxV9vudzz95WjoOWWcuRm13N2La14f+C
 UWnlV15BX6PNArrSpyjbkVWLOmpdu+kxCr2jSBZd+UiFBzHhXTCgvoWYwr9F0V0ck2h3
 K1fKgj2AhZGavQoDjUS2fDu/NW4+4MdAvBU4gALuq6tceMnoSbS9VcanPVHg5Zn2SHQ8
 DAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2PB/319L1J3UbSsvQXsk+iqaXbh8YEkFfuDe3hnFHE=;
 b=QzneTU6mxdx5z/9A0s8IgTnnQkXknHxDa4RGzUC05xPdb7Dn6L9Ua8ZMB9YSmJjO3S
 S0q7ZMNwUHhqFkI9LqkE2XicyJpQcFWsBZ1uDrb3fXhbvGEbFs5verIWplTeNJ3182sB
 Y0oIvLpQYvbuGWwZc06IENBVZy9gFQU6oTxI01NPjIgdHrFEsbuSTfbytRjtD4h9EK7J
 S3v8s8Om4blRxQb8arKWrXkjlKUV4+DCUgMrHHvPmJMFX70G6wUedlnSGzH/16LtH8ZI
 YdG7UrcYHeBGibOxPkXhd2WKGXE4N/LtrZvEgvdkeqN9rkB+2sU0G4slx6n3Ha/xaNV9
 9krQ==
X-Gm-Message-State: AOAM532TN0neDzqxKBcQbGpw0G6f0OY4kcuwY8uLmKoyinRgm1VbLf52
 YkE7/dwfpWx01PcB+l4K+ZmdUXWB8QogY3/Ql9LriQ==
X-Google-Smtp-Source: ABdhPJwYd8jpI65/wtT2fNRZWRhTYTd4FnLcZufGtZBAixlBWVHmz9K/7rA4kw/6OBJZEDtXxlHLFhaUiHeMnLm74jQ=
X-Received: by 2002:a02:a584:: with SMTP id b4mr2653129jam.68.1597411096065;
 Fri, 14 Aug 2020 06:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Aug 2020 21:18:05 +0800
Message-ID: <CA+Px+wUYYV=AS51i=7sbLDJ980om5mDp=YwVuOYzEy01WxTf-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add mediatek codec mt6359 driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, bicycle.tasi@mediatek.com,
 eason.yen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
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

On Fri, Aug 14, 2020 at 6:47 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> Jiaxin Yu (2):
>   WIP: ASoC: mediatek: mt6359: add codec driver
>   WIP: dt-bindings: mediatek: mt6359: add codec document

Please remove the "WIP: " prefixes and resend again.

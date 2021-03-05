Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38121331FA3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB6D217D3;
	Tue,  9 Mar 2021 08:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB6D217D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273413;
	bh=QmF+mvS+MLxLt6q3dQkoY40EhjIBy/NHIII8iIh6APQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpKLYF6ivuK/ChHtrT+HQR5vvQR0KAwxQHRmNzIivRGXerZrwgpR8LFyNzawzaCNt
	 RQPQq2JUjaey+gpzWEAlAjgGsGBqtKDtfRYA69ePK1H0NLI/pb0gBlYnrn71jI+LAi
	 Ipszq/LOEubxtA1+gOVf82H9DqlWw28xjfO4I4lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB88F8014E;
	Tue,  9 Mar 2021 08:02:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94C98F8025E; Fri,  5 Mar 2021 13:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90922F800F3
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 13:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90922F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bHjAZhuf"
Received: by mail-wr1-x434.google.com with SMTP id j2so1923813wrx.9
 for <alsa-devel@alsa-project.org>; Fri, 05 Mar 2021 04:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmF+mvS+MLxLt6q3dQkoY40EhjIBy/NHIII8iIh6APQ=;
 b=bHjAZhufUbVM2E/Px0qJ/imHzNvX1/O2wSS2s49c1PdMwr1NmNHqMaRuXPcczu75l9
 cW/D3D1RXj7tRr/0BCgFgr3wTTOPAG+xNNlvxNQrqXzIGNK+SZWuaXTSoSUiBIWa+S75
 yb22bkzeZebfMKeo2Qggt9fImoNaTxorpFA2uz/VeoQ+vIUp3UtPiz6rUM3A1LkqT9k1
 AWe2V923LfTkrqUKrKNUr7LGNGhG3MbtYhwzxDLBGyXliY7mzZj2xN9grbtA4+WIAhcn
 5hAAqGcR5kAZbirU0GnDm82xIOnBXGY4GcPxKby2cJu2M601j3KI8S9FT+DOdPbMr0Ep
 S5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmF+mvS+MLxLt6q3dQkoY40EhjIBy/NHIII8iIh6APQ=;
 b=GXlfh3EQd/9/k9Mdeb6J5w8G56gPiVa/SkbTDQ0Qufzkujvm2SpbhfUiZH9aL8b9ww
 kmZjDGvPs4UBKETQt2kz0Jqhe2ziGXYZEadQJuXBbLy1dzgyHwrdbRq5f2XIfOvy4oxk
 Xfx1RkCLNxJk3LMBoK0V8djXjIymjy1iI04vsZ15NWFAwnn3ZOUSv5ySAyurFkwKprxh
 BAJo9qemEI6egoN7TgVem2bXpF0JZb+FFQywNj60VxrQFModanUw50vfgW2lGk4FVcp3
 vSsRR+bcdwxkSjCK0ZyfYk6gt3Nu95pcBAKbPkdnTeuz09+5oqJeBfsCxKCDFVbnuIZv
 je0A==
X-Gm-Message-State: AOAM532NfiSiqOFB5xSn7MIXnrLmtGltcEZMh/20gXfEFAvM52F7Rxe/
 nRLIizvDIWNPhIs/mbEn59XpmjCfw5Orz7/yXiI=
X-Google-Smtp-Source: ABdhPJwXjMQOM5nzdg/7g/bbUofDP/d6h+41pogdgtczYu3CsbmEQu+kYS+mJ/MZKSwvcgtaRzjf4pLIUt6BcHQLzpU=
X-Received: by 2002:adf:d84d:: with SMTP id k13mr9527969wrl.164.1614948200745; 
 Fri, 05 Mar 2021 04:43:20 -0800 (PST)
MIME-Version: 1.0
References: <1614770488-12861-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1614770488-12861-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 5 Mar 2021 14:43:08 +0200
Message-ID: <CAEnQRZCvYe6n_8MFwfz_MyanJLqH2VAqkgcZ7K9NJkqBPg=r1A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Relax bit clock divider searching
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:01:58 +0100
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, gustavoars@kernel.org,
 ckeepax@opensource.cirrus.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Mar 5, 2021 at 1:15 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> With S20_3LE format case, the sysclk = rate * 384,
> the bclk = rate * 20 * 2, there is no proper bclk divider
> for 384 / 40, because current condition needs exact match.
> So driver fails to configure the clocking:
>
> wm8962 3-001a: Unsupported BCLK ratio 9
>
> Fix this by relaxing bitclk divider searching, so that when
> no exact value can be derived from sysclk pick the closest
> value greater than expected bitclk.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

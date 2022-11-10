Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C861624A5A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:10:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097591651;
	Thu, 10 Nov 2022 20:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097591651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107404;
	bh=G/mBYtyztie+h46PmH/Zk9zR5WE6VE58AciLGHizxbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzLW7JMCTctmrg0Vyc97O7IL07C4R8uK2eW9N3bDYcFBJ3abjVfwwquADY9kxnZkT
	 aC/QbirrIu0twkyWslzcAAKNCwZcGd25/S4d1QL67Un5uPXyg1GIdJZ39ZoKX6adic
	 yP5jTxdsrdvZwdoEXipAGYBtLna1dqUdCL4oehfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF6A9F80104;
	Thu, 10 Nov 2022 20:09:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57670F80104; Thu, 10 Nov 2022 20:09:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECEEEF80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 20:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECEEEF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SmJlkilE"
Received: by mail-pj1-x1035.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so5663016pjs.4
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 11:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G/mBYtyztie+h46PmH/Zk9zR5WE6VE58AciLGHizxbI=;
 b=SmJlkilE12HGb2sxMtzADB8mWWLr5U39bQBL/7O1hZWQtMgy3TV0d93aXgTIPejC8Y
 TyZffY736lWsDPIQDXaXfm7yx202fM43f7/Qi2RvURxY6USUTVgl5gBDL7l7ahZ/BmBA
 qIs77nlaqzDUKb6k6Mu5ysnXIhzPJAtQDbwmK9BA0xmhubloj1e6lV5uhfuLQnau3sMT
 rZRLbzdjxdx5I5AoBAdgY8UtJ3C0k4CQukGnLzed8ga+Xa7e1QDTDFqAFZ1ohGoEJ7QT
 nxBAo6gE0p+3SsTOrVz2D3i/NqabdqYsIY9UvyBfHmJGGLqywLjWc1n5gdtQVqnHjVtM
 ZFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G/mBYtyztie+h46PmH/Zk9zR5WE6VE58AciLGHizxbI=;
 b=KTBppHVBkf7OLITBWaqE/mVyppdyrOrkZ49e3s2shVISfVlPwo0RzVIFitFlmLUXuR
 2AvMS9HEiv+eXfyCXLEHrPXYlNisODz9LRmYUO+AemqTcePw+BVStmSrDgj7Hwb6M/V4
 WKNzPWb+9bPFx2XR7HUP9u42WTyOWgSSBgW++ODtL63ALr8YySXwOSVuEWcVpGx/iJfD
 fDKALO5x8MSefLe7tyMVN8YUTzpmyJUOfFLHpWYGYLGzZkrR1/KMYrTdYZp+U6HicUfT
 jPHFhx/xnXLvJOPIOZt7PkosZjHObnBW/sbT7cETQm+jhUN3Y4ltuEpqc+Y+wAs3pDzk
 92rw==
X-Gm-Message-State: ACrzQf1mtkp+cLAFUPgWGCpanSdJjY6pzfRcpPaOrm7ExKkOc5x8PBma
 UFgYJpYTyPCNdK1MYZOLWuIY7i//dyzuls5khh4=
X-Google-Smtp-Source: AMsMyM5TElItKyrxA7BJRgm8tw06WTvSGL7ZM1pFeJNuHzXf512lMP/JotH3KDH26F5g+z7aWEKllgFznuY37dYZPv4=
X-Received: by 2002:a17:902:cccb:b0:185:4880:91cd with SMTP id
 z11-20020a170902cccb00b00185488091cdmr1758619ple.130.1668107337925; Thu, 10
 Nov 2022 11:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20221110190612.1341469-1-detlev.casanova@collabora.com>
In-Reply-To: <20221110190612.1341469-1-detlev.casanova@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Nov 2022 16:08:44 -0300
Message-ID: <CAOMZO5BiFdVJ5tipBKfo6ZGSeGw4m4raoV_x1y1ffOJgBGg2Xw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
To: Detlev Casanova <detlev.casanova@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:NXP SGTL5000 DRIVER" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

On Thu, Nov 10, 2022 at 4:06 PM Detlev Casanova
<detlev.casanova@collabora.com> wrote:
>
> Since commit bf2aebccddef ("ASoC: sgtl5000: Fix noise on shutdown/remove"),
> the device power control registers are reset when the driver is
> removed/shutdown.
>
> This is an issue when the device is configured to use the PLL clock. The
> device will stop responding if it is still configured to use the PLL
> clock but the PLL clock is powered down.
>
> When rebooting linux, the probe function will show:
> sgtl5000 0-000a: Error reading chip id -11
>
> Make sure that the CHIP_CLK_CTRL is reset to its default value before
> powering down the device.
>
> Fixes: bf2aebccddef ("ASoC: sgtl5000: Fix noise on shutdown/remove")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C724634A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB5C16DA;
	Mon, 17 Aug 2020 11:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB5C16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656391;
	bh=qX871vE+FuBcMCwIyoO/B6faScex0KuAjvcf8gzD10o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amXBOtE7tgvi7bhWvUVWTWKmZUiXVyx/RNzqlnpCgBW5x4l9nx48xc22NcS5R6rPw
	 jn5ZPncfIxJqCRycIlTx4YiPYLjghGRK+1oGFF59klcYxKDZSN4BiQAGqhlYq4DBPj
	 ZeYUietS1AXkXj53w4iuwxVYjcyAVLNja/D+JSso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4917BF8025A;
	Mon, 17 Aug 2020 11:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9649AF80255; Mon, 17 Aug 2020 11:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5178F80218
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 11:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5178F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NAHfXp4U"
Received: by mail-wr1-x442.google.com with SMTP id y3so14226885wrl.4
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qX871vE+FuBcMCwIyoO/B6faScex0KuAjvcf8gzD10o=;
 b=NAHfXp4UBf6Jibtr2eCLhEO9YoL8Wt0anDkAAE2K5TZU53xG1vkvMB2EgNCPhxmGx5
 5T32Kbcf1FdbzuearoAM/32+vKjxF0vhz64kmxZbU9ko7qcmNfkyTlqyF/GFcyxSVLrJ
 4AipYvBmctHdf5NScgCdQmoDe6GBXy6cl050KRWSjF4d85M4QevyefgyHJWjxGkWqVTS
 bbVXr1TUoX220i171lSN7bFYORPx8K6513VEN6ttGYOEkm+naSJ8p2UZxdk0z7fJNMaf
 FjjpeZuHmTS3NmdyQULQ9ufpXW+PaUMUhtPwUwlVvQxYUkLL8MOw27x70MEt5E9DxpzO
 VQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qX871vE+FuBcMCwIyoO/B6faScex0KuAjvcf8gzD10o=;
 b=BruznG4ovULVnUJy8SGgQeSFiqC/RN0WEqna/QU73gQMcoGneNC3M1VJnsb/mlyPj7
 5SZlUAxSG9D0ZEyOmWW+0xdJsupsCEgBR4TlLt4cdo+7JqsZmRFRsRKkg7RQcrS2XBfH
 hsUKEb5ROaerBpf8elDqLy2bXcU3mBu35Np71495r8rWr68TrZA9MPtojEMvqUr4e1XS
 v6oh655bEh5JZRJqXQkbFHPlM2jap8kCMZhbs9u/VWwaKgsmvUM2idsWPTibOQgSsmTJ
 nmEFhLsYp+MMKTekAD8Mm9WY+NjEC6E9lvSFkGdU1aM4nqma4TK07jaNuRA5hB1572GW
 RTCA==
X-Gm-Message-State: AOAM531GxiJjD+2oCK6ssk6gNUSiQPhoKRwjbDcGZGnksYrO8gWhv1qJ
 VG8pQiFnj10nLdaF3Wb4XDFXQaAgVjVAC52Z3fY=
X-Google-Smtp-Source: ABdhPJyqCR0rK5Dp5nj1dXQBMsH1a4xuJvfOer49VOTuXmGUa+ctG1GwTxQ2v/dZNgABIn1M51tgRR3MnRWB5D7Osl8=
X-Received: by 2002:adf:b1dc:: with SMTP id r28mr14132586wra.242.1597655944611; 
 Mon, 17 Aug 2020 02:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hpn7pprl1.wl-tiwai@suse.de>
In-Reply-To: <s5hpn7pprl1.wl-tiwai@suse.de>
From: Allen Pais <allen.cryptic@gmail.com>
Date: Mon, 17 Aug 2020 14:48:53 +0530
Message-ID: <CAEogwTAGHOfBe4ztkx9To0gQGwHwFWzCBxn8nzWJP=wRJUJ56A@mail.gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, keescook@chromium.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, clemens@ladisch.de,
 tiwai@suse.com, nicoleotsuka@gmail.com, Allen Pais <allen.lkml@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
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

>
> Is this targeted for 5.9 or 5.10?

This is targeted for 5.9.

> I have a patch set to drop the whole tasklet usage in sound/*
> (destined for 5.10, to be submitted soon), so if that's for 5.10,
> it'll be likely superfluous.

 I have picked patches from your tree to adapt to this new API.
Those can be picked in 5.10 I suppose.

Thanks.

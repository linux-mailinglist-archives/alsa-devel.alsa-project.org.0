Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A80672B62
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 23:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D8F7BDC;
	Wed, 18 Jan 2023 23:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D8F7BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674081341;
	bh=xJvYbw6U+K+0k8BLB+5FqLiyzX7FBCNqG4euLaaJvIg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=poTdd8WYDfJoC+lshvBt2rZvdRQi/x7iOSbfqswSrNg9N8Qg3Z+GXDWr6Ka8k0RQU
	 wCrwy1k2BzIlSk3Ow1HOfAa8LP0FAXeNt84ZVFWvI4iTqTCgTJrSKNLPYToYKV0JbX
	 pHE+IeFSy35cbi6S5PjzjhXk96waWJTgXFxTIvQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F06FFF80083;
	Wed, 18 Jan 2023 23:34:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BACFF8026D; Wed, 18 Jan 2023 23:34:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B1D8F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 23:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B1D8F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Gw0omF3r
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-4bf16baa865so1284847b3.13
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xJvYbw6U+K+0k8BLB+5FqLiyzX7FBCNqG4euLaaJvIg=;
 b=Gw0omF3rTcAXmt61uekjPSMgv7ju/jQkT+NRYfg9clCCKkBTEB23Evj839n2n8qoNx
 s8Y59LwroPq/lApwG59kNIt6F9v38rKdQRdeYCn4EcLgR2xAE1WUahiFZDjTbGuOsbYL
 yMDJWS0gyHaya9j7vNwSWnJbixaqTqy5xWGZRHjYJhefVMUHoMZ8bsX4pAL93frFHWpL
 YH8kcGWtkNgRG2/YmoUITscmA1Fnpqd7WmdrZkRCYyrazIKac/BIIbegNk7SX6Pb0bNj
 XBsP3S87RV2/SWpTohHkG+rxSMn5w9hGVhnGPDF+4CigzvO0xieBdBkTS0AogF02dkPb
 jJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xJvYbw6U+K+0k8BLB+5FqLiyzX7FBCNqG4euLaaJvIg=;
 b=A6j7yFlh2ynaMBNZCBmszPG6CANTKML2tH9059VQKNI226mKVlx8azZREitNzrVeX5
 CUcQwnxVDNcALERct8OrUOUlFdYMe4mR9NNgoUY/pw5N5qq9PIeQxwpqoMBBgpS2vfjA
 DTiwfdYHGT/nnF94AVEhvhDlgdwhy7fbweYS+K0llsctCvVPr7TZSwA8aBdAgsRduc+q
 I6V3gjww+vgvxjp9fYV+oh1B4mJJaxa3GfSDu8+V93PnkB30vvj3plfapwlFjXBnveus
 s2yIgsm3DkafRp9IRCRTb0FcBDjBmrkgyM2Z/GPtlYUCUXRvL6chR2kUi2l/VLen4PgC
 +J5A==
X-Gm-Message-State: AFqh2krKMC/v3r1JAVmGM+ayga9bMPPTgYcGhACyCZY/7DnEC8XnY8JE
 SQtvCzqE0zReaLRH6ssv0obt17ffto5H0rNr8TkpzA==
X-Google-Smtp-Source: AMrXdXsYvs9R4DumEh82QT8w/5J+EBP6tPUYo8vsrjxDEkR74vY+cmlmPYMXXZqlqcHX/KZpOQ1sN4+YM2TWY7PVyvM=
X-Received: by 2002:a81:4e54:0:b0:4e1:a40a:af7a with SMTP id
 c81-20020a814e54000000b004e1a40aaf7amr1150249ywb.273.1674081277745; Wed, 18
 Jan 2023 14:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20230118161110.521504-1-arnd@kernel.org>
 <20230118161110.521504-4-arnd@kernel.org>
In-Reply-To: <20230118161110.521504-4-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jan 2023 23:34:26 +0100
Message-ID: <CACRpkdZhyL4tTP+=uDB9CfYKRgoKvqp-T+SUzg0YZi4r0Hxy0g@mail.gmail.com>
Subject: Re: [PATCH 4/5] ASoC: ux500: remove stedma40 references
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 18, 2023 at 5:17 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> ux500_pcm_request_chan() is never called because the dma channels
> are already set up from DT. Remove this, along with the
> ux500_msp_dma_params structure.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Now I will try to continue my work on refreshing the Ux500
audio support on top of these patches!

Yours,
Linus Walleij

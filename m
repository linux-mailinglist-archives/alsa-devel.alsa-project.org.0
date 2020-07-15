Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B03422132A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 19:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A90361665;
	Wed, 15 Jul 2020 19:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A90361665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594832794;
	bh=xO+CZHfGaRi24KKOFEYK7t9qFgm6KC4uSFe7PiZwT4w=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hW4e3tTJdTccrR5PmhZCm81KyFkcRN2g5i7DlI9dR++iPnjMRk7bPUiU/b+R/4cAv
	 aoqC8hG8ch61phh4jjQQGUoUk3AUzQkULS7QF/aEqNG/toj1xI3QZ3Ve49U6BZshzV
	 S178T41qMYMfBVbjTt7xHBnvHhn8ZMiKE4rsk3+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D69E5F80217;
	Wed, 15 Jul 2020 19:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61432F8021D; Wed, 15 Jul 2020 19:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58404F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 19:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58404F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="ThOyiQIx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=4Jh+f3MpUewvG9TjlbyiB5BjBplgAIyhzMLRAyxFtWc=; b=ThOyiQIx2gQFq+m1Sl/59B3Jrl
 aXpCyi3qqlMbhmo3b4t5JJXovkOXEzk3Y9LF2cP5TPsWxavBfg5etNB+ZCVAbewunaMC4Xh/5KAOV
 FCXiYpRgDPcCVtT120z3OL4csGwkDqx5rr3TMSjEUrCAtyu7c1Z0lSHmjW4jWVVIo3GY=;
Received: from [10.8.10.223] (helo=work)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jvkpj-000ynD-1Q; Wed, 15 Jul 2020 20:04:39 +0300
Message-ID: <e1282824eaa7ab0b220b44e5573e3ed0b8c34b9e.camel@tsoy.me>
Subject: Re: [PATCH 10/10] ALSA: usb-audio: Replace blacklist word
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Date: Wed, 15 Jul 2020 20:04:37 +0300
In-Reply-To: <20200714172631.25371-11-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
 <20200714172631.25371-11-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

В Вт, 14/07/2020 в 19:26 +0200, Takashi Iwai пишет:
> Follow the recent inclusive terminology guidelines and replace the
> word "blacklist" appropriately.
> 
> Only a comment fix, no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/quirks-table.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 4ec491011b19..336d81bb5fd1 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -127,7 +127,7 @@
>  /*
>   * HP Wireless Audio
>   * When not ignored, causes instability issues for some users,
> forcing them to
> - * blacklist the entire module.
> + * skip the entire module.

Maybe something like "disable loading" is more appropriate here?
"blacklist" here means literally "blacklist" option in modprobe.d
or modprobe.blacklist= cmdline option.

>   */
>  {
>  	USB_DEVICE(0x0424, 0xb832),


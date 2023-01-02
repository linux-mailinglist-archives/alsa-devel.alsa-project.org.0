Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42565B757
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 22:16:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04B3AB22;
	Mon,  2 Jan 2023 22:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04B3AB22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672694185;
	bh=VdCFEjL/pXhO3/s2/6Z/F/sNBWs9tGLAKOlX1du+ZVg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZoyOtAVl7q+J/kUmzgxhqTsHTZr2Xy+8cb0FugpOVEOc5y1gOXkWGz2KCxHORCTMQ
	 eO6UTRl5v4arhmuBYsUKXQfsbRYD0vsZ9XQy2zpwGPiKPEsesxXsOtV4o9YVdFSO7Y
	 zHsIxV8moeiyJu1irOeeKKWegOARTd+l9z7RqD84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE6DF800C0;
	Mon,  2 Jan 2023 22:15:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DED0F8023A; Mon,  2 Jan 2023 22:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFC92F800C0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 22:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC92F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V7xHsaHW
Received: by mail-ot1-x336.google.com with SMTP id
 k44-20020a9d19af000000b00683e176ab01so13170438otk.13
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 13:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SW0oRVfU9E9kddNcaOCqOIe25DN6FqPgevlyVzRceYs=;
 b=V7xHsaHWfrYGJToPfcJGIYGLLiNaZYa+eqarT/yNA5ebilDf7DWQj+UelxBPPQ7Znw
 IULfV0EMtcn43S+Y+putXx4XMYZKemRLliwr3DnUSdT36hlhUE61erWDdyg5n5J57tRz
 a7jqDOpHXEdmdj21aWvGWcOXhzetC2pMYGj9zwK1hNkIE2QwOvhIpDz679t1mNMtDu6X
 m4sV7omY5l/70JmJw5J7otilZhaGPMqJA9+9vv6TeIVGk0q//RgAflnQtYIuQ61AiJvh
 yV/T7oPCBpVywuSneNDWkQRlc3rjJgdIr2pFLO9c0tKocU0Dr9b4jGemTNHPo/a3bXSU
 uE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SW0oRVfU9E9kddNcaOCqOIe25DN6FqPgevlyVzRceYs=;
 b=HSa5KaV0zB1UZor50fT0Vkm88eXSEwWjmBcu8qdMWhSI1k4B+088MtXNGZLFAkS77E
 lDCIWpQoPHiOy/jyu0sJB/esbwh6J+q+jwzFkIG95TKKNVf6Z6ESDpFBr/LdXoH5vqrx
 EfmOpo3WyykKyt8F6YeoQFFWs5Sd9ANxE7g+dY0R+yNIXOuODdaLHkWS54XeJKjsK2qE
 MCXoueCrxvwcH4b8tIyhcBTkiL43l5H+vZJfSC09ejHjNyRExu7WX8s8sWCnsbYe145F
 2tK5twoqfaVzQ+KQwLZJhtkImti2f06uqS2r2s+lGm+fa6adZttsSs086bl0kvl8mgxy
 f0Fw==
X-Gm-Message-State: AFqh2kq077tYR3hub5lNlYBIyJiYX3jsTuArJGZXywbtqhFZ94tXQnm4
 uuvtamUMbxm8SJHG4y9Sy2E=
X-Google-Smtp-Source: AMrXdXsBGe/5tX1JQDigKkFkZdMLjG0utWKvMQGzJQVGWbHv741pPeBpWEL/xiXNmMaaj8jnQxGSDA==
X-Received: by 2002:a9d:6057:0:b0:675:1aa2:5e40 with SMTP id
 v23-20020a9d6057000000b006751aa25e40mr23942592otj.17.1672694120504; 
 Mon, 02 Jan 2023 13:15:20 -0800 (PST)
Received: from geday ([2804:7f2:8002:cb32:cc6f:d0db:e73:5ece])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a0568301d4600b0067088ff2b45sm13957443oth.37.2023.01.02.13.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:15:19 -0800 (PST)
Date: Mon, 2 Jan 2023 18:15:25 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/3] ALSA: usb-audio: Fix a few implicit fb sync issues
Message-ID: <Y7NJbVBuiDHlJbgb@geday>
References: <20230102170759.29610-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102170759.29610-1-tiwai@suse.de>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jan 02, 2023 at 06:07:56PM +0100, Takashi Iwai wrote:
> Hi,

Hi Takashi,

> 
> this is a series of patches for addressing the remaining problem with
> the implicit fb sync.  The first one is to cover the left over EP run
> state at re-configuring PCM.  The second one is a workaround for a
> regression with the hw constraints, and the last one is the
> refactoring and fix for the multiple EPs assigned in the format list.
>

Perhaps it would be wise to include tag
"Reported-by: Ruud van Asseldonk <ruud@veniogames.com>"
in the relevants commits tied to this series, as Ruud did share a small
reproducing C program and went so far as to bisect the regression.

Thanks,
Geraldo Nascimento

> 
> Takashi
> 
> ===
> 
> Takashi Iwai (3):
>   ALSA: usb-audio: Make sure to stop endpoints before closing EPs
>   ALSA: usb-audio: Relax hw constraints for implicit fb sync
>   ALSA: usb-audio: More refactoring of hw constraint rules
> 
>  sound/usb/pcm.c | 217 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 134 insertions(+), 83 deletions(-)
> 
> -- 
> 2.35.3
> 

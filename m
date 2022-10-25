Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B160C1BA
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 04:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0852361D1;
	Tue, 25 Oct 2022 04:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0852361D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666665120;
	bh=y9Yc+laQ9+DxE5zL5BFHjRdIE1TTwOC7PZJho01015o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FPPeoxv1JQH/E8XE9B6yskniLrNlUDS4Y2Kn7Kfs/6znViX9POeJaeR+Irtxw9cWE
	 9ifOQO5uBuzcW9ntnnv8BCMPkkktaqIyqq3x5DP9npF+WPx0eVrECR75mpxyCTzj8x
	 39EMKZkSLegxhN80UVotVWhtH6IeeNN2t2beVIrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77451F80448;
	Tue, 25 Oct 2022 04:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB011F80240; Tue, 25 Oct 2022 04:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74797F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 04:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74797F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NKGfkW7g"
Received: by mail-ua1-x936.google.com with SMTP id f12so5406548uae.3
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 19:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y9Yc+laQ9+DxE5zL5BFHjRdIE1TTwOC7PZJho01015o=;
 b=NKGfkW7girzG1YR7hd+foPmKX3P2WOjRX+a7HQ04F5f83cg+WrR2ufvNZehHBelsu1
 TgtfPGs9siU9vqt3KsugwgGtRik+7uTLGp02r5VXpuHOfQpISF9ilzRPTr+AdJlLlR5u
 WgsJwEtsu3ReHTjO6VTCjhLsmaueMO7tqYuzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y9Yc+laQ9+DxE5zL5BFHjRdIE1TTwOC7PZJho01015o=;
 b=XkX1DvpeVJODVgMg9GGEI0LSBewYL+BjUV6J+HBz+TZybsZynO3Bpk9xtB3AZPWscj
 1rnbAC/OuV4D5pK5stuE380c+iZlCDnZaZnUsIpm1O85z2V/3+IVYP4FiNdvFQrDW5NL
 GwlFNPOcxAc5icypeLYu+soI5nFImrjcz9u4tb3LEA3WyZlgZJJrtbgXnFMTziSZRw+q
 xbyTA1M8QT6oNNnoy8QnWej7G/eRGUIvsy9wajRWC/YMWolWE4BALGRoG7K3IQdWfpYx
 oY7wFTdTINExtzDzaxhY5e64eDw1GRWGgrqoYBW8713ZgOF1vEpIn2bNblWx/7vIzuhB
 cpeg==
X-Gm-Message-State: ACrzQf08Gx64ZVqkAq2JNtKLqrArTx552w9u3jWqixj7LitimYL9SN21
 f2SxRwEepfo0IsdVAtS9OI+OA4ZnP1RYW5qMyujoDw==
X-Google-Smtp-Source: AMsMyM5UckArDa8dEk7rn4Om1hvtOru9HZGn1ILjR/MjOGwWc9WYR20BToCUho5YwIwOTfrVH+3HhZk5Crv0wsAkqv0=
X-Received: by 2002:ab0:1d82:0:b0:40e:9f5:91bc with SMTP id
 l2-20020ab01d82000000b0040e09f591bcmr2381411uak.78.1666665059214; Mon, 24 Oct
 2022 19:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221025020444.2618586-1-tzungbi@kernel.org>
In-Reply-To: <20221025020444.2618586-1-tzungbi@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 19:30:48 -0700
Message-ID: <CAGXv+5FZxFUfqvMKmT41VgubaiDN7=qZQQ2tYbT-899AOt+w7A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update Tzung-Bi's email address
To: Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
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

On Mon, Oct 24, 2022 at 7:06 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Use kernel.org account instead.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

You could also update .mailmap?

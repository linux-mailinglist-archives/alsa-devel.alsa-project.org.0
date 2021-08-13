Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204613EB96D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 17:47:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 983801868;
	Fri, 13 Aug 2021 17:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 983801868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628869633;
	bh=IHuDdb+WXOFRmC/LOUYJlgHAErWRMwyktxLBxGw0HxU=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r+chqEWWmC5IDERVWtmYP7dH43eb673fpun4VwErOb/vAG3Gbq1f9PWoK7TjqoeBV
	 RMQO8Q15jEmRt5Q+3C9dJX+l998+kz+RJZ8GrTVr5L3c9EeQDMeDAv1x5YICyNAOt1
	 D3Pfj2i0nIBy+hI03p9E/5WZ6RCIY2U1vbm7kaPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE04F8032D;
	Fri, 13 Aug 2021 17:45:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC064F800E5; Fri, 13 Aug 2021 17:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99750F800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 17:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99750F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ULJhbpXY"
Received: by mail-ot1-x32a.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so12509489otu.8
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IHuDdb+WXOFRmC/LOUYJlgHAErWRMwyktxLBxGw0HxU=;
 b=ULJhbpXYjp+Nb8nY1QTOgIpZmKriaLS+clQDyIrL8scdUS5+wl8flBUQ4HzjFvIX/g
 PTptRsZbYKnkrHyCt2PRmyg3y2GLz8cMmnK7Lk1N2WsGD795suYVsbcmsSHs4Yn5kkRk
 Qss57AaOCHYzvnPVU1iL65kI5NPBEssmAUg0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IHuDdb+WXOFRmC/LOUYJlgHAErWRMwyktxLBxGw0HxU=;
 b=pl93mNJGKEYN1C7kCBdU6769yfFdNp9ZqjK900DGTps5w++As05uT0v2AgKidY7bjB
 7ezJi4hPoyvA+/I0ZwYegJuTZJizqG5Y91CMptXppRRNh5GXoc5GaBEuaJsNCqphIbhi
 7YAFDC0b5Eypdp4Hoh3GReWmLjd6AknkG8NndqWGvSsN9LwO8y571iPOkHKPHQORB3ds
 2Hnn0BkTNEMNWYDSz3RYMVRZjL3cB3bNrfuo6GG8gh2fKOP77iqPcSN3WSRQHGbsV86S
 tUoJJF7DczCNuCuWWKQm61oBkKHfmAhwsW17gBY0egyxumO2Q+BDNOfKNK55J67+ZSuO
 qIFg==
X-Gm-Message-State: AOAM532j9UCEN6sGoRJOy4WrlyVgr6i5hIhsr7HCbbu1DIpDYOKaaWDg
 OvrWIFV79HPaeDi+7+QYgeqxo6/fWHkcRQVBTFzG6g==
X-Google-Smtp-Source: ABdhPJxJH8BwLTYD+I8QdwbyJlfIh+pbTo/uAp5m5ivMZnAvzUrlZ7qudZrfjyIc8BvwEVNQ0YP54Lm9a9ekOKdE+x8=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr2650353oti.25.1628869530754;
 Fri, 13 Aug 2021 08:45:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Aug 2021 08:45:30 -0700
MIME-Version: 1.0
In-Reply-To: <20210813073402.1.Iaa9425cfab80f5233afa78b32d02b6dc23256eb3@changeid>
References: <20210813073402.1.Iaa9425cfab80f5233afa78b32d02b6dc23256eb3@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 13 Aug 2021 08:45:30 -0700
Message-ID: <CAE-0n50VyHtGf4TmZBdsQ+nFo_SPk2dBofLgYCQsgZtZyTs-iQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Remove unused variable in
 rt5682_i2c_remove()
To: Douglas Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

Quoting Douglas Anderson (2021-08-13 07:34:05)
> In commit 772d44526e20 ("ASoC: rt5682: Properly turn off regulators if
> wrong device ID") I deleted code but forgot to delete a variable
> that's now unused. Delete it.
>
> Fixes: 772d44526e20 ("ASoC: rt5682: Properly turn off regulators if wrong device ID")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

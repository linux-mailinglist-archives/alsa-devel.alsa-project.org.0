Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B360350A57B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551AF1672;
	Thu, 21 Apr 2022 18:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551AF1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558620;
	bh=GPA2eJSOAsJuxgsx3hYopaNOvAXCHZuUwk5FjjilgpI=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o89P8lTok9NmbQBh3zdefJundQbqsZnTWZ7YT3CHaEqpyo+n+el7J/JBiOxkay02U
	 xcdAwffPq117b4k1/Wry8yhJZt2KgVVBo7CLRLZ3tF7FbGYLlAELLazPVX+Ji/I6rE
	 iOf882fcZzBAifmhaP7u1rJzb+XtNDikBFDDBYVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC3D5F8047D;
	Thu, 21 Apr 2022 18:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 187DDF8032D; Thu, 21 Apr 2022 18:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E283F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E283F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="kiRnNazc"
Received: by mail-wm1-x332.google.com with SMTP id bg25so2819171wmb.4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=vrEs/2pEILP9d1ISDp34/8wtCsJViJ6D/+Hs3vTnWsI=;
 b=kiRnNazcdTuefZZxff/Lv7MqYKxC82ka2qvvv0JcQaQ5eXgb3C1Td1A6Yjqd9oSHjW
 cMbnQC3KtAdteb6sdIvj+QXOwx4ornXjnKbeU5vSxw0jCC17VrGZfmOrM4sXwlVVndEH
 JPAKQS8ZxSqC6VQv1Z9KYKx9e6oAIIg3+US9C7QWCuam4Z+S244I7ecKXVgyO9+PsZvW
 esjoVzMxM+KA87KPOtThU5FRSN9h4WqEZXzc7y2IlFAi9oejv6HKiIsgCkuGcnDbUzeV
 qWmJ6gqtGwT9I3hN8m64D4R4cyImSkG161BjeGoRFRYFJOzDk+XHe3yAisQDlDb7PhdY
 Xa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=vrEs/2pEILP9d1ISDp34/8wtCsJViJ6D/+Hs3vTnWsI=;
 b=Nz3+fdleVabpTaD/04hISTeip0keFemoN9EeUykOrIkYGxdxgVnksRiI6E9b7+GIp5
 BK+wUOIFeDojyiCZ6NUm7/yDk6dyHXmTp7bVu9u0Xi0g12mMUfrlGRhPueZr0+t3xJGb
 cBwC1jokrRvpLPmMtX3IaB/bFr2qf87+n138OdJ8GTD8R1ve44E3qjhcMHeS0Kt65lqq
 7IAxGECfHLmTfesONcsVJBHLARpaFUkM3c5oPYaw2O4NHxSYhN5NI8ysgSRlTyINFKsh
 ynOBNI/gAqPqWUmaApIgxqoONYjK+xePmB0iVxIgiMdTDeH3gcUHHsEpzXE36iEFp8+p
 SgMw==
X-Gm-Message-State: AOAM531LS8YQP7Ouk62ZgfzRy97KsKdABVbNW+W8JFoIveVkZpbznqUy
 SyhOjd5vzch8kHIFSqEdvzJ8GA==
X-Google-Smtp-Source: ABdhPJyQaNKtS9rLLBu7H6jeDjbWV36SMhQuTvDDlstfthSmDE74vKvCmC4ESH0lxl25edccn/nitw==
X-Received: by 2002:a05:600c:a06:b0:37b:fdd8:4f8 with SMTP id
 z6-20020a05600c0a0600b0037bfdd804f8mr9664089wmp.41.1650558550287; 
 Thu, 21 Apr 2022 09:29:10 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm2576235wmb.48.2022.04.21.09.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 09:29:09 -0700 (PDT)
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Date: Thu, 21 Apr 2022 18:17:02 +0200
In-reply-to: <20220421155725.2589089-1-narmstrong@baylibre.com>
Message-ID: <1jwnfixuwc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Dmitry Shmidt <dimitrysh@google.com>
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


On Thu 21 Apr 2022 at 17:57, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> causes the following system crash when using audio:
>  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282
>
> Reported-by: Dmitry Shmidt <dimitrysh@google.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

For both:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

The main reason for the this was to be able to configure the start order
between the DPCM Backend and Frontend. Only the trigger() callback has
that capability for now.

This HW require the BE to start before FE, otherwise channels get randomly
shifted in the output stream if there is more than 2 slots on the link,
mainly on the capture path.

This HW require mutexes to handle the TDM formatters (because it uses
the CCF API). This why I moved to non-atomic to use trigger(),
forgetting that doing so would make period_elapsed() take a mutex from
the IRQ ... :/

To properly fix this, I'll need to extend ASoC so the prepare() callback
BE/FE call order can also be configured.


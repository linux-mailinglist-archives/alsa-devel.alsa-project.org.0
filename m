Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD151FA0C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 20:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1436B16B9;
	Wed, 15 May 2019 20:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1436B16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557945317;
	bh=s3S+wQREXmjW7tD5/hVjzDI5ZGGvgIH2XZ9H8onTOyg=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0Nb4lgFq8JKdL2I2hhx+JtJKZNfaQ41EMMWOkr2ZNbV+3YO2UamuwJ1PvX8st8lS
	 LVXEL/FUZsy8gIxLrJ9sVz1BjcKWefVCwjkV/7r+vFcHOUJBWw8A7Xlj6jsL9lkLOf
	 56FJjgQJbzabXQUqoYzSb1WeUQlRibtzTyB2Nu9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD91F8968A;
	Wed, 15 May 2019 20:33:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E29FF8968A; Wed, 15 May 2019 20:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31FB9F8078F
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 20:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31FB9F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="1qr5UW1h"
Received: by mail-pf1-x441.google.com with SMTP id s11so388746pfm.12
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KTn4Z+mP+RK9qfYjM/8C+gF7DHUoeVhnhade+GuKjk4=;
 b=1qr5UW1hGKCD1t9Lva/WBysBSCPPi07jakQMbn5YKqeIpXFI1j60Sqn0793aukY46q
 CmQAicqUN2t3dlERSLLqZnF3xzjDMU3ojhnsIXn0feXMYgbxasdk8E2h9K+Xtsjx3Kfs
 PCeZmfQTaJA7sH1py4q+nuMh5ZytiTYn54FamSdbLq1Elg+rNRdGVrFpaG6KI8HrqW2S
 yyEwTA4pSWJbiaTFJwRZtRPCAZia3yJHaabp+Q353LeX/l/tN807VLhvt+pB1+2utqfM
 1ECCPRDY+VwvfzTY8VDQExnN8849lbIAEzZjNKP0AZY3X4Zxahe7+M92uJAOozk8ecL8
 jNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KTn4Z+mP+RK9qfYjM/8C+gF7DHUoeVhnhade+GuKjk4=;
 b=lpAJQDoBiBPjEXUxgyatzYIUa38Ve4Eqx6fKzxu3zJr3jgcIgj7WxLNt1jX4X3wXNw
 zBMBVaUJJibwT8Zj4WiVBq+6tLZxhjjAE9yiJlmSCgVZTocRevcCJkmg903X1knxtDny
 TZAreh4JqmIWjYAInCyOX13gb/sybPuEUT0hgbzANkfsvTXjs/jUeAqEHYcMVveXMymz
 k5ESKtFVgbyukbwmrC3WEl0duA7sBnPMe5EQROzLbHdmAXM6J5ocNDD7wl0g/U88SRW7
 zFi4MeggGhdHLPljn3v5Ops4Gez9JNHSwRDxx0JwtiXEeg6UhdRUGvMfaz5flH0mjpaR
 cbzA==
X-Gm-Message-State: APjAAAXi/a/LQ6MXH37KXoXCoMKmkSCxHc7+KWRZ6WY4dqzU0HQpbMUN
 5WbAVxmmVwblArl5m9Zhll1OZA==
X-Google-Smtp-Source: APXvYqy/xNuRdj0vQvs/4sL1fODiYHQj+T+AwczqxGkZPytjid2N4wSlezxn8X+oTdH3vdNaXnYwow==
X-Received: by 2002:a65:480c:: with SMTP id h12mr44587808pgs.266.1557945199335; 
 Wed, 15 May 2019 11:33:19 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:20fc:89b:acbc:4e17])
 by smtp.googlemail.com with ESMTPSA id
 q128sm3528980pfb.164.2019.05.15.11.33.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 11:33:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
Date: Wed, 15 May 2019 11:33:17 -0700
Message-ID: <7h7eard0uq.fsf@baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: meson: add hdmitx glue support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Jerome Brunet <jbrunet@baylibre.com> writes:

> On the Amlogic SoC, there is a glue between the SoC audio outputs and the
> input of the embedded Synopsys HDMI controller.
>
> On the g12a, this glue is mostly a couple of muxes to select the i2s and
> spdif inputs of the hdmi controller. Each of these inputs may have
> different hw_params and fmt which makes our life a little bit more
> interesting, especially when switching between to active inputs.
>
> This glue is modeled as codec driver and uses codec-to-codec links to
> connect to the Synopsys controller. This allows to use the regular
> hdmi-codec driver (used by dw-hdmi i2s).
>
> To avoid glitches while switching input, the trick is to temporarily
> force a disconnection of the mux output, which shutdowns the output dai
> link. This also ensure that the stream parameters and fmt are updated
> when the output is connected back.

Tested-by: Kevin Hilman <khilman@baylibre.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FFB1B5596
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 09:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D10416F5;
	Thu, 23 Apr 2020 09:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D10416F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587626814;
	bh=ZBYbrHc9gCXcCuzO2lECvk3wELc9S8J5/i/PXerFdr0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldqImZXT97kX5g49j8qg2FZ398T3qcSIDLs/C+rZO5xRHP19r5bwi7jiYoJPkMlJb
	 /xZSPUDbcauDxn38lPe9LtMY60h0s9QQP1a61EoRMoZiDY84apQTjt8K0uYnZb83tv
	 0F5hjJQkyAkyEf8RuGk3WEa+zO3txBJrvapwfWHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 419D4F800FF;
	Thu, 23 Apr 2020 09:25:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE363F801D9; Wed, 22 Apr 2020 20:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32485F800F2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 20:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32485F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o616xSUI"
Received: by mail-wm1-x341.google.com with SMTP id u127so3729146wmg.1
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hkalyHJqg5ugOHKHuOFHI5AizfqrqyG86NTtO7Wz1Bc=;
 b=o616xSUIWsXUZfomNboyu/h8ArKESuhk0FtuGwCsMq6kL9BhmyjqH3dcHuB6mKgtEj
 bzxvU8hgmNPz4EFPF78sp5Ib9xIxttNhF9KWK5vxENRPRH7D4hyaE99zJyH6+PeioE4H
 jBRuShkyAQOipnSws+heJ+ARZyr97zJJ+ZZMgvK5vIYTUTPonF4rN7XYOMcaFYBN0KaP
 iu5fbYsk9vBo6bnjQk9/mKSpY277R7thivsLBi/elUDGZ3XIS5N6JoZRLb3PQZKmCzvj
 GQ+8uR6861mxeS2iheJfeD6rWeo2h2WS3lum3I9nLjsQsmNqz69yHTwNhv3oCs7Kd1TO
 9lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hkalyHJqg5ugOHKHuOFHI5AizfqrqyG86NTtO7Wz1Bc=;
 b=p85rL+vepxCHeUqEqY5BV+rf0yOcW5o3uY/kX2zWczRvCfOCF0dba9JtikJZA0t9nf
 EzuzNKrKMZ3+RwoVUwwXU2dthtzanTNdAWkAuGVjDQyqGYK+HBpFY//EY1dDce0E56Mm
 kHKwBDohF26SV9dY43H8sCMi5SDQHTWS/Ca67/7PCnP1uMxYhzT/Rk9yarct9oZvL1MR
 JC7nPJWoP73P/R6pS3q1MNzeN1mUWXnQuqZcOHpcc6LVMhz0cC2tbOBfKHzqujX1qRoE
 U7CycMCCvQTGcahg46fz5Booae9rkiJMuunaT7gl4hkFYKqfTXNSSKSvChEZlSzxx/bg
 5pJw==
X-Gm-Message-State: AGi0PuZNSlpVJg99+Vyv4ykANdzNGKYL1JE2cWsxnMO5XrC7W81MAlQe
 EKMhWqpC/+jQVdwDlxcv3Q0=
X-Google-Smtp-Source: APiQypJLC7phBF0Yw8BoGoCloB2GTITOavOKuDxc7rGEQWR0RgqUB6wattNHXMe8HqoWNPsT7DRGrw==
X-Received: by 2002:a1c:c2d4:: with SMTP id
 s203mr12900240wmf.128.1587581730932; 
 Wed, 22 Apr 2020 11:55:30 -0700 (PDT)
Received: from localhost.localdomain ([91.221.170.230])
 by smtp.googlemail.com with ESMTPSA id a67sm244292wmc.30.2020.04.22.11.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 11:55:30 -0700 (PDT)
From: Gregor Pintar <grpintar@gmail.com>
To: alexander@tsoy.me
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett 2i4
 2nd gen
Date: Wed, 22 Apr 2020 20:55:22 +0200
Message-Id: <20200422185522.3347-1-grpintar@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7190177d62f349eea7a5d1056924a63fc4270d43.camel@tsoy.me>
References: <7190177d62f349eea7a5d1056924a63fc4270d43.camel@tsoy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Apr 2020 09:25:07 +0200
Cc: tiwai@suse.de, Gregor Pintar <grpintar@gmail.com>,
 alsa-devel@alsa-project.org
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

On Wed, 22 Apr 2020 Alexander Tsoy wrote:
> В Вт, 21/04/2020 в 21:31 +0200, Takashi Iwai пишет:
> > I wonder, though, whether we can correct the rounding error in the
> > driver code, too.
> 
> I'm not sure if it's possible with currently used Q16.16 arithmetic.

Maybe calculate fixed correction shifts (like it would be feedback)?
Something like leap year.

In endpoint.c:
static inline unsigned get_usb_high_speed_rate(unsigned int rate)
{
	return ((rate << 10) + 62) / 125;
}
I guess 62 tries to round it, but exact number is needed. So exact value for
44100 should be 361267.2. For 48000 it is 360448.
If only we can deliver that 0.2 by shifting rate somehow?

At least maybe it would be better to disable sample rates that do not divide
by 1000 on SYNC playback endpoints, if there are others sample rates.

But I'm not familar with the code or USB.


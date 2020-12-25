Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB772E298A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 04:13:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1471F183F;
	Fri, 25 Dec 2020 04:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1471F183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608866035;
	bh=DJOL8UV8z5hcR8g8wWRxQRTITu2XsLNAWmNHVpDV3mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tO4Thf4Cv2DhCuQl5QSMnqEYszp7NQK7+NqEFM12XvRpcMU94/ufmCUqc3B/wZjnh
	 JCx8fiUAjcxzPPhSsYVLv7kXGq+5FaOk0ilByJcV2WfdgH832qxwprRh3mgYyhrPZO
	 wlCFHNBMY7Qvu2F1YykS+3nn5iU6OON+4YBxbdlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88EA9F80113;
	Fri, 25 Dec 2020 04:12:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0472F801D5; Fri, 25 Dec 2020 04:12:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 783A6F800AB
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 04:12:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 783A6F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pEcGjUXO"
Received: by mail-io1-xd2e.google.com with SMTP id z5so3240047iob.11
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 19:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kz8XSagp7CkDbgHAUJuSlRq3MwJ6dmhfE4c4FIgNp4o=;
 b=pEcGjUXOqtx62CfLtyz87uDNkfDmx2T/k6JTJfEFkoaWensJK0QUZurYhbKw+9W6W8
 TgOEALzqpFuSj3hDYzmbj2FueR0tqwawpFBadVRPUk/RA2skwGEd3qfgeY7mQ3WSDPgN
 C0kHZrLjaOJW6FtVsAEiX+KeBH1/oDW3F9vW3OBe1Lu4r4rkE5O+eRLOvC4OqF24lolL
 bFIm5rgFkdt8ry85T4pGrb9O2wSIL1dA4cBLUQiOxotHYg/bNhlMi0+FkE5V+j0Hcrqg
 Ergymx0Zeb9B7atAw3fN2r4yq/JU2hqDsWuyL5sGPe5XHpQEGqWbzAPRKTHQQoJmBd4X
 DyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kz8XSagp7CkDbgHAUJuSlRq3MwJ6dmhfE4c4FIgNp4o=;
 b=RIifs07KqWSTlCBBUQARPA8UGuCfR0x2Tvf418ehBDZuSOGdIF1XZ0zK5dFK72DD0w
 laAzSQGMYLR+gxDXQ3fF6zygWwC7JQqYQ3mqDqOMYz12QSUDKZTGyQeFLEzLHMF2wjcr
 WVs57liEKhXCpxqsIqleyjFMo9BUAo9rk5mSTL5PdNHirJFxhqoCmCrES4xgaI/zbe2a
 Cj4OpK6sjCdLW3B7WsFsRChGiLCGHKXE/3a5wIr4sWj3u69dI0bseRoM84qErQ4tCkt6
 D5xG/EVcvrKznXDQAmpMeWH3HvOpPsLNiY7/az+fljUNnVo2Zlc187GpM9adTMujhm93
 R2kQ==
X-Gm-Message-State: AOAM533gOkJF6BBA2M3Ncp7BBDBnOnYnXJlJ8iYAG/zifLzRKolVBfqu
 lB3vkNHSqdigrMTQJtxkqU+ML8tG8PrRzWFB9AyFtuJDpvxtqw==
X-Google-Smtp-Source: ABdhPJwJvjar/N/Q5cCIGxufL3sbkgzfX0oh5Q55bi+BLg0jSAVa2WZnsWRSgVEx2zdLtT77ivU/cxeaLip7F0qyBn4=
X-Received: by 2002:a02:2a4f:: with SMTP id w76mr28360624jaw.50.1608865929896; 
 Thu, 24 Dec 2020 19:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20201224101034.3018244-1-tzungbi@google.com>
In-Reply-To: <20201224101034.3018244-1-tzungbi@google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 25 Dec 2020 11:11:59 +0800
Message-ID: <CA+Px+wW1cKbOXWjfJUSzmKgrwgNbX-Fb_HfgmkSPRUQAcj5G4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt1015: reset cali_done when suspending
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Thu, Dec 24, 2020 at 6:10 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Assuming the calibration state gets lost after system suspend.  Resets
> cali_done when suspending.

I guess re-calibrate again when resuming is better (to not depend on
userspace needs to set mixer controls again):
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-December/178623.html

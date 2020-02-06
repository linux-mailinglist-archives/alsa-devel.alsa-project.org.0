Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C9153C3B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 01:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4EB1682;
	Thu,  6 Feb 2020 01:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4EB1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580947486;
	bh=q7GkbH5t0o2g8+r78UH/12KGRuhBhc3WNzj2NFHj+eg=;
	h=In-Reply-To:References:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0oDHCArdi5QPCjZoRPUSLYUIqJ7mZC4lkRZ6dgaqXp2Szr+i+dPcfJQ16u38Ilsk
	 /Vb6Ha5Mp7bX8Sdr/jQJHzj26I6ipcTG3oAESIvp4+wtGNMxMJXm+9aqhPEcaZmKrx
	 NZCpkk5a+lEsYY2KpznXubMDjLrERHmRpi9xLYKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6864BF80051;
	Thu,  6 Feb 2020 01:03:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10DEAF80148; Thu,  6 Feb 2020 01:03:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18757F80142
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 01:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18757F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="pOlkEbd7"
Received: by mail-yb1-xb41.google.com with SMTP id f21so33344ybg.11
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=p/hAx7ykwozfbDkJFRb2sFhR7F8ihh/2GRzXDRxUrwk=;
 b=pOlkEbd7b/kho2grFcMA2tCxz0eUn/fw+PZhdkj35huCmfKj0lTjvgTekStJRb9PrM
 yFvTMUqNpQfm184evOGg4dzGUAKPaw5cYO84VcjJYsIX2pxCU8ZKKNme/iFwrxjkKaNv
 etkVcROBmLwNg0RFRJP5IQtqCV5SnFtgdPJOpSZFMdJcKezHSn0C8rZvToiEGamOKl0c
 Q+go5iGH4q/eD4ng+9Z3PKOK60cvqUL8OVl6jk5CQWJCcl2ClvPYqj/erEb2dnqPFHSM
 mg02B2wPYGEKihO9shH8vquit6R2i9C1ulWHKsL+zChWr/Ap+3QxTbhhPgCT9jKa9YcW
 ljnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=p/hAx7ykwozfbDkJFRb2sFhR7F8ihh/2GRzXDRxUrwk=;
 b=Y4ja8nlUaUEnZVOFMVS6+rhK08VA8OFgHsWfi1WidK9e+nHjagWzkHD2H1f53t8Ghi
 UgofBWo14gkiKYOM8n22vip3FR+OWL/ofbinO6rzEgCqZ+7pcbxNcAp6ks/N1jm+N+F+
 CbZYJ//WN+Wzvt2aCahw73j2geq7wpizLAuZDwWkiKFEI+ku2IfsDy6hbcoa6P9e9k1K
 d2Kz1VveSGkxZi/+Rvz9XEy8Ovhbi+wgKFCWfzWnXWWkBnZZX5y/D8+EnheWnz2ORVCD
 rofoFRZLgQr09cxn71Dx2N1wDCGnRuAhIeIFq5NxqUD7RxmVWy6evKiZd8c7vLPoaMhX
 qO0A==
X-Gm-Message-State: APjAAAVPZOA8L6HADUCQtzVLBKLK2ewb/9Qv2QfGJNd8j/2rTTZGbECY
 0VZaX/2n2H4kLEFUtXZqZU06cKL6jinfMWGtdVcGtzaKiNM=
X-Google-Smtp-Source: APXvYqzQDDjGhMTv95sUWy/8iqVp0bKmqT37uZw34jcpDQYLmdIMPDXDOMGEErRr31XesdSJ+pRBqRfuZvxeV3s++aw=
X-Received: by 2002:a5b:88e:: with SMTP id e14mr647178ybq.338.1580947374524;
 Wed, 05 Feb 2020 16:02:54 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0d:e186:0:0:0:0:0 with HTTP;
 Wed, 5 Feb 2020 16:02:54 -0800 (PST)
X-Originating-IP: [73.70.188.119]
In-Reply-To: <20200205102553.GD9810@workstation>
References: <20200205081221.18665-1-mforney@mforney.org>
 <20200205081221.18665-4-mforney@mforney.org>
 <20200205102553.GD9810@workstation>
From: Michael Forney <mforney@mforney.org>
Date: Wed, 5 Feb 2020 16:02:54 -0800
Message-ID: <CAGw6cBsYot=_AZRKkctate=CczPuy0kk10133c8-e3NhZXYE3Q@mail.gmail.com>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH alsa-utils 4/4] Avoid empty initializer list
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

On 2020-02-05, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
> Good to me.

Thanks for reviewing.

> I think it better for you to generate cover-letter (--cover-letter
> option for git-send-email) when posting a batch of patches.

Sorry about that. I'll make sure to add a cover letter next time.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

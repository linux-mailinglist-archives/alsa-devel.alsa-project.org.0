Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C613F2015
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 20:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57FC01683;
	Thu, 19 Aug 2021 20:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57FC01683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629398692;
	bh=JmnXvtA27f3HNWDeH3joOjOLqfHZmsqnbaeRmH4xmZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxL3v+S/2IIr/IXYzLYdKVkXUeISbp6YhGHJHTsBm6bMp9M6QPz+zCmknAzMdNj+R
	 MvyoE1Z7YBZx7n/UcPh7AGJobcCfA30ruUJV3N1yPzfsTis+ITgFNrV0N0Iv2ogs0i
	 l1f3qVCgkIcGjxpo413j94bDQaY7SkKX7Jj12CRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2A7F80272;
	Thu, 19 Aug 2021 20:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55CC0F800CC; Thu, 19 Aug 2021 20:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1023BF800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 20:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1023BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WEgNjKT+"
Received: by mail-lf1-x12c.google.com with SMTP id o10so14937902lfr.11
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 11:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5zVDBtjJvuw3n2j1usmurBdgybO6iB7zH3x0zJhcS4=;
 b=WEgNjKT+jKwxfCEmWRVI5h0DSy7dl5DMhsaDoroFmJ3u/m9OVUvV++QiAIf/uv07Vx
 UgCHHJM8/tzRBd64tdY1DHXg2J6YFyS9afWAXBshYv41dUDsCUOd3lyBEaMdu7RcmVXD
 FyP9KM5+gO2z1y4lqewUHkpmMT4If8VElioNLlkJV6FJGON2XZD/ZNLUjZXGAS61VwtW
 VRJssnpxugFHB8Gp0w4y4aujqlWGFzfFXZdGXcroXH8rOw2baF28ZY34ow1lyhvTdIq2
 UkM2kHjYmI1bc3xRO7ONcylSmWRgAYEosO6j4dtIKelF4ECg/QYLN1uPWZJFDGfUBAV+
 IrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5zVDBtjJvuw3n2j1usmurBdgybO6iB7zH3x0zJhcS4=;
 b=aYJwYURm8vOP7TiiFmFabCvzfZej1rD79Qu5dF72jsBR1xaZ7vtsOaWf1ANIs6FjZF
 cZ9VRsqBcJnyJxLQn9sYpn+PcyGx3VVBinxqyl6OuYHp7ibOmIpcdCr0Qp55cZoivvnZ
 HCKyq1cQ6XIS2ijqpDXOdyPxX1wGHfEKc953t5bo58j9K0cIMjKGOZQWf3k0HYaDtVUC
 Xi8v+z8xRGLWM5YggtvOdcmcsxCN4xm0SUaLMOsmyCQvBHdLrpvYR3KQ1OWAk6IHpDzc
 62FltOhkXLnPRSz5Ip6pss6rqkdvDtRb9OEX5b3dnVV0GAnJ9nm6RbWmrnYLS5oDQ5es
 ARIQ==
X-Gm-Message-State: AOAM533epe3KR8/rfa8MyUvIgaGkj8rhygOOwnNqqRmqR1T0CI5zWCIY
 ELQudo6QbAwbq01uQ6eHK3oupCMNTeBzwVkOMq0=
X-Google-Smtp-Source: ABdhPJxUzOlnMgY2Xdmm/PplOzBYb7NTqWgZaPz2PooQD8gxWkgavsv8Or3bWWSGtbw0Tf1hGHj1DFX0KsURLA/wcGM=
X-Received: by 2002:ac2:5470:: with SMTP id e16mr11552167lfn.399.1629398604609; 
 Thu, 19 Aug 2021 11:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
In-Reply-To: <20210819183450.GV890690@belle.intranet.vanheusden.com>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Fri, 20 Aug 2021 00:13:12 +0530
Message-ID: <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
Subject: Re: arecord is failing with -V stereo
To: folkert <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

1.2.1.2

On Fri, 20 Aug, 2021, 12:04 AM folkert, <folkert@vanheusden.com> wrote:

> > arecord is  failing vumeter option -V stereo only.
>
> What version?
> Because the commandline you provide works fine here with 1.2.4-1ubuntu3.
>
>
>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5B1E9F32
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 09:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ED8A170A;
	Mon,  1 Jun 2020 09:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ED8A170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590996373;
	bh=mxAYzF8OzzHURzEooOCt5aqNg7V74tDjZtxIS2Xknxc=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tnPnBA3MKEOzwPlUQSeZ3xcG+ahHXAHWyaqgTL7Kf0M+1LkfHesJ+IIVIv9NfCfDe
	 kCrXg15IUcpzbkNksDInpB4HmMTjTPwfik/zdZowL4m3235Bf9dw6tpydzGL9VFgKl
	 rO9+sZkJcvSMrQzG3nViLUO7V/whR24HJmabe1O4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4898DF801F5;
	Mon,  1 Jun 2020 09:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CA20F801ED; Mon,  1 Jun 2020 09:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF67BF80159
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 09:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF67BF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BwyL7sK0"
Received: by mail-il1-x12b.google.com with SMTP id a13so3668457ilh.3
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 00:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mxAYzF8OzzHURzEooOCt5aqNg7V74tDjZtxIS2Xknxc=;
 b=BwyL7sK0mETBUeSxKVGfov8XBgJvy4xpWxgmdt6p19kGWb9n7qeXai/vgD8JR1b+SK
 XqDuWtL0WkV1uHmoC/OWfb7DNP/qLPnNuWz6/e8VWYJ3slJ5m7ZqCZ/WCKZBvup15fIo
 IYkHKVX9Ps+4K+28kNN9VkHTCDWI46oJSAHTTiEqqnuuNLckODzLI2Zf3I6+NzFTri/R
 BEJbeb1qk3yC4fyOVAvonu9POf3hQZe/btraMCmd0720Fclr9/uH0uZnQNn3k8r2/n3A
 DIBkCbhWWmrMu6EX4jaA5E8bFTJPeolrxTh1txJpf05Rpl8HcTQXstif1TZVv97n6466
 s/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mxAYzF8OzzHURzEooOCt5aqNg7V74tDjZtxIS2Xknxc=;
 b=hvHoaNYUWFMJTXpOpK2h90M8bi9AbNu6n6jhZ4zeDodj6othwqmbTjZc8IUm+q6oAR
 wqxdDUJ2SFr1cCbZLiRGHmlRlooBlnKUOuleIBOrO7SytMOBunDqZVkhg4hK9gBPThuY
 aPpa7jFyPDHAoEarBNUPYSPxZe2/DiD0Kk3vtgux0fOFZYMvqsjBX9gEZCbydqc0JY5P
 OElC6e5t3YG6ycgzfUvTYlcBsEOaX4hUWOTbJh/HxXDqN91aIklEXZHDHcyXbVTaaps1
 bKvpSL32cM7muOjthLaFp18tz8DlIumB5hauCWcI14m3mwI+KXwdFNNrAny+NoHve8oW
 sxCw==
X-Gm-Message-State: AOAM532O/f4uUpglPLdYqI1HRonThLLe3OwZGD5Qpv443WimEnMyjfq2
 pM3nPOXy/GiLqf33J3sqhXLQh6Lkq6zpL+aET8xz05Haw18=
X-Google-Smtp-Source: ABdhPJyXTHyQpOj43kme+jjDaM0KZaZVwwk6RWjbED1g+QMz8h4ijhuRb4R8QlB/SQrrY+DK5IJZgj4yuA89qgVHJ/U=
X-Received: by 2002:a92:d3ce:: with SMTP id c14mr7706758ilh.62.1590996260521; 
 Mon, 01 Jun 2020 00:24:20 -0700 (PDT)
MIME-Version: 1.0
From: Paul Dann <pdgiddie@gmail.com>
Date: Mon, 1 Jun 2020 08:24:09 +0100
Message-ID: <CALZj-VpLECyDaBeHcowTnCcufLVaPyr7Xxii+PbkrwGn9kYU+w@mail.gmail.com>
Subject: SOF 1.5 release on FTP server
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi there,

I'm eagerly awaiting the sof-firmware 1.5 builds to land on your server:

https://www.alsa-project.org/files/pub/misc/sof/

Archlinux builds its sof-firmware package from there. SOF 1.5 was
tagged on the 27th April on Github. I'm wondering if there are plans
to release a build for this version to the same place?

Many thanks,
Paul

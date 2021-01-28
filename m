Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3F3089C8
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:13:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FB2C16CD;
	Fri, 29 Jan 2021 16:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FB2C16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933184;
	bh=I2+okNVijmOCHwJQ9DkQ8dg8ShZTxywABf7GFaAooE4=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g01XqYPtHISLAlxEEszAjUKoC2pU+4f+i5bBy3efIaNxAmqBK/GjgylpwG5yQZj2o
	 Jq86dUSvFaqNacfKFigJPLYqgH9vLcqzWNbNDfxWqEDKrnKYm86ZuoIsfq6MDvkK6n
	 tUUrU5ahbQxnelozlA5M/JsVxhgPoEUHpMd3rO3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE362F804E5;
	Fri, 29 Jan 2021 16:10:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0689BF800D1; Thu, 28 Jan 2021 23:40:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8000EF800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 23:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8000EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UTU1M1wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611873601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=D1asM/mdpxR1vYWT48GbcZmtlsbJYFV6SyTJkmfAp54=;
 b=UTU1M1wnVhOjIrQ+o4kddxPxlc3947OjN5Pfn8OXabTHbWp9ikXhMz0CQ462CIryTFapNg
 CIvkshytC6XWefmQ/QROaVri3Au9ToUMJFk9XPB5dVsBobsfUuJaRRAwaIwkUjADAn+b8w
 thgIq9SXbgkhyfU2n/FrBVs1n6+Ktnw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199--QIKW1SuPLSHpovem6Bdbw-1; Thu, 28 Jan 2021 17:39:58 -0500
X-MC-Unique: -QIKW1SuPLSHpovem6Bdbw-1
Received: by mail-il1-f197.google.com with SMTP id i16so6030724ila.9
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 14:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
 bh=D1asM/mdpxR1vYWT48GbcZmtlsbJYFV6SyTJkmfAp54=;
 b=dg0TVPIjnfCzekz0c/27yBb7ie8H3bdCIkal1JrQjlTUC6/QdHdy4p4ZbDKKIqEoyI
 TI6kYNNR/bVR4cNYStwSwa9+aFd+91yBwJlpYsjiOaHzVgN2IdyCb05+hbruAUT9SDuI
 x15btmiJlOFFvq3Nu2HJYGvszgvPea8wfu2Oasx47oZyFGXoyZ+Weg5VIPhoOlzRoaN2
 JojGiFMKmDXHKvYyjzaKI7CQ9p06Pa//pjvMAget75PLS9yxDvIPU1hW3i4koS2PDC+Y
 1HrVmEsDmfJEMqd0fK3XCGV1XtalWxJGaFBQLhqN+hLXZxNO+T2t5oQXyHqZtLXwgCpa
 XnVQ==
X-Gm-Message-State: AOAM5300JOpGgJ4DwGx+vBwwbdzVtECxGAOGu83Osi75jDnLO1Befk/m
 ocXVzbYpticswUrcOeKvcI+B7qT28eEyz61ApDx2gBg8FhBlborjSVM/+ThI1BG3IuQNO3bTWvJ
 2dsT1Dznrr+zfnolfdPDb5QZ99VwiKOb9GeO/wdBpc6oUx12pw08qv379rORQywXFu5qx/BaOlQ
 CTqA==
X-Received: by 2002:a02:cc43:: with SMTP id i3mr1266666jaq.58.1611873597933;
 Thu, 28 Jan 2021 14:39:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcaTSXcL4AYZdldj4cezSvP2lg+1lhTtXjvAHJFF8aCcJcvdASnKcaPNsTC8bU8dAa7/nETQ==
X-Received: by 2002:a02:cc43:: with SMTP id i3mr1266647jaq.58.1611873597445;
 Thu, 28 Jan 2021 14:39:57 -0800 (PST)
Received: from chargestone-cave ([2607:9000:0:57::8e])
 by smtp.gmail.com with ESMTPSA id j7sm2822590ilo.52.2021.01.28.14.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:39:56 -0800 (PST)
Date: Thu, 28 Jan 2021 16:39:50 -0600
From: Michael Catanzaro <mcatanzaro@redhat.com>
Subject: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke my
 laptop's internal audio
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Harsha Priya <harshapriya.n@intel.com>
Message-Id: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcatanzaro@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Fri, 29 Jan 2021 16:10:20 +0100
Cc: linux-kernel@vger.kernel.org
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

Hi,

On my System76 Gazelle Pro (gazp9) laptop, internal audio broke after 
upgrading to kernel 5.10.

The laptop's speakers produce no sound. Audio from headphones still 
works fine. A quick test is to visit GNOME System Settings -> Sound -> 
Output, select Test, click Front Left or Front Right and notice there 
is no sound. I tested a mainline kernel revision from yesterday 
(5.11-rc5+) and the regression is not yet fixed. I bisected the 
regression to "ALSA: HDA: Early Forbid of runtime PM":

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a0645daf16101bb9a6d87598c17e9a8b7bd60ea7

I created a downstream bug report here, including some bits from dmesg 
that may or may not be relevant in comment #2:

https://bugzilla.redhat.com/show_bug.cgi?id=1918933

Audio devices:

$ lspci | grep -i audio
00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core 
Processor HD Audio Controller (rev 06)
00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset 
High Definition Audio Controller (rev 05)

OS: Fedora 33

I'm happy to provide any additional required info or test patches if 
you CC me, since I'm not a kernel developer and am not subscribed to 
these lists. Thanks.



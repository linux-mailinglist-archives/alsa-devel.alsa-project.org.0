Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D19641CC99
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 21:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B9F16E9;
	Wed, 29 Sep 2021 21:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B9F16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632943707;
	bh=BINxv4Ro8InLMoDxPtIX0UAWq4JRTRC8Sj2m/yRL2Es=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XqzLRt3z0g6WYI4p7p5G4KEWY8/2MQYa5a8j4gtOKOcqfXmOD4iABLxUr6IJDEUXh
	 RSGOfpGiJ79iisLR4jehzDqgp57JL/dExjvpF/PBXY3QcHx5dBDISewBS1IQkl5n9w
	 /uYAlgNp18rrxHn8WGBUUYz2sUyOcwvvaXklVBdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B714F8026D;
	Wed, 29 Sep 2021 21:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB38F80227; Wed, 29 Sep 2021 21:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01951F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 21:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01951F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E8sAPz/5"
Received: by mail-ua1-x92f.google.com with SMTP id c33so2375930uae.9
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=BINxv4Ro8InLMoDxPtIX0UAWq4JRTRC8Sj2m/yRL2Es=;
 b=E8sAPz/5KnQ9/D/0qqnNBXhi4A0wvll35YtOfn7fMx/wW2mkg/dtNVlew76wNjFqNn
 g7zd/m9woK8h1wZ3CJRfMTWk3xytaBWS5Ln71f5vhaCmLlDDQ50B7MwEvMxzSerkhTmb
 4ZRDuB+s5ceRcStktsv3VHiNsRGJJ2hCwe2J8X/Oi0jnKkNDYLTAAazLDudqNDj6qbve
 BIbBJ++ebjIjD+Azy52cdITsmvhafPQelMta5BV7jbZvkAvQhN32M/DJuP8C21x8aEIh
 BO3oCEQlc0reffmBmjbW+EzPxlCzWGQhuP9G3AINAs6p95ECHnth3QiJ38x/FhzRxGov
 wSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=BINxv4Ro8InLMoDxPtIX0UAWq4JRTRC8Sj2m/yRL2Es=;
 b=WqjR2pIlXjllSH3Vszr0Ai94fiH1wpPqqiEQpMdM0TiuJsWKC71bwAaXBNRVyAWgSU
 dzx8bx9KjpfJVl0nX5WdS177Y6dEujp75QFFauclTTATsZoXYX4bYcEaFpOO80RxeGGn
 YxuQSLU3Vc4fsVdpyc1yJ4a/vbyvDZjuBG5Y0O3Lpkcpq3wUEkiTWffoR4F7a7aJFhY+
 73hQ1DEuLxrmVQhvsoryqR+q2G/w8/PZSlLhS1yiw30lUiOquTKsSfmxj1NPI1Ml7jMb
 wPL22UMz8+nqQMQ3eZWDeTqM8dxnMWcpIZZQg+Y9NXy0Jze99+mhHtqsGHBkUYWkcXai
 Pv4w==
X-Gm-Message-State: AOAM5318rCLj1CFcf23h91vEaqgjU9EL1AY1FCo22ItklQWfIx3VgVki
 39O1eZqXyvOFdXg9GVJsvRc=
X-Google-Smtp-Source: ABdhPJxzGrOiSNWJPCMJTT5Y7LJpHwEj1TQycv3m9lmqJFBugj3xgYVrQOMbvjsdmOlnZT0489AzlQ==
X-Received: by 2002:a9f:315a:: with SMTP id n26mr2063225uab.15.1632943618127; 
 Wed, 29 Sep 2021 12:26:58 -0700 (PDT)
Received: from geday ([2804:7f2:8280:7522:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id f21sm448439vke.39.2021.09.29.12.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:26:57 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:26:58 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Behringer UFX1604 and UFX1204 unneeded implicit feedback
Message-ID: <YVS+AsiTRt1FqMn0@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Takashi and everyone,

Behringer UFX1204 and UFX1604 have sync endpoints and we set up
implicit feedback sync on them. This is against the UAC spec.
We've already fixed a major source of noise by explictly setting up
the Clock Selector. Therefore in my humble opinion we should now
disable implicit feedback sync for those two devices.

What do you think?

Thank you,
Geraldo Nascimento

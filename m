Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6C3A2736
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 10:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC1521759;
	Thu, 10 Jun 2021 10:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC1521759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623314263;
	bh=6pSZcId0wo+0FskXVHpcmEf/rnt9bGweGpb1tZoGtwA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qGAdGNxVvHPFLmyuVyZ+JA8FWFsnEz1sI1yuQWFATGnuPhEJc0ds+Q/SNK9FnCu0N
	 hlO1/s5TO87l21b2ouV4EO8hF4sFFJS55LIJ/MyhYfb1tbcJP0qn4rEHK36KM9tTy7
	 hsC6pFOWT5QgC20Ua65NuvbP2AXZtaWzq65+1wvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61308F80256;
	Thu, 10 Jun 2021 10:36:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 475CDF80227; Thu, 10 Jun 2021 10:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B0C9F8020D
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 10:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B0C9F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=zamaudio-com.20150623.gappssmtp.com
 header.i=@zamaudio-com.20150623.gappssmtp.com header.b="TvDLnNMh"
Received: by mail-pl1-x62d.google.com with SMTP id v12so600630plo.10
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zamaudio-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=6pSZcId0wo+0FskXVHpcmEf/rnt9bGweGpb1tZoGtwA=;
 b=TvDLnNMhi9kxfaaN0UfVGNeKeqYd158wKCytFR5+Vw7tbzvP0Oe3ZYpb0g5ALU687h
 nKWy4q/+dreP0bIjH4sZdopqCxQDL4lLcO+G2+2DM3AH24I/Bjr4UuAVIaRlyYmUHnY9
 8rjvc5Z68MhVHelpw6rGu89oJM2vzoABvTDIA9zQi+xqeMoPVUQtW+4Dj4ntX6JOcEr4
 a+N4aokemSHJ4cRktg0noBaGtaCBE+b6T0kYdI5b8mIksFYY+MYSW/6Ik8c7fRvL+lH2
 W8iV4Snrnnx5PMdgqX48uoA63js6MmYP8NLvFfU/28eDtZ4/KMck8ILeRONDs73x5p7J
 TU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6pSZcId0wo+0FskXVHpcmEf/rnt9bGweGpb1tZoGtwA=;
 b=fmtcpNF5doAyKjnVIqhGiObPA5y9Wv2taQD/lHlxAfCHM++ngQjYKjIUqL4bLIokYf
 5djybwh00IJWa/DKDkqrT1sSq6NZSWyi8QRUpaGSb48Afxtpe1Uq0UdzjzbPLS+7/rfq
 0HjbRSgcV2zNqCHYq7LleFPyo55QrWlvKRj1p/8mIaIjCPEmpi3wXPXiNU9gKKVEmFL4
 j403SbwyVdq4ymChdyL9RsvX31WvZUA7MatpRbE/7E4mELN8quqEBQJLZ0uIYcD/wJYa
 MfvSgBXFf5dl4kMdY2vV9fJmULWaVX7hIZOlU5gm7ShWC+SWJDTiM+5cZor5x1Za0Sh7
 xQ/Q==
X-Gm-Message-State: AOAM533dL7AB/a5+qWke9Syhkn7XXicFMfEp3iUB2cYwxPuF1Bhi908u
 PZeGKLLmcxaHKe5jZWh7eBss1m/QJqjvK/PV
X-Google-Smtp-Source: ABdhPJyQ+73VLA9CFgFSqyguqXJC8dxc3O0NOPXb2Q9TZkuJegIX7RuD1lreIj8gLFucOaRHkmg1kQ==
X-Received: by 2002:a17:90a:5911:: with SMTP id
 k17mr2182547pji.29.1623314163011; 
 Thu, 10 Jun 2021 01:36:03 -0700 (PDT)
Received: from zamx.lan (119-18-22-20.771216.mel.static.aussiebb.net.
 [119.18.22.20])
 by smtp.gmail.com with ESMTPSA id z6sm1856447pfr.99.2021.06.10.01.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:36:02 -0700 (PDT)
From: Damien Zammit <damien@zamaudio.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/1 v2] usb-audio: Add support for Denon DN-X1600
Date: Thu, 10 Jun 2021 18:35:27 +1000
Message-Id: <20210610083528.603942-1-damien@zamaudio.com>
X-Mailer: git-send-email 2.13.1
Cc: tiwai@suse.com
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

Hi Takashi,

You are correct, the patch still works without the hunk referring to
the PITCH control.

I have removed the hunk and was tested with this patch and it still
functioned as expected.

Regards,
Damien Z

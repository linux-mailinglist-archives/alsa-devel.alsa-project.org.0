Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB426A316A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 09:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A133165F;
	Fri, 30 Aug 2019 09:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A133165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567151078;
	bh=dbqVS5tNApcm3ah6uamnQ4Z3NUhCD1x0BgoMh5rSqSw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U6zbb/2xjKX6wVo/rdHYfSTCaiasIk54LcJWS/96Y7fEybhJ4POINSZVPMTRcukh3
	 xSSh2dUOLJvSIDfpG7YEEjwgVdaLPcSITlhyxud0jbTUAs9kt7BoGu9hhcgfjwubev
	 sH0Ph5NPYwHbDYrgoSHKkxFCbFQO31n2nGbCYECY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B117AF80362;
	Fri, 30 Aug 2019 09:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 718E5F80369; Fri, 30 Aug 2019 09:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD9E5F800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 09:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD9E5F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="XKHptlIJ"
Received: by mail-qt1-x849.google.com with SMTP id e2so6149815qtm.19
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=q9X7p6T1VvsdNEAdRrFBgksNSceIigEeyP5OFl4y79I=;
 b=XKHptlIJqxIg63JIf7N6iMYcEqr6izHNPQ3wMlp6hQi/eNBMadnCCDCo2085aWBUzh
 T+q5DS3fTV9IndMBzVyYWG6d8ZUQ/wLLhuKojUtEBZpdx4sz+5sBtkcJ7HY9JhU9nqFv
 wtRAeQ1GEGsMyGUI2AWJPT2lZSjy9na2NznE+pX7v1IhiwD7za7RW8USRsNvj0vV4qEF
 ruJ0vdDpTIWCe1hizRWLMVHlrpEdpD1r23WY9OhisQQqqcicWnEWbUPcHC4T7qEgF6gc
 cF+jerWew7zFqNBcUJZtjzAlkygXHqUDlvws2T3Z8qUtgTBQVVQLEcOKaGlEdcWHeIX5
 D48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=q9X7p6T1VvsdNEAdRrFBgksNSceIigEeyP5OFl4y79I=;
 b=fqLufqq0VZlXLpYUZAMDnOqGTBbIQ4VG9WkOJg7E7OOWg4xKBK2xrnYibpy7P+SswT
 7ixxthPn22wD0jeYgrQTrJGkHb/I4swNzIdxSER68rqikNt+JlTZgGRPz+9Ze9n0icV+
 LjdMjJ4EoROVuZqXWnVAOISpECp3l4sHrqN7SRfYP7GLV8dDaDZXL1C0IM/91wGEGJSV
 9YWbATM3o1Hele8PGfamlo/91ECfV9Tncdy7Es9WRpV/YmIDDle6MMATaxcE6lMCzqm6
 l1Hg5Aq7ZTcmOWKHdqFKT4K7CBDi559Bbi9UuX3T+HqHrV0BaBO24ngeM2l+L7uuPFs6
 yc4A==
X-Gm-Message-State: APjAAAX5hKVYV7aPqQ+IU1e4Bqu8XGlN54i8ccCeKcOyNBAbLOaw4qyw
 6HlNJUt4nvlwx3Y48anE4Tde3mVzG+YN
X-Google-Smtp-Source: APXvYqzTuO/QSfVEuL7aMnZ8WtDiWg6rUisf7zSYQ3nzI2a80u3uU8SFWXoO2o4LSDRfJZru4E9L5jXBugdI
X-Received: by 2002:ac8:2b47:: with SMTP id 7mr14300924qtv.116.1567150966478; 
 Fri, 30 Aug 2019 00:42:46 -0700 (PDT)
Date: Fri, 30 Aug 2019 15:42:36 +0800
Message-Id: <20190830074240.195166-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 0/4] ASoC: mediatek: mt8183: some cleanups
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

The series contains some cleanup refactors and should not change any
behavior.

Tzung-Bi Shih (4):
  ASoC: mediatek: mt8183: move private structure
  ASoC: mediatek: mt8183: move headset jack to card-specific storage
  ASoC: mediatek: mt8183: remove forward declaration of headset_init
  ASoC: mediatek: mt8183: fix space issues

 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 55 +++++++++----------
 1 file changed, 26 insertions(+), 29 deletions(-)

-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

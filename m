Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FC154F5D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 00:30:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67122169E;
	Fri,  7 Feb 2020 00:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67122169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581031834;
	bh=cIcIWZpjgE4ZbnTl9HNVuGDjDh/aTYHqbm/9E+QHO+4=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GxsM6NXh/VVF8yk1ZBxnfy4HjHnkrqdG/GdWamfEhWLJYU5itpW14iSCqC9d4fg+B
	 s//MPmYu+dpM33o7Cx+a0Tzpr2Fn2s62OZoeykqz/gcbUM6TWBYloM8Mg3etrdNU9T
	 pOwZI4m/aqQPSyZAyYRdwEkYsTauyu34Rnr7wvaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69554F800AB;
	Fri,  7 Feb 2020 00:28:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABEFEF80162; Fri,  7 Feb 2020 00:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06718F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 00:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06718F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ZcKoqhVq"
Received: by mail-pg1-x549.google.com with SMTP id h21so333470pgl.19
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 15:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PSJH9GYraFPbhcG+DGJnLRxMg/i8Sc5VCunvDN6ByYQ=;
 b=ZcKoqhVqqTxaA7bcY8f1rBLOLO2Mlig83ZXxynCX61+JalVusJ5YJZuiZQPmpNMDhf
 qxHbsKwEo+cMzNEoJ2u7H+ZwvQOiIb/udcQF70az20a4Bpk0w9WHnpSjajxQ5hB4ijfc
 X2uSaNAiJrkMGCJ/uRZ2BkjsQ5dEpv2kyNN6CGK7P4MIPSBCZlgYMC/VePgg0c9jN7mv
 cpF+JJblF4iEO00UI1S9tHbJ892XOaCfG8gmnOyhdAHFVtTDelqzIBWMwbmKYeFiKZbq
 msmqODnP8qH3gI7v1zwWTLqqsZ5nJoQdPb6O76k76Qni2tEulHYLM68KfzR58nacD8dQ
 BwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PSJH9GYraFPbhcG+DGJnLRxMg/i8Sc5VCunvDN6ByYQ=;
 b=GFFO7lyMv6GcPr9tZG6eAB2+/TptKrba9aQ7j7FMONRaM5e1Q1r4fFXvvr326Y5yil
 Z7PRiSOz4warsTzFDi8rAkUgPmS63jeSYCtE4KvMoCLuoFUhM/qikwzBkF3poXCU0ZqW
 XHnJzpmoBnCCha9g5Bb0kNRHAdk/3W4r5RYgP+HN0HcW19jgGbn/VojyPnDUZSuq69cC
 s7aYf4Y4NOkYbsMLpJYeTJCiwaX620wQ/ghK2/7B1FU5OZvijQOgpF/L+QvSPxeySpV5
 gf4xT6wtDQqSvW4G6nbUXm3i47/nXQre06VCLYXsEEbLyXLzw2P2yFjmVgDxzyBFsqVR
 yiiw==
X-Gm-Message-State: APjAAAVffDgQfaoHAkSFazMzWzpj1EWUFeulbiIHJIaEVWLDMUJsGRhK
 fyImPTX1B9qBbo9BhN7URvmq6EGN1XHoNkwkbNU=
X-Google-Smtp-Source: APXvYqxU+blpeLlP9bV/bbHLagRRMIGJxCkP2rCxNMXwLELINAyD+jYB2Eb4CHdzI3chcTfQARAPyBxdMqhPAZR0/KI=
X-Received: by 2002:a63:ba03:: with SMTP id k3mr6733096pgf.52.1581031722616;
 Thu, 06 Feb 2020 15:28:42 -0800 (PST)
Date: Thu,  6 Feb 2020 15:28:40 -0800
In-Reply-To: <20200206200345.175344-1-caij2003@gmail.com>
Message-Id: <20200206232840.227705-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200206200345.175344-1-caij2003@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Nick Desaulniers <ndesaulniers@google.com>
To: caij2003@gmail.com
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 clang-built-linux@googlegroups.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: fix an uninitialized use
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

> Fixed the uninitialized use of a signed integer variable ret in
> soc_probe_component when all its definitions are not executed. This
> caused  -ftrivial-auto-var-init=pattern to initialize the variable to
> repeated 0xAA (i.e. a negative value) and triggered the following code
> unintentionally.

> Signed-off-by: Jian Cai <caij2003@gmail.com>

Hi Jian,
I don't quite follow; it looks like `ret` is assigned to multiple times in
`soc_probe_component`. Are one of the return values of one of the functions
that are called then assigned to `ret` undefined? What control flow path leaves
`ret` unitialized?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

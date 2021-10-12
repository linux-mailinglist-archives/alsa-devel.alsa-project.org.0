Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF87429D7C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 08:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C6F71689;
	Tue, 12 Oct 2021 08:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C6F71689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634019039;
	bh=wNf0MfgPFcnrslmejgTiSnnuCjLc4mUB0YMd9PxWJ9A=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rdDxDiq4HSAMbEemE60QJP/41kMJs+IJ6bCqB1CpFBl4PJpvn05XWYx/dKgiZvqfE
	 ATbVRT1LuMrg0G7lVNezvKfSZGQJQBfRKpY3aUxT4QdO7jLA5hVRjXooTH+VoAUbnT
	 Qpio09y58nw98Em8a8wbgM+kjh9fVOwOWqbqte9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 629DEF80245;
	Tue, 12 Oct 2021 08:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72183F80212; Tue, 12 Oct 2021 08:09:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D03C6F800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 08:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D03C6F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="KASwleAL"
Received: by mail-ot1-x32c.google.com with SMTP id
 p6-20020a9d7446000000b0054e6bb223f3so9831364otk.3
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 23:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ts6+EOXXWo1GdwyQqMEj2J65rtYhy+2qGH3k92oIfJk=;
 b=KASwleALBBDb21Kd4lL4GqNqXGv8ZbPX32ECH9JXvfHy7+Ils/6pl1wGcctFpUKQpS
 QsxdApmntbYuhI9JSb3KoD8Thks87u267XYG3Ebz0ySGB/H3SDKOx8QVzQQg6IWvZj6U
 j8A90nsIUe5UcQiTXZaeJa3MmnTuwvlLeqcDGU16buUHMHWXEEMyE0AYpn+EZG7//HRI
 /LmAqsxRZs/ppZ6A7IexUJOOpcXnHyrMUJogQj0Xz65SUOoV44ATb9qf4TLO+BL+Dx+t
 qaLMID9gWLF4Vgc1DoFrR+Ca2NJGd5cxFQB5Jw2/2rgI7CyVHH1PmDG6TrR6zkh91THK
 IVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ts6+EOXXWo1GdwyQqMEj2J65rtYhy+2qGH3k92oIfJk=;
 b=7RM6zP5MPjbn3mA2s4tkgRxbNnHPPVocgb5QXxXA3jg4r2j43kKt7STUrTp+1R4Wpq
 y8bgDjGG9wSzMOpkx8ZMn8rqc96c5CqENk8c470BQoDyDCwh8datsNsgUN2aA9GFREfB
 sW12G7SU58ueCWwWpwLcBKJCr3IaxNMtBQf4Ty6INKKIDykEP8pVa77RkWlaCKgq9d2q
 2yw8HviIK+phgdlOue7HOd6uwV8pzwn7U/4aY2153hICyDPUPyQwcM1Nd+4xo71SYVNQ
 tJF2urAi6sdi9CeeTfsKXSVOubODx1esyGIgbpD4vLhIfCMzfPCLmRcJ5ANbA1irVCQi
 J09Q==
X-Gm-Message-State: AOAM531cxUWQ7XSkB74J6ZvaU/Xt0agHdlA0OCWNEWQ66OHFPmwwi3uE
 EelCSYHv9uNzhasqCLAR8JDUpE6OScV4s4NCJzHrNw==
X-Google-Smtp-Source: ABdhPJx+h2pgpLCmkTeEPM57O+5djDeS975Wv6rKM2xO+UKk6y7OLiHyvX+a8dkBCzC4z3Pl+L1jaoDBZcmzebi4KsI=
X-Received: by 2002:a9d:6483:: with SMTP id g3mr24203295otl.105.1634018948964; 
 Mon, 11 Oct 2021 23:09:08 -0700 (PDT)
MIME-Version: 1.0
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Tue, 12 Oct 2021 14:08:21 +0800
Message-ID: <CAPpJ_ee4+Aer5z2qWr9xECoJOZTn80GKXxdTzzj08ADdXm5Uow@mail.gmail.com>
Subject: Add ALSA UCM support for Pinebook Pro's audio
To: Jaroslav Kysela <perex@perex.cz>, Dan Johansen <strit@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux@endlessos.org
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

I prepared the pull request "ucm2: Add UCM support for rockchip_es8316 on
Pinebook Pro" [1] to enable Pinebook Pro's audio generically.
Also, the corresponding validator pull request "ucm-validator: Upload
rockchip_es8316's dummy json and alsa-info" [2].

The original information comes from Manjaro ARM's
pinebookpro-post-install's asound.state [3] and pinebookpro-audio's
audio_jack_plugged_in.sh [4].

To make it available on most distros, I transfer the asound.state and the
shell script into ALSA UCM conf.

It will be appreciated if someone can review the pull requests and give
some feedback.

[1]: https://github.com/alsa-project/alsa-ucm-conf/pull/112
[2]: https://github.com/alsa-project/alsa-tests/pull/22
[3]:
https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-post-install/-/blob/4b4206c57b21044bf9c00848bd1f8b6f710d19eb/asound.state
[4]:
https://gitlab.manjaro.org/manjaro-arm/packages/community/pinebookpro-audio/-/blob/1f567db09495acc3beb5405c9ef85c3c07b86785/audio_jack_plugged_in.sh

Jian-Hong Pan

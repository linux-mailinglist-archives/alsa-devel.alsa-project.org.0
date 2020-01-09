Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30A013520C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 04:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D31175E;
	Thu,  9 Jan 2020 04:55:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D31175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578542157;
	bh=//LOAfH8BeY9fQJyLiYRkz0DJuIyAz3EOdzJ2200aPU=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KiP4Y+Eqvtwya8bMlyEJfL3Eiuoa736lZxDj/kDjf+MVV69BlbLF0Ojj0MG37xRSl
	 BcikTK3m/3mZ3wIysHEjpNLSROhjZThbDwfXOkm5iycDiMjzuicdwTBHNNUCgLA9eq
	 zwalNMOTDPKNVpJFUDNpvcNB4ElXKn7dK1YVA8gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB86F801EB;
	Thu,  9 Jan 2020 04:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F7E2F8015B; Thu,  9 Jan 2020 04:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B734F800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 04:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B734F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q1FXaAT2"
Received: by mail-io1-xd32.google.com with SMTP id n11so5611917iom.9
 for <alsa-devel@alsa-project.org>; Wed, 08 Jan 2020 19:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ConQiDjKSYXSms4pIkKZsxwRJ3BjXIpR6iF2XO2vJNs=;
 b=Q1FXaAT2PFPlHOmS+epQiHTDq6mn4oFutcNP3X/rYYxabmVRRwFSzeelGLjOjve2iQ
 FJgwtdYeGGO6P8Kmc6RSnYJzPCNHY+bhwgxjdHLtjQFl5kJ7CWFr69BgAQNv4hRZrnSC
 re+cApO5yOGX56CYzYO9EZKBRAIGa3gWdm6HduiaUFgXsykZl/5n9rHBfPs9jnYIHy4j
 bTL1xz0BrK3vH9MnntBN6kt6g3vLnOSCGlqIBWUkv6fOCCJWC1oqSLGh9LS5rHz9TFjq
 WuGlJsS3F7jtYRsfrmORn1064LVkB8ARrMFOD7KTPmkYOmdPSy6OT+02Ba4pOhaBUEda
 rMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ConQiDjKSYXSms4pIkKZsxwRJ3BjXIpR6iF2XO2vJNs=;
 b=iZkeZnToozaJanrGvYJ5gkVwA0gF2JAOXTJj8z8pmmO3fsAUeDaEmx+Ail5NBSlyin
 pHtr511zbtS4hV2uKX/hPykR/Vb9amIFr54YsUeOr8l5yV0v0ghywhAFKJts1foujCMD
 f+/nY5bWZtbpwfDXB71H/SFyjvEeXvV/gudkq2Izd/IoBEtPg0yhXE3dJlsybhRpDsRy
 mc1asGq1FgWhN6cGFVaZ29uxdEHHxHRpJVQ2mdJxevyiy/yr2utrihtT9Z+iqMkQtgl9
 Z5f4/qVz+7FyPpQmIgkey08A9w2DZkVoj1S8UzjA+FRCu8WK8OuDaYH21DgLbe08GCnB
 5HDQ==
X-Gm-Message-State: APjAAAUH2YG3oECG/nQup++BLnDRQy74svHvR/21AsDwq1RYT7VsWPLS
 kjR3v2dPCheoKSregfoZIcr7yRL5o2lsGyBzrV4LZk7L
X-Google-Smtp-Source: APXvYqxZoKaON7V4pp2dFe1Zm0dRgkL7TAOx4BTSfDU51WgbknvDrHCu7eHRTxITMJbNQx7ch5DyQz/Opm/DHjImkxQ=
X-Received: by 2002:a05:6602:3c5:: with SMTP id
 g5mr6150159iov.161.1578542042760; 
 Wed, 08 Jan 2020 19:54:02 -0800 (PST)
MIME-Version: 1.0
References: <mailman.4430.1578531132.5591.alsa-devel@alsa-project.org>
In-Reply-To: <mailman.4430.1578531132.5591.alsa-devel@alsa-project.org>
From: happy musicmaker <happy.musicmaker@gmail.com>
Date: Thu, 9 Jan 2020 11:53:51 +0800
Message-ID: <CAJDJRCrv-C6Pah-cHTHeVM005NMr1TGxR-Mv1Di4kzhtV49duQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] MIDI 2.0 packet interface impact on ALSA & Linux
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

What is the impact assessment so far done for MIDI 2.0 for ALSA & Linux ?
Will a kernel change be needed for (USB) MIDI to support the MIDI 2.0
packet interface ?
How about the ALSA sequencer API ? Any activities around this ?
MIDI application based on Jack MIDI impact ?

https://www.midi.org/articles-old/details-about-midi-2-0-midi-ci-profiles-and-property-exchange
https://www.midi.org/articles-old/midi-2-0-scope
https://thefeaturestory.com/2019/12/05/artlogic-give-exclusive-preview-of-midi-2-0/
https://www.namm.org/thenammshow/2020/events/a3e-workshop-art-logic-midi-20-developers
https://juce.com/discover/stories/introducing-midi-2-0
https://www.musictech.net/features/midi-2-0-what-mean-for-you/
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

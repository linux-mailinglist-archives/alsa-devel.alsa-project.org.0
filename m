Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6E327FEA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DCC91693;
	Mon,  1 Mar 2021 14:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DCC91693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606590;
	bh=xd+fbJdpQirIRJLJt4qOqF9CVnuBBdqg9PBjZk+nnXw=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IigLTa2bIMVPUT3MUB9g5la6Tk7k7WzhhCG9pEv4MfkNYKDS5J2fQiP0+EYT/0rrK
	 0Fhh1Oqqkv9H8bvQ7yCOwqptdisX6BvInHguOsGnxhOfl+GGjHKiyVjMCnoTAPxVoH
	 R738euWL4DtMpuNZbv/ov8tV0ydbUdHgS9X64+74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC48EF80548;
	Mon,  1 Mar 2021 14:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55702F8025B; Sun, 28 Feb 2021 20:23:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5FA0F8010A
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 20:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5FA0F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=helmpcb-com.20150623.gappssmtp.com
 header.i=@helmpcb-com.20150623.gappssmtp.com header.b="rRSHeNrk"
Received: by mail-lj1-x232.google.com with SMTP id e2so9688094ljo.7
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 11:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=helmpcb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=N23p4qZjU4Y60wv7dtAT8z4vK20H44YQT1lWPBFmCMY=;
 b=rRSHeNrknAEsXeEFeIbT6XOSCXmuWCKS27e9SX53ZsSlJIvdzZ6YPRPWXfpTIvYtk/
 JFeO5cNcCOvnIDqDibKF8HEdvOIXQ5yQJb9uEuYOhHUOoFzpfVYP/NJ1NTYOWXvM28cn
 lR5CqfO3yENDFRwmcI/0xNxGekN+fHu+0A7SGw2JpDZTpD3SClECWNX+A1ApAiOfYxKT
 CMjeih7c8ohV+JcqPfaUuVACH2bGoWXdds3K9HIN6cFJWhw+8zOqdwoRqoXbfxDeTgk8
 ki/H8rCxskNFIRuJEm5X+oTVeI0z2Vl3aPOhTPr/NoQ6aSZdLwdaAxnOPqi1KzRtB/8/
 aH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=N23p4qZjU4Y60wv7dtAT8z4vK20H44YQT1lWPBFmCMY=;
 b=RD3R7hg5hUGwBnpL3CJiqbXtyYYzKZM3B3kHnnuS02Z+c3JpynQrrosjBkqn75SO1x
 I7g9Jyfx8+C9DRxqYHyl8eQVR2zyIlvvYJVIhFxheXja/YD2PmfUv86qknXJsMC3SIr9
 /pam3yUnH8wfbJoIl+wZuifoQe9E1VTSxfQqYt4Wb1h5krpqIhpWblA65SGJM36+1mBU
 s9YpH1LOOqzVLXLQuQcN93aMJgheIPQsYHMXWK/uR+xl7ss3yDwoLfw4KpUeCOGxsjjL
 bZlteqTI+m7zhcy7PCbg6iHOframNI/dckkImOsXCCTJ2RsNAKS5mRknrQX6VkvYdLi/
 EVYw==
X-Gm-Message-State: AOAM530aQbqe7qgqvgM8MbxpsAUzN5x+4rDi3NTNX7IS2Umlv07iwDNW
 y3N1m4KWEPekbL07WxOiPWzEHtR/Uj+pKByxn7gJiwc+sAC5Rg==
X-Google-Smtp-Source: ABdhPJxr3amjR5dKDGfJAh99ZIufkiz6Si5cUzrSHHe4s11HEVrvrXeEIRDpU8pppMApKz74AUuSHpIiRu3zYHmFeS8=
X-Received: by 2002:a2e:a413:: with SMTP id p19mr7367708ljn.213.1614540187234; 
 Sun, 28 Feb 2021 11:23:07 -0800 (PST)
MIME-Version: 1.0
From: Amr Bekhit <amr@helmpcb.com>
Date: Sun, 28 Feb 2021 22:22:56 +0300
Message-ID: <CAHmAUHKpOd53mJ_skCWgkbhdUc-FD3sWea2diN2E5K9BwY8HSw@mail.gmail.com>
Subject: Turning an external amplifier on or off when audio is played
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Mon, 01 Mar 2021 14:43:22 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello,

I'm working with an embedded system that uses the SGTL5000 to play audio.
We have an amplifier connected to the DAC output, which we can turn off
using a GPIO pin. I'd like to automatically enable the amplifier before
playing a sound and disable it after playback has completed. Are there any
hooks that would allow me to do that in userspace? If not, is there
something in kernel-space that would allow me to accomplish this?

Thanks,

Amr

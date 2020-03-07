Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 719DC17D24C
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:50:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC681689;
	Sun,  8 Mar 2020 08:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC681689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653828;
	bh=c3vz12+4VID8zK8FL5KjiYfCAjJuUOqUTAQfHx5W3z4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwaTfdpn8MsZyYdN21JDPz+kAZ6U8Epv5hYoeXf0+JUkldVfqMDOubplxc1id1fZc
	 5hDabOWtJtw01Vgxdh7CeigzNwzBCIUGNx8jKST6BUbEnO4Eomzh3hB9oceIOZnfhp
	 Yhm7gHC4C3vLDGHipkZAwzGjdZ1xuT/nN/Vxkv7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F8BF8029A;
	Sun,  8 Mar 2020 08:46:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D80F80125; Sat,  7 Mar 2020 19:57:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc34.google.com (mail-yw1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A6CAF80125;
 Sat,  7 Mar 2020 19:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A6CAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lEcgW0wE"
Received: by mail-yw1-xc34.google.com with SMTP id v138so5731537ywa.9;
 Sat, 07 Mar 2020 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c3vz12+4VID8zK8FL5KjiYfCAjJuUOqUTAQfHx5W3z4=;
 b=lEcgW0wE+HP3wwv2fAI6onOrCuJll2lBCO/RIxRooIP1psG8mn1RLKzITKVat1pFor
 xZ62dsS5ZK1LoUdELMlGsDoB0nmi6zzJdFdXZVh2XwE4ZA36ZSToDrK8QQAf1nkLkkwh
 cWvBC0W4Xpzb9+DOQcqTJdk1uLTVfIDh0MAQxql/8rXrHm7Igt5XW9m/YG8KcQdrSUGK
 elpc89TCGW1vN47f2Py42ue3E0nDXH59JTs5xjryjrnEMArFNyMIEcEZ2JwOQ38bz9RZ
 dEdvNL6sv1NjBWYuZPhsbC7ra0HBss/T1oDp66dzo5LyNQvSbXniABguchHr3X+17qol
 zQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c3vz12+4VID8zK8FL5KjiYfCAjJuUOqUTAQfHx5W3z4=;
 b=lVgcg3v2Ov+xsCJOG5PHwnNBIjAhnqBW1qXThwgh+yogPCro9fbeMJ2SUyPvbEmpYV
 N4mQ9lFNxEleRQOSRTz9DWA39UMJrFK+Je+58K+y3qMsqaRIp2dbiujtBHNjWEf6MkZE
 KQMSKpaEO4SLjhBBAlo7edgJY9xEHFiV9Xb0KvOoUNIyzHmSGf2tfDIMHtsxmAZKxN+6
 qNf0eDB9nNrNuOhRkXzNV4p4Rv/1IxHxTHRS18yb35WeAFY4BJi5uiFLLhC+x5PIXVtA
 hSH119Xvm4L8RZTeUbII3lsoPwarE/U1Ws2GjycPffG3IqqQRBfcUUiCxwazkHWJqqzc
 0HEg==
X-Gm-Message-State: ANhLgQ1O0FYQXFORxmQ9I3V4ho3IJiJSYTbpKEWBiet/HUHnQrKoJtjG
 BC7l5+U2flxMxr4LdbeTz2HrEkno
X-Google-Smtp-Source: ADFU+vu0NjiNG+FG8EOnXsfiuk99W2ZyJVCWTW9UvJE2cjsD52QVFQ0FhEIr9jr8TvJU295cnQMvSQ==
X-Received: by 2002:a25:c50c:: with SMTP id v12mr1501649ybe.205.1583607444260; 
 Sat, 07 Mar 2020 10:57:24 -0800 (PST)
Received: from cybertron.pseudoangel.com
 (cpe-172-101-252-194.rochester.res.rr.com. [172.101.252.194])
 by smtp.gmail.com with ESMTPSA id e62sm15863903ywe.37.2020.03.07.10.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 10:57:23 -0800 (PST)
From: crwulff@gmail.com
To: patch@alsa-project.org
Subject: [PATCH Fix for Kingston HyperX Amp (0951:16d8) 0/1] snd-usb-audio:
 Fix Kingston HyperX Amp (0951:16d8).
Date: Sat,  7 Mar 2020 13:57:40 -0500
Message-Id: <20200307185741.32578-1-crwulff@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
Cc: alsa-devel@alsa-project.org, Chris Wulff <crwulff@gmail.com>
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

From: Chris Wulff <crwulff@gmail.com>

The newer version of the HyperX Amp USB audio sound card appears to use two
separate interfaces for controls and audio. This doesn't work well with the
current linux kernel (tested with 5.4).

Interface 0 has just a mute control, while interface 2 has mute and volume
controls for both playback and capture. This appears to cause a couple different
issues. 

The first is that the wrong interface is used to query most of the controls,
resulting in lots of messages like this:

usb 1-3: 12:0: cannot get min/max values for control 2 (id 12)

The second problem is that since it is enumerated as two separate interfaces,
the device gets registered and then the capture stream gets merged into the
already-registered pcm device (which results in the udev events not being
generated for the capture stream and no /dev/snd/pcmC#D#c file.)

This patch fixes both those problems, and allows the device to be used with
ALSA programs, but pulseaudio does not enumerate the capture device correctly
since it is pcmC#D1c and there is no pcmC#D0c. Adding a symlink from
pcmC#D0c -> pcmC#D1c fixes pulseaudio but I'm not sure exactly why pulseaudio
can't find the device without it.

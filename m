Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE179095BD
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2024 04:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6507B84D;
	Sat, 15 Jun 2024 04:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6507B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718419869;
	bh=R764S7EN4/FxBf26BEHI7euXBWM9msXFNVmov2DoRy0=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T406LqmkQqTwtQ/IE+F9yxkM7Sc7RR4ozi+QQZ9X4VS4LRFNzVLwLppML7NhQNTku
	 5SDMuhu7X7se+vnb8SVNZEEGA6OoPyVT6KgGD9Jo8tII1bd0uxBtGVUCUBEUgPnsIy
	 Wqv2G78QTKyk1PiRrGlerXv23177JdfsUn/yacj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5930CF805AC; Sat, 15 Jun 2024 04:50:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA14F805AE;
	Sat, 15 Jun 2024 04:50:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25EF6F80448; Sat, 15 Jun 2024 04:50:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20117F800D0
	for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2024 04:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20117F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A0LAdBAO
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-6ce533b643dso2056317a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718419820; x=1719024620;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R764S7EN4/FxBf26BEHI7euXBWM9msXFNVmov2DoRy0=;
        b=A0LAdBAOHmqdC8NP2nzsrMGUO/flHfJi1FxyRamZblmvkVDCWkashA8D0dNnWvBjEo
         nqEwPbrSW9/FVSNynBo5nj8ZcjhxZFI7MoFVbesQLEuBLpysKxspPIZ6EFCuEB+2dxy7
         tNSMLL5iwU6JYi+sFD9C1efD9krSIB5oTYAZjETW3rXvgkz5XTpSQa79D0ba2q3u1cK8
         zRK4tKx8AUq9/5X1Zu0IQLNrrfwHXuYH4j+exhWMtWKGf5vKX6kZIcSJf62RwYosXyQ7
         PSNwA7x2NkGQtyuXYe67XDKtC2bcANpLPiRwx3h7McM7CaKj2OahpBRP8BcNjaMK6167
         peTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718419820; x=1719024620;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R764S7EN4/FxBf26BEHI7euXBWM9msXFNVmov2DoRy0=;
        b=om0auxklXXwwn7mZZm+zTbUY6iVkngFGiZtTlNWrr7JpejkBskmlT1JJg3QHQOqEpA
         80O06PB9meToqN9LBf/MFgJXL1UXhrFwITTyM3bEaNQoZyCuncQiCo84CMV19fe1DUH6
         Ay2SLyFLfr9aIQlY38+4HJPgi+zvtPpE7FMKOTClL4eKZqMw0TaajA14noPU0Uw0l7iH
         nmN6ZtkHBRdyFWIX2aP335HRhkLEyw8HQcDR+qoaH4cNHs+fLK8moLeL7sF4yEw1ZV6Q
         RMIgwcrkEnNOmtCsKnG0RVJ7Mx/fDUaazoXOq0wQ/LzweFUwUNA09Q23wlPu7dTT0mFI
         is0A==
X-Gm-Message-State: AOJu0YzJdwpAnIZU8Yec6ALEiuocoCDyiFYeVBdA/BuVTej7LZM22Y5f
	aWOSuDBZQ5zT/4Qd4PLf4ITY0mBTh4sa2OIs46WHZ96BC28bIzmv6zJScc+ErQt4iKjrO6sHKzD
	Uez2fbFjlwmHtxNqdeOSbTZtGXZDc2g==
X-Google-Smtp-Source: 
 AGHT+IE2V0TomahInhhu7AGKYtFrIJS6qn9kR5gacceEQpOCut+u4PvFQhAXMjgPX0uIz/SpLq25Io7ViJXLombsU7Q=
X-Received: by 2002:a05:6a21:1a1:b0:1b6:d9fa:8be with SMTP id
 adf61e73a8af0-1bae8238eccmr5098215637.40.1718419819766; Fri, 14 Jun 2024
 19:50:19 -0700 (PDT)
MIME-Version: 1.0
From: noman pouigt <variksla@gmail.com>
Date: Fri, 14 Jun 2024 19:50:08 -0700
Message-ID: 
 <CAES_P+_=Yx3_0mMyRDjMEYEV=2rx69ry1PFzBE=-VVUvvPOvEg@mail.gmail.com>
Subject: aloop driver introducing glitches
To: alsa-devel@alsa-project.org, perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ZIUURPA6XGJ7VL2JGBAVGR6IUJA2GIQ3
X-Message-ID-Hash: ZIUURPA6XGJ7VL2JGBAVGR6IUJA2GIQ3
X-MailFrom: variksla@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIUURPA6XGJ7VL2JGBAVGR6IUJA2GIQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Folks,

I wanted to use aloop driver to dump playback
audio data to a file in userspace for debugging
without data being sent to hardware (just as a
debug feature for future use).

Command flow is this:
1. aloop capture device is started using below command
first: "arec -D hw:0,1 /data/rec.wav &"

2. using aplay, userspace sends the playback data.
"aplay -D hw:0,0 /data/test.wav"

Using jiffies. Wondering if changing rate_shift
(don't know what is that for) will help?

However, even in this simple setup I can see aloop driver
is corrupting the data and sinetone sent from playback
has glitches. I have tried different period sizes as well
but nothing worked. Wondering if this is by design i.e.
if the aloop driver shouldn't be used for this purpose?
Any debug steps will be highly appreciated.

Thanks for your help,

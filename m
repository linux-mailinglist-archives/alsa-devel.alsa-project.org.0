Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E4E6111
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Oct 2019 07:00:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE36C18EF;
	Sun, 27 Oct 2019 06:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE36C18EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572156046;
	bh=9HJu7G2X6uuBS5aGM4NFYSIIeXOk9vm+Wb9Mz+bjlmo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hp0j5Q0vpEx8XgNabYYDV0b2M2jm6ipxQ5k83F6mDhuEJ78KCZL4FXRjrU4yebQmF
	 rY2Uot6Bg1zffYq2g6yUnM1h3LviCRIWPJFWo7doYhLpT3uO5FYYHh/yJvIOPf/ify
	 tAU75JVaCgl6u8f0bDOYNFZOW/h+vQy1/9D+KwOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3766FF80392;
	Sun, 27 Oct 2019 06:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A157AF80392; Sun, 27 Oct 2019 06:58:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FD6F80228
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 06:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FD6F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lN+/RWMm"
Received: by mail-pg1-x530.google.com with SMTP id e10so4313862pgd.11
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 22:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:to:subject:mime-version:content-disposition:date;
 bh=W23GMoX/L/JSui6dQFgqWzNsdin+ErvQoXJ7ztENu2A=;
 b=lN+/RWMmPxJ2zpxbBb5CDHQ2jRV10Pi4T8Bfa2PEywoD5K9COGSEpo705KBwXvRoos
 FCPDscwdk5oUqoNip4p0uW6JZNKzm4iww/MTV6kGhLltUTg1XQwTPzy5N222NtjuCHMp
 LKewqmqhVkPw6cW1RLjxZXbippK1c2fp8l2SR1DLF/VePJ6nig7Y9x1T2U+CcKHx6tYf
 N88g/lXRwXwGX5XgMls4A+EZQfmCDk8SMG1ZPxLnTxb85FLR1Bq2nZhnloU3+694Ovwt
 oxPznUARq5oP5tog9j36V+FeZKoYht6e10+Y4PjKp+LKal+QZcRaymhdSFbsBAHne/1L
 3nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:subject:mime-version
 :content-disposition:date;
 bh=W23GMoX/L/JSui6dQFgqWzNsdin+ErvQoXJ7ztENu2A=;
 b=BGHmjoJQ+kxpcHqDmAywCQBy1Zr9IHanRPLtiLBjoMNXl8VXjw8okZs5FrQdgBRxCB
 18rX+Zw8i/1PFC4FSSkF59o5nwus1jD1sWSHuzLSKBLPF6GXLtSqun7dETQkbwCu+3z5
 ATT1AqJwLaibiOFsDUTCJE0QNhbNEFBdVfUz0judDHZdEO70YR+Xhf0JkEbB8AeuSal2
 BiUleljYFx5cojVSGKiZwmPyQpL7MadC9XBmXsnGCVotMoWI9lM7A92DDiFggDd3BC0G
 i6thhYKfkZOzKqhLHpVnVi8DbtyL+X6LDJNxkubzA7uDXBx4eQkbhVoMBtjnzuXSkTK3
 WTAQ==
X-Gm-Message-State: APjAAAWMOA/H2g9Ez8/IR0Vucp6dD6799/PrQEXdxBtC3uMw9tLtV89T
 Unni5X12phJ4xwQSJ4IOG2rnxqB1
X-Google-Smtp-Source: APXvYqyZefC6T3SyWmHfocoLlZtHUkbAjLVcwQT7NANJTRl9o0kCAmYSxus4zvBcwSoL4oyKYXgnlg==
X-Received: by 2002:a17:90a:1424:: with SMTP id j33mr70141pja.2.1572155929469; 
 Sat, 26 Oct 2019 22:58:49 -0700 (PDT)
Received: from localhost ([2602:ae:1f18:f600:30d8:fbff:feab:8eda])
 by smtp.gmail.com with ESMTPSA id a23sm6957824pfl.65.2019.10.26.22.58.48
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2019 22:58:48 -0700 (PDT)
Message-ID: <5db53218.1c69fb81.4bca1.5d88@mx.google.com>
From: John McKay <adenosine3p@gmail.com>
To: <alsa-devel@alsa-project.org>
MIME-Version: 1.0
Content-Disposition: inline
Date: Sun, 27 Oct 2019 05:30:12 +0000
Subject: [alsa-devel] [PATCH] Fix JACK plugin buffer sizes
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

I was having a conversation on the Archlinux forums[1] about using the
alsa-plugins JACK plugin. While one of the bugs that we found has
already been fixed in the git alsa-lib, there is another bug relating
to buffer sizes.

Currently snd_pcm_hw_params_set_buffer_size_near() doesn't really work
when you are using this plugin unless you happen to request a buffer
size that almost exactly matches a whole multiple of periods that the
JACK is asking for. After some debugging, I discovered the reason is
that some plugins, notably the 'plug' plugin that most everybody is
going to use to change frequency/format directly attempt to manipulate
the buffer size. This causes the code in pcm_ioplug.c to fail because it
cannot find a number of periods/period time that can fit the buffer.

The included patch stops this by specifying the list of acceptable
buffer sizes as well, so that when other plugins try to change the
buffer it always picks one that will work. It does have some problems
in the JACK plugin now offers a number of periods/sizes that don't
exist but in practice asking for huge buffers just seems to give you a
more sane value.

[1] https://bbs.archlinux.org/viewtopic.php?id=250116

--- jack/pcm_jack.c	2019-05-10 06:57:24.000000000 +0000
+++ jack/pcm_jack.c	2019-10-27 03:43:36.053734268 +0000
@@ -428,6 +428,7 @@
 	unsigned int format = SND_PCM_FORMAT_FLOAT;
 	unsigned int rate = jack_get_sample_rate(jack->client);
 	unsigned int psize_list[MAX_PERIODS_MULTIPLE];
+	unsigned int bsize_list[MAX_PERIODS_MULTIPLE];
 	unsigned int nframes = jack_get_buffer_size(jack->client);
 	unsigned int jack_buffer_bytes = (snd_pcm_format_size(format, nframes) *
 					  jack->num_ports);
@@ -441,6 +442,9 @@
 	for (i = 1; i <= ARRAY_SIZE(psize_list); i++)
 		psize_list[i-1] = jack_buffer_bytes * i;
 
+	for (i = 1; i <= ARRAY_SIZE(bsize_list); i++)
+		bsize_list[i-1] = jack_buffer_bytes * (i + 1);
+
 	jack->sample_bits = snd_pcm_format_physical_width(format);
 	if ((err = snd_pcm_ioplug_set_param_list(&jack->io, SND_PCM_IOPLUG_HW_ACCESS,
 						 ARRAY_SIZE(access_list), access_list)) < 0 ||
@@ -452,6 +456,8 @@
 						   rate, rate)) < 0 ||
 	    (err = snd_pcm_ioplug_set_param_list(&jack->io, SND_PCM_IOPLUG_HW_PERIOD_BYTES,
 						 ARRAY_SIZE(psize_list), psize_list)) < 0 ||
+	    (err = snd_pcm_ioplug_set_param_list(&jack->io, SND_PCM_IOPLUG_HW_BUFFER_BYTES,
+						 ARRAY_SIZE(bsize_list), bsize_list)) < 0 ||
 	    (err = snd_pcm_ioplug_set_param_minmax(&jack->io, SND_PCM_IOPLUG_HW_PERIODS,
 						   2, 64)) < 0)
 		return err;


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

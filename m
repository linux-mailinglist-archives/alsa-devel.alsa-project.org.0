Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666146AB66F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 07:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F10B1094;
	Mon,  6 Mar 2023 07:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F10B1094
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678084862;
	bh=oGx/Ty0W+r7AcONhbzL4lw5SppSD5zCFVINp2SMEdsM=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sHHo0sW9S5FaxdCGtJ3DyaCv86g9xg5bRFYLIvXW8IwqxVAOA6i+Ic4auzMBOVvEO
	 a0VbZTJ6auCBJ+iiwxQ3jeJcQHxFiRWnQ7tdJjTasIG6bZVMMk9wpqiQ8k3sn/VAs/
	 ohZYg5GMARC/I0vnHfvV5Z9hSzQhYCLbcZox9N4s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF11FF80236;
	Mon,  6 Mar 2023 07:40:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4BBBF8042F; Mon,  6 Mar 2023 07:39:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32329F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 07:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32329F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZPDhKJ+e
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-53852143afcso165997557b3.3
        for <alsa-devel@alsa-project.org>;
 Sun, 05 Mar 2023 22:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678084775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjKchQ4QvINiKoZzK3DKOpLGfDmAJk4YYRymN0+j00I=;
        b=ZPDhKJ+eejl39U2SIp0el/thJmMcRUPDfrv/OQxJlZrJ/4TpGViREXRZ2uDp+opJHg
         huTE2ScQHmHnQVf6FsHENp7b8s1xcJw9XnX8rIsQ/vvhAO6q2m70UMIix4H/suUJrI+J
         a259MjzWHqvuUGuvqyw0bkm0AVNkce9mGk+NbxJ98+UcD16ydawRNoEb7GvpJC3XNwwu
         q56xCf1T6TCZJfGF9qPt6bqIky+w+Xf7hf/vSb8SVGy/jhxe7178Et3SqyXPFo3iU/tl
         SXBkREVa0YKkpNar5CxQ5nhLSDR4bbaZqXjLfR4pB9xqUB9TeQ+dZKff3pmvqFtoV5Ah
         uwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678084775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjKchQ4QvINiKoZzK3DKOpLGfDmAJk4YYRymN0+j00I=;
        b=j9qLV/FzY1w0iHlyF8s4JRosPHCkk9i7JrYgcq4z5kq5rLeNaQlhKh+z1X0VoYB4TO
         uw7kh2giHnAQK8BWtcwD1d7XXHOVzQK4J1Cx88icF++mh54qkzS9zAaJtKQkb0eDq107
         y77+2xDPFULWeMVSRK55IR1RPMWpd7E3xSOUQyA47oJRMmZbSIJFGEHm5kFWRvEYsmmW
         YeBQeCPLiHfRMJNoQYNzPQNRplg9gvlNHpHhY5Ud2pSA13mOEWcs6dyMZwv8sqz9WMTx
         TDq9kfrYshNidPUH3cOFLKg9rED6JTte3oEXNdehlMi4S0YDN6R7yHB84hMGlfDx7ddJ
         9udQ==
X-Gm-Message-State: AO0yUKXWU527hqDcGoADqQGyTZkf4Kr9UXIwke2LAhEn1O52tIoqc0qL
	+am8mj148XofFh/xEAt4fMrAmeny6hVgTUAOtvo=
X-Google-Smtp-Source: 
 AK7set9dJTVhqJbqXfe397tfaTEsbbvU3/FJxBWZAwF+j/WAlL/8bbKoGM8qALKzHXhQ48r7q/EG1w9ZFsDt+EldEHA=
X-Received: by 2002:a81:b717:0:b0:52f:45a:5b00 with SMTP id
 v23-20020a81b717000000b0052f045a5b00mr6165555ywh.2.1678084774738; Sun, 05 Mar
 2023 22:39:34 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAHhAz+iuAYpxkpVGWp1g6u_j+wyB+vsFR8FGz1i_8G5TQhOVZw@mail.gmail.com>
 <9a68a02a-d724-8475-e6a0-082b20e93956@linux.intel.com>
In-Reply-To: <9a68a02a-d724-8475-e6a0-082b20e93956@linux.intel.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Mon, 6 Mar 2023 12:09:23 +0530
Message-ID: 
 <CAHhAz+j88YwjBa2y2G8Hj20BksbeShf5TiuP3zqr6o5MBzvk_Q@mail.gmail.com>
Subject: Re: soundwire: user space test utilities
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: JEOKUYJ6LP2DHS7GTX7NQRXZGWBK5W24
X-Message-ID-Hash: JEOKUYJ6LP2DHS7GTX7NQRXZGWBK5W24
X-MailFrom: munisekharrms@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vkoul@kernel.org, sanyog.r.kale@intel.com,
 alsa-devel <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEOKUYJ6LP2DHS7GTX7NQRXZGWBK5W24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 31, 2022 at 8:44 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > I am looking for any existing user space test utilities to test
> > SOUNDWIRE SUBSYSTEM in Linux kernel. Can someone please point me to
> > this.
>
> There are no specific userspace utilities to test the bus itself, you
> can use existing alsa-lib/alsa-utils applications to play/capture audio
> and check for events, i.e. aplay, arecord, speaker-test, amixer,
> alsamixer, evtest
alsa-lib/alsa-utils applications can be used for transmitting audio data.
How to transmit non-audio data over the Soundwire interface?

>
> The Intel manager driver provides a set of debugfs features to e.g.
> inject a parity error, bad command or test for signal integrity with the
> PRBS data generation, but that's low-level for hardware integration
> purposes.
>


-- 
Thanks,
Sekhar

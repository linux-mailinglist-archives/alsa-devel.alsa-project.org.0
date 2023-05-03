Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B211E6F4F7F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 06:41:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8F0D138F;
	Wed,  3 May 2023 06:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8F0D138F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683088902;
	bh=ouAqqueiiGfX7m6JpXrrBiw4EvXj2cQvgigK9Y4iNMU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GDQ8vgchzh+lJWiwD0bhDhjo4uypjKQCSI8O6Zl+2cuxmWhgWc6Ryf9baC525ufpK
	 Gi9B6x4CJ6rSu3SAZCQy5T3ZE8mYSGigtoinBuhf6JlkxO/v5p6URRztkd3EjQ6wX7
	 Ynjmznt/zQjMDG9PbglFPq7aFR5OQlJbJYCySJLQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF5F9F80137;
	Wed,  3 May 2023 06:40:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC058F8049E; Wed,  3 May 2023 06:40:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C743F80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 06:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C743F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=AP6cSbQM
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-24de3a8bfcfso3919632a91.1
        for <alsa-devel@alsa-project.org>;
 Tue, 02 May 2023 21:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683088807; x=1685680807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77tiXpQ2HjbyMiGi98E0ovy9Ioj8cftg4GmqV7//X1I=;
        b=AP6cSbQMwHS6YgLcCIuhbKJsz4vaRSY9hCqhPFEtm1HvvnSf0N2gxnGfZTtZNeb3fM
         TZoK8iW8O8MRog34ymtley4D9V4uy5F6QwMBxbNoC6MOWj60ENUdFc9y3b2u/j6Y1tJz
         hkHjUFD9D/tzIc6oyyld8M2eNwZryMU6ID3HCJ0OIFfHV+sxQAlh5dWP9F6FXA8pt9hW
         qUU8Q1dvEAbAMjCbH6dYmU3dC00Dha/cZMaGdMtWi9pq7ekseqAWr/oQr/shKek35CZ2
         OSNWdXu8oT2IHmDEP+wDrzo+sdwPvFSNLWzCvIF9/pr5vb/SXBHtJnwQNQuLNTNxfiFO
         g40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683088807; x=1685680807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77tiXpQ2HjbyMiGi98E0ovy9Ioj8cftg4GmqV7//X1I=;
        b=RbicH52kjHT1WGXhAw0T3YOFQl5SHfAEsQ+kBQmk9r2nZ9D9ykpy1NAWOZmcT/hrpi
         bBJbQRr4FWGRWYPeoy+xVTi2My2/b/6cmaE7JkxVeHYEvXol9r68QF6fDf3C8lkottDo
         yyycIK1KkcW/mT58F/Z7O+sGt4fYgsdmUohNGd0wXyqVMHod19UiFvRYJ082bGSsCleu
         JnXbPngwiLNNgx6BGRM8HCrRRtXtMjbI4cl/1ZQrAlLXPb4s2G7fkvsQQT/aawdknAKI
         k+MlT0BYU9KLlvdXWBhJJWzqlSYGNveOcIV4wS95ubrhHuyNJhF9iNLhbT4n9/GzT7zU
         F1zA==
X-Gm-Message-State: AC+VfDzE+ibWE52Lgsa+cUDHTNVupHlEIV+U91bcN9lGJkRkBJu6UBbZ
	b2hcWKlPXrzgV/iSzVHfaYk=
X-Google-Smtp-Source: 
 ACHHUZ6FVFqaBqyy90CyPDYOpLziIFIxoEYbT12+sSR0gn8lbdxTMRS5XqCfds/MEuQG/S5rDPBXNw==
X-Received: by 2002:a17:90b:4c46:b0:24d:ed1e:c2db with SMTP id
 np6-20020a17090b4c4600b0024ded1ec2dbmr11210942pjb.31.1683088806739;
        Tue, 02 May 2023 21:40:06 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-39.three.co.id.
 [116.206.28.39])
        by smtp.gmail.com with ESMTPSA id
 h24-20020a17090a9c1800b00247735d1463sm2276107pjp.39.2023.05.02.21.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 21:40:06 -0700 (PDT)
Message-ID: <b449cbf6-8286-e22d-ca87-b1bc3dce29d7@gmail.com>
Date: Wed, 3 May 2023 11:40:02 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: linux-6.4 alsa sound broken
Content-Language: en-US
To: Jeff Chua <jeff.chua.linux@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me> <87r0s0pnim.wl-tiwai@suse.de>
 <CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
 <87fs8gp0i7.wl-tiwai@suse.de>
 <CAAJw_ZveoPfnBsSkHZqmLiVWATcOosR--6Ds4cdekdi=t1yV7A@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: 
 <CAAJw_ZveoPfnBsSkHZqmLiVWATcOosR--6Ds4cdekdi=t1yV7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: M6OV4RK2XSVYYGFPEXJDFK7F4LHVKRUX
X-Message-ID-Hash: M6OV4RK2XSVYYGFPEXJDFK7F4LHVKRUX
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lkml <linux-kernel@vger.kernel.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Regressions <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6OV4RK2XSVYYGFPEXJDFK7F4LHVKRUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/1/23 22:03, Jeff Chua wrote:
>> There was no description about which sound backend is used.  Is it
>> PulseAudio, pipewire or dmix/dsnoop?
> 
> Just pure alsautils.
> 
> arecord -D hw:1,0,0 -f S16_LE -r 48000 recorded.wav
> aplay -D hw:1,1,0 /local/share/sounds/alsa/Side_Right.wav
> 
> [recorded.wav] attached.
> [Side_Right.wav] attached.
> aplay: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> arecord: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> 
> alsautils, alsaplugins alsalibs all using latest git pull.

Are you sure you build alsa tools straight from the git repo?
Can you also reproduce with latest stable version of these?
Otherwise it's anyone's guess due to moving parts...

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


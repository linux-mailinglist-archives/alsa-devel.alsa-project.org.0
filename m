Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28676718B89
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 23:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6602A3E8;
	Wed, 31 May 2023 23:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6602A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685567028;
	bh=t7ze61W5mDpGIXFew1uV1U9LtQbd68RSAtyboOvbmuQ=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vbuoVRPTji5lV9enVH8pnI7oftHzksPGPlZqklk1QOk9sl3YnR+drTnSwRwZbNRlf
	 akxWvrs85UhTLZQq4AqqRVRhrzD/2pqjyuLlWQqf90oe2EU6f8y62/735tqOOiPdZ/
	 1jY5Qd1ONQoHCehAA7BT8UZU5HnyGy6LOwXuZnoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C9C0F8042F; Wed, 31 May 2023 23:02:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87257F8026A;
	Wed, 31 May 2023 23:02:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1317EF8042F; Wed, 31 May 2023 23:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8365F80086
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 23:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8365F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=iRTtzqlo
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7757912a0d7so2077339f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685566937; x=1688158937;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7ze61W5mDpGIXFew1uV1U9LtQbd68RSAtyboOvbmuQ=;
        b=iRTtzqloS/gnS3kPw16JPgRkCtoop1wn7no76IDFRJbNOOSaiBnCZtZ8jevulOJsWn
         ANQq5Gp1IElGmG5zY8WjcnkGId6NiE8sc1seo8GRQXd8yWddGc0IMDS0oBTKLRpgqD/A
         8JyYkyRhGIL5AQyIiaJmphoejPbvzCTvlidwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685566937; x=1688158937;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t7ze61W5mDpGIXFew1uV1U9LtQbd68RSAtyboOvbmuQ=;
        b=FC23EvP1xZ1106aVO526bltLHAoRANkwILD2OJL1jA4eOkmhYx5JaJ/DahWdqURduc
         1bYB56+JJsvZvE3F2JpE0+QzZUT4XYjpvNyfVM0vQJ0Ug8MuhI8CsRkn53lN5Pa+3uLL
         qkS2NXEDj7QBmFEBCd74AXD9Y2znU9lRm0MUGyism4R3D/ZE2arOKEh6iq9JsvGAgGef
         TlIAKxbjTbemsbNKFwo4ghFM7JcvElrK+MP6048HPoL5ko/Pm8tfoyoGVJ0zkwVvYKaO
         xTFWzr3jY5X2VNMkfRYH0r0eu/e0flaGTzfGCFhwHmzNGP6ZV4MUN6z1X17ohzreWrO+
         Zm0A==
X-Gm-Message-State: AC+VfDwjzSlCB3/SXHLNI7athmTOakwJEHTW0ocZw6eN7Hr5AFNa9Vgh
	ygTI4z/e1R+gxWQijeggpUMnag==
X-Google-Smtp-Source: 
 ACHHUZ77QomxYCAi5cPyxHMuVz8JK+42g9/BD2jLICSO9SzgvyhfKgjsmMXuyu95Qjf53d9ryxIsJA==
X-Received: by 2002:a05:6e02:1d8d:b0:338:4b36:5097 with SMTP id
 h13-20020a056e021d8d00b003384b365097mr2204435ila.1.1685566937370;
        Wed, 31 May 2023 14:02:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id
 t10-20020a92d14a000000b0032f240a0802sm3353407ilg.48.2023.05.31.14.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 14:02:16 -0700 (PDT)
Message-ID: <55e5f74c-6599-e127-cc68-06f1a52711c5@linuxfoundation.org>
Date: Wed, 31 May 2023 15:02:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Linux 6.4-rc4 - audio doesn't work
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HAC3CH7EUBDNSCPF4IVGMLZMDSRT5RIN
X-Message-ID-Hash: HAC3CH7EUBDNSCPF4IVGMLZMDSRT5RIN
X-MailFrom: skhan@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAC3CH7EUBDNSCPF4IVGMLZMDSRT5RIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All,

I updated my laptop to Linux 6.4-rc4 and audio stopped working.
I haven't done any debugging yet since this is my primary system.

Here are the audio hardware details:

lspci | grep Audio
05:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon High Definition Audio Controller
05:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] ACP/ACP3X/ACP6x Audio Coprocessor (rev 01)
05:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h HD Audio Controller

I see just the Dummy Output device in sound settings. I will
start poking around later on today.

thanks,
-- Shuah

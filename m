Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8B65A63E
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 20:17:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3624197;
	Sat, 31 Dec 2022 20:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3624197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672514264;
	bh=VweJSIOnzfqimuYbQG1+A26FePNUQgznXsgT83FnxYM=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eBt20upqq0t8oYO90oInGkyPw8auLuprPr25kgK1k7brQiK4JngasytyVaJfcOlRs
	 cc/ApcvsvXaS5R2VPZ45MSwrVhTDXSXcygPN9JialH5dHP5it6GUuKiUr1HQgjlx3u
	 MXog5QxCrAmaVWAS65qJqbbS8PZazEZeCthI+Q1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55301F80144;
	Sat, 31 Dec 2022 20:16:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F387F804D0; Sat, 31 Dec 2022 20:16:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 600F6F80144
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 20:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 600F6F80144
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=yakajirri-com.20210112.gappssmtp.com
 header.i=@yakajirri-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DHN+S6j3
Received: by mail-qv1-xf30.google.com with SMTP id d13so16880877qvj.8
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 11:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yakajirri-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUJl+mDOreZifd1C5DswkF/KPhUtnl+qujGQ6NTYbNg=;
 b=DHN+S6j3TKhbLe4Ok0n6ZrJ6lW7XzfIuUpO4fFlRgCUlzJXUACETHkS72DXMH7TzxR
 +vVdomo8yfo0ocmiyGnx84I3liGPtfBDDWbLmxluNnesulhyB6KV0YARRI+pkFKVTTNs
 6qfVxrDQIvxdFXe2ntidzdn1XNx2ZIR6aua/yTIUZzDPZgqBHlNqpBbLvqwAUiSkFLu1
 Vz95RlAL0pGXw6qO86T7vQ5A4+T0whp03z8r7vTLcKAr9NJj3nH7BRjyucWmsShNn7fq
 6rJLaxRx5qW/Ik/ccflS7kiqhTn5mj5kT+x666fg80yGWw4sEo4eY7s3bjcJ56kjGxdw
 aQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jUJl+mDOreZifd1C5DswkF/KPhUtnl+qujGQ6NTYbNg=;
 b=4zYQ6lUqLgP/Hrg/17Sc9ViBpVnBUWxVkJoBLbdEXg+GTsQbE8+oXZHmybttOIirrS
 AAL7I+LYecvayBRmOA+lUTi35rLEn9aq3wBtGg+hVyJi3/aaEYUCJvrr+Q4nw+hqqH06
 4WDRNnveggV9wVLYYoVY3Q2COZurbuoM90Qa1jTkiYoWlqrx+5NXUBx0CLAMVKRq2Exd
 qjzqYk7xNDMev5fY21ni1paFwr+ovzNs5Qe6e16/el3FapNAYfGNuZy2lRObal/0WMZo
 6+c7CjnW/id4O6oC1hriTKfJX1/9DA4hHAn0tsFPUjFYWKADIG6TZQhU0g3JlYXyukzf
 nkSg==
X-Gm-Message-State: AFqh2kq2ahpcdCbRPgxkgUGuKfmNAkz5f/mYWbwcGJuOVEUF6CCnKYlb
 eCr1CAAnXs8U9XkcffTAdXCpRC29zhoNncvVgF4=
X-Google-Smtp-Source: AMrXdXsoxSfIAb7NlpZUpR5whOld2RV3D5GvQKuQlFACo+oewmRRSlIo3+omeprslGFoONMVTpO96A==
X-Received: by 2002:a0c:fa52:0:b0:4da:ce6b:21f6 with SMTP id
 k18-20020a0cfa52000000b004dace6b21f6mr48820084qvo.19.1672514197779; 
 Sat, 31 Dec 2022 11:16:37 -0800 (PST)
Received: from ?IPV6:::1? ([2602:306:bc57:e350:a99c:2930:28a1:466b])
 by smtp.gmail.com with ESMTPSA id
 b4-20020ae9eb04000000b006fa84082b6dsm17014865qkg.128.2022.12.31.11.16.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 11:16:37 -0800 (PST)
Message-ID: <80606087-3b92-c06a-ec3a-a37549a33017@yakajirri.com>
Date: Sat, 31 Dec 2022 14:16:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: yakajirri - a001 <a001@yakajirri.com>
Subject: Front Audio (Headphone) and Optical Not Working in Rocky Linux 9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 221231-0, 12/30/2022), Outbound message
X-Antivirus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

With Rocky Linux 9 (clone of RHEL 9), I do not get audio of the front 
headphone jack or the optical output on the back.  I do get audio out of 
the line out on the back.  The front port does not work with Rocky Linux 
8, Ubuntu and Fedora, and I did not test the optical.  With Windows, the 
front jack works as expected with the realtek driver installed, and I 
did not test the optical on Windows.

The output of /usr/sbin/alsa-info.sh is here: 
http://alsa-project.org/db/?f=0d71a1351cd49f220c36fe69cc9af93f1d71ee3c

I built the computer with a Gigabyte Z690 AERO G motherboard that has a 
realtek alc4080 codec and Intel Z690 chipset.

With Rocky Linux 9, without the headphones plugged in the sounds 
settings show:
   digital output (s/sdif) - usb
   hdmi/displayport-built-in audio

when plug in headphones in the front jack “headphones - usb audio” 
appears and disappears when I unplug the headphones.

If I use the following command, I can hear the audio clip through the 
headphones:
   aplay -D plughw:Audio,1 /usr/share/sounds/alsa/Front_Left.wav

If I use the following command, I can hear the audio clip through the 
optical:
   aplay -D plughw:Audio,2 /usr/share/sounds/alsa/Front_Left.wav

I’m using alsa-lib 1.2.7 from the Rocky Linux repo.  I tried to compile 
1.2.8  from source but when I run “./configure” I got the error:
   ./configure: line 2998: syntax error near unexpected token `external'
   ./configure: line 2998: `AM_GNU_GETTEXT(external)'

I noticed 
https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/USB-Audio/USB-Audio.conf 
has more If.realtek-alc4080 entries.  When I copied the 
If.realtek-alc4080 section into 
/usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf and 
/usr/share/alsa/ucm2/conf.d/USB-Audio/USB-Audio.conf, and after I 
rebooted, I get the same performance.

One thing I noticed in 
https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/USB-Audio/USB-Audio.conf 
is the only Gigabyte entry under If.realtek-alc4080 is “Gigabyte Z590 
Aorus Pro AX”.  I see other manufactures have  Intel Z690 chipset 
support but not Gigabyte.

I’m not sure if I’m hitting a bug or if my motherboard is not 
supported.  Please point me in the correct direction if this isn’t an 
AlSA issue.  I posted the Rocky Linux forum but was not able to resolve 
the issue.

Brian


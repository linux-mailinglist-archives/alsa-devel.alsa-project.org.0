Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745765A82D
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Jan 2023 00:35:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC99145F8;
	Sun,  1 Jan 2023 00:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC99145F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672529753;
	bh=faQ5E2SIXeFwTFjMj/cyO75dGvfIuppj/Gl0O7du6Ls=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cF8qtvFiwp7rcEGZzzfQz0K36CpKds+EveAJIp2lkUgdfzAJS74ODNUjvZK5pPH6w
	 E8BSw1v7m30gBKcJHUVdWdbnn4U+WfKCnjLxgUJd/2znxlEhGrFiPQieU1QB/B4LuW
	 yBDfLaySLVIPWfZxww3IRj2BueVa2KrYVdGMBvis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60615F802A0;
	Sun,  1 Jan 2023 00:34:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABC19F802A0; Sun,  1 Jan 2023 00:34:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B67DF802A0
 for <alsa-devel@alsa-project.org>; Sun,  1 Jan 2023 00:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B67DF802A0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=yakajirri-com.20210112.gappssmtp.com
 header.i=@yakajirri-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=pzgUqM/p
Received: by mail-qt1-x835.google.com with SMTP id v14so17037178qtq.3
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 15:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yakajirri-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DTGstkMg2lE2fa0njBwoyN1x2/IKcbWf8ZCRlduvuH8=;
 b=pzgUqM/pUHQvehgLQBrre44gSyEZFTS1Z4lP78xcHieDQDwoJ6mFdrpmPBBdp0G6rd
 f5Ldargh8oOHz0p6hcXbjsXY3VJ2BpAUfoaYessifSjhWGaZvuraPgBYMSUn1wkV2LUz
 UKNhpqq4vAyU16qBVTKdhS+kztq3S5dguBKSWWdLeyLvylgfmcC4uW+Eqs8nmC3bnmOl
 4/N6GafejdQd6KukRHjZEih5jm479IPsjHFc+kyX/YKOdZAAigEN/wMZZ/x+NCK0mGjt
 fThMj0Xq/K/hp1fGAAzBi6TixTVbfGzkhu4QiW+wMEdN7IgzZdTV+fUFu+sC0pr4aRTZ
 D29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DTGstkMg2lE2fa0njBwoyN1x2/IKcbWf8ZCRlduvuH8=;
 b=kT3P61aui5neUv41ok2IVXG+hrRS6A8WuOOs1FkqiepoU5EknsRpg9/UDqvYfY5XAh
 oaj4fN52IDlBLILUxMRDVoIbe+LxkgWScAakkV/TQnJU/iF8M/44q7YQt5Uk74rxddQa
 8dCyr+baTia5ngZJGg1R8eiOOB1qPF9Vj61b2byUOAZb+w5qniWnAbuTzfn2mXHDoIfn
 cbN+R6/tBO6u0XVYp/xdT7Pj0nC/qQRhpqUdGrB8j66MqqqT7fipvZaVERIKJfjwuDXD
 brX7iGvcn0FnmGOcMWvFDqSYrrTp2shj4lj+SzH7rgkaM6jDOmPYJ8IVe33q9dyokJSE
 VGzA==
X-Gm-Message-State: AFqh2kofdFHIBQ7Ca3P1AeJf0yHkrE9su2wYZHHNUZFTc/1C4ROTN02S
 T0Xt9TbwA+RmT61YbvCzsMT9m+Smk53blLoxshY=
X-Google-Smtp-Source: AMrXdXtSAM2UKwxZWqYOqbqwfNayor34Sr8WhmlINQtxV88cEjMDD+pZpgHK8P3brrST+VOPCqrSmA==
X-Received: by 2002:a05:622a:1f91:b0:3a5:460f:9650 with SMTP id
 cb17-20020a05622a1f9100b003a5460f9650mr54582976qtb.46.1672529681138; 
 Sat, 31 Dec 2022 15:34:41 -0800 (PST)
Received: from ?IPV6:::1? ([2602:306:bc57:e350:a99c:2930:28a1:466b])
 by smtp.gmail.com with ESMTPSA id
 pi27-20020a05620a379b00b006e8f8ca8287sm17529232qkn.120.2022.12.31.15.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 15:34:40 -0800 (PST)
Message-ID: <b999d709-80b0-1c1a-3aec-2f334b797135@yakajirri.com>
Date: Sat, 31 Dec 2022 18:34:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Front Audio (Headphone) and Optical Not Working in Rocky Linux 9
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>
References: <80606087-3b92-c06a-ec3a-a37549a33017@yakajirri.com>
 <5b276f02-2792-36e6-55e1-a1cdbc389453@perex.cz>
From: yakajirri - a001 <a001@yakajirri.com>
In-Reply-To: <5b276f02-2792-36e6-55e1-a1cdbc389453@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 221231-4, 12/31/2022), Outbound message
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

@Jaroslav


If I do the following, I can get the audio on the optical and headphones:

------------------------------------------

mkdir /usr/src/alsa-ucm-conf
mkdir /usr/src/alsa-ucm-conf/current
cd /usr/src/alsa-ucm-conf/current
git clone https://github.com/alsa-project/alsa-ucm-conf
cd alsa-ucm-conf/

mv /usr/share/alsa/ucm /usr/share/alsa/ucm_bk_01
mv /usr/share/alsa/ucm2 /usr/share/alsa/ucm2_bk_01
# -P keeps symobic links; R copies dir
cp -PR /usr/src/alsa-ucm-conf/current/alsa-ucm-conf/ucm /usr/share/alsa
cp -PR /usr/src/alsa-ucm-conf/current/alsa-ucm-conf/ucm2 /usr/share/alsa

cp /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf 
/usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf.bk01
gedit /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf &
   #in realtek-alc4080
   # in Regex, replace 0414:a00e with 0414:a012

------------------------------------------


The optical and headphones work except I have three issues:

1.  When I reboot, in the Rocky sound settings, the computer defaults to 
"hdmi/displayport-built-in audio".  To get the optical port, I have to 
select "digital output (s/sdif) - usb" in the settings.

2.  When I plug in headphones for the first time, to get the audio to 
switch to the headphone jack, I have to select “headphones - usb audio” 
in the settings.  If I unplug the headphones, the settings switch back 
to hdmi.  Then if I plug the headphones back in the headphone works.

3.  I have kvm switch that switches usb mouse, usb keyboard, usb 
printer, and hdmi between this linux box and a windows laptop. When I 
switch from linux to windows, I get a pop on my speakers. This is weird 
since the optical port is built into the motherboard and the optical 
port only goes between the linux box and speakers.


Do you know if any of these issues are easy to fix?  If not, I can live 
with the issues.


Also, should I submit the USB-Audio.conf change as a feature request( 
except adding 0414:a012 instead of wiping out the other motherboard)?


Thank you for your help.  I've been fighting with these issues for a 
long time.


Brian



On 12/31/2022 2:35 PM, Jaroslav Kysela wrote:
> On 31. 12. 22 20:16, yakajirri - a001 wrote:
>> With Rocky Linux 9 (clone of RHEL 9), I do not get audio of the front
>> headphone jack or the optical output on the back.  I do get audio out of
>> the line out on the back.  The front port does not work with Rocky Linux
>> 8, Ubuntu and Fedora, and I did not test the optical.  With Windows, the
>> front jack works as expected with the realtek driver installed, and I
>> did not test the optical on Windows.
>>
>> The output of /usr/sbin/alsa-info.sh is here:
>> http://alsa-project.org/db/?f=0d71a1351cd49f220c36fe69cc9af93f1d71ee3c
>
> Card sysdefault:0 'Audio'/'Generic USB Audio at usb-0000:00:14.0-11, 
> high speed'
>   Mixer name    : 'USB Mixer'
>   Components    : 'USB0414:a012'
>
> ...
>
>> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/USB-Audio/USB-Audio.conf 
>>
>> has more If.realtek-alc4080 entries.  When I copied the
>> If.realtek-alc4080 section into
>> /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf and
>> /usr/share/alsa/ucm2/conf.d/USB-Audio/USB-Audio.conf, and after I
>> rebooted, I get the same performance.
>
> The configuration for your hardware version is missing in UCM.
>
> Change 0414:a00e string in Regex (If.realtek-alc4080) to 0414:a012 for 
> a quick test in USB-Audio.conf. And yes, use the latest 
> USB-Audio.conf, Realtek/ALC4080.conf and Realtek/ALC4080-HiFi.conf 
> files from github.
>
>                 Jaroslav
>

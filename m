Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E14961A6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 15:59:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883CB2B5B;
	Fri, 21 Jan 2022 15:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883CB2B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642777164;
	bh=qJu84sMkB2ZNgi9aUCZTQ3ff8Om6lgbkjIwr/mh/7ak=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c2pmB+MU2516b5AQpW+6Wid5lD1Jp94Bt1KuHraPupdQpMXn52GmUlug/yOXcd2qr
	 amvOETC+XKbCsFRIEC0syQLW+bMgCxpTJ+Q5wO8K8LDftQ/+nVSJ8NILOaBWRA8Qlb
	 D11FFoGmUn3jz31Dbsoe+1Ku/BvfY9dU4IwlyE10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC1A2F80302;
	Fri, 21 Jan 2022 15:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40F17F8028B; Fri, 21 Jan 2022 15:58:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00712F800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 15:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00712F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZyylAai+"
Received: by mail-qk1-x72b.google.com with SMTP id d24so10120407qkk.5
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 06:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=BpG9dn7qpXT3iRBggoRMoNfPWx+JsvWfSVHRmwZyIVA=;
 b=ZyylAai+KT37WiyrIwGoc46aqe/zbrAbgdCicd5Bpop6vWPR6SpReFHZtAMd80cqK5
 2pbSO9F5KfeMUIq5ZW9G+RoqhTxaulHfnpoTA38mINUF1SCfLvyevsnHccEQsLJSMwBq
 bSpwAf6g+aV+nA7jSJi8N8rLjBk9hKltKRL9cnbNM/Vuzglus2VnhTK9MX+Vn2DNErUN
 aDpWOABCSE0pBorU8gieTDs6diSKdCHusMjHcgdYqQR8g0UjuE7UO9tlYPnrOayh7tLG
 4E2xEqi59ySQtud7hOFVOfpVkrnwmvRkmPS2wC7hfE/C/XpRteven78gQ8tF3QgbONZF
 tz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BpG9dn7qpXT3iRBggoRMoNfPWx+JsvWfSVHRmwZyIVA=;
 b=x9neUX2TOJ847fGUkLe3VUytzPN9hiz7f9wl43JVGKD7wW66tPO+b0esb8ONjwV9pl
 kH4VUbXVB9erUQ4WH50bIKnDxtp7Us2ZUeWK1pAHr429A6qVIFqRw71G6Wbv5+ZfyOCD
 g1j0NHM8aYUP5U3hzjJEXhGTYJZbgbpdUHAUMBOngfttPjmLtXQ1OLartDbAUXfjdQo+
 Wu49rcshjvet5bJ3neLiEGBxOeGj867k9We5cHosVzsddRtoymGLxIqrEKaPmWUL5oYM
 RKLcMwQeVYQLSTvTQb3/DOa/qG9kbuueSl8XYYYELwLYVB3oaOWTpRAuTXaRkvX5WmUG
 qn3A==
X-Gm-Message-State: AOAM532HC8mCBzyxJMdYNOoHcF8TD78OQD6rs9js89I1NepbVh0e3EMU
 +GDMUqgM51SpHRZFcuv/dF5DV8wtZ1x834uzaB12L65QJ9o0Jg==
X-Google-Smtp-Source: ABdhPJzGEIHvDuMyKGs9Jk4u2SnjR9KyvOemqHDRso2ASkxnj9WNCDJnccDh3rtFa1BNsQKhmsNQR/b+iT8If33nSvE=
X-Received: by 2002:a05:620a:2996:: with SMTP id
 r22mr2805665qkp.47.1642777087262; 
 Fri, 21 Jan 2022 06:58:07 -0800 (PST)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 21 Jan 2022 19:57:56 +0500
Message-ID: <CABXGCsOJq8gJDYN6siT3EMMjVSvbfHkFdnmPknr+HM=VX0L+=Q@mail.gmail.com>
Subject: SSL 2+ playback device didn't work (device or resource busy)
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi.
Got a brand new SSL 2+ sound card today.
If the recording works (not ideally) I would like to work with each
channel both separately and in stereo mode.
That playback does not work at all.
The device is defined as a quad channel and it would be better to see
this device as two separated stereo devices.

$ systemctl --user stop wireplumber.service

$ aplay --device sysdefault:CARD=ILDSP ~/Music/Modern\ CD/01.\ I\
have\ found\ my\ love\ in\ you.wav
Playing WAVE '/home/mikhail/Music/Modern CD/01. I have found my love
in you.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
^CAborted by signal Interrupt...
aplay: pcm_write:2127: write error: Interrupted system call

$ aplay --device sysdefault:CARD=S2 ~/Music/Modern\ CD/01.\ I\ have\
found\ my\ love\ in\ you.wav
ALSA lib pcm_dmix.c:1032:(snd_pcm_dmix_open) unable to open slave
aplay: main:831: audio open error: Device or resource busy

$ aplay --device sysdefault:CARD=S2 ~/Music/Modern\ CD/01.\ I\ have\
found\ my\ love\ in\ you.wav
ALSA lib pcm_dmix.c:1032:(snd_pcm_dmix_open) unable to open slave
aplay: main:831: audio open error: Device or resource busy

$ systemctl --user start wireplumber.service

http://alsa-project.org/db/?f=99ecd60a74fe21e14262ec53475437b413ae5602

-- 
Best Regards,
Mike Gavrilov.

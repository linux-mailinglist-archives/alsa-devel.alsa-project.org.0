Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28C2279B5
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 09:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0533F167D;
	Tue, 21 Jul 2020 09:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0533F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595317544;
	bh=N9YDhuYUOUHpXCwVjoQ/eRExwGtLOCv+fJdN00Gkoas=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DNuSmZyBpibJ7quCedttkSapWwPrqkWoBU2gZ3DQ/XomL7aXQshUujueB4xJbyQte
	 vZMtKFQJFxIN4g+/0OhM/rEo5/g340qXhnBFvGcqY2nITcdFW0ZWji9gG39D53qbAg
	 NtbJOAl1r7sdauWeeYjmx1MGG+SCFtVQV2g37IiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4140FF80117;
	Tue, 21 Jul 2020 09:44:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFABFF8024A; Tue, 21 Jul 2020 09:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA000F80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA000F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jdwmoz0b"
Received: by mail-ej1-x629.google.com with SMTP id n22so17753887ejy.3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 00:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=N9YDhuYUOUHpXCwVjoQ/eRExwGtLOCv+fJdN00Gkoas=;
 b=Jdwmoz0bFtGFaYQH+2BvB4CsCBrRawstnt/vd++m4WjsIZtogqqI+7atYjL8Aqs5mm
 Oau931rhCmzY0qjpg2+qFV/zgZ488b0d2e2hKjHXRG27CkjTNyxg9XHzxKlfQ1WAVvPH
 cJFuCK/jQDVvTnTmyMSoq1ac7XEEpwJVPcddSsIGSc7Th1MDfk5nhjDj+eI4BKYMUJE2
 1OzaYDOo0Jo/TdfNc0GKfvMi7f9rL2JIEKcCkNtkfRaafjIneFcYInh2W+lKPdxPt8F1
 6eNVtT2HDhoejRymc3UObqoTxYb+bGUikc8BiJfuDt2wwhtYLYmnMuRv1bJooMv6GQQi
 tObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=N9YDhuYUOUHpXCwVjoQ/eRExwGtLOCv+fJdN00Gkoas=;
 b=AI71ZFItEcLkNri4cIV+6gcRlIBd0ZuUHIBBz3rz6gI7995MdOnKwRKkZlPtM7utT0
 3Q+hgveMusd88rCfF0e+3DLtmWbse70pYPi6au+5o2CEeWHg6DFYmc8LxQ4PHyntDdAA
 o3vmBccEjSg/wWYD/RPmmV67BW7F4zAPuJnWHLDBiMG9Dw3xFMiy+k2tRqYcka3xUxVB
 0kl7+Hwbud9wxi0+t24SP2KKprlDnbMEh1Ix26vLIpW0s0zvu5+XPfPVtitX4Yoz7NX2
 beg1yAEONKDCDhSsxwXkYSwmHXPvpBL5zA9ld00//w5+2BGydC4CcTNpwh5EHa5uq9PB
 3QSw==
X-Gm-Message-State: AOAM5327/R+VIub489Ft94bD2OZ3iLaWu28+qicim5YTb5PIuCu3qHJJ
 Ms/VPHj+jvsej9OJntnWXq8=
X-Google-Smtp-Source: ABdhPJweUgjACn0IyjDNnNw++82uOrABdoSLbHa8GZ2CP3Owo6fpdblE1Rcel7Btoa9hclHNyqpH4w==
X-Received: by 2002:a17:906:9348:: with SMTP id
 p8mr25637721ejw.467.1595317431211; 
 Tue, 21 Jul 2020 00:43:51 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id o17sm16229521ejb.105.2020.07.21.00.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 00:43:50 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Subject: Reference USB card driver?
Message-ID: <b6b173b5-fe9e-32a7-638c-6e5815f28872@gmail.com>
Date: Tue, 21 Jul 2020 09:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Torsten Schenk <torsten.schenk@zoho.com>
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

Good day.

I recently acquired a TerraTec DMX 6Fire USB card to play with, which
works after one/two just to alsa-devel sent out patches. Not very good
though; it's for example rare to not have my music skip when Pulseaudio
mixes in the "there's new mail" sound from Thunderbird.

I haven't been around here for a very long time now but have some
ALSA-experience with ISA and PCI hardware from long ago. None with USB
whatsoever though. Is there a reference/best-practices USB card driver
that I can/should look at?

Regards,
Rene

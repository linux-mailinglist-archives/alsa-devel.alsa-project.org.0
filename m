Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48CC13B162
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 18:53:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862B11828;
	Tue, 14 Jan 2020 18:52:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862B11828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579024404;
	bh=zdyO40yhXoE/V8VAqqR4iHDvbk7BKUiLAfm87zf24Ig=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IT6p5sWxn+SBJuXizjaMz8shE+apcM59pJA9IVJbiLW4PapUp0hYNl+pow2WxwjFj
	 T+yF0NzzWg6Shk7fIrtrtGqEaRAR0r0PqJv917cnAL6i3y90/0LNZP+dOPvEyQn8Tc
	 uJYkhLo6xBwF1vqfHv9bpWGgWkJPGviz42TAp5kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED364F8014E;
	Tue, 14 Jan 2020 18:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41AAEF8014E; Tue, 14 Jan 2020 18:52:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECD57F80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 18:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD57F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com
 header.i=@gateworks-com.20150623.gappssmtp.com header.b="DD+Ohg+5"
Received: by mail-ot1-x329.google.com with SMTP id r27so13457055otc.8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=i3LxDiMV6aun6yiL6tjUXyDycZcUqNGEQFgaII9F85g=;
 b=DD+Ohg+5kQOqsUeljospO9RVb+EX2MfwPFZhEtnIb08Ai4MethsvH5oXew93vd3xmk
 BUYhPH08f6D6gmYKIW0H6+vKQO7FkOSU2yNg9VMQ7uoKwEWzL0/pbfR3wz+xDEcNe/8q
 gEJyrwBUutf3G/XQb/vr5of66c7TGc22ChAV/aSJyVDhK2EWRP846EEL7kUJz7A82urE
 gyk9QtdyblyS3CyubnPtcLo9R1gtQLekva2hijsVPe8AU3qumWOUXqr4Dvi20hTFEXOT
 cApTYPKc/kCrmtf+Gg8RonkXC1r6gVbk2unB3XN5MtPLe4pXS+9Tw6HvJHviqkbGhvcq
 HJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=i3LxDiMV6aun6yiL6tjUXyDycZcUqNGEQFgaII9F85g=;
 b=PX1zsRv5mI02rFc3nnoahe96X9dKOhhDnZ/1n1qHOUvDEcvxYYc7TC9sZvVuBIXzt3
 0NjlqDdwZMTiDIMWrmd+t6Lu1pqoeAe93BgUdhhvb0s+Sym3W4ehMXND120VywzxOlRi
 Fj03EkD96GY2DLUfuwN8hhB+g2OLJbSoTvx/mNx0D0YjWZbx9Eza2d/tJSWdDkjntaFM
 U3pfqORew7EcuCrt/dh3n1ZtUzTBS51BMWQM4z5pmU8JKkoowRXiUfE5z+Ek3eDeLEG/
 kpLLgaG+bDhhznHIYh5M0ApA68uLEP4fyqMYcoDedO2nEjoJAyuW6+TT2s2+nLWvK+MA
 LAEg==
X-Gm-Message-State: APjAAAUh0ZDf5kwrrI2EqZC+22cuFrmPaeEnQl03VwgS1WbwVpUcC3/W
 TzuAz2FesGJvaPYy+3hsalCP3AbJ8cB7vejQKoByV8nj
X-Google-Smtp-Source: APXvYqx7CNFnCFuqK8gtbaEReOf7UoMLQ/rZLr4uJ9fVfXIYKprNB7sQjmz2QKK7iIV7IfJMhcn/PO+U09OxQwjL8hs=
X-Received: by 2002:a9d:32c7:: with SMTP id u65mr18199936otb.224.1579024343245; 
 Tue, 14 Jan 2020 09:52:23 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 14 Jan 2020 09:52:12 -0800
Message-ID: <CAJ+vNU2ArU4mo-9_SE_x-_AfdTNKvun=DpfxRsKRv20CaEKqSA@mail.gmail.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [alsa-devel] how to use DPCM to alter audio path between headphones
	and speaker
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

Greetings,

I'm working with a board that has a TI TLV320AIC3105 codec connected
to an IMX6 SSI with a headphone jack and a TS3A227E headphone detect
chip (HPROUT/HPLOUT), mono speaker amp output (RIGHT_LOP/RIGHT_LOM),
and mic in (MIC1L). It seems that Dynamic PCM allows for the automatic
routing of audio to change between headphone out and speaker out
depending on jack insertion/removal event but I'm not clear how to
configure that. Can this be done via simple-audio-card bindings or
does it require a modified machine driver?

Any pointers or references are greatly appreciated!

Best Regards,

Tim
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

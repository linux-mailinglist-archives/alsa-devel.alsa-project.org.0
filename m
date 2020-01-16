Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB33A13FBA2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 22:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A1D17D5;
	Thu, 16 Jan 2020 22:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A1D17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579210621;
	bh=WPdoKcLJILXRnZLJaJY93JnQyhqHjMMXd/wdh0xO4AY=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kU6Y7SFo1ZFbIyAr//68wlczD7NY9zdWhqy/Uxb2H6atnIjVvIpYLdSNCxqa/EFZ6
	 LE6tKkeNtktZgkwW0F0/KpsB55C4GIe1wkIpwiAzZzryLYVHwG6RIB1xqBXgTG4xj5
	 qKfBAXYBZZfqgopHoV2hpXV6YwmIvP+afXF+vXwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E14C9F8014E;
	Thu, 16 Jan 2020 22:35:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BEC0F8014E; Thu, 16 Jan 2020 22:35:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 399A5F800E9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 22:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399A5F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sQsh4VSM"
Received: by mail-wr1-x433.google.com with SMTP id d16so20674734wre.10
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 13:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=11dmuK3ySe5ohLd38FGErtu0DzzxDaJioS7FQt8LIuI=;
 b=sQsh4VSMnRJLRVVV+YBQaQ1iBhPQ4zjIbJUOTc0XITHO7TH/oiDxrE1YtETLpS8FVE
 fZk8m5Z8uUBvFCUVzxmdK6XG242yEFGjI1RBZWh7NOVT6AkPqq5TwH9AKa9AG46/lgvN
 lYo6LJ/y5cPkEZ44qF7m3bvprUKXhJZkyqZbHQ6Dwr1LoxZVfZPCOSjfvU77wFLW8j9k
 BJzmZKvUZrusSBDYiok9SAGqKW8XgPK0Ujno8di9P5kzMecNECoaKfVzIB2wlG3+Civq
 XwWhkxnG1Bd199JH1B2ruJTzJQa5AY7VZqTEqu0g5XxNLzpVPRyiXWKh7Dq3Hn2N7Mg2
 NRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=11dmuK3ySe5ohLd38FGErtu0DzzxDaJioS7FQt8LIuI=;
 b=j6R2TGhVbJsy/f7p7AQ3PB0tsBisycIqlI0ta781pIXRBvOxm86/V0JVX/WimoKvom
 zYKt7LFih9Ge5oG9+NRQ3EUzq+U8jALPMsGrtLgBIwBuCUAsoV2GK4lhXj/3Pu6zIvLB
 XFzQJYE6xNU97Vh8St7nRtqM9o9i2DmliNDqYHxywR2O08NnaPEPNnyHLT9HVXIFQQo2
 ntXajlNT1+Foregd3PjpAjkr3LIHpyrWLvYTPO4hZXFMxWTbIbLYtkPRpdf/HMrZNfNR
 R7M2USdl91y90Y6INPQAq8RAVx61d0QPHUW4oTeLOuBUHFLJfZyTq2Tu4VgXLDnG3Fnb
 sg5Q==
X-Gm-Message-State: APjAAAWEBfSxg1ZFHn3Z8FzXPfvDC45yjVSWxnWvE8H4WsR3fxrXQmtm
 1cOGC33gn+FtrKN7HuAwtHL3XnBMtKTQKREbn6EF/C7KgiM=
X-Google-Smtp-Source: APXvYqyzfXpYPvmKp7pdTrhY0SmQdgCpBlzsGUX40zH12dfLHulMdTFeyq+cGAoICValIdCXhAyeGi8E9Tm+hsTrVZs=
X-Received: by 2002:a05:6000:1044:: with SMTP id
 c4mr5575014wrx.204.1579210507893; 
 Thu, 16 Jan 2020 13:35:07 -0800 (PST)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 16 Jan 2020 23:34:56 +0200
Message-ID: <CAEnQRZCfC-D_gA95b+qO-quu6sLDQWftJUUt5jew7W32Ji39yQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] simple-card: DAI link creation
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

Hello Morimoto-san,

I want to know your opinion on enhancing simple-card in order to be
able to create
more flexible links.

So far, simple-card allows the following cases:

1) normal sound

all DAIs are detected as CPU - Codec (+optional platform).

2) DPCM sound

2a) all CPUs are detected CPU - <dummy_codec> [FE]
2b) all codecs are detected <dummy_cpu> - codec [BE]

I will need to have a third case where I need to create
a back end link like this:

link->cpus->of_node  = <&my_dai>;
link->codecs->of_node = <&my_codec>;
link->platforms->of_node = <&my_platform>;
link->no_pcm = 1;

Somehow, similar with qcom_snd_parse_of from
sound/soc/qcom/common.c.

Do you think it would be OK to create another file to handle this case
in sound/soc/generic?

Also, I would really like one day to really understand the role
of cpu/platform/codec for a FE/BE.

In the case of the FE:
- cpu dai
- platform
- codec, here it makes sense to be dummy codec.

In the case of BE:
- cpu_dai
- platform
- codec, here it make sense to be reference to a real codec

In the case of normal link:
- cpu_dai, here it makes sense is a physical DAI
- platform
- codec, here it makes sense it is a physical codec.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

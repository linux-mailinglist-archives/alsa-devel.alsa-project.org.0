Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A467A943
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 04:29:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEA9E7E;
	Wed, 25 Jan 2023 04:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEA9E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674617354;
	bh=zNQqxqxbT0eUVxqmH68RO5Vbx5Rfr0jQY3PqDOZYvko=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nlagmfmEcSr3QieY+80ZpNBHwjvtPqzLe+TGOyNaTisMoCjLAY+1TNngmy9raeJBx
	 POzuOeP0pb2kcjmoya6xdoICHNObHbqzD7+TI0Nx74+Hc4XR4Z6pmheHR01kaCNTYK
	 g7/wB1uAhCw6U01GSiTd8GP8s5ZYr8+qtaxOCk6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73F9BF804A9;
	Wed, 25 Jan 2023 04:28:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5229AF80424; Wed, 25 Jan 2023 04:28:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9806F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 04:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9806F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Fd9hROox
Received: by mail-pl1-x62a.google.com with SMTP id g23so16667967plq.12
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 19:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D5LtwQmh21YMbY4pyaQPm7iLpie4QCzhPFlDJZ2GmVk=;
 b=Fd9hROoxStTFDOBhSTTHl+uv5IGApiEewgkpwc/NaQEC/Vqvd7nESMzIZqJnoXYYOv
 2i6oh4dsMcRqbfw9rdOcUDAHYzNpyHeu+uaDWY3CytU0rJYPadvVoxxwz0xmleXtWer+
 4o1ydVzWRU1EGcWt20Q8qY7vmiEd64hhSa0+lZSh7dIvAInfv1nnWTRDWsKWDUpS0EQd
 eMUpGZARJWJ9Gsla5ypv5/KeRyZ029/RdKmZXJwBjY/Lws6NO3GXDrP/dUNj8NdgKFDR
 /BJJCctIIShxk1SpuEOsxqoTuiWKAtp9+TyxocrjII3NxUyzx+H6REdtx/9tJHkyUlhG
 eOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D5LtwQmh21YMbY4pyaQPm7iLpie4QCzhPFlDJZ2GmVk=;
 b=gLsqyYRpx2/mQN5NeKoTMnADrsgyYuDemZyqyQNB8fvFH6XhO+wlQBxEZG/47XEo0Q
 nXp6itPeJ6BCxLS5IA7TvAjMVr/CXxryQx6acalF5+48XnKuOp6Wtya0vseN6BTMRHhQ
 k0EggSm4yyPleglMjGJCClm9H+gYre6ChB+Z3Sjw1tIyrl+6IpID6VjqBRhAju7A/2va
 6FLd2j2k6wS4VoWvAeYnGvF1ZoVbFcmf0sfYJhZkEzi6SZm7ibTO1/Wec8EXpL6Mpo40
 tROSVYAly066LQWJyP7PZcpFdsIHWhRkfxYytqvvi0+ZxC9KqX5qAlelgQ3tTW1tQbge
 wUyQ==
X-Gm-Message-State: AFqh2kqciIFpGcjdJ3xLo9gDRnr2EZT6ppecbq1UrH6FtnkMRhulSgeF
 F21cjHG1rPCMavnLWH9AJewdxTHncTAose/LvnE=
X-Google-Smtp-Source: AMrXdXsMYVlTr1KtQ//4B6jrWwXUF+svYZJmtmPPOGPCE/1CfjBBnkZ3InJzC6jrbcT6hABka900F/8HcSysKuG3IzQ=
X-Received: by 2002:a17:90b:400d:b0:229:30c3:60b9 with SMTP id
 ie13-20020a17090b400d00b0022930c360b9mr2725672pjb.172.1674617276600; Tue, 24
 Jan 2023 19:27:56 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Jan 2023 00:27:44 -0300
Message-ID: <CAOMZO5CVCm5bpVThYW7V379PyTfyVQLBrN03cUfOxLRyBXp0gw@mail.gmail.com>
Subject: i.MX8MN: SAI: First playback failure, second succeeds
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

I am trying to get audio playback to work on i.MX8MN board with an
ES9080 DAC (with a not yet upstreamed driver).

The first playback after a POR fails most of the time (about 70%):

speaker-test -t sine -f  2000 -c 4 -F S32_LE -D hw:3

speaker-test 1.2.6

Playback device is hw:3
Stream parameters are 48000Hz, S32_LE, 4 channels
Sine wave rate is 2000.0000Hz
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 6 to 32768
Period size range from 3 to 4095
Using max buffer size 32768
Periods = 4
was set period_size = 2048
was set buffer_size = 32768
 0 - Front Left
Write error: -5,Input/output error
xrun_recovery failed: -5,Input/output error
Transfer failed: Input/output error

However, the second attempt always succeeds.

I dumped the E9080 registers and they match the good and failure cases.

Any suggestions as to where I should look?

Thanks

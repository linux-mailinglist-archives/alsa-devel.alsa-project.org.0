Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B261B559D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 09:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E97116FE;
	Thu, 23 Apr 2020 09:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E97116FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587626861;
	bh=bT+toeSW/tqa6z8FWEaEaJpTep00WkLpX64oMkvij6Y=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IfrI5JJaAT7u5QGlTORx48ggrBvYIehGyJxMgLwOUFKD7caa1xWUq08pirbqmC35j
	 PC5wJfNaWcm4unxRoNarGikkqG25BwkBIRYCUV50TFD+0FR9mD2cM/YVmRFc1bXGle
	 j0HpC3225oarYQKk/LJzyyRoZZiB9I0fBJxezeZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6477EF80228;
	Thu, 23 Apr 2020 09:25:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C912DF801D9; Wed, 22 Apr 2020 21:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D01AF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 21:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D01AF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TxoewdDb"
Received: by mail-ed1-x542.google.com with SMTP id a8so2409028edv.2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 12:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VKh0D77o8Okg0Trgma6am+eO1wD0AUkDm8J9zTCOZco=;
 b=TxoewdDbUYM8EOwu/SC8RQHP3YzMAxP55u1k+j4Cpx7eJoIDHy2a6dSGUnTzkRYm1J
 HKBnIPZkPaV2dKfoGgKb2d8Pgv/UOIX6aHwu9F4Ul0T8fv8VrwVjjoVmOGXmHEw1gpSx
 mbxr+vXqhTjWshlhsa+yPAJ2HIZeMCmr+dp39ia5e5y9YRjrzCAOEXnBwdaauy3OrSNT
 6dp/X96JABvzx5ed3bQEaidB91ZiY3wipZzd7epn/edL2rumHABj9MRpn7psBpB5OAMy
 2cwBMv0BGNWyPBAW1t46UUZ4i+pJb6/83lyFpsbglxGuaiUYjtC6PfGv5LrwQ69FBoM0
 iUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VKh0D77o8Okg0Trgma6am+eO1wD0AUkDm8J9zTCOZco=;
 b=mP86CxEh1KomViGQVBpyYe+r8+TFPhHc7twQJFsx5BCDw3pvydevdhME8N5hIV06YS
 3ckLfEiZm5SSxcbQ2lOZi+AzTbe43SnziMTmOQqblP0UDlMlMfiicWhJcKx1H3b3xo2S
 rWXb/w41mfstuyNgsgnP9sSGMvmpcnwPg9FFpURqk540NVWBeyAcpclXeoQFqe5ywses
 yz48D/YYun+PA38DCLbVlN6EfDl4HRK+tqSrFQBYF/A5X9ma+pwq3oyNJik+RYxPCBdH
 s3J4YMJTaDSoKjLGSSLkYlm9oyUkfuOHOmigd8/Z25bH/jC+QoAg/NYNFctOa2so7QgJ
 9jLQ==
X-Gm-Message-State: AGi0PuaraqekPMRtSxAZ+bnla6Hy6VaE7U22ozZ2IplUr5I7PRKLLOHn
 wViTJ2p8H/uzxRpT51pdmTxiC2KhJwApFN4pqxddd8qe
X-Google-Smtp-Source: APiQypJX8oUuZeUcF43EQaIY/E1zDK9TX1Mi14SNuAi99Ut2wgwgUAWxRVTH2tpg6s38IYFzCmEZjSdYWZsPWITN3WY=
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr124873edy.210.1587582963077; 
 Wed, 22 Apr 2020 12:16:03 -0700 (PDT)
MIME-Version: 1.0
From: Xingyu Li <lixingyufree@gmail.com>
Date: Wed, 22 Apr 2020 12:15:52 -0700
Message-ID: <CAOX8YS8EYDJOpy1NxLphzYzwnLdmoGquEjveB7fGAg0dunw+CQ@mail.gmail.com>
Subject: sound:core:oss: what determines the value of plugin->extra_data in
 rate_src_frames()?
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 23 Apr 2020 09:25:08 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi all,

I encountered a problem about ALSA subsystem when I try to reproduce a bug
https://syzkaller.appspot.com/bug?id=54576f48248190caa29334a754275ce5e1d8be95
.
I run the PoC https://syzkaller.appspot.com/text?tag=ReproC&x=1275090ee00000,
it is supposed to crash the  kernel. But it sometimes does not.
Then I found the point is rate_src_frames() in sound/core/oss/rate.c. When
I can not reproduce the bug,data->old_src_frames variable
in rate_src_frames() and the passed arguments
frames are both 11. When it can reproduce, the value
of data->old_src_frames is 85. The variable data is one member extra_data
in plugin variable. But I can not find where it write to
plugin->extra_data. So I want to what determines the value
of plugin->extra_data? Why is the value of it different at different time?

Thanks

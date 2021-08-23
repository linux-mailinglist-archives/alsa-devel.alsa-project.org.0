Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 712453F4A0F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 13:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E500115E5;
	Mon, 23 Aug 2021 13:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E500115E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629719415;
	bh=rvKEHG+V5P5958Idt0zT0SZsTZxU/6CjLe7f+MZLLSc=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ARVAnuMxlnWNjBxcNLivFXxHkG4+m0NfvmC/qnotGo0/Ek15aGmZ8RyMW5/R2fG1g
	 dTW/aPBikAcLvyrrYLYe5Mw2SyiC7nC6GKaA4qw8C/SEcK7vVRq7kPVElUN9ZSe44Y
	 Ho4WeEjh8lPnlsZEsXg7KNWiE9WVeCRschTAwcrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 582BBF800E7;
	Mon, 23 Aug 2021 13:48:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FCFAF80217; Mon, 23 Aug 2021 13:48:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B57D4F800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 13:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57D4F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z3nam39b"
Received: by mail-io1-xd30.google.com with SMTP id g9so21372059ioq.11
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 04:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DGeOtwniKjgHeFEXcTnWIoKjqVAsKHeKtt5KDw99aRM=;
 b=Z3nam39bXXNw4zj0cv1glfRbHWY8kPk3JWIaJoBihTUY8yAfdI+jugW2xDYdujbvw+
 OLv4JaBCpt/YA5o++DX/hS6yWwfsifECJ+o/ykEuP23vEFkm89CSsAX/DnHKxX8lGway
 eh/ziuO/NSB1brxBMwwi5TRqewN/NNtvzg2dGlwUjlMvTKhg1DHCVlH1GUPPbwNruCvX
 SZdf4CYNM+DHPdLGSGNLiDBUk9ZaM5gH4hrFQcDLAolIXxDeUi5q3kfsiIDfiEdsBmsj
 AxfWx70Vht22DSDdrBdLr8TbwE5zaeQSA2ftJlZr//iBt3rWihYJfLQ6x1pboJkdUbTR
 TsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DGeOtwniKjgHeFEXcTnWIoKjqVAsKHeKtt5KDw99aRM=;
 b=Z6Lyyn9vG2YEhrHcSMIyfPoWOYnpeGGaU3ctr6pMQIdx2V4Aa2hOemiTNQBX8gdbtc
 syDrg6tMP5ss80tYCi+J0lu8eP/uN6xOuftqzZ5EX/fTt4ZAS5NxCJrS07wxBR1ItZpm
 NRLdst7d2zOov/f1TFPWnrg2TlKrek3KU67WXbYToDA9gq1jUvoWbCCVnJYOU5FEnlBk
 7c4VAKx7YP1WZaDbMP2fI69xqcWVDMxivkIBpggOER2kAWUWcJ07XK78oJGT0Lsy2e6S
 4JwmYmV2vR2tZzomIy46nD5sHXK26WhhpECxPpwILmYqqrrCuxWeqc8hTob/dpxCWB4Y
 LbFA==
X-Gm-Message-State: AOAM5327xGv6Clr5zar+tuvn7dHOqL/OjOHFxGBNvsyKYyIe0mBiAjMv
 vbJ6Qzku02gTs8UsmmCLd54xxniVONgw6OXx7Wx/f21FM+I=
X-Google-Smtp-Source: ABdhPJwzsWhJYjmqNW7lzETuKOb9ghbo1NbwHdvPBLdczBp10mRkvpK3SepcVJmfyzyPy8fIJKIHKk4MUl8qCfl3cTE=
X-Received: by 2002:a5e:990e:: with SMTP id t14mr26675403ioj.75.1629719329851; 
 Mon, 23 Aug 2021 04:48:49 -0700 (PDT)
MIME-Version: 1.0
From: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
Date: Mon, 23 Aug 2021 13:48:38 +0200
Message-ID: <CAGFh025WJ3uCfiE=2vYYd=gzwY690iokjvTD1GQ_G+e2aT4X6g@mail.gmail.com>
Subject: [PATCH 2/2] plugio: Check for pointer callback error codes
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

By checking error code returned by the pointer callback, we can
determine more precisely PCM state. Previous implementation assumed,
that a software PCM can only produce overrun or underrun. It was
impossible to mark software PCM as disconnected.

Signed-off-by: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
---
 src/pcm/pcm_ioplug.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
index c96104e9..0e27e121 100644
--- a/src/pcm/pcm_ioplug.c
+++ b/src/pcm/pcm_ioplug.c
@@ -81,11 +81,21 @@ static int snd_pcm_ioplug_hw_ptr_update(snd_pcm_t *pcm)
  }
  io->last_hw = (snd_pcm_uframes_t)hw;
  } else {
+ switch (hw) {
+ case -ESTRPIPE:
+ io->data->state = SND_PCM_STATE_SUSPENDED;
+ break;
+ case -ENODEV:
+ io->data->state = SND_PCM_STATE_DISCONNECTED;
+ break;
+ default:
+ io->data->state = SND_PCM_STATE_XRUN;
+ }
  if (io->data->state == SND_PCM_STATE_DRAINING)
  snd_pcm_ioplug_drop(pcm);
  else
  io->data->state = SNDRV_PCM_STATE_XRUN;
- return -EPIPE;
+ return hw;
  }
  return 0;
 }
-- 
2.31.1

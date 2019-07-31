Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C37C82A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 18:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F23B16B4;
	Wed, 31 Jul 2019 18:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F23B16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564589287;
	bh=z+RS2xXNX6/epm2dHgJIfXvUbyTfmxv8PAdungzfX8M=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gi9ZoRpORiCA7Y/6G2vYWwdsjOIvlOMp/0dCIG6+JjCGeIfqo3XKJDYY5HJJPXo3/
	 dgQ6WOzZP1O3TTT2d91ccNDEINiqHmhVzTd4ovCimbigjqqmM6sR8b8kfxM9MHRFeu
	 Bx984w/njzktnXN092OauKqob4V1jRhVWUAmb0lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D84DEF80483;
	Wed, 31 Jul 2019 18:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FDB2F80483; Wed, 31 Jul 2019 18:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC9EF800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 18:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC9EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VNigzGxx"
Received: by mail-yb1-xb29.google.com with SMTP id j199so24620203ybg.5
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RzLQxKDYOZRncMPU59yzIHSWEj5jqKUY0Dr5Gw9Yo2o=;
 b=VNigzGxxgiF9JCV5R45Pi8zDGeaEOUX9BXKku0TfHTxaZsFc/unVY77ew+gfu6/kzg
 mULy20ai2LslQ48nnSrldinjUF4KfmqC8JsH4UlPtQPsrI1Ovyt1oVjCyTuD50YnvkTS
 lJa8IEQejxClYktMgAxNmQXGfgg4+Thb5vWirjQSBlV9A8JomTrOSswXPPV1F0hcMjNI
 H/4A9EyXL72s1NeH29hDaY432LfB+fiUnPwYUL6ylAtpcqFQ1we7ivooH6/jYcYjlwHz
 2dWLbRKEB0WLle7MVG3UnbGYYybXPXJzPPhdkrRsh++xUW6PHzTtuBHJMMSHIuN1u9+/
 +v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RzLQxKDYOZRncMPU59yzIHSWEj5jqKUY0Dr5Gw9Yo2o=;
 b=Fc+G8bABkKE2XN6jKQMCDPCO0g7jefBH4N3STNMqTDJINjDfCakTKo0aU0qnG99qO8
 2XnvhAY4QP5hCJZxem6ULpIDnLOfU5SLONw+ZlTUDS0Fh6sWcPt3WBKiCzdgthZJrew4
 6ezHRjueGH30VzbxeDjqiMhZ+RC3z3O6NwekA1Z8Hr8k9NEMh94CVX3awZsYJhXXbWYC
 Xf1ujfLO/zoXTsKcvuu/02AzF5BjXWy2fN/L1g5hsQSzWlxE5SRVPvqoGlhkMgXCI67b
 ZyGJhopaAwc+f9w9W8YRU3zQAQkXd6NuNXvV59jD34PTlUwdSWfM6s0QUen6kVmyMK0h
 1N7w==
X-Gm-Message-State: APjAAAV+JDenyO2iLihlFblXYJo7uFeOQ1jqIOUlQJow+CZzvUcCprFk
 QaVhd7jlEwTdkJEYuFxC3C2Xu3VtU04opOvbo31ARAzo
X-Google-Smtp-Source: APXvYqwzgDWTSf+zqYQjPF+z5zIDV9gScq4fs3ESroVYBOVvnDwFFbToZ3xEh1+7laoB/GDU7WjxybQcQRGaJTorwxE=
X-Received: by 2002:a25:3b85:: with SMTP id
 i127mr38160593yba.164.1564589176195; 
 Wed, 31 Jul 2019 09:06:16 -0700 (PDT)
MIME-Version: 1.0
From: Diego Buffa <diego.buffa@gmail.com>
Date: Wed, 31 Jul 2019 18:05:40 +0200
Message-ID: <CAFwn9n1mL0tE8CaD+tF1vWBQv-E5hidz3B12WiHzxRhvpHs8fQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] standard read/write vs event waiting routines (poll)
	in ALSA
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

Hi all,
I am trying to learn more about ALSA, I always used example found in the
howtos but now I would go further.

I went though ALSA documentation (
https://www.alsa-project.org/alsa-doc/alsa-lib/pcm.html) and in the
specific the transfer methods.
Basically I don't understand the advantages of using poll instead of
traditional blocking read/write.

Generally I know that using poll I can multiplex I/O on several files, but
in ALSA I cannot create the poll descriptor array as I want, as I must use
snd_pcm_poll_descriptors() which requires that the poll descriptor array
should have the size returned by snd_pcm_poll_descriptors_count().

Am I supposed to realloc the poll array descriptor once I set it up with
ALSA, and add my own files? Should I then always check poll array
descriptor with snd_pcm_poll_descriptors_revents() before checking my own
files? And in this case it is safe to call
snd_pcm_poll_descriptors_revents() with a  poll array descriptor bigger
than the size returned by snd_pcm_poll_descriptors_count()?

Many thanks in advance.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

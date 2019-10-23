Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CBDE1D2F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 15:46:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BAB71655;
	Wed, 23 Oct 2019 15:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BAB71655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571838366;
	bh=TLvPL1tIal1vXFpvsYj7D/OKSETPxRxGyP0ziJqw4vU=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fBij2P5lczF3TW55DwoE56CxSwR/ArfH7XpVhWaFfTZ6NlJLkWsyp4uquRb7cAxht
	 d6Nx/1tstFPdPR1QBKYeVmku0aU19V+yw9wiFs0tGtuU2dTSTepW/23qIjJHwNZ+RS
	 maqWFLsfOdt0JiEWusN0FhPY3xwPm4H6l1Eulkrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B115F80368;
	Wed, 23 Oct 2019 15:44:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F09B1F80368; Wed, 23 Oct 2019 15:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B40EBF80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 15:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B40EBF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TQ2fhLGR"
Received: by mail-wm1-x32e.google.com with SMTP id g7so3250776wmk.4
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 06:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=k3spEnAc4J7QBbU+4ZzyW79GJhBhtKf79UbJTEJOXQs=;
 b=TQ2fhLGR+TYYTRI2TdNndsBY3ewxDp5K4uCK1n/RvjI4ZnWc6CCoEaZ6Ew7EsC89BH
 Ra/vjy3B5gWaOIlvQO6p/YsrYs+y/inIQ3lzjmLKtBa4sTpEbpmpTIESdOu3SMMvn4CD
 o1rUxVbHHpuDOcb2MYGgHvzomrmI6uNAeYdVf4Diiz/oxXIL9xC8YkYe7UeKGnQ90HGn
 q/Sb3rEiOpreDn8JSYYqw4zNqOvSJ0fJ5YrwTq1R78yuKXQrv2WvEnkI5zUSmHfh+cWQ
 4UDvkIn58lB6fGZ//zwzna9VrHeCYuz0sPywNpwuGrSo86v1Bj3HfY0JrhhDqY6Ffbqw
 O7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=k3spEnAc4J7QBbU+4ZzyW79GJhBhtKf79UbJTEJOXQs=;
 b=kpmG1a2TTgM7GqkH2KQiksz77MB1zSfkWx+trzccxSMJVuoZmS69nKM9RGSh/yvaAE
 fxfjjQPBeFcI8PQtXUu0SLXfI95kqOg/LpU+CehMrAtP7OT9EIO2gtGCwY7gJqKw6oDD
 w+hWrAJUzBHaPq3JvRpMa32t4J43I8P1wAD97QiRDnGl9w3+vgPMCm0PLZtLv02wAiRs
 FyDYVlRV9GeWR2kys+mEp3YRwdzohbyph+6B+G/4tbgMeBUCYTEcfHmRRcMBfVb7JHP2
 HcuUjEx7TNkKObnq7XmCpfpGN33shG1M6dGvvn4WEWbEdKZcqPSgPtOX3mab4diauH1x
 4Ovg==
X-Gm-Message-State: APjAAAX6+fv4plPvPCJcsjLMJJlTwu+6Giw1GQGVtZyAzSvRZ8l9IBXK
 HDss55c2ZwYO+vz6C4Z5ojZ8pzHl4/TGhPrffPIhEO4+
X-Google-Smtp-Source: APXvYqxCCk+Hy5Z4Dv2FStivUzTGGodRKSpoaJV0z1em0hbYbxJb4/DIKdbVedUErG8eOn9A+D/SzVviNkhcYlTG8iA=
X-Received: by 2002:a1c:dfc5:: with SMTP id w188mr7634964wmg.133.1571838256316; 
 Wed, 23 Oct 2019 06:44:16 -0700 (PDT)
MIME-Version: 1.0
From: ed nwave <ed.nwave@gmail.com>
Date: Wed, 23 Oct 2019 14:44:05 +0100
Message-ID: <CACtB+u0=M5kn6OWXad=1Z=PQaqbjtNStmpxDMpei_V6btwWBEQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] alsaloop change avail_min question
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

Hi,

Over time I see the message below and the value slowly creeps up. Is this a
simple information output or more of a warning? If run alsaloop for a long
time - many hours of music, will alsaloop be prone to failure because of
this value increasing?

playback plughw:Siso: change avail_min=7299


Thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

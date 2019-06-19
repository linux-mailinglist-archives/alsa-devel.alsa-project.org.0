Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07D4B916
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2840E1727;
	Wed, 19 Jun 2019 14:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2840E1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948633;
	bh=tAFeCOP/vs6KAcp2FLfiNrV/QbGgTmNUXhpYU8uR4pI=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SS/Gq1CSY/z3bF190swPI0Dwdwi0Cgm/q6WiqhFux5JO/0OImbB8qJfAxKoIo4z3Z
	 y2XoTDXTue7Vfr/fDJLfJSQYzqsIKj8Pu50wK1jfg0hVdrilAaI5R06teCBdUB6BtJ
	 ++p6+g0EMVQi/HV7cWhTIivpeFR0yPzKowtvkvBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07200F8972F;
	Wed, 19 Jun 2019 14:25:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 071A9F896F9; Wed, 19 Jun 2019 14:25:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935E1F80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935E1F80C87
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dvsn.net header.i=@dvsn.net
 header.b="g7sUhNRs"
Received: by mail-ua1-x935.google.com with SMTP id 8so9554860uaz.11
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dvsn.net; s=dvsn;
 h=mime-version:from:date:message-id:subject:to;
 bh=aaxm/AA1h0GP/QlcT6aEEiohB1phQXeeO/yDGE22hBs=;
 b=g7sUhNRs1OUuhoaY6aZ+WxS1/j+L58L6R6mzuxGxF7wbubXgyUC6rwfKkxjVZ8F5G6
 geUwBEP25wwXBDmGd24tEP7I4oXJteCVCebjJKlrNFs4/JsHB8vLFzZlDSw9svD2bulO
 Q2hkCeiBa+pFkVR32az1o2wFGwBut6bO7yppH+lWiW/OSDUwZAcYbxtXv01kq1enTY5T
 5wZ6kIynuciH/mgRWcnYopOtRKQIEwz9rrgqWBUqVeHP6cE6XKmgQDWSFW9XUQC+aZ8v
 XGCsfKx357H3pw+B/DQFbDbgLWuCGUemAXccLIho/s0OE4DRd6wmx4le9Y7NhirBYdID
 Nmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aaxm/AA1h0GP/QlcT6aEEiohB1phQXeeO/yDGE22hBs=;
 b=a16V4BR6/h027RLlhfea6VHc1Bp7uJCSBcpHawPyXT7nMGLDVzfysnIq/CpmOBW6Iw
 JfhQCQlcF+r2G2qbk0kHihbMYgwQQxZXj5/IMK7UJd9HAGGYIbz7JEeiUa/XQX7NOmEz
 fPToN/x+8cthtn9ZpYXJLXf0gt7MbGo8kVG/OhqLzGAwmUS8jFqB3TisSkcrjsGFc9yL
 4ZzkDYbHVo4KXFiA/Nyvz9t+w6KKzxWDyoyjBtqru0oSbIV+3xgSae1p9Wpg2SMbF/xC
 VxIT9vL/n9GhJIWvtZczOgqkQXCsmROzhqvSP4vPXPh3DtPB+q0dnb+Yi59MKmVYGjeF
 We/Q==
X-Gm-Message-State: APjAAAXCKevF7ltpHei5wzAssyp3gI7RUKgC0rP4TTNhpKKFmIymxsbe
 4NEkznS+zxxtQvXMmpcPnb5vWFjcMVPIwaFPAIileaUnpVhAmg==
X-Google-Smtp-Source: APXvYqzvjjfwN/xW+6M3iH8Uz6KAhbkAkXclyUf17g780B+/WBI0bnKA1tNZ6tI8qQ8gWX8tDabtX8G6G7qhUHkxZLI=
X-Received: by 2002:a67:e3da:: with SMTP id k26mr26489822vsm.131.1560947148155; 
 Wed, 19 Jun 2019 05:25:48 -0700 (PDT)
MIME-Version: 1.0
From: Andy Davison <andy@dvsn.net>
Date: Wed, 19 Jun 2019 13:25:37 +0100
Message-ID: <CAPk8ziH=P8ST6Ao54NycgiZePDr=T0+L6uVxA=c+pvhjZZCbPA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Patch Update for OpenFrame Sigmatel STAC9202
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

Would anybody on this list have a little time to investigate this patch and
bring it up to date for application against the latest 5.1 kernel, or
indeed anything being actively developed?

https://gist.github.com/andydvsn/c0c159f99bf19d5b30b5e5e156dcac3e

This applies correctly against the 2.6.33 kernel, but I I lack the
necessary ALSA knowledge and programming skills to make the appropriate
corrections for anything more recent.

Alternatively, any other advice on where I could seek help with this would
be much appreciated. It is the only outstanding kernel issue for this
device and would love to have it fixed.

All the best,

     Andy.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

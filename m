Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E91210B9
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 18:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802B4166A;
	Mon, 16 Dec 2019 18:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802B4166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576515974;
	bh=SMq9ODiNPL4URnpdpAHWhKoi9GgKWgDz3NdXcjW4DPY=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RD/bilDVM2ZetP0qmXS2iu4ICKM/RX3iCCOQXXsgwMk5gh723abzNto4lxi9noKUg
	 fEqPVgK1yWqe2kTP3MWLrVX79LQd8IGNCyJKXeU4rDD/auKuGH1slCGnnXKFXW8MZz
	 RQCxRhKLRmJALqLhHViM09qKKaX308aLUWMqD7/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7B5F80255;
	Mon, 16 Dec 2019 18:04:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFEAEF80255; Mon, 16 Dec 2019 18:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 352E7F800B2
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 18:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 352E7F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WmF8LwYY"
Received: by mail-wr1-x430.google.com with SMTP id z3so669535wru.3
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=D3KrVha7Xy8MmXsg2fUaHSDil7iN5fjwMv42kKYTDx8=;
 b=WmF8LwYYUlAK0WNN/c5dqoCRGQtpMu77pdxAPZCZrRw+qS2ThGoQbHU84mv1LuXAdJ
 UkBM+EgaqWI5Ld2gZxZom+Er3cmfoKLUt8aQ3zvZHDd8l1WmhE0zrk+OTrakE35lxqm2
 BA1uOFiz7/yAzs2M/0KMdX/4rm0TeTTJL10FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D3KrVha7Xy8MmXsg2fUaHSDil7iN5fjwMv42kKYTDx8=;
 b=ExoqA5FlDosoGVkRQ02H16Fpqhl2j/ReQlis+14frs3FVcL2iMYaFGutUt6Php2+Yt
 X9VVXMzLxdF1W1vTKgPVR4YuBcaF6HzBDQfvKqdn7KLuLuZGF9xCE2abAFcQ0XFNPuxH
 /vO2jcA3CxD6FIAGbrWbpwWVpC/0qMW7V7dfuj8m+jHJSEtqcqKs/qRc9TxACA7HS5lp
 tXq0gxCSkQ11JRfAxlgNPaCFzA1KSaM1wXslxVyQeCP7oOyfH7v9U6/TSazTI3Yp1Kul
 AXmz9pvt71a6pspPLaOglSMu1iM3Bp5YC2VGL7nTWkaDuZtoNdtjGW2zmMcvuo1IGknS
 T4Hw==
X-Gm-Message-State: APjAAAWzfGMqsD9JOrRcdnz4eh+fMTsehTBsY378zWOVkdWNRVszvlaX
 p7KhRdvBdhkRXhN8mJnBs4m+yVuTL7X1H6sOWBgcfDqB
X-Google-Smtp-Source: APXvYqx9VP5OQQ9mHwnv5hWWvVlTK9CknZ06x/b4bIy78vLi7XxX6ww5VPqi1ctzTm9aNrX+pPsxFyx9UQ4KnQLTmtA=
X-Received: by 2002:adf:e74f:: with SMTP id c15mr32803593wrn.274.1576515865856; 
 Mon, 16 Dec 2019 09:04:25 -0800 (PST)
MIME-Version: 1.0
From: Fletcher Woodruff <fletcherw@chromium.org>
Date: Mon, 16 Dec 2019 10:04:00 -0700
Message-ID: <CAN-6NYbiFOKDqAP2tHBYm6heqFSCQqQohdZfXqQ-rpgwnX1PjA@mail.gmail.com>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] Free-running MMAP Mode
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

Hi alsa-devel,

I'm working on implementing memory-mapped audio for a project that
uses the alsa user-space API. My understanding is that typically, mmap
mode requires explicit calls to mmap_begin/mmap_commit before and
after every read/write in order to notify the driver of newly
read/written frames.

Is there any way for a user to request a sort of "free-running" MMAP,
where alsa just assumes that the data it needs has been written to the
circular buffer and doesn't expect those begin/commit calls?

Thanks,
Fletcher
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

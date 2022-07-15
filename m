Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A9577CDE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 09:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92C671755;
	Mon, 18 Jul 2022 09:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92C671755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658130753;
	bh=ZqOxXZfLWbKCIYbZLLDFyaev8kBXH7qr0e4GmZg/tNY=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iPTXsrsTYILW/vqExFYn+YppXERVsUaDrbph8kBn/QJcEEShqCL3kUmBmmKBUTyIx
	 4z4jHRRzfcnRpfSmGCzZfrimVwQMnROBgJE+dQTevF0M0+ndMDKkDH6uzuKda2/hEC
	 OJdKuXFicEqk8qO+98rvfLZUzjvCcu8TWaLB3hls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49393F80529;
	Mon, 18 Jul 2022 09:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9869EF8015B; Fri, 15 Jul 2022 12:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC1DCF8012F
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC1DCF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HK33gUwm"
Received: by mail-lf1-x132.google.com with SMTP id e28so7199679lfj.4
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=vuQM2C3tRwK8xJaSxJ1ugxtB6fZM3nEFk9mPW5/lDXk=;
 b=HK33gUwmqzcjyfQ8sJX7gaRpWshYloEJO0fzZQjT9XoI+VNIlSwLC+qNT5Vxe761Sm
 HY4Xwp5ObZVq02Xu1FkglISxCpaQiobeX6e07nxXYZHHR/zeIPqdvnp3uikzhiPS+N7v
 K+YYWWdrtj+cbXyGsegh2K+mKZYb5ZlV0zeI2AbWG3rWpXPdZOmInejNzi0thXfQF5am
 5GpSzkDeo2ZxFVbHMRQpRKYiI5UehTgrxvhcQCVsq9jvkhKqqXXvT9SB8pSzYgPNjqNi
 pGqN2g3fB780iCg0uvB9Ql/BAuG160mvIew7Zd7A0KH++m0gSJEgL+A7k6dRABXszLLP
 FV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vuQM2C3tRwK8xJaSxJ1ugxtB6fZM3nEFk9mPW5/lDXk=;
 b=vR1G49S6gZDCcBMGxceH+10iKU/UNojWvS7SGtRB+JjreFsWpzVk7jsZyVLSOLEdQD
 0RrD3aKwqhfoRg9LxNKcSqK1MCQVrtZY4wnOueq7YBUuu6WYRh6FXBRWAQmz1lXh/Sm6
 8Y3G+3v5iVBgb0k6Cgs9kkog8069olw8Jtk/OFlMHS69/lZMVMpUOhci/5IYhvtgFMKI
 xxMT1zyBqS7zgHA7/EL7tt6CPMTDe7ZcSLeTvygKb69lHvgoNtZOqdD0adO5vJxhXhut
 YSLYFXj0UV0rE7UmiIPhnQAunAX9P1Mjk5CtYSKWRPnZ7RNBaUuJ/EMLgiFxrXdguOxC
 m6yg==
X-Gm-Message-State: AJIora//LWRpIKm172emPMIjOKQGuuAmI/rjgSHqdCMT0OcPZallrPKl
 2zEBLO0tjS+F0h8f8bhZO745qJ6kEs2SNyaz1YvxqP/QeS6FIg==
X-Google-Smtp-Source: AGRyM1t2wbiSMYIVnU4XbXxCYNIS2IQ8ur+cgpg7mZ06N95VQGt1MUzHqSLkiF5dQq7hC6s7m3YCMoVa7j5AjBpKJo4=
X-Received: by 2002:a05:6512:3da2:b0:48a:1b79:6d5a with SMTP id
 k34-20020a0565123da200b0048a1b796d5amr3730918lfv.471.1657882108645; Fri, 15
 Jul 2022 03:48:28 -0700 (PDT)
MIME-Version: 1.0
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Fri, 15 Jul 2022 16:18:17 +0530
Message-ID: <CAAd2w=ZJg6pJQ7TY8c1v9CJ+w65+ko3Dn7AMGPpupNrROY6e=w@mail.gmail.com>
Subject: stream == SND_PCM_STREAM_PLAYBACK ? _("underrun") : _("overrun"),
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:51:01 +0200
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

Hi ALL,

in the below link
https://github.com/bear24rw/alsa-utils/blob/master/aplay/aplay.c#L1360

My question here is ..

aplay -->writes the data from userspace to  system dma (in the kernel
alsabuffer).and from system dma to hardware dma(if hardware dma present)and
to fifo.


Now the application writes the data to system dma -->is always fast because
the cpu runs in GHz.  and from system dma to i2s fifo runs on i2s
mclk.which is running on 196.6MHz.

My point is..
cpu is always fast and controller is slow ,so when playback we should get
overrun.
the command should be like this in my point of you.
stream == SND_PCM_STREAM_PLAYBACK ? : _("overrun") _("underrun"),


Please let me know if I am wrong.

Thanks
Sujith

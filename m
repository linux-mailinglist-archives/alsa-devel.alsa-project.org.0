Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1A5F3F30
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 11:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F4521710;
	Tue,  4 Oct 2022 11:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F4521710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664874534;
	bh=/B3eO9RuR5NT5rgqfWPbOUzqeootW7WpsdtWM8BPgVk=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CAjyS49XaeuTEt+gO3kpf6EEsYt9mZ2XTOHV01y4jGJ5Y/o9e1SFwTY4mtkP3vusS
	 yswfxNzgB6C1k74t12uN8cjVI1aNkyu/e7T3Ql5sMegI/Zdw+0GqODz74KzgcjubBF
	 QeXE2MfwQqkQCkYYuZmy0v3DK/+yATN/xnCfkEaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA17DF80118;
	Tue,  4 Oct 2022 11:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EAC5F801EC; Tue,  4 Oct 2022 11:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 873C6F80118
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 11:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 873C6F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qXFh4io7"
Received: by mail-ed1-x532.google.com with SMTP id y100so17440559ede.6
 for <alsa-devel@alsa-project.org>; Tue, 04 Oct 2022 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=/B3eO9RuR5NT5rgqfWPbOUzqeootW7WpsdtWM8BPgVk=;
 b=qXFh4io7/xWywBmUKgeyz/xIT8LI+SlrheDVeemCwgimYVDaePs9iVGgMFBAE7fCUb
 4pOTtMbCp8HiE5wuvRUW/Z0ym/aAm8/A8MHXkW+LHXKX78MULwPDcL0VBpIfiQlK/PBZ
 MEwu94+OVcFDBTJnLZMAyOCUImsDa3qcTLmM5DEqA7tQZspApNZDJ7Z4NHzM6Wfu6ZZ9
 3rTbLWj8IrUls+8xuu61U4rsYKFxtBDjwqDxaFRiDCWaKjWYZUe/tayrt2YQna1A447A
 Fi0dAjTooBcBZZ9YxJjGSykWpfuYPmO5vyHVvqlIE0zyGzADG8vO5rTd/l7YXL6EjpgE
 f6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=/B3eO9RuR5NT5rgqfWPbOUzqeootW7WpsdtWM8BPgVk=;
 b=reDvuCizo2BF9zUmmMlwlfEcGYKv8/SBAbfDR0Ryw3C0G8eh4bXnAEPU7zAIlYMr8t
 /U1mGHMoW0lj7z18WHUJrAeejl7WjH60x6dkN8QGXHTrEfOMKa95n1tUmYfSXsakFFud
 egYRT5o2WZLqtQftuupbah91Ob6aPYTU1biCHIfgm4CGrhZObh50gOyHXQ57mC/k4MUe
 Aw1PbgywupARCdp0UIbiPT/2TqwxuNhlpkhOH8vgagA1/va1sv/Cy0kPsD9uokDx+Pob
 r9v6JcoELqv+GmIjNwpMkUYCjdub9CtZppIVu39dzoYc5u/xax2YrwMFMbDA72qaAon5
 l3FQ==
X-Gm-Message-State: ACrzQf0Z51kihw5KEl4Ns9fn1BT0AXi4CE5f8CkJGYKQf7vX6NPsuaSw
 RNTZn6X9x4jOUGPPZ6ZmL5ib20kX6O4ZI9Sci72yI1ph
X-Google-Smtp-Source: AMsMyM5PAy/PZxq3O3o/W2C4lOfOHwG4FNSaXvlHztUeeYhgGOJlFsD2ro7DFn37n8PNr2iRp5rrXI8UOoV+KoaDItM=
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id
 n10-20020a05640205ca00b0043b6e01482cmr22945120edx.189.1664874471931; Tue, 04
 Oct 2022 02:07:51 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 4 Oct 2022 12:07:43 +0300
Message-ID: <CAEnQRZALsr3Cf20K103ax9kvk-opAfWMW5XBE6pgu0KKq2Xaxw@mail.gmail.com>
Subject: ALSA Compress API - system suspend/resume
To: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

Hello all,

It looks like system suspend is not implemented for Compress streams.

Any story behind this? Were there any attempts on implementing this?

thanks,
Daniel.

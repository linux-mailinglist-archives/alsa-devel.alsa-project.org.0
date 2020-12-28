Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A21272E3678
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 12:30:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39A81170B;
	Mon, 28 Dec 2020 12:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39A81170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609155018;
	bh=D55hOi38a20KqhQfNdxpK8UXcd2GddB5OeLZht3Kups=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6amMacTnzXY2qus1RPOGyyp/t3qTlIA6gB/rizyEsTd6X/XZfbYDYqoq3xXO6heQ
	 JV/Vi05CF+blXseBwdWImHIdbBt1tJtLGVkNXGw/q11PaqD4xe4PqQwX6jSF4sBO+H
	 srv/MruSQozSN1C0IWtcOtkkVk14PNzkdOMmjBv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 933C5F80143;
	Mon, 28 Dec 2020 12:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A801F801F5; Mon, 28 Dec 2020 12:28:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBD3F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 12:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBD3F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="gHnD6pXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609154900;
 bh=D55hOi38a20KqhQfNdxpK8UXcd2GddB5OeLZht3Kups=;
 h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
 b=gHnD6pXDgQkGh6iSfCaFkFFoTcTSqib+chtMrD2l3YY1RtgjSgRIvA8q8hdVh+Ysb
 L64tVcq9NW+dUaSm3Bf/wslYf2aOGfVEQZIUar4SGX5vlXtKqYc95xa4idU5p8xG/W
 jt+BsvlEyyT/JLPo0p175lRbjaHYYQNCtrhiDVk0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.139.21]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJFdP-1kaGY30PvP-00KMRh; Mon, 28
 Dec 2020 12:28:20 +0100
To: Defang Bo <bodefang@126.com>, alsa-devel@alsa-project.org
References: <1609074299-3990670-1-git-send-email-bodefang@126.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] ALSA: usb-audio: check urb before kill it
Message-ID: <52c7a12d-3eeb-b8cd-c1a3-05a1c70a7f9f@web.de>
Date: Mon, 28 Dec 2020 12:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609074299-3990670-1-git-send-email-bodefang@126.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r6qFwb36q/omXI+xytZdBi1r267PUgwkLvjvIIOi2SNhTE8o5PW
 NETSZUW+VwqCTzM6wYzG3lGcKh8/FasUkJjGqyMeLzN3a2O6QxFMg9OuQ1kJ1ao5rIJAxkJ
 PmhINxrIUHM07DMrUkEA1RhhDClQhpT7+w2ruJpozsORhNGB/ihnHiudJFjAwPsOf2rklfP
 Ug2J04ErP6x+BS3m40v6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZzOX3j0G97k=:ZzZJd+WPPY87wrHA5ruXGl
 /ernkgoo8EyUIoJqhEcUwQuFcxhdMXzyQvTkuT0JYZ0nliJhLkUAxA6vPqv5NoVTcUrjWVDMb
 dAH7mVOmr0RxBvX82RuBFodBVu8KSNcjpqSPnlQYEV34smw+05qucG8M/6s2YJ4IL/8+G5bVg
 pk0hAjkJGLn42X9wr+aa0LqMof8tA4kPar2iLuV7it5fYak92LQUDRDCfg1IPDCwzYfb4IEIy
 f1e4LA2QLNA+XPcxi2wtUZnSroSZbyTg3dr+92uqViVdglXyM8EFoqVKNc12PfbCGEeeWKptc
 OjlMchx9CbJxPsUC6WL8Kpp7AqokmYlFD394l0W4IqScFTr8hem9K/1icMQsveTdP6L763NCA
 AjO7v1jBPVblnLn6m89POLI8SKlzboADdPioAOMIhZ9mSRoKtG0nfCml3Hf8VyU5KgWqNDNXA
 DtQ6XWNhXX+UVJGNt+7Tp2fdMhAOPzYBMwTp/ShyHRgxkKnMMwJQrEoXNEqdZPZD5J0SCqFS9
 EORsBritZmBJsMzvkAHUia/47l9APNE94RJHCjr2QUlIpvIqz8lRNKbnhLHqaVb14O7FDUFoy
 QeVTamhXQYjAvqUDai1GMNN041kAbaakQLBn9koFy8E1qmBIkyjh9MLegNmML+rDymuvBKR65
 ONLtibaM4x+dm5sND1GlATM2bIyJX3SA5Ze3halxVsw8rkuzL7a7udIUAi/MajKSiNHY4FMJL
 4DyQaWej5u5azUFg+rXw9x/bxFQmyVJlamQrWSEEs5STs1VlZFNy/znRkZJ8yf2XyfcTCvopW
 iGbdOFgbr1CWaubPkxkZbCeVNImGzd5hDBaouu9/egD4cCKlhE1fv0rEu9HM98eA8h2EOlgWw
 Fa7jm+Qn7crtjEqfL5ew==
Cc: kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Tom Yan <tom.ty89@gmail.com>
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

> Similar to commit<124751d5e>, there should be a check for urb before kil=
l it.

I suggest to reconsider this change description.
How does it fit to the information =E2=80=9Cmay be NULL=E2=80=9D from the =
function documentation?
https://elixir.bootlin.com/linux/v5.10.3/source/drivers/usb/core/urb.c#L67=
7

Regards,
Markus

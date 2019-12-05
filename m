Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C14113D44
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 09:45:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 007271668;
	Thu,  5 Dec 2019 09:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 007271668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575535550;
	bh=+asvy3zR9la2+sz5/5YZ9uK4awG6uyAmOHCSrCZitmg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nO0WEABMmqEfRhBLeBbgU+jNThbuFDPKtCNMB7TvR/U+RwhJA01tRfGT9RSJXje2+
	 tQF3AwZSgv5feuxyedwYlWKG2w+29XclyJtDWjfWSmP9pYXecfWZeB9JUPZxjk4VIt
	 E+pLpgTP+Fqd91gkc65irvt2/4q/VSZqBQa3dRYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D6EBF80228;
	Thu,  5 Dec 2019 09:44:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63A15F800B4; Thu,  5 Dec 2019 09:44:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3845DF800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 09:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3845DF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U2VSti3x"
Received: by mail-wm1-x344.google.com with SMTP id t14so2647009wmi.5
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 00:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lU1EvzM/eLD0n0vZaZM7AMkwMVY8sZSz0h3WsdV8t0E=;
 b=U2VSti3xVYS3TZPRfEbXKHUduQrzXSc5f+w1SuhjId7MWQwy7oOm4AD/MgMfRrvBTD
 8BVTycGLuJp8sE6OQ+FG0TCjsXTjRI964j4m5fup+dxVQ1Mlsa/+9p6kWM4HQEUnLUPB
 jDoOpTvvmLrggMmDLQIrbrpt5LlAn6GbQjyJzvu+gdCJX+gp30vQL38CMQoJbw+vSUBh
 vzqWSDfZ60M9svZzy8bab7AWE7X0RDQRXDUrvfoAx35v2NKnCNG3v2WH50/J0oJuj6Vy
 N0t0vFI5R42CNnD2QpW2oIE8fwT3iMnetrtWzEp9GEPetG4/UuqNqfJVlZQZR3k3ONod
 jj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lU1EvzM/eLD0n0vZaZM7AMkwMVY8sZSz0h3WsdV8t0E=;
 b=G1j7xszm8WAg03QBAT/YilbZwdwW2hO7iqhuyRb0Htq6O/stqzu+xI7D8LyqQ4mJXw
 uuYBUq/xi1k9Csx48BaoDxkOunoIdzgq3rnp2S/0GXySDQ3XzuYopxQBv8wXsEdJoru2
 UH4Md5+ZF9KfUjzGZ45UfRk/QXv46WAvxC781O7A67fkMw5ZPWJWPXYi6Dx0ecFfXhN/
 Rv+Rl70EBjO0cxDQM1veoD2itStPQI5bXfh1ql7aDBNhsOxGQPb2OAJqx3/CNDWnQBff
 OAMaDl9nJxNc0okJdaWOGnleKB/W+syGuyuWzLB7hGW1niCPnlsZeS9g5OYFkMFfdrr5
 P7Yw==
X-Gm-Message-State: APjAAAVAwldlh20nhbyTkpifRQZXvDGi0/KTAfIKkg/yOT9b3/PCY3tm
 TmuOZ33W2OeoCBMEUa3MA2flKwd3SDQ1aZX55OM=
X-Google-Smtp-Source: APXvYqzHaKRUEfbiAOswMp49ewBcixg21LL6YP05PzNudQhdouGxpQM6W2U/QiJNtYTg+vZqQcCAgBCV7oa+geJPtRg=
X-Received: by 2002:a1c:4944:: with SMTP id w65mr3776661wma.39.1575535439089; 
 Thu, 05 Dec 2019 00:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20191128223802.18228-1-michael@walle.cc>
In-Reply-To: <20191128223802.18228-1-michael@walle.cc>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Dec 2019 10:43:46 +0200
Message-ID: <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: add IRQF_SHARED
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

On Fri, Nov 29, 2019 at 12:40 AM Michael Walle <michael@walle.cc> wrote:
>
> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> IRQF_SHARED to be able to use these SAIs simultaneously.

Hi Michael,

Thanks for the patch. We have a similar change inside our internal tree
(it is on my long TODO list to upstream :D).

We add the shared flag conditionally on a dts property.

Do you think it is a good idea to always add shared flag? I'm thinking
on SAI IP integrations where the interrupt is edge triggered.

AFAIK edge triggered interrupts do not get along very well
with sharing an interrupt line.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

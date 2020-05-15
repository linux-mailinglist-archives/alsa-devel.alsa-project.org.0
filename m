Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF71D48BF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 10:44:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24751669;
	Fri, 15 May 2020 10:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24751669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589532270;
	bh=+wlsUC7AekfE9cPMQivKTfEw+c/Vi1tbnbrhUvLkjic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eiw0ekmfRq5fmGjL5EgNcP29oaTKWEWCthsyhqSa6ncQZMPeb88rN+YKg8KtWcFLd
	 pkJiPkm51t0cAyI90sRL6ne8hhEc6c9PkxFRxJbDCZc8hZluM9J3b2HVlLO8cBNshh
	 JIL5JgQPRrf59zAUN5mujH4wknoU2rJHoPBtvjLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19098F80253;
	Fri, 15 May 2020 10:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35F09F80247; Fri, 15 May 2020 10:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7866AF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 10:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7866AF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YvfODXaG"
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE6602076A
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589532158;
 bh=+wlsUC7AekfE9cPMQivKTfEw+c/Vi1tbnbrhUvLkjic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YvfODXaG/5LnxsITe7hu9FrWkUcI2KANLVHkcrvI3dwQ877NLgobtrwJ073/j0xZn
 8GyvYBC9HjGYHjjPTsPImO0KYlmi7R2MxvDB5EssFZ6foDBv3zZP/DNU9znV9CYyrI
 FvNPLylAw9gdI6xdCEbBxDojXG4YFfF+G6+1vC6Y=
Received: by mail-lf1-f53.google.com with SMTP id e125so356270lfd.1
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 01:42:37 -0700 (PDT)
X-Gm-Message-State: AOAM5305uxSQBoPfZVaFdFnrxGvQ5pHdOjLMg/8lp8ElfFRV1KjzdOvs
 E+m0cTyXMhfCl+dSoXsBTuONBH6oJzZqGlu5uHA=
X-Google-Smtp-Source: ABdhPJxrOJjUeXqe4EQxacNb+3MBPLLyw3JMQa80YtUpWVmkGjh1BatCzeFvu4HIEtk1kIKuuWsxa7DPBFcoY1SZeO0=
X-Received: by 2002:a05:6512:44d:: with SMTP id
 y13mr1616831lfk.118.1589532156020; 
 Fri, 15 May 2020 01:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200515070742.14151-1-steves.lee@maximintegrated.com>
In-Reply-To: <20200515070742.14151-1-steves.lee@maximintegrated.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 15 May 2020 10:42:24 +0200
X-Gmail-Original-Message-ID: <CAJKOXPf-Q-e_K-puR-N2NRwQCmaKD=EczzON4rBymvV2CyoiTg@mail.gmail.com>
Message-ID: <CAJKOXPf-Q-e_K-puR-N2NRwQCmaKD=EczzON4rBymvV2CyoiTg@mail.gmail.com>
Subject: Re: [V5 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Steve Lee <steves.lee.maxim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 steves.lee@maximintegrated.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 lgirdwood@gmail.com, nuno.sa@analog.com, broonie@kernel.org,
 geert@linux-m68k.org, dmurphy@ti.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, rf@opensource.wolfsonmicro.com
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

On Fri, 15 May 2020 at 09:08, Steve Lee <steves.lee.maxim@gmail.com> wrote:
>
> This is the initial amplifier driver for max98390.
>
> Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>

Hi,

Your "From" address still does not match the Signed-off-by. Set the
author of commit to the signed-off person.

Best regards,
Krzysztof

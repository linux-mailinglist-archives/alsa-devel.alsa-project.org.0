Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88A647A1C1
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Dec 2021 19:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E0A1843;
	Sun, 19 Dec 2021 19:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E0A1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639938112;
	bh=6nENfV7OMWDanG8BRzUaZ1mdpUEBoCB+3dpa5i0xUzM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJkdPs3aSfxkYA/wRIEvdf1s8Mcxdl+Gv2jNKaMKBUMnqNbeGP7o8tDkp0hSWUglw
	 PqJW/h5kwvt+s4OYNH5FZ+npvRQsf9i+nfjO6B1hfAGLmgMhM4kXobBv2TyF23Usb1
	 zqt9rwmmpo3VFFulv3p48Pz/TUDcwN7JM5aJXeqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E69DCF800B0;
	Sun, 19 Dec 2021 19:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB75F80279; Sun, 19 Dec 2021 19:20:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E631F8012A
 for <alsa-devel@alsa-project.org>; Sun, 19 Dec 2021 19:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E631F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dk0MsH5X"
Received: by mail-pg1-x530.google.com with SMTP id a23so7375880pgm.4
 for <alsa-devel@alsa-project.org>; Sun, 19 Dec 2021 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u74cWTopnVH44MujokkrRkfCfXsq6ZRs2mw3KCw/CPU=;
 b=Dk0MsH5XNuAraSVgPHFMysD7ERqAqCiLBWVLN/71If7J9EBQPqS0L9VQxOknuDAHK5
 es30u7K3pka8DrQVJFcceYwaStyahPQz+wM84OgG0k91L+bJeLPz8Kr8+ExyOR3/y3Uc
 /+mq1ZZl0ZcEKbN7NjcQmJcSmcyGTQ5ucaGLsIRk/KBAOC7aPtnkxuu4zmHJQQbjeHoA
 5dvhX9YgyFJECc7u186r8K7EjVrL6VJKhkw+PzFyt6LLCRX3kr8hg6y65wWc20uTVkXQ
 B33vPwnwGJC9NEmVdojl2lR1dXBsZYdk/z2MLSaPxDZtXnOPNLN9XTOPiKIIbYE5gduc
 1WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u74cWTopnVH44MujokkrRkfCfXsq6ZRs2mw3KCw/CPU=;
 b=tU2fDzDu93bw3LqX+Qs1MfpMMjqmxsxWKLOonDOKYdEBG+7HFSTKQOVuorARRYI26H
 sMRiHlAtX6A2ahe0X/dDAArVcUynTFaYxe3b6EK6Qjz1XK/em6t/APvzJt7y2p4mFdd3
 NqvSc4N/aHQbHW67CTJib4NtDXhqk2/vVh+VshZaqdCubIuLE7lyV0PhSIjOV+yNBrCP
 LopAZnk+XnnWpc4GWCBH4J5gz8Es4p4RFn/4M+8gK+XmbzgV6jv/eJzsq3MfoZmaVBVr
 nxbWn2kAJD/GPSIPuJ99F7YMrsStUxjlkcdyp+YQ8E6QJ6ltQRwF0ySgRVdKTSbz4wqi
 QSEQ==
X-Gm-Message-State: AOAM530W3a/tR0uoqvSicaqKCowI1c36oTRfbf5l5dw5ox//SdhEwZ7A
 Q6cA5XMKCCEfxqFUaLK0bPY=
X-Google-Smtp-Source: ABdhPJyvN359C0RRu1+t8X0WexVORAvsU8PlbIbx3hHdgYJi+uvSgoAlbRbHICPH70i4d9Qh/LtuBA==
X-Received: by 2002:a63:114:: with SMTP id 20mr8050324pgb.342.1639938037547;
 Sun, 19 Dec 2021 10:20:37 -0800 (PST)
Received: from [10.1.10.177] (c-71-198-249-153.hsd1.ca.comcast.net.
 [71.198.249.153])
 by smtp.gmail.com with ESMTPSA id n18sm2243641pff.110.2021.12.19.10.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 10:20:37 -0800 (PST)
Message-ID: <f58052cb-bc5c-614c-10f9-8e6bfc7ff24b@gmail.com>
Date: Sun, 19 Dec 2021 10:20:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] ASoC: bcm: Use platform_get_irq() to get the interrupt
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Michal Simek <michal.simek@xilinx.com>
References: <20211219181039.24812-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211219181039.24812-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211219181039.24812-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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



On 12/19/2021 10:10 AM, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> While at it also drop "r_irq" member from struct bcm_i2s_priv as there
> are no users of it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
-- 
Florian

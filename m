Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696E2E9857
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 16:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8CC31672;
	Mon,  4 Jan 2021 16:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8CC31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609773740;
	bh=sl7QPMLwU90CoA161NtzEHw5VEr4bZVTKRNo6BU9a60=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ucv6h+IpAUmgncnSDEp3kfLfNy3ioxAaMWZZW5Adu25jUVJfxRITOPWx6OW2PqfiQ
	 YqDNjBomwpWP4KBujITCVmztOftlhrKVi3FkSjTN+JMejDJB+09rHNJA/5MDHe3wB6
	 gwZAuQLjAO3+Qk6MP3HHXCChybzJH3R9BuiVM4Lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 295DCF8012B;
	Mon,  4 Jan 2021 16:20:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E15F80166; Mon,  4 Jan 2021 16:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2192F8012C
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 16:20:34 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 20DA3A0048;
 Mon,  4 Jan 2021 16:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 20DA3A0048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1609773634; bh=eq0qZuW5s/ZZeSQ94GZR5i6q1BS9RNCk6nlEElDYM5U=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=qP5tMe+aucy2QWiqfIZri2COPv0G5Rh34TM/Djo8bDp5JEIgHGuUbSYA0Lh66UhIf
 crDWoPNzb9kinoShJR2/xvUW3WRfmkGIZPKU+zUifiZ+YB38x9MmYxsCkWtrC74OMn
 ZXR7MB/laZPpqINtkhFUvzFlzAZPeRwLCXPdCjSc=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  4 Jan 2021 16:20:30 +0100 (CET)
Subject: Re: [RFC][PATCH v3 1/4] alsa: jack: implement software jack injection
 via debugfs
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de, kai.vehmanen@linux.intel.com
References: <20201228080003.19127-1-hui.wang@canonical.com>
 <20201228080003.19127-2-hui.wang@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <18eee6df-c77d-0672-2e58-7fa9a442ce40@perex.cz>
Date: Mon, 4 Jan 2021 16:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228080003.19127-2-hui.wang@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 28. 12. 20 v 9:00 Hui Wang napsal(a):

> +static ssize_t sw_inject_enable_write(struct file *file,
> +				      const char __user *from, size_t count, loff_t *ppos)
> +{
> +	struct snd_jack_kctl *jack_kctl = file->private_data;
> +	char *buf;
> +	int ret, err;
> +	unsigned long enable;
> +
> +	buf = kzalloc(count, GFP_KERNEL);

Debugfs fops allocations should use kvzalloc() / kvfree().

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

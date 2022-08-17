Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14259667D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 03:01:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 142DC1663;
	Wed, 17 Aug 2022 03:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 142DC1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660698117;
	bh=kfFOtD+3dn0C6xB+jG+/jXs2FUPps0s0mzAQZ2f2oDY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pP0u1ADnkWlKnHdCZVaVKi/DroGtPcM5xqCVrq+et1ZJUHMGIlmcG0wPCppkTreAu
	 4iXSu3lzFFQEfVwsORwKNTR1yTbpqKpt7UlE45FZqBw3655vpsuCQ6RwoAkdWt8fRy
	 UIz8bPQEM/vAx/emlkrvLtL50P8kLwzz8ZhnkzmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9782FF80424;
	Wed, 17 Aug 2022 03:00:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96A1FF8032D; Wed, 17 Aug 2022 03:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92333F80118
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 03:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92333F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="mwd+V8sl"
Received: from neo-zeon.de (localhost [::1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id c0818424
 for <alsa-devel@alsa-project.org>;
 Tue, 16 Aug 2022 18:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=1; bh=028U5yB0pnmE6Kt
 hqEK9BQ9kECY=; b=mwd+V8sl+D9jTzcxrcONAVzXv4Vc3AYzCzg1Xd/ATTdvZGP
 v8hWVfE6d070qzpuhN8KJUn8OZ5vnYwjqBhF4jUrRdt4CovW9d8LcNJiGK8z6YxN
 iJmELOsne0+lsPG/q1QIkwTV87XRAvvkmr77+PSe7lpBTSgHU9xcqSGoaBhU=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id afa06b45
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Tue, 16 Aug 2022 18:00:43 -0700 (PDT)
Message-ID: <b62e6b1c-a804-531a-c3bc-d9415805e4c6@neo-zeon.de>
Date: Tue, 16 Aug 2022 18:00:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda/realtek: Add CLSA0101 to
 serial-multi-instantiate.
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220816194639.13870-1-cam@neo-zeon.de>
From: Cameron Berkenpas <cam@neo-zeon.de>
In-Reply-To: <20220816194639.13870-1-cam@neo-zeon.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

To add to this, it seems this patch was originally included but was 
somehow lost at some point:
https://www.spinics.net/lists/alsa-devel/msg145711.html

It seems the rest of the patch series made it in intact.

On 8/16/22 12:46, Cameron Berkenpas wrote:
> Added CLSA0101 to serial-multi-instantiate.c.
>
> Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
> ---
>   drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 1e8063b7c169..bc9bf591dd10 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -327,8 +327,9 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>   	{ "BSG2150", (unsigned long)&bsg2150_data },
>   	{ "INT3515", (unsigned long)&int3515_data },
>   	{ "CSC3551", (unsigned long)&cs35l41_hda },
> -	/* Non-conforming _HID for Cirrus Logic already released */
> +	/* Non-conforming _HIDs for Cirrus Logic already released */
>   	{ "CLSA0100", (unsigned long)&cs35l41_hda },
> +	{ "CLSA0101", (unsigned long)&cs35l41_hda },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);


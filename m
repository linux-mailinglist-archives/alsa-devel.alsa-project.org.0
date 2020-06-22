Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5252037FF
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CA316DE;
	Mon, 22 Jun 2020 15:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CA316DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592832564;
	bh=uvSEl9qT9+rff+OO4Iicai8iw5Nl64Pu7/nzvjE5hA0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qY09lTGCtqfZgBXFkHkGdkd9bzNu5nnfmjr9z5yyF20NMx/Ik8BviQjiN3o7FYLSX
	 0iWYB7kIUDCOgkoQc4wgo7UMDAahnei37nVBnU2see3garYF6gcTpAymHcFVpj0AAV
	 JfbJXFKIyNUWatWQQQ65+QVeLZ7I+NrPoKuoNSzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD4DDF80162;
	Mon, 22 Jun 2020 15:27:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74571F8015B; Mon, 22 Jun 2020 15:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26190F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:27:31 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8CD4AA0040;
 Mon, 22 Jun 2020 15:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8CD4AA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592832450; bh=24rJYlFZoSjnsYi8nu5mQYRQ8G2JbGsDMFs86T1jYD8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3SDsfbv8uCQISha/KTayEPr3cWhi8cvnC9fUtGLYJbH+lgzrMOpUMyErJUEtSqpWi
 M0XmXnqxsLgJay3OsY1zQrJr5Y34zET+gn67d2zcOlSLtGtfmweKnzWUx7DlZfWLu+
 aoEPGDrowsQGgnbUfhGcjlrCmaBewZqiQB4wxnEI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 22 Jun 2020 15:27:25 +0200 (CEST)
Subject: Re: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org
References: <1592654687-24574-1-git-send-email-Vijendar.Mukunda@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <46604924-3293-062e-db29-2647ecbc0701@perex.cz>
Date: Mon, 22 Jun 2020 15:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592654687-24574-1-git-send-email-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com, hui.wang@canonical.com,
 Virendra-Pratap.Arya@amd.com
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

Dne 20. 06. 20 v 14:04 Vijendar Mukunda napsal(a):
> Add logic to check DMIC hardware exists or not on
> the platform at runtime.
> 
> Add module param for overriding DMIC hardware check
> at runtime.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/renoir/rn-pci-acp3x.c | 29 +++++++++++++++++++++++++++++
>   sound/soc/amd/renoir/rn_acp3x.h     |  7 +++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index 859ed67..ef6eeba 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -5,6 +5,7 @@
>   //Copyright 2020 Advanced Micro Devices, Inc.
>   
>   #include <linux/pci.h>
> +#include <linux/acpi.h>
>   #include <linux/module.h>
>   #include <linux/io.h>
>   #include <linux/delay.h>
> @@ -18,6 +19,16 @@ static int acp_power_gating;
>   module_param(acp_power_gating, int, 0644);
>   MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
>   
> +/**
> + * dmic_acpi_check = 0 - Skips DMIC device creation and returns probe failure
> + *                 = 1 - Assumes that platform has DMIC support and skips ACPI
> + *                       method check
> + *                 = 2 - Checks ACPI method to know DMIC hardware status runtime
> + */
> +static int dmic_acpi_check = ACP_DMIC_AUTO;

I would prefer to have 0 = auto, 1 = force, 2 = skip to put the 
dmic_acpi_check variable to BSS. Otherwise the patch looks good. Thanks.

					Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64679206556
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 23:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD0017CC;
	Tue, 23 Jun 2020 23:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD0017CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592948788;
	bh=UxOvEua8DWYok/4IreTOx6GPR6TIcUjR2Okg5zit+fQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5KwkWV+oD0tFQX1qXUcWxynQ5xO6enbCsfMBN+7tzwseb1i5ovwVaJqVeG8JCPQi
	 zXHxD/XfTCl1no+G1MMJbzBojAQVrBwTpBPv0rZQcl7WPqvmLhIGiMGgboMrHzmdPH
	 vBK7YSa1UMF3m1KOzLSZGrANy6pYzPr7EycyDx2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FE5F8010E;
	Tue, 23 Jun 2020 23:44:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2988FF80234; Tue, 23 Jun 2020 23:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF47EF8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 23:44:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B717BA003F;
 Tue, 23 Jun 2020 23:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B717BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592948678; bh=CB6AXcX49HkPcgs54b/mMemnHcT/ndZNHv32cTaL0Tk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=se83+4ZdVxzqgl0/RXfeQgw/kOgGUEvqE/dNH0D5f/u+ypU3se1PHXAPG+4TIo1gH
 9iC3m/S+x9wsqRpvEHNA/p8+7IwdmOT3kGHcTw45Q1eIvBcXagdkcU8ql3/BIJiJKe
 tG7ogmgjowVWdF76DzQ6RSrzRIS3IfKQXKLqE7rU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 23 Jun 2020 23:44:32 +0200 (CEST)
Subject: Re: [PATCH] ASoC: amd: add logic to check dmic hardware runtime
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org
References: <1592944040-12974-1-git-send-email-Vijendar.Mukunda@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <234d8532-9d7f-9128-b0a4-23c8f04fac01@perex.cz>
Date: Tue, 23 Jun 2020 23:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592944040-12974-1-git-send-email-Vijendar.Mukunda@amd.com>
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

Dne 23. 06. 20 v 22:27 Vijendar Mukunda napsal(a):
> Add logic to check DMIC hardware exists or not on
> the platform at runtime.
> 
> Add module param for overriding DMIC hardware check
> at runtime.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/renoir/rn-pci-acp3x.c | 29 +++++++++++++++++++++++++++++
>   sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index 859ed67..faa7566 100644
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
> + * dmic_acpi_check = -1 - Checks ACPI method to know DMIC hardware status runtime
> + *                 = 0 - Skips the DMIC device creation and returns probe failure
> + *                 = 1 - Assumes that platform has DMIC support and skips ACPI
> + *                       method check
> + */
> +static int dmic_acpi_check = ACP_DMIC_AUTO;
> +module_param(dmic_acpi_check, int, 0644);

I think that Takashi suggested the bint (boolean/integer type here):

   module_param(dmic_acpi_check, bint, 0644);

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

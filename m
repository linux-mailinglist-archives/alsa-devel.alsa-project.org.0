Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A163E19F113
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 09:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FAE183B;
	Mon,  6 Apr 2020 09:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FAE183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586158950;
	bh=yo80kqAPMTS6jJLCSWjioSA+EyN+3jYnsqXOPAkTfkw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iag8k7WN7VovIuUwIT1hCm7zPjaiUU21zao9NOJJZNldf9g/apmhw2XfsN06bjn4/
	 HR7Tl5W/QpcN0peiWNFWOCba8aXBDa/x2zkzhXZQWR5WyWFD4/CnoyeGMEmc5nLY/O
	 P43PBkExeNAg3UFERmJdlJs5E75xMybfPAOUVMVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5915F80291;
	Mon,  6 Apr 2020 09:40:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48EA3F80290; Mon,  6 Apr 2020 09:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFF6F8028C
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 09:40:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7FB54A0042;
 Mon,  6 Apr 2020 09:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7FB54A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586158840; bh=7gKEiiAo44YLtjELJjcWJQg11dfhtXbk9izacDiAVFU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vgQtx0QRVz4HUNvM2NatSLFPNlH3DU63hwyCcyTOM2c8FqSWEwtBqsyytaVFS65fX
 ugPXiH4w1k0tljsntWDvPopBIzjB41H8gON8WQoF2sa/IofDbUKq2j+U9185ClBFhK
 NmGpFVFfBxpXCOLcLrbnpUS192+GoyeY36elxlAw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 09:40:38 +0200 (CEST)
Subject: Re: [PATCH 2/5] chtrt5645: Add ASUSTeKCOMPUTERINC.-T100HAN-1.0
 symlink to chtrt5645-dmic1.conf
To: Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-2-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <53df59ff-a858-50b6-8069-49307977126a@perex.cz>
Date: Mon, 6 Apr 2020 09:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405183454.34515-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
> We already have a ASUSTeKCOMPUTERINC.-T100HAN-1.0-T100HAN symlink to
> chtrt5645-dmic1.conf, but since kernel commit 39870b0dec68 ("ASoC: DMI long
> name - avoid to add board name if matches with product name"), the kernel
> omits the (second) -T100HAN. So with newer kernels that no longer works.
> 
> Arguably this is a kernel regressions, but chances are we already have
> some configs depending on the new behavior, so lets fix this on the
> UCM2 side by adding a second symlink using the new long name.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 120000 ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf
> 
> diff --git a/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf b/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf
> new file mode 120000
> index 0000000..b4d2816
> --- /dev/null
> +++ b/ucm2/chtrt5645/ASUSTeKCOMPUTERINC.-T100HAN-1.0.conf
> @@ -0,0 +1 @@
> +chtrt5645-dmic1.conf
> \ No newline at end of file
> 

Applied. Thanks.

			Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

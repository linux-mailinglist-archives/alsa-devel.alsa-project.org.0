Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C83F77DA
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 16:38:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2371677;
	Mon, 11 Nov 2019 16:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2371677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573486698;
	bh=H88gmuWuIhtT1BXUNZZjj1UjMWcnsg+6q6IVAJJ7V4I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vB4P/tVYORoM0X++jhYhaJAuOdKnjql2dFkE9pFiG8sKeQm8b2dOMZjjONneu1qa3
	 eK8Yhex9pfXswSXBWcJQUGUF99gXldgmEmuHmqKShHTuTk6s739Lb00LSckVQJCePc
	 l7Lz6DoVkk/U/ve2eClKFBAlaNWvjl28qYRx8KjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90276F80506;
	Mon, 11 Nov 2019 16:36:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F8F1F804FF; Mon, 11 Nov 2019 16:36:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43BEAF8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 16:36:25 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 77545A0042;
 Mon, 11 Nov 2019 16:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 77545A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573486585; bh=5Ijl5hzYmnp81FnKAXimpIEQHR0NgpeDOPgLuIZlIJ0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jaq/DtMTH/QffDoYHvdkl5TkycDIAHtnsZSR9VZamgRimCdepTFsG4E2cRrNkTXzx
 BW76pJIkvR2nJSvUq2ls3+vA5hpS+yVSwku6C2zGX+1B7kTFqXX2utDE/oRrDtMpoR
 ombxb043/MzJyQTfJ2nAL6ATcloE7uhBCbXlLJic=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 16:36:22 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-9-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6eb3d595-d5a9-5749-32b7-77ba3a56aa3c@perex.cz>
Date: Mon, 11 Nov 2019 16:36:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-9-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 09/11] ucm: docs: Add EchoReferenceDev
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> Sometimes userspace may want to use a reference channel to cancel echos
> when using video chat, this value identifies the device which carries
> that channel.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   include/use-case.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/use-case.h b/include/use-case.h
> index 9a10f390..e84f3f8f 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -308,6 +308,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>    *   - CoupledMixers
>    *      - Mixer controls that should be changed together.
>    *        E.g. "Left Master,Right Master".
> + *   - EchoReferenceDev
> + *      - If userspace wants an echo refence channel this value identifies the
> + *        device to be used.
>    *   - EDIDFile
>    *      - Path to EDID file for HDMI devices
>    *   - JackControl, JackDev, JackHWMute
> 

It's PCM device name like PlaybackPCM ? I would rename this to 
EchoReferencePCM then.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

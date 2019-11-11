Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD7F7789
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 16:20:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8C41675;
	Mon, 11 Nov 2019 16:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8C41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573485647;
	bh=Z6Izd3UsoQiWouha+hum3ejEE47ntDgeOjgW2l7taLE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vhuKmjB1/ufH1zW+jztNOAI010FrZdVKEp8yPTAIlTjq16lJHcpxqRmp531WcHDS7
	 x1wcoutdMmOXgh9okSgZF3hk+lTKorttkJDuky+KltJpjbb/4WBcTPcI5IMFEpMr08
	 fgeIEcTzRBoaAe1NpJQ+onAiKhhqR6NfK2kxo0nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8161BF802E0;
	Mon, 11 Nov 2019 16:19:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C15DDF804FF; Mon, 11 Nov 2019 16:19:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E84DF8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 16:18:57 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1BA79A0040;
 Mon, 11 Nov 2019 16:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1BA79A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573485537; bh=568wTfIauQIQeZluGxw4+r1D1IcaswhYNAabzJGpaEQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mDenAo7A31v6QtGc9/HA32NjJwBwhFN6LSL59tK2zqkRJoTuKtLE8JMbMjlLs0dBP
 /XIiRnCmT55w0xeoqL8f0fxlcUDwZe+oLKDhJnA3zOwNQlN6mTijX1F7lGyD9rU3zP
 yEVCLGaUdBZ26d/PVcDoIkE5jXavdt8rtkFkeFkc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 16:18:53 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-4-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <90dd9ae6-4b67-5e85-9712-364df5798c6f@perex.cz>
Date: Mon, 11 Nov 2019 16:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-4-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 04/11] ucm: docs: Add EDID File value
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
> Add a sys path to the EDID file for the corresponding HDMI device so
> userspace can use if needed
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   include/use-case.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/use-case.h b/include/use-case.h
> index a79e5b91..28e92d17 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -301,6 +301,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>    *      - name of capture mixer
>    *   - CaptureMixerID
>    *      - mixer capture ID
> + *   - EDIDFile
> + *      - Path to EDID file for HDMI devices
>    *   - JackControl, JackDev, JackHWMute
>    *      - Jack information for a device. The jack status can be reported via
>    *        a kcontrol and/or via an input device. **JackControl** is the
> 

Applied to alsa-lib's git tree:

https://git.alsa-project.org/?p=alsa-lib.git;a=commit;h=ef085a55c488f64834fca233355b9881489be10c

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

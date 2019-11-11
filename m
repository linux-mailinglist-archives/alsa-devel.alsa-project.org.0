Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D16F778E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 16:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F731167C;
	Mon, 11 Nov 2019 16:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F731167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573485693;
	bh=ljFd5n0gxiIra5uEp1gmLeomMGnV5XMvvK3pFP9z85k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=il2ZbCBEUBix6S/mOBDOdTnGE/UV7dnSjxxq0ZWgHnxy/2wzsckYJmmj0tOCsT8l2
	 lALyuxvHFPb1zeNHcsD6s32HaEnVwB3/dZc4kZJSDLx1xzpVAvrCnl2hsdQU/BDQ7q
	 alKPELwpVYytfwSF6/imFM5BfQuPnoGlpRzrH/Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A7EF805F9;
	Mon, 11 Nov 2019 16:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDFD3F8053A; Mon, 11 Nov 2019 16:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63189F80518
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 16:19:38 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E90D5A0040;
 Mon, 11 Nov 2019 16:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E90D5A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573485577; bh=bh3WPlf0KDA5BPdQfqHE4L2l35ChVbTNTnMJfbm3uvQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=golxzLpdCLS0azhhRQYo88Vs+eDTlnTes6501IoJBqQFA82YEtY5luzMyi1bpGW+X
 maF1fuus1YEdp1sDqtPAkHfeX0wf+Fmm4BzSjUtOUDOugZY8tKGbjIcFzm8g7VzPqz
 A3NH9Aq6NtDnAvPg24GsKstIlWw1VF2wMyASRH78=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 16:19:34 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-5-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6d803112-b6fd-0240-0ca5-70a1d8ef7287@perex.cz>
Date: Mon, 11 Nov 2019 16:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-5-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 05/11] ucm: docs: Add MinBufferLevel value
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
> Allows ucm to override minimum buffer level for platforms that
> incorrectly report their buffer level.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   include/use-case.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/use-case.h b/include/use-case.h
> index 28e92d17..05628303 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -330,6 +330,10 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>    *   - JackType
>    *      - Specifies whether the jack is accessed via hctl or gpio and therefore
>    *        only carries the possible values of "gpio" or "hctl"
> + *   - MinBufferLevel
> + *      - This is used on platform where reported buffer level is not accurate.
> + *        E.g. "512", which holds 512 samples in device buffer. Note: this will
> + *        increase latency.
>    */
>   int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
>                        const char *identifier,
> 

Applied to alsa-lib's git tree:

https://git.alsa-project.org/?p=alsa-lib.git;a=commit;h=88c69ed2c865f6b857c26c04f5fc56d9396437f8

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

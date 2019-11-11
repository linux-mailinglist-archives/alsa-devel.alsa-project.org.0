Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E5F74C7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 14:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982E41674;
	Mon, 11 Nov 2019 14:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982E41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573478884;
	bh=HUvAuMRe1iGRrXG19jgZd9tNKaU6y+gOyLA/Kguxv3E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLubPN3J2BhwhyvBIIZ4qWz1ZTvI3vTHk+gdnluwDIShehkNbUAwj5d9cjJ++hWXJ
	 n4+FYsmjAte1pUVcBuXyHxvnaM4/D/PJX8DgNx8SgH07SpqeurO1e5BRdNVeRxefzI
	 haSBsfMOnb/1zktcXINOVHYFjeYhSImK0zv0jOfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C7AF8045D;
	Mon, 11 Nov 2019 14:26:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58657F804FF; Mon, 11 Nov 2019 14:26:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB37AF80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 14:26:13 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5CFDCA003F;
 Mon, 11 Nov 2019 14:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5CFDCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573478773; bh=1+CSKgjT9/Fp9YyM1X1RVztEOXYnCzw+HeygyQW25n0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xGgFu6/soD7k/T6YbUD6XTzMCRsneIdBlJBFoPa/QqfssjdeZei0h2SeDMrQDycBp
 MROs/ijH+dhiwB/F9FF7H0STmSor5vR/KNdFkiMWI8Mkeuwx/lQD0EsPPRUtiBzhON
 A9ZY868gX1+1rozeBI+tIOe4Hoq4o6ZzamjKt9hI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 14:26:10 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a56fe687-3821-6e4f-7ac5-aa69befd07b6@perex.cz>
Date: Mon, 11 Nov 2019 14:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-1-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 01/11] ucm: docs: Add JackName value
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

Dne 07. 11. 19 v 2:57 Curtis Malainey napsal(a):
> This field represents the input device name for a jack detection line
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   include/use-case.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/use-case.h b/include/use-case.h
> index 5cb4f31c..2051bd40 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -320,6 +320,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>    *        trick upper software layers to e.g. automatically mute speakers when
>    *        headphones are plugged in, but that's application policy
>    *        configuration that doesn't belong to UCM configuration files.
> + *   - JackName
> + *      - Input name is the input device name for the jack
>    */
>   int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
>                        const char *identifier,
> 
What is the difference from JackDev ?

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

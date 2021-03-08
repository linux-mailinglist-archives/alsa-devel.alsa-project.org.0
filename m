Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA94330875
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 07:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E948918DD;
	Mon,  8 Mar 2021 07:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E948918DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615186363;
	bh=Msuqxfje1I4WnqxT6Jc7FxS+CotqsqeGyF7dqs2AphM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKapcfh9tHwvp6KAQvpf3oCXzEIBAStWwrLKj6Djuiea//w7+DIESkYJa04MTttSV
	 eb9YwvmFGxRfd1UjSXc13LKnVMtEzX4FyhO9L99S1/WmW21yZS+RjIKn3/yerCPJSK
	 gnoh4Y7CeKj8JwspJ6CEXVVCP7iVwBZzfrwMuffM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D91F801ED;
	Mon,  8 Mar 2021 07:51:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47423F801D8; Mon,  8 Mar 2021 07:51:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71161F800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 07:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71161F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="TwFIgrnc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=i0gmFpOVEqM0E4dUnLDzKTfLkWMoQgTTzY2+cl6n74s=; b=TwFIgrncW+ysQNb28Noc7ELeyQ
 jIU/0GL4pRe+3oVJqDTRlbgfJkva/8n96qvNL0GcOSl8nk1/vLkrrkJ8QiuXJ1a34avriDS2wo6Ep
 nvbZCmRfaiqfroxwUjCHOkyZtt6TwxlbBLtVRRSP0xC40frr2H3dh/5PQ4ywjWLdZE3bARz6BX+pr
 tkMU5FllgHO5VPse75hjIo0Ab1Ys/lDkO6TMTKO7FOlehTBzzjmZFW78/Yz+VtEP4FzR2HMEAfZTU
 24HAwKW73+kdLBoHs6ZgSNtsRaf1+a4HZhcyU9fR8e/E2lQVqqf55gTy19CwhqW5VjbhhB1Qq7D9T
 QXOGECZQ==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9j7-000UYr-5y; Mon, 08 Mar 2021 06:50:50 +0000
Subject: Re: [PATCH] sound: soc: codecs: Fix a spello in the file wm8955.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, gustavoars@kernel.org,
 ckeepax@opensource.cirrus.com, peter.ujfalusi@ti.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20210306115151.31759-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5a19f291-d5be-b30a-ae79-f1c5ce290164@infradead.org>
Date: Sun, 7 Mar 2021 22:50:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210306115151.31759-1-unixbhaskar@gmail.com>
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

On 3/6/21 3:51 AM, Bhaskar Chowdhury wrote:
> 
> s/sortd/sorted/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  sound/soc/codecs/wm8955.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
> index 513df47bd87d..538bb8b0db39 100644
> --- a/sound/soc/codecs/wm8955.c
> +++ b/sound/soc/codecs/wm8955.c
> @@ -151,7 +151,7 @@ static int wm8955_pll_factors(struct device *dev,
>  	/* The oscilator should run at should be 90-100MHz, and
>  	 * there's a divide by 4 plus an optional divide by 2 in the
>  	 * output path to generate the system clock.  The clock table
> -	 * is sortd so we should always generate a suitable target. */
> +	 * is sorted so we should always generate a suitable target. */
>  	target = Fout * 4;
>  	if (target < 90000000) {
>  		pll->outdiv = 1;
> --
> 2.26.2
> 


-- 
~Randy


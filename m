Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E84C289B
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 10:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71DE8180F;
	Thu, 24 Feb 2022 10:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71DE8180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645696595;
	bh=/n75j2+vxgqqryZGybH7IthNrDj1w6prdozxYse9SUk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTzUX5+xWiW/NFfA5tJCbxEVUUMc2pa+D8NOskyntJ6+ySCz+Qgjc1phCRY8wfZe7
	 v+ssuP0/NpWuaiqFsB9xsBwH8MWV4CmW8AyoVXX5ztMxDpHI6t8rewU1YbaisQHpzr
	 vFP/VlmxDz9wK2BI2f5x3BD6aQzaMYE0FgaEASYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9306F80310;
	Thu, 24 Feb 2022 10:55:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80BF5F8030F; Thu, 24 Feb 2022 10:55:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D760F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 10:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D760F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hkaey1IT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19F4DB8234E;
 Thu, 24 Feb 2022 09:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A4EC340E9;
 Thu, 24 Feb 2022 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645696513;
 bh=/n75j2+vxgqqryZGybH7IthNrDj1w6prdozxYse9SUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hkaey1ITcpR7c7EjwedBuhUzAG0S/M7sD+ClXNymg+LsuPFABd3j70d3o8r7R4qEa
 cKZpCk1/pDoeLT0PW0y9PI5UpsPWKVFGhkCCN40t0JnA8NfxVZMS3Qiu3TsesTuCNP
 vBMPJQ7fJ2pycFiyeJP//s3/skccbBWIxmR+hMWihtkAkztXlE1zDM//yfDIqVXUcS
 11zU2+oy5Ls3yuPcvKBuY8II0ZH5kRoZyj/u2zarp81DhQuyn7bC4fVW7Ouy8/r3fI
 WdtGzbsD8cMGebTfrVNaEmPnIieDVviSu1a7EMPTVs2BiDiJAQC/KUrudUTLl+d0aC
 0vL01pqzSFqbg==
Date: Thu, 24 Feb 2022 15:25:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>
Subject: Re: [PATCH V1 1/1] ASoC: compress: propagate the error code from the
 compress framework
Message-ID: <YhdV/ZsxJ3J+3JK5@matsya>
References: <cover.1645689841.git.quic_rbankapu@quicinc.com>
 <ec8263009612ead127398ba089f84dafb9fcfa88.1645689841.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec8263009612ead127398ba089f84dafb9fcfa88.1645689841.git.quic_rbankapu@quicinc.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Krishna Jha <quic_kkishorj@quicinc.com>
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

On 24-02-22, 13:56, Raghu Bankapur wrote:
> Propagate the error code from the compress framework for the timestamp
> query. This error code will be used by the client to handle the
> error case scenarios gracefully.
> 
> Signed-off-by: Raghu Bankapur <quic_rbankapu@quicinc.com>
> ---
>  sound/core/compress_offload.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index de514ec8c83d..b89adbf666b1 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -166,9 +166,12 @@ static int snd_compr_free(struct inode *inode, struct file *f)
>  static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
>  		struct snd_compr_tstamp *tstamp)
>  {
> +	int ret = 0;

why initialize here, also pls leave an empty line here

>  	if (!stream->ops->pointer)
>  		return -ENOTSUPP;
> -	stream->ops->pointer(stream, tstamp);
> +	ret = stream->ops->pointer(stream, tstamp);
> +	if (ret)
> +		return ret;
>  	pr_debug("dsp consumed till %d total %d bytes\n",
>  		tstamp->byte_offset, tstamp->copied_total);
>  	if (stream->direction == SND_COMPRESS_PLAYBACK)
> -- 
> 2.17.1

-- 
~Vinod

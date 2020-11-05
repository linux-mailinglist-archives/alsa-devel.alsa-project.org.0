Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5E2A80D1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 15:26:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33BB165E;
	Thu,  5 Nov 2020 15:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33BB165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604586382;
	bh=dt7frWRc4yaqfeG+2+PM88uR+njae8nGK5QYGuzbQO4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eFcuC4l2QwoAuRSAzdsz3IbjEmWEq5eepUn0kdts0OF8L3YHxKYEkT/QsyJZwyI08
	 JhDOALfmrCKFs340n1XuoDRxRkN5OPOM9ftSNjJk5HIB8pc3oRfpOaCWrtqIXszuun
	 BR2uPuENuUlIQQhv6Hl4gFp6yqXIf24zy9CNBmtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD9DF80162;
	Thu,  5 Nov 2020 15:24:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B52FF80171; Thu,  5 Nov 2020 15:24:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 817EEF800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 15:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817EEF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="dKCNqQYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1106; q=dns/txt; s=axis-central1;
 t=1604586282; x=1636122282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m6Hj1PcDHNtmRz976ZetkbnRFd2lehGva+qXmHjaFUQ=;
 b=dKCNqQYp+siWTPbccSQSPZQ5tGPrnP420Y8nCDPSkKA3PYT4gMBNi9pV
 fzFcwugmRP5uXvlF5I4uLZx3WWHIyAp7eeJqNHHgE2Kf+xOd5AMxCGlk+
 yVXN9LH0Wx2U2cCKlxK8dDC1LwscKyexUqTtTUYw9RxhlGK9c8GUoCcDs
 TPOn1FtX8tEb+bZnd7VlMR00uDTMq5dspYIQK5Omv2FzJopGkpJueRoh9
 OsoxgOZigFRCay+ZdS/vykc6YpRhQFN/9yu7ZvfhJJz1y5BlY/QPDiqp/
 WJbh6Cd8saPsaUCN8WnrbXZT9scSyhfwSxcQmF8IIaQd0R/N11mRQLyYL g==;
IronPort-SDR: d+9irLwKinwX01RMdlmlgOrcJOPhm10C/UwRftUrJ3dG8bwQqERZ3EcO5k1NrtarUEgLdqcdN3
 wYujyxpfv1j/2IeDqttubbYESs/4Uljp/EweSRveVI56UxH7KXJjvnr6rlCQtNaZVkIBFOYL2i
 gXebTomWAOQVKcnJRSjreMudVb4w4YQKHwcCxtvrCGA0vu3Uiut9GSEJOaJMj0IlTlluAaDfGy
 4QT1SYvi8H+4VKhV82KodMgqACxFArlySn1k68SXxgmaxozhc9XtsfIp5b5I8tnHkkdVKA9BaU
 AX4=
X-IronPort-AV: E=Sophos;i="5.77,453,1596492000"; d="scan'208";a="14771844"
Date: Thu, 5 Nov 2020 15:24:37 +0100
From: Jonas Holmberg <jonashg@axis.com>
To: <tiwai@suse.de>
Subject: Re: [PATCH] pcm: set the snd_pcm_ioplug_status() tstamp field
Message-ID: <20201105142437.GA265496@axis.com>
References: <20201104134956.260519-1-jonashg@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20201104134956.260519-1-jonashg@axis.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On Wed, Nov 04, 2020 at 02:49:56PM +0100, Jonas Holmberg wrote:
> Set the status tstamp field so that it can be accessed with
> snd_pcm_status_get_htstamp().
> 
> Signed-off-by: Jonas Holmberg <jonashg@axis.com>
> ---
>  src/pcm/pcm_ioplug.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
> index a437ca32..9b1b8ac3 100644
> --- a/src/pcm/pcm_ioplug.c
> +++ b/src/pcm/pcm_ioplug.c
> @@ -115,6 +115,7 @@ static int snd_pcm_ioplug_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
>  	snd_pcm_ioplug_hw_ptr_update(pcm);
>  	status->state = io->data->state;
>  	status->trigger_tstamp = io->trigger_tstamp;
> +	gettimestamp(&status->tstamp, pcm->tstamp_type);
>  	status->avail = snd_pcm_mmap_avail(pcm);
>  	status->avail_max = io->avail_max;
>  	return 0;
> -- 
> 2.26.2
> 

Is there a reason that the tstamp field of snd_pcm_ioplug_status() is 
always 0? I assumed that it was an oversight/bug so this patch sets it 
so that applications can read it with snd_pcm_status_get_htstamp(). I 
have tested it and it seems to work well.

BR
Jonas

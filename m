Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA765129
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 06:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB35616B4;
	Thu, 11 Jul 2019 06:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB35616B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562819824;
	bh=39vUR8294de255vyqNELBdni8gmClKD+PTEYv7quSYk=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7DX8xEBW5fvuqMddExtccv35bQNm8NhuPycdNNatJldRDyFbjpHHeSe1jf7zzc+8
	 CqNg7XV95SN6h2LOT4phhuxm9i/BGNfuHEZzeOnCCEWOO6dR9cFd7pWheRgvWQo/SL
	 XbmlrjLSMSOJoBEDYhf2zoL5v/PRHbAtr5ixu0js=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A3AF80307;
	Thu, 11 Jul 2019 06:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 702DEF802FB; Thu, 11 Jul 2019 06:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C9C1F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 06:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C9C1F800D8
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 29DC4CAAA9531A3843DC;
 Thu, 11 Jul 2019 12:35:05 +0800 (CST)
Received: from kjyxapp02.zte.com.cn ([10.30.12.201])
 by mse-fl2.zte.com.cn with SMTP id x6B4YdHi088159;
 Thu, 11 Jul 2019 12:34:39 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
 Thu, 11 Jul 2019 12:34:39 +0800 (CST)
Date: Thu, 11 Jul 2019 12:34:39 +0800 (CST)
X-Zmail-TransId: 2b055d26bc5f6be64b64
X-Mailer: Zmail v1.0
Message-ID: <201907111234393553279@zte.com.cn>
In-Reply-To: <87sgrd43ja.wl-kuninori.morimoto.gx@renesas.com>
References: 87sgrd43ja.wl-kuninori.morimoto.gx@renesas.com
Mime-Version: 1.0
From: <wen.yang99@zte.com.cn>
To: <kuninori.morimoto.gx@renesas.com>
X-MAIL: mse-fl2.zte.com.cn x6B4YdHi088159
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel]
	=?utf-8?q?=5BPATCH=5D_ASoC=3A_audio-graph-card=3A_ad?=
	=?utf-8?q?d_missing_const_at_graph=5Fget=5Fdai=5Fid=28=29?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit c152f8491a8d9 ("ASoC: audio-graph-card: fix an use-after-free in
> graph_get_dai_id()") fixups use-after-free issue,
> but, it need to use "const" for reg. This patch adds it.
> 
> We will have below without this patch
> 
> LINUX/sound/soc/generic/audio-graph-card.c: In function 'graph_get_dai_id':
> LINUX/sound/soc/generic/audio-graph-card.c:87:7: warning: assignment discards\
> 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> reg = of_get_property(node, "reg", NULL);
> 
> Fixes: c152f8491a8d9 ("ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> sound/soc/generic/audio-graph-card.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 343ede8..ebf2ca3 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -63,7 +63,7 @@ static int graph_get_dai_id(struct device_node *ep)
> struct device_node *endpoint;
> struct of_endpoint info;
> int i, id;
> -    u32 *reg;
> +    const u32 *reg;
> int ret;
> 
> /* use driver specified DAI ID if exist */
> --
> 2.7.4

Thanks.
Acked-by: Wen Yang <wen.yang99@zte.com.cn>

---
Best regards
Wen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

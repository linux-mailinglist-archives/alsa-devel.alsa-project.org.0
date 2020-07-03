Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB42130BE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 02:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469F216D0;
	Fri,  3 Jul 2020 02:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469F216D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593737930;
	bh=FGKCLWB3xFwlJuBmModDHRw9M5VOJULZV6L4iuvVoHY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNQz7C4+GCbD6Fs0jNVNvRykHMZ552dY88fGSdxaMHyXqXmrkYVgghJ9u5mcPEo2R
	 folDPzVlzoAyHEvtJGSP1zGqkV+I8QD+7fULiLbiQB5DxUb0yO0RjmAzxu1dGiu4Eb
	 3zewDA4u8T9N4BCWE2FXUYMhG/YRsSVYEW4LYSeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 629CDF80134;
	Fri,  3 Jul 2020 02:57:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93534F8022D; Fri,  3 Jul 2020 02:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C3FF80134
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 02:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C3FF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="c28gi1d5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="arSG++a2"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id E1297B97;
 Thu,  2 Jul 2020 20:56:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 02 Jul 2020 20:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=N0L71KptBQjZz5cAIsugJrh0Lwh
 GDIUbtv3hIQ1GbcY=; b=c28gi1d5oEOsbWgz8Gz61WqRdPMIkiQVmxZ1tuACSmp
 tYVP7FkrScnBebrHLLsY4Oq/0lpYZ15AVMLAewvMvl0idJUJ+6DURah87kpREXIi
 YvUOKakBkv7PX1furMtoBACCneXySKVROoZCCGOiuO1KBW64wwNPEMavHVd2D7r9
 7Djn++gq/17ZN0vDmDDMT0k30tNnuut54UL33ZUzf3QFe+sOsiZW+5CVhhVRxSWL
 SQ9+4m9lu15ToMF+ebMXPTXCEPFHUvbZbG87FRHpdKM5LidaS8+gzE3B3uA5TmG8
 EJjP8OOps+pgR7l3Cqt5UWDIN4lGsFgcEdpTu1xFowA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N0L71K
 ptBQjZz5cAIsugJrh0LwhGDIUbtv3hIQ1GbcY=; b=arSG++a2fht/YhZokTNgEd
 fI98qvSL2lVSUaOdcYHpdhZoz/oDBo/uSw2GmRcFoDyxqKhIJlqe5ycYJqfa6Kbo
 LbRWOdLwc60A8VKr1jcd32F2UE9AmZWHLfyWEEPVx3VLlifxmLXoINsYvmrT/L5z
 n3uRhHha9gwW1zLdypAO7Hb1ZgDEDOrZ3nf56EpjAdUwfoRmGiDvSxWPOUNyxyL5
 iD/ENfxRzY5jAPdzd7tyIUpp9YotrYw2K3AYxbJoGlHyBkoBt75WQJcxGcBTRXRY
 hHx8lvOKotQshky93L70iu7b6TLR7Y+/pApxcvYkk6nD4RpjRw1f7u6OGy8daUJg
 ==
X-ME-Sender: <xms:V4L-XmY1jUpV1xR7vf7KUmpYUNxZYErc12-zvreCA-qIghRCVPLcSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:V4L-XpZ8F5L31kaffL4D7DBUfghiFldHmNG_v17Zy4JZX_uR3Qt0Nw>
 <xmx:V4L-Xg8olzOF0qeTYxBMMvUm9NGXxb7EkfGLJgGTZO3Qw4_yKt9Zhg>
 <xmx:V4L-Xor0EPoemPGlkQ1w7LIpC5dDLPUV6QWsi61KR9GZzozOk-h4nw>
 <xmx:WIL-XjFs2gbvEKj1bedqrc4YXogwhd4e2Y-voxnh9pig1C3P9txUaw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00D53306006C;
 Thu,  2 Jul 2020 20:56:54 -0400 (EDT)
Date: Fri, 3 Jul 2020 09:56:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 12/23] ALSA: firewire: fix kernel-doc
Message-ID: <20200703005652.GC349540@workstation>
Mail-Followup-To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 alsa-devel@alsa-project.org, tiwai@suse.de
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
 <20200702193604.169059-13-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702193604.169059-13-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On Thu, Jul 02, 2020 at 02:35:53PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warning. Remove excess function parameter from description
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/firewire/cmp.c | 1 -
>  1 file changed, 1 deletion(-)
 
Thanks for your catching this bug.

Fixes: 7bc93821a70a ("ALSA: firewire-lib: split allocation of isochronous resources from establishment of connection")
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/cmp.c b/sound/firewire/cmp.c
> index 14abbe7175b6..b596bec19774 100644
> --- a/sound/firewire/cmp.c
> +++ b/sound/firewire/cmp.c
> @@ -293,7 +293,6 @@ static int pcr_set_check(struct cmp_connection *c, __be32 pcr)
>  /**
>   * cmp_connection_establish - establish a connection to the target
>   * @c: the connection manager
> - * @max_payload_bytes: the amount of data (including CIP headers) per packet
>   *
>   * This function establishes a point-to-point connection from the local
>   * computer to the target by allocating isochronous resources (channel and
> -- 
> 2.25.1
 

Regards

Takashi Sakamoto

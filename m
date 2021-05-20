Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8338AF9E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 15:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B31A1694;
	Thu, 20 May 2021 15:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B31A1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621515965;
	bh=coyW5VJ4ZWRLZp6Mhu+n/+JWjikE6mveaeHyJsMEG+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VoyKlWSuW5q9bh1hJrbiVRjXtqtQ7btAHSpvP6ZW1UCimaStOTONovPnZIz3EH7SQ
	 pMtpKnsi0wqhYOnVVozjfKwl1fQnxjFc1aDo1hQaJ/4sebkeHs2USyG6iFhlQ82jB/
	 YrjF5UM275zF+G0ndebXrY7FsqR2N81jLB+7uCJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDC6F8020B;
	Thu, 20 May 2021 15:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3E1AF80217; Thu, 20 May 2021 15:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBE47F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 15:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE47F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OA+mtaUy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lwe9suLQ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id DD6631725;
 Thu, 20 May 2021 09:04:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 20 May 2021 09:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=PB8aFO0bwnqJ+dOxGGLQidZNKsJ
 Ew8NFmWMUOhVb3Gw=; b=OA+mtaUyy+VSofW6UXYNgJ5/3R4srrqaaqkKXww4Alc
 NKTVGGuPpuYpZqm6UuN5FY8VTazomSef4/sMYD0S2fm/2tN/tfGsx0Vs3LrRvELa
 9hXlzbpRPf0XlXQ6/8uHICfTzKEsdVITZJIdpNzr5GSwVKobspUzB3Aj/RmT2Mbm
 q2sHztRaHLCc0zT0o/Q2sFFWWVfrKkvRcDAzlK/F8kIvH4LFePld1lDGFSdPZSJl
 9aIyXzNovmB3wEjmqNEvP97lvbzF79fDh3lIar9ViE0k83MFxz28KhY4ijnHexyL
 cTf4XPJxlfBW6F4v8DIIWbArpHs1JHgc4JU8mhBjDnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PB8aFO
 0bwnqJ+dOxGGLQidZNKsJEw8NFmWMUOhVb3Gw=; b=lwe9suLQ3B4Osp9BqL76mh
 87GaL31cD2UGzZwhCOL3F9SqgSmMgs46u952/zry+PNR2XSWz6wVxO7lTkIndhOK
 NPl8zWyu0SEpKW24l804/ENaKVvchUQPkCOZYlu/E0Cbua/1+/Av+Pp0GDVUE8zr
 jrMkM8kcAW57uFgCHwPzf9N0hKat9uszngOEVlCHYiL6oH3kt+ILRGvxYOljN7n1
 rBm0xf+msiZTfngT9PKVxKRDTSeI2nqb9U9jpns2Hc2bdAFdaUP/7AMbH8mx04fg
 rQJ4jUd7VeWXMSxyEBuYyzjQmrPpMVXcgnlI3sb2h+JtAHmnw/DypngXtTwIEycw
 ==
X-ME-Sender: <xms:Tl6mYPhfJFavWrDCnzg7x82gmC5te8x9hqOJE3t5eca2f225llJa5A>
 <xme:Tl6mYMDISyzs4y3E5j03ECTQMfZWj5KDGTU34thAjHb9ht0FYJQs3CC6YaQjYaTy6
 sLJAdE_dcow2VV_jiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Tl6mYPFRAXuQ36b-S0BeEy738PjkkgVYK3B8s5CD-M75UJsYcFQ9WA>
 <xmx:Tl6mYMTVPVxQVUXot91qZmpBO3NM1iaaft7fDdjiaEKm_uItZNh1aw>
 <xmx:Tl6mYMzgVRncpkMZm1dIgltnU0HN-DofwMXrk0kKNYYA12GsytY4ng>
 <xmx:UF6mYLqb_IHyEpP-gtHzTeuOjQv3YLbjch_vjUOcEtfolyiO-TgCnA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 09:04:12 -0400 (EDT)
Date: Thu, 20 May 2021 22:04:09 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH][next] ALSA: firewire-lib: Fix uninitialized variable err
 issue
Message-ID: <20210520130409.GA170303@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Colin King <colin.king@canonical.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210520083424.6685-1-colin.king@canonical.com>
 <s5hh7ixh9qn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hh7ixh9qn.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Colin King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
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

Hi,

On Thu, May 20, 2021 at 02:26:24PM +0200, Takashi Iwai wrote:
> On Thu, 20 May 2021 10:34:24 +0200,
> Colin King wrote:
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently in the case where the payload_length is less than the
> > cip_header_size the error return variable err is not being set
> > and function parse_ir_ctx_header can return an uninitialized
> > error return value. Fix this by setting err to zero.
> > 
> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Fixes: c09010eeb373 ("ALSA: firewire-lib: handle the case that empty isochronous packet payload for CIP")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Just a bikeshed, IMO, it'd be more proper to initialize err at the
> beginning than setting 0 at every branch, e.g.
> 
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -652,7 +652,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
>  	unsigned int payload_length;
>  	const __be32 *cip_header;
>  	unsigned int cip_header_size;
> -	int err;
> +	int err = 0;
>  
>  	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
>  
> @@ -683,7 +683,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
>  		}
>  	} else {
>  		cip_header = NULL;
> -		err = 0;
>  		*data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
>  		*syt = 0;

Thanks for the patches.

The error check is just done for the case to process CIP header, thus we
can put the auto variable into the branch.

======== 8< --------
From 3fcca0062297e937c665f1c8e3a117e1187f4115 Mon Sep 17 00:00:00 2001
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Thu, 20 May 2021 21:59:50 +0900
Subject: [PATCH] ALSA: firewire-lib: Fix uninitialized variable err issue

The check of error is just done for the case that CIP header is available.

This commit moves auto variable into the branch to process CIP header.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: c09010eeb373 ("ALSA: firewire-lib: handle the case that empty isochronous packet payload for CIP")
Suggested-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 37c8de8a..11ae4e88 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -748,7 +748,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	unsigned int payload_length;
 	const __be32 *cip_header;
 	unsigned int cip_header_size;
-	int err;
 
 	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
 
@@ -766,6 +765,8 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 
 	if (cip_header_size > 0) {
 		if (payload_length >= cip_header_size) {
+			int err;
+
 			cip_header = ctx_header + IR_CTX_HEADER_DEFAULT_QUADLETS;
 			err = check_cip_header(s, cip_header, payload_length - cip_header_size,
 					       data_blocks, data_block_counter, syt);
@@ -779,7 +780,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 		}
 	} else {
 		cip_header = NULL;
-		err = 0;
 		*data_blocks = payload_length / sizeof(__be32) / s->data_block_quadlets;
 		*syt = 0;
 
@@ -790,7 +790,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, *data_blocks,
 			   *data_block_counter, packet_index, index);
 
-	return err;
+	return 0;
 }
 
 // In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
-- 
2.27.0
======== 8< --------


Thanks

Takashi Sakamoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BB471899
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 06:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A161AB7;
	Sun, 12 Dec 2021 06:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A161AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639287957;
	bh=Lft76lMLRbbMrOdadgLIQMuiZChKkDYz4lzOAs6Yilo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lb6y8LwEkSxndXHE9nLujHS8kWLh2M8FU9P0XXIbDjzbXB/gBIn4aPBW7WdqGUKWM
	 +HAJQqLmHqxpRjq/+bMMXVIRS+gWdxO8WpgB8Gd9/yMH1+T2VT79NOZYzC0r8T96Y0
	 W3EW2038ejjk1wFg9UIDNFtLSdewiC1ga4PG7+P8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED68F80249;
	Sun, 12 Dec 2021 06:44:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2304EF80246; Sun, 12 Dec 2021 06:44:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from relay.hostedemail.com (relay031.a.hostedemail.com
 [64.99.140.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5501CF80161
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 06:44:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5501CF80161
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay11.hostedemail.com (Postfix) with ESMTP id 82E1A8016A;
 Sun, 12 Dec 2021 05:44:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf14.hostedemail.com (Postfix) with ESMTPA id B09A130; 
 Sun, 12 Dec 2021 05:44:32 +0000 (UTC)
Message-ID: <64e31a014f01755c618c9d126f006b01fbc66408.camel@perches.com>
Subject: Re: [PATCH] ALSA: jack: Check the return value of kstrdup()
From: Joe Perches <joe@perches.com>
To: xkernel <xkernel.wang@foxmail.com>, perex@perex.cz, tiwai@suse.com
Date: Sat, 11 Dec 2021 21:44:33 -0800
In-Reply-To: <tencent_3D368E118A8AF018A5B1FF16904166B2DC07@qq.com>
References: <tencent_3D368E118A8AF018A5B1FF16904166B2DC07@qq.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: B09A130
X-Stat-Signature: 7g8i1y1yo5fzdd8wmjqo7u4wc876jzdx
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/G2LPGuVsCJ0v43GNEqYpanGSjUVLemfs=
X-HE-Tag: 1639287872-849325
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sun, 2021-12-12 at 01:13 +0800, xkernel wrote:
> kstrdup() can return NULL, it is better to check the return value of it.
[]
> diff --git a/sound/core/jack.c b/sound/core/jack.c
[]
> @@ -509,6 +509,8 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
>  		return -ENOMEM;
>  
>  	jack->id = kstrdup(id, GFP_KERNEL);
> +	if (jack->id == NULL)
> +		return -ENOMEM;

jack should be freed too.

	if (!jack->id) {
		kfree(jack);
		return -ENOMEM;
	}

>  
>  	/* don't creat input device for phantom jack */
>  	if (!phantom_jack) {



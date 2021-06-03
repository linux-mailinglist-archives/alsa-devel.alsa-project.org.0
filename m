Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE639A3E8
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 17:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B6C1704;
	Thu,  3 Jun 2021 17:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B6C1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622732622;
	bh=5U/K62EikA6IPhCfQH3e5ZNKDxwPB7nwoNHufp+UtNs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvHGczIrlZ7u3zT2UYtYsnMRvug9EH1MD1Hms5i/0n2eBsEYCW57Jh4o8CxUv+aOV
	 FEFHsnfqlSgIumj4Dr0/LwM4eQOnJ2xSepmRIgJn8J2JlaiKBm7sQn+96LMWaiJ2+H
	 D7+47nP62osvrdbOLHR7T8S8RdCtu57ZgkXSKIBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A904EF8025B;
	Thu,  3 Jun 2021 17:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBEAEF80254; Thu,  3 Jun 2021 17:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08E15F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 17:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E15F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="2kXWyUHz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fE8UHn3Y"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 35AAF5C0099;
 Thu,  3 Jun 2021 11:02:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 03 Jun 2021 11:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0HIisfxA5dTWqdfe+GombLbxAER
 gPt2GjHpbX0Q+X/w=; b=2kXWyUHzy1Y4vfP8nNmuwdemo26kvXp+cfAes7hkS3q
 /a9OoSfNolk177p56a/9aM0y39F+3SXeeoaCf5+hg8/SP0dfoQbn9VYnqCBhxBQ4
 fXSpqy1roKXAQzQ5ljBZUWSDgz5w/vfGtRPrlhI2MHtbbAJe7XranTkW8FxHYl8n
 1xTvoLOoZAu7yxRBLwg4w+081KhlCfq4yX3MkhlNWV1MAag2K0zRWQ4K+yMntM/r
 3Rai26yCSzdTGd8+Cq1PsGXhPPhJ0zT7e+bTGA9TXewi2d+9MsrZNRZtwPJCa2oM
 vK+XnMxubxK5vm2nNg+HleVCLIDnCUz2qKGgZMa04EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0HIisf
 xA5dTWqdfe+GombLbxAERgPt2GjHpbX0Q+X/w=; b=fE8UHn3YowsxE0qYhMurup
 bYNnah78+g5Hv/QYS5YLTyOzIPgecJf33LdyKvGStuAtNviw8+px9Y/O16Wv7n9L
 ney9BwfkKSu1FaqE1ctGrqKRMOCiiDeinn9ZDu1E0OqeKk+rtgAmm5cYzlOxv+/4
 ZXuoaACwWJOOC12qfp0i8kRm9Mu7wm5jnVxo7FKGvv21Xgq+L8YvWTC5rdwTFYX7
 8lCnIleENgFK/YtC26jj/2dNaDLxBrq10/WdoYB4ckvw9bYYgXjddNrZ+8RsVw+r
 OzvjKVDG5obs6CzB2zXZOuQJNi+gISvmWUlLAP4tKPLOwLvdHG9D20nxosLhHEug
 ==
X-ME-Sender: <xms:6e64YKcxeJf6VXeaTwcYOj8ZcDiQj-F0LDlK22hPRiJy-kRrVke4Gg>
 <xme:6e64YENKs1q7uyXufnAAIK7QJU_iIFGl6nDmilmOnbbj37u_CwFEEXfdNQftVhHdo
 Pik7RWPiW7vaWrhzwk>
X-ME-Received: <xmr:6e64YLgoMzoEeCDENZOcLNfl6EQjrsqzHRLshRdiWo8MulKF30Y7xJL8y7sSPMZirHpIJaXLPBhtmzD7IK67WeyXEDsPsMa9Yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:6e64YH8S4RxT17EPJEIr6uGI-WFxy1J2KM1STZJQIVneNSrEOXxHGQ>
 <xmx:6e64YGu-yu2_9qnhY9uG5i-a1dirxOHlX7L-theya1zCeCnMS2gZ7A>
 <xmx:6e64YOHR8TuddI6rNELZmKiNHiZgbr6GyKJ4czD_dq0ogEy6HW_Zew>
 <xmx:6u64YP4NqUrv3aHW_nM1ODlzTY1N4f7-ZnfRZITWhTxlG5BF2D-Kgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jun 2021 11:02:00 -0400 (EDT)
Date: Fri, 4 Jun 2021 00:01:57 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ALSA: firewire-motu: fix error return code in
 snd_motu_stream_reserve_duplex()
Message-ID: <20210603150157.GA3437@workstation>
Mail-Followup-To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 tiwai@suse.com
References: <20210603143203.582017-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603143203.582017-1-yangyingliang@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com
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

On Thu, Jun 03, 2021 at 10:32:03PM +0800, Yang Yingliang wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: e50dfac81f73 ("ALSA: firewire-motu: cache event ticks in source packet header per data block")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  sound/firewire/motu/motu-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
> index 43ff5be32b15..9e6ca39ebd7f 100644
> --- a/sound/firewire/motu/motu-stream.c
> +++ b/sound/firewire/motu/motu-stream.c
> @@ -191,7 +191,7 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
>  		if (!motu->cache.event_offsets) {
>  			fw_iso_resources_free(&motu->tx_resources);
>  			fw_iso_resources_free(&motu->rx_resources);
> -			return err;
> +			return -ENOMEM;
>  		}
>  	}
>  
> -- 
> 2.25.1

Indeed. Nice to catch it.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto

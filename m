Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD34319FE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 14:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F091ABB;
	Mon, 18 Oct 2021 14:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F091ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634561313;
	bh=z2dn+DJIORRt1AvzeyHdGrjXX0hVTdlUGQfIQeXdkcw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxe8fqKq7Y80Her43irNLkyUL6zvbAxbhcWje46/gjkg+/HXMekIkMlimgBZrUMe+
	 063eP2KAjzLBjFCThodpUWEJDv+3xY6uM/S3CDXHFUb+DTZY41udDJKY+nJZFeCvM0
	 rv1/zV3vAyRcLrnV2Bohat+8R9KbrQFVBRVH3qII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DEBF80217;
	Mon, 18 Oct 2021 14:47:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 164EBF80253; Mon, 18 Oct 2021 14:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5207BF80217
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 14:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5207BF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Es4SrDEV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="H4ii4lqe"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2E59F320091B;
 Mon, 18 Oct 2021 08:46:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 18 Oct 2021 08:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Ti+baPBivGaw69gGNupiitVXA9B
 C4o98jTI8B0gYoGQ=; b=Es4SrDEVWQ43SFJIZmh+wXN87GhGEkFFzMHDJ1hmTHg
 LcYQfs3BkxYdAXfpiDzS6TgiBGZvjzlj+8//mjbnFIWmXNRTSiXVTR+jDXcL7+e8
 2FJtbKU/gLA6lOR3jwU0ZbzTKndViX/WE7E8fjiByZS7C2+COh8azAo42Syj3n/8
 iqMuiammB8xRu2qvkiMczQxWKB63JuDJCJtxmoLnlBv2ImPq2VG0fAQNmHvKshCM
 ZilRuaO0U+pF+tZlDe6afuzAIZq3l0tvgNYpYQGPMjDBgpMHacURolpHSLw2XrSZ
 N/sDACwolPKMtVYC6p3pzvAwI3wpW5XTuyERffNF8+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ti+baP
 BivGaw69gGNupiitVXA9BC4o98jTI8B0gYoGQ=; b=H4ii4lqefQbzI60DPIIPin
 G+IaFMImt2TBdzfDIK1Y/nWO+9M/sGZPAkkGZddBC4QoxlJ87r1ox/j4JJrSiH2X
 fcskapKt27AMLaNQYdAuyuUli2fZD5K8zBMshbjJdQs05gIA0Y1z6McLbkUXQo2V
 say4BWdhxv90mDYHLF9sawc/h4dBsnfr/lVYNExbia2S1aTyAYplmgRgDrRNb5/8
 RcFvNhPMFXeN14smQ4A15wmnByr4vyeKIGSxzLXLzXOfIQDfwzJfhbnSApWAUmDR
 MMIWMJ0XLb2myFXF68XcOgaYpZXZfkeqv7W9HtGRIZwucJBBZl6k5xDr7gpgzlyw
 ==
X-ME-Sender: <xms:wWxtYRGf0ySW773AE_vSYkQgSF6Fqttx4AmdqQJLkGrRXdQzcT1QNA>
 <xme:wWxtYWUcpnjlsSvEv0OcaJxNudIggasCqnMICRVOLg7bmC1Tn4bYorR_o6PPPZQpH
 8XhW51xQN-gwXqLKok>
X-ME-Received: <xmr:wWxtYTItuVZKPcnB4kRS3cyHDB7YM2cCWmMfjT3QcOUkk28o0ZJfPPHZO0KZy8kJMe04l7UAoCYzmeWrkENO7KlaixsuqmaNoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:wWxtYXGWbpZi8ePMkRhUD_5881JEWQydaw1MwAPiHsdiUZK4968AXA>
 <xmx:wWxtYXVYr1KOCeFYbb2CydJjnQlMaMGhejRYDgraQAeIqcndR4r25g>
 <xmx:wWxtYSNk5EB37TzgcGLuflX9E8czIbBOg6PgzUSG4dPT3pu-gfPE5g>
 <xmx:wWxtYUgfP8EiQKnWNZfWu7mk5cbELpWjHc9O7KdS2_dU3zcyrOHDdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 08:46:56 -0400 (EDT)
Date: Mon, 18 Oct 2021 21:46:54 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] ALSA: firewire-motu: add ioctl commands to
 retrieve information in messages delivered by isoc packet
Message-ID: <YW1svlqJvG1oQGK2@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
 <s5hv91ythay.wl-tiwai@suse.de> <YWt6179lGu6xM3Gw@workstation>
 <s5hczo4t9q1.wl-tiwai@suse.de> <YWvsEY2aGYtDloou@workstation>
 <s5hee8i69mb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hee8i69mb.wl-tiwai@suse.de>
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

On Mon, Oct 18, 2021 at 10:05:32AM +0200, Takashi Iwai wrote:
> On Sun, 17 Oct 2021 11:25:37 +0200,
> Takashi Sakamoto wrote:
> > 
> > Would I ask you opinion about my concern about firewire UAPI header? Is
> > it allowed to use float type instead of __u32 type?
> 
> I guess the safest way would be like include/uapi/linux/acct.h.
> The ifdef KERNEL will be omitted at installation, so user-space would
> see only float type while the kernel sees only __u32.

Yes. I've already found the header and it would be the safest, However,
conditional macro sometimes confuses userspace developers...

I decide to keep current usage of __u32 as is. Thanks for your opinion!


Regards

Takashi Sakamoto

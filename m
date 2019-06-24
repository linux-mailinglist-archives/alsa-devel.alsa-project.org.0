Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028850552
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 11:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC3015E5;
	Mon, 24 Jun 2019 11:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC3015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561367761;
	bh=30LZXBmAf5JwuDyhe/5AWGhBYCGBdz8xGmavuAmupNE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qgx+n5rQ/lmTkkbggzBmMxji+MErkHuyvJ4TPNK9O5rUcl96NDj39IfI/n3+hA5FV
	 VYtZ5e0UtvFMGeEAu2taP5mNj3dQ8WEvAotpGAzcgQl4g6S5/m7qxxb8QNhlYNCH98
	 3goM0sNPLZIvjeeVu6/cuwyIFNijtRQHV8eIhaM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC3CF896B6;
	Mon, 24 Jun 2019 11:14:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD52F896B7; Mon, 24 Jun 2019 11:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02E46F8065B
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 11:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02E46F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SsIZPf+F"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="j2Zp8LPg"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 55A1E22223;
 Mon, 24 Jun 2019 05:14:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 24 Jun 2019 05:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6fRI4nZFR7BrqnupomnCiEbO5Ky
 K22WI0fSi8Gd+xvw=; b=SsIZPf+FEYgmP76P6FTWwdFtgEEryrIJniPih/0s4Tx
 bPheNs2ZPdB7ZdHEgVtJysA0VY/JtN1PYw7Ix+XTgfvD0mpK6qBeuGIKcBgSs+QU
 Amg1QDJYDvS5h7Xno9Nm+pkbhMS1GkmWYjQbfBs+xaJsZ7oRP8WGfiMZD+CCVbZg
 oIjfhT5+bGepOnQHkvKDDW7sYq/mzM1qwI6IPjhYJrkWpvdMI0FOlsjg5/JvtRTa
 0/tgS+bWLc+lH6/L2Zf4b4OpxMiURpZK3Sr47+9M+P/1pSJd2Gxlj9/yqmyEWpL5
 lXU2TXDg5O229QfE55lyMKLaNCBM+GLyGyGQ5s4fQ1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6fRI4n
 ZFR7BrqnupomnCiEbO5KyK22WI0fSi8Gd+xvw=; b=j2Zp8LPgXGtKrH5fiNL2aW
 +SP0RrhdGFTdt9RQufeha7P9pU0JmQ7bvQYT+1iX9UOAFcr0S+9/lzeRx2939IC6
 iZGRDd33c1GITCTYo/bUTalp3dxFomR4csd2huEasbMnx9u1n1hYmWDQCtGPJ4Yw
 D759phGkVbdnB5x9/eOtQZ1+xoeWtNqlF4Y4b1nvcATOZ+JbdH1nQxWDZSNIqdHx
 Mfy+YCuyh0Tme8qAKluHv6viHGnClZPz1f2jfxAjPzou/QkJmKAviM8pGAU6I17z
 o2ZK5GGoXoicGt5WXf4O//6v7ivUC4tsbsvICUR6fDln9BoTRZ/rJyUpTJUZ/V4g
 ==
X-ME-Sender: <xms:XpQQXbqydUj8eLgTuIvuyYt6YwFpms2D3MUmlbc0G4iQoNj3OijeTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhep
 ohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:XpQQXeGP6_CnX_DZ4H1JncDtF43UhRBjUQN3IiYLtZg-8a83GdqRhw>
 <xmx:XpQQXYrY6dybGixpEugZhXhbJkA1ls5sfSh92QC6nqsoU3v3GxXQ9g>
 <xmx:XpQQXfb9ytlni6yspuXQhJ42VqGbWshhCceic9ol2PNPnAlaZYR3vQ>
 <xmx:X5QQXUCs20GXJ192fmn_FiZ3hLC20xRfW8XlQY3mloJWpfUo_9DkVw>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27721380084;
 Mon, 24 Jun 2019 05:14:04 -0400 (EDT)
Date: Mon, 24 Jun 2019 18:14:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190624091401.GA7004@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190623013159.17280-1-o-takashi@sakamocchi.jp>
 <s5hv9wvz7a8.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hv9wvz7a8.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH] ALSA: firewire-motu: unify common
 tracepoints for both direction
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

On Mon, Jun 24, 2019 at 11:01:19AM +0200, Takashi Iwai wrote:
> On Sun, 23 Jun 2019 03:31:59 +0200,
> Takashi Sakamoto wrote:
> > 
> > In ALSA firewire-motu driver, some tracepoints are supported to probe
> > vendor-specific data fields for SPH and status/control messages in
> > payload of isochronous packet. At present, the events of tracepoints
> > are unique each of direction, however the pair of events has the
> > same structure and print format. It's possible to unify the pair.
> > 
> > This commit unifies the pair. From userspace, direction is specified
> > by filtering for src/dst fields in the structure.
> 
> Don't forget your sign-off.

Oops... I'll resubmit with my sign-off later.


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3442B1A9A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 13:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A891786;
	Fri, 13 Nov 2020 13:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A891786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605269072;
	bh=9tVL/EybeB1bYCTindTojnLByLngEqGiRJDoY56a8XI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UjDg5LpG9dnlVQTLgExxokTfPW/ea1iny23A2FPZNcm0eCZFy1uiEipVpD4J+hufM
	 yYyn4sbvkJQ8EUE4DvQvh/3cH8cMsa4jc4K0tlP1Z0Gqm+V3G99i3Vn7WMU/QQRHg7
	 39pUsq73c0pvTahm91MsF/BA30h+MOL765EVA9Sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DEBF8022B;
	Fri, 13 Nov 2020 13:02:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEE52F8020C; Fri, 13 Nov 2020 13:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4091DF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 13:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4091DF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KuJKtjsP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R8hY2u8q"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AC6915C00E8;
 Fri, 13 Nov 2020 07:02:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 13 Nov 2020 07:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2kHLB7kOUlKlV0tfzZxBUvi40Hw
 xqMwOKgrmn07lwIg=; b=KuJKtjsPRQDzWV/SdLJwNXjKIVI4/WX/0gl/5qLR32U
 bhklMjLevsjjzjRBtY3o4vhDRdioewD0/DGPwT9q1bG8Q0eR/tTbf4kM+UQci2sJ
 RhiqCHdU+Vfq6c5wGG9vHFXLZRYE3HpndfCZSNYHEQteAs/EPU6VQZPuz5Cwjiqv
 VznzLxPZ/kgh78IiKMMi9PlLZS8yoe4RHPCWJhsl3WNMj/676Yyts2JwwxBTn88U
 K3w5ayMjfYSjTxh0F1/YtE97dbK0AF/LmbeebG+TSZnglXWxodymNRVokL52jk0K
 glvW8IMqXWj0slKb23ImYnVm402oP2g0Sg6Y8HxI56A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2kHLB7
 kOUlKlV0tfzZxBUvi40HwxqMwOKgrmn07lwIg=; b=R8hY2u8qJUkGsXEijhj+bA
 HkE0cGMvOEUT/cWQusCWKCZDjQHaSyznGS79UWgLpxop61lDolM7HuEiTGbA03JZ
 J92rYGswFuV7SwZ5lddNhFPS0aRXqKfkB3OxNeQhkfGEsZJzyw21K0TAmTQ6S4PG
 BrICqyB7BFOJWmRfydVvf/VeA3ZWUtMmug1/8sY300dHiOm25uGS82VTNzVJKoMg
 jaYBmlVwAWud1TOt90Fp5wBlsmDPOCmeA7QbYWw+YfJ9GfT0g3wpVNgOeLPYGt/S
 zOVQZViGHHaUcjKGhdmpUhswRwvo8Gd46bGztA37AH4/vK+1kwm1EZFmFDAVaH2A
 ==
X-ME-Sender: <xms:5HWuXw6J9XPh9hJKqgPr3oLHZJLuIn_1Lsldo7TdHR0slX9I5vKrEA>
 <xme:5HWuXx4LjL0pgYznFie6a8bRAvzeHOhQVGbAy5nQLYNkoMJqeR8sHVf3cMszLE4Vt
 PYmMqRvzt3bTFlYPxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeigedrvddtjeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:5HWuX_cHpsHJOuIlqXGrjahNo33IhJDhFAOcK34B4SH3Q4nDNmbNcQ>
 <xmx:5HWuX1K6cG38HyC_bKhHDfRIdAPzsbOL8vlEv3uL5h1qOmNOq76UGw>
 <xmx:5HWuX0LFQPxvkN1GIhxSYiHrc28yS_S2ZK_l3ykVCeefYHfLqAagVA>
 <xmx:5XWuX40MywUEQ3ZiFcLWz_7XxLEt4XXYvGknnLj0qCC-9oqIOxowVQ>
Received: from workstation (ae064207.dynamic.ppp.asahi-net.or.jp [14.3.64.207])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BC873280060;
 Fri, 13 Nov 2020 07:02:42 -0500 (EST)
Date: Fri, 13 Nov 2020 21:02:40 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ALSA: firewire: Clean up a locking issue in
 copy_resp_to_buf()
Message-ID: <20201113120240.GB76672@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <20201113101241.GB168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113101241.GB168908@mwanda>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
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

On Fri, Nov 13, 2020 at 01:12:41PM +0300, Dan Carpenter wrote:
> The spin_lock/unlock_irq() functions cannot be nested.  The problem is
> that presumably we would want the IRQs to be re-enabled on the second
> call the spin_unlock_irq() but instead it will be enabled at the first
> call so IRQs will be enabled earlier than expected.
> 
> In this situation the copy_resp_to_buf() function is only called from
> one function and it is called with IRQs disabled.  We can just use
> the regular spin_lock/unlock() functions.
> 
> Fixes: 555e8a8f7f14 ("ALSA: fireworks: Add command/response functionality into hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Indeed. It's bad to use the two pairs by nesting. Thanks for the patch
and your care.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
> index 0f533f5bd960..9f8c53b39f95 100644
> --- a/sound/firewire/fireworks/fireworks_transaction.c
> +++ b/sound/firewire/fireworks/fireworks_transaction.c
> @@ -123,7 +123,7 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
>  	t = (struct snd_efw_transaction *)data;
>  	length = min_t(size_t, be32_to_cpu(t->length) * sizeof(u32), length);
>  
> -	spin_lock_irq(&efw->lock);
> +	spin_lock(&efw->lock);
>  
>  	if (efw->push_ptr < efw->pull_ptr)
>  		capacity = (unsigned int)(efw->pull_ptr - efw->push_ptr);
> @@ -190,7 +190,7 @@ handle_resp_for_user(struct fw_card *card, int generation, int source,
>  
>  	copy_resp_to_buf(efw, data, length, rcode);
>  end:
> -	spin_unlock_irq(&instances_lock);
> +	spin_unlock(&instances_lock);
>  }
>  
>  static void
> -- 
> 2.28.0


Regards

Takashi Sakamoto

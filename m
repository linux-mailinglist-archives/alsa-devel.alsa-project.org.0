Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1AB3873CB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2800216A0;
	Tue, 18 May 2021 10:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2800216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621325720;
	bh=kSoIHn4yAOcHcSblxuD+TWhxK6Pmpwq3XDuRr4BFzKc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fnov6PCUMVE4FopKKf0NZXNDtzVtTF6lNNJq2VwUa54sIU1p0LIJs/XtCfSy+XWDL
	 aMBICdjdM7Zxw2WRSrREal8U6Ci9lm5zGzZI516v16Mn6jASTNllZLg7dL0cTwiVcJ
	 OEIXtZccwfOqo9M9VMaOzUJ056a+fNdeHruRh0Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 885F0F8012C;
	Tue, 18 May 2021 10:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C45DF80217; Tue, 18 May 2021 10:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D9CEF80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D9CEF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0bIsuESQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AqLet3C+"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C72205C01D1;
 Tue, 18 May 2021 04:13:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 18 May 2021 04:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=V88fwtdtyoFv5Gf11zvEAU9sPO4
 u5MqTfxsKSxkFjxU=; b=0bIsuESQH47g+SqA3lEvbE+Q7IwtydjIqkcGyOQy9Wx
 BP0YLxpwv3e3KO3A/Tz9r5r6X0uFG2mKako1j6f1h0AxryBvcyyAbTU6+ZtBKxaP
 k3/5L0CPJvQIiZpjsr/baGWxOubQJSbsfPdcOv9Xx089G7TIWeJM+8BK00j49HlE
 yoqj6qs7FDvLpjXzDBJFIcitAltGebfoX3iMkhwrd49xErCwwhN9SLMP/xvoi4C4
 WY9XX/CotHd5bsd1R8ZhJeZR8KdyHuT90QIey+OqLq9+AK/fQetDPpvSmAKV2cf6
 VH14pxPEzFbcps3V/Evoyqh32IFLdosT+LrymfqDZRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=V88fwt
 dtyoFv5Gf11zvEAU9sPO4u5MqTfxsKSxkFjxU=; b=AqLet3C+fsthJbkfujAozg
 /mrrCQ3JBdzwb5ZCq+46yvhMczmS2to5TuCywG/vL3ZAEbxhnXW3eNy30YxFkd3Z
 l7yU+EziRePIpFyIKwbHN5jL6olKLp13E4f5y3YWoRipxzOLSD1rdqxa7JAMaYTf
 e/IO/tUpyDvu87Z7Ey5LC3z6WOwtkCJfhHzdyC83DoGwzI2qSuKf+xUsuJxGbWHO
 RizIsfFj8+t0sia7eW1NkbMY/ThZSEp+IbzshAEWLw7CzE7Chlux6rbKNsoj1t8k
 aFvlp5jE2nmuPZeqbwZE/jETuvt3xaBm3tVs461RlsqhMuiUZnTkQ4EXHL61/uHw
 ==
X-ME-Sender: <xms:MXejYAnLoEsk6tJyGwu4rDt5t_nm5iOBAv-ffLDFjdUgdUIUL8FnUg>
 <xme:MXejYP2kIuxOeMIxGfhAKqe6DPuVmg2eoeAQ6kbIgeJrWWT9aGIb8pUcvTc6AhDa7
 A_lFPfZr78crX5FQ2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:MXejYOrllyGiSPEqd3ZbU7V2bcoYbB1BqadbuaAql6aJG_QAdKbLCw>
 <xmx:MXejYMmM2OolHAPVFJbWlngDublp_FvF_QQRNajopN9PMsRYn-hx7A>
 <xmx:MXejYO1LQOCaNcpUOqqns-teYptF1KM6wp3x4jiHAWV6MQL04NRvgw>
 <xmx:MnejYD8WgGVKnoLcKvzNrukQOIDt1QVLii2VE63vwTRyEk2lvtJrgQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:13:36 -0400 (EDT)
Date: Tue, 18 May 2021 17:13:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 02/11] ALSA: firewire-lib/motu: use int type for the
 value of bitwise OR with enumerator-constant
Message-ID: <20210518081334.GA84841@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
 <20210518024326.67576-3-o-takashi@sakamocchi.jp>
 <s5hsg2kmsm9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsg2kmsm9.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Tue, May 18, 2021 at 09:02:54AM +0200, Takashi Iwai wrote:
> On Tue, 18 May 2021 04:43:17 +0200,
> Takashi Sakamoto wrote:
> > 
> > It brings some inconvenience in practice to use enumerated type for
> > variable to which bitwise OR with enumerator constant is assigned.
> > 
> > This commit replaces declarations of enumerated type with int type.
> 
> Better to use unsigned int for bit flags.  Otherwise the highest bit
> becomes harder to use.

I can't imagine such situation that the signed value causes issue. Would
I request actual example with such issue? At least, the highest bit is
still available as bit even if the value is negative by assigning
0x80000000...


Regards

Takashi Sakamoto

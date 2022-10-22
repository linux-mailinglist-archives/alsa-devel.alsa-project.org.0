Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C760AE18
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A0274DE;
	Mon, 24 Oct 2022 16:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A0274DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622926;
	bh=ezilklELNMChCl3p+jEy0b5m9WzFLQ8bV+1DikaeCr0=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTTnR6CuOkLnFz0+/053AbXMLxMLnpVu9OKek2KImvu2c7sJUuSarTol/jTOncpv/
	 NQxmStFrcO/kKsR5d4qmYzH1AodBrvwO+QfyH15qH34fGsfn0gS7FmR36hM9xzUWYm
	 9wyBUg+mNKfOMVxzLmWIG43xzavuJeye3AUVwqQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CAFF805AA;
	Mon, 24 Oct 2022 16:44:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 359D4F804B0; Sat, 22 Oct 2022 21:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A93F8013D
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A93F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de
 header.b="R769R20c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DZdlxJQ1"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6AD1458012A;
 Sat, 22 Oct 2022 15:48:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Sat, 22 Oct 2022 15:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1666468121; x=1666475321; bh=UGS1Mg1RbR
 rjg7l/C4uODk6tRvKSFxQmBze4CDiRUok=; b=R769R20cvAUvCJzdLxBnDkwPBp
 EbTpyCnh90ePwkW/W271GgnujcaxKPNlKUZTD1QiMzbOX6UUmX5GBGQy5YnoG3Hz
 7bIbm4GGSebbV6RK2kBgjxCEhVjRMxNaLgKsw+7i5e4f4W2C2HsQFTmKv8S+gZdE
 jcEJHfdX99rjFuuQuzOPTEkJYLvC3gJ1f7jx+9U6cwktdP6NSfqNvxTgarEWxD1c
 GFRrikCndHmtZnFVFspin0GH0nBuno9DFl/vX1YEuWJJ1DmabcJBI+QgW+pFl13L
 PUlTUh21czWS+IFSiTNJyGJ4p7ipLzCb7UJepNPQ1EVgfsLevgq5To41FFEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666468121; x=1666475321; bh=UGS1Mg1RbRrjg7l/C4uODk6tRvKS
 FxQmBze4CDiRUok=; b=DZdlxJQ1/OPf/Y6KDYWPfdC+mu56NzIOlbXghWxjCj9D
 9CPMuzFO6wSIpYXaVVKO5ogBmtK5zrRUpai6gPg5qF7aq51p1Tf8zgVV+aEGQIpg
 Le7lvLJR+05feR3Q+7owk4RsmE3rzpsqGg/UOGa7xGgp5BzvreC3G8OxhZ0WzoTZ
 kHVkLu1P+KTSJm4dYCrODRLVTVeSHwuFqAuyI9eyO0UD5B3tL3/NipBn2AFumQvr
 +xjvFjLrJEOmbNOFedB+o0knlGPPR7li0EwNxPvDXhDL0DJhj4plmQqEZJg8uEWZ
 ljUtVQj8llXCVqwnpTmY8Mpk0y+FjFMyLlNEuZEfiA==
X-ME-Sender: <xms:GElUY9vt3ItviEp5AJXQjYcX0YyV47YTITTgtkGjjNw0aSie0vzYkg>
 <xme:GElUY2cknoJTeDpYvjbC4RFS-FtPGbyfFDbbyjNFIChdDqrc0xYFVavFYI99vu8kl
 0KtHqNspAg1e6vBhwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedttddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:GElUYwxiXoqPMILm1SZ_32__qu1Q5l_zrlV4KYN9jBrAlex9SwSKIg>
 <xmx:GElUY0PzOcbbrTlSQkCZ5j1lrS1Cnv1p6FZXhLQlA1lHQyiDXRQGng>
 <xmx:GElUY9-JQg9pRkXJG00aarf_3pC2T4jG_plPdMl-YxzKsRcEtsxZ9g>
 <xmx:GUlUYyKFp-5FR5wwM3xl6nutJeKlKU0pfMGHX_pxDvaIG8i-amMB_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90C24B60086; Sat, 22 Oct 2022 15:48:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <7c4531b8-a296-4ea3-9564-b094704d10b2@app.fastmail.com>
In-Reply-To: <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
Date: Sat, 22 Oct 2022 21:48:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:49 +0200
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com,
 linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dmaengine@vger.kernel.org
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

On Sat, Oct 22, 2022, at 17:18, Krzysztof Kozlowski wrote:
> On 21/10/2022 16:22, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The s3c24xx platform was marked as deprecated a while ago,
>> and for the s3c64xx platform, we marked all except one legacy
>> board file as unused.
>> 
>> This series removes all of those, leaving only s3c64xx support
>> for DT based boots as well as the cragg6410 board file.
>> 
>> About half of the s3c specific drivers were only used on
>> the now removed machines, so these drivers can be retired
>> as well. I can either merge the driver removal patches through
>> the soc tree along with the board file patches, or subsystem
>> maintainers can pick them up into their own trees, whichever
>> they prefer.
>
> Just to be sure - do you expect me to ack the series, or rather as usual
> pick them up?

I think in this case it is easier if I pick them up with your
Ack along with the other platforms I posted, as there are
some minor conflicts between Makefile/Kconfig changes where
I remove adjacent lines.

       Arnd

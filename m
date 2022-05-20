Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602CA52F9FB
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 10:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2C1216FE;
	Sat, 21 May 2022 10:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2C1216FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653121260;
	bh=vmMC2Am5aBHB1lzAH16lNPR07R+FMNBAArthJqJLkNc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vqR2sUQvQhK6qCilPJNelbmXHTviRVaBTlW6nX3qQFvSYt1uBOZMPNSj8Yz95fKRk
	 Z+MzEZIObrwoUWxF+cM2avCDXizxaoxCUoFz3Ge+e2bZ1gZzjV18cm0fnH8N8irhhY
	 H3A5fWbam+pJcxQpXlKK2VKnCuW1vr/j0w/9O+dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECB6F80153;
	Sat, 21 May 2022 10:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F6AAF8019D; Fri, 20 May 2022 17:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D363F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 17:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D363F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org
 header.b="dKidBF+i"; 
 dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org
 header.b="n6agCsCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kwToCduxEHKRlf6xTfLStwKuhJjU+lyECx++Tp7rwBg=;
 b=dKidBF+iQ7d11gWNT/UoyXW+3Hs3JRy8MCTHjV+5ua+Tg8M5cogj66cbemiXXWJkpK0zsojA7lQyE
 +WqVoFZWQ6MJXXhEGgSw5lyAml+bPL2Bob4FIJw5qswzhyuzPAS6nncjClEcmRp8/q5uuFnaXkNE2d
 CPuaLrtvtWobbmHB9tsxsDLdpABvzpEFwrP2Hjj7G7q9P4zXpqd59UkkCfAXbqYiZX0JhO/0Al924K
 wFSjZf6TdiexU83WgAFrBKHbEHcVNpQIMy29BaLvT2CXdB5WMu+1QWT1QpW5jqN1dCLHfvlGz7DBJM
 XMgEyhF4mJWi5tS9mXMNT9APf2Wijnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kwToCduxEHKRlf6xTfLStwKuhJjU+lyECx++Tp7rwBg=;
 b=n6agCsCBqaR8eTktbf5YnuH91+U1tOyO7hFP5kGyWriJEdb5PGp+30pFXfAEW1f4wny+jHMBg9N+G
 uHm+DFOBg==
X-HalOne-Cookie: 6d6a2faa20e68cf1e8fd7d3b59daf8d1323c09c1
X-HalOne-ID: c1025af6-d851-11ec-a909-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c1025af6-d851-11ec-a909-d0431ea8a290;
 Fri, 20 May 2022 15:30:19 +0000 (UTC)
Date: Fri, 20 May 2022 17:30:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
Message-ID: <Yoe0CRhygXOIrYJc@ravnborg.org>
References: <20220519211411.2200720-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
X-Mailman-Approved-At: Sat, 21 May 2022 10:19:59 +0200
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, May 19, 2022 at 04:14:11PM -0500, Rob Herring wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
> 
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org> # for everything in .../bindings/display/

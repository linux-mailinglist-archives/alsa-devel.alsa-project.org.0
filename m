Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC208892B
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 09:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC801660;
	Sat, 10 Aug 2019 09:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC801660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565422257;
	bh=TUdmySziTnElLOnOXS/nWJgKJe6PP0S5PyaRzZF5wBU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ONryQTdy1UuUoJZpJ35lc0neJUI+eNjZ+B+A3EzkPVJPDQpJ7sNV2JVQaduiU/0xe
	 gi/IRURjbJFtWKhe6mEY4L8SjARmi7HvKaF1NJivUXmINgyAGNCHRHZNTRIAYRmJC1
	 8sOlNRxjRRHym1uANZdTRhRno5Nro5jcPkgeb3vM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1680DF80535;
	Sat, 10 Aug 2019 09:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63040F80506; Sat, 10 Aug 2019 09:29:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA52F8015B
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 09:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA52F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lBqrC7oh"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8F5A208C3;
 Sat, 10 Aug 2019 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565422143;
 bh=6VbgVATIK8gQ19RGol0s4sZQa5UMwCh4OTfTrF86+S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBqrC7ohyxzl6vsNis9zlpMAhEi70L2WIqFNi8DDBsBBNwByj5leAHxmTIVNndq9s
 TmKlDe4pOaS0AZ1mw/6SXmBx+J4FF6/e2v1l5HTChKEx5JJo8ey/k96tf5JfLLG90A
 9Xpmz9DaBhJLkh1c//sGGMllxdkZ23lOJlyBP2UE=
Date: Sat, 10 Aug 2019 09:29:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190810072900.GA16359@kroah.com>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 "Wanzongshun \(Vincent\)" <wanzongshun@huawei.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, Greg Ungerer <gerg@kernel.org>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] [PATCH 00/16] ARM: remove ks8695 and w90x900
	platforms
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

On Fri, Aug 09, 2019 at 10:27:28PM +0200, Arnd Bergmann wrote:
> As discussed previously, these two ARM platforms have no
> known remaining users, let's remove them completely.
> 
> Subsystem maintainers: feel free to take the driver removals
> through your respective trees, they are all independent of
> one another. We can merge any remaining patches through the
> soc tree.

Serial and USB host controller driver patches applied, thanks!

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

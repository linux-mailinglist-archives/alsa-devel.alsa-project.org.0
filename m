Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D88E7C0B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 23:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2C521CE;
	Mon, 28 Oct 2019 23:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2C521CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572300051;
	bh=OEieysX9uxQvM2rR/gQGps8wC0i67r9lZW4rIVciBmM=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzpDSzs4IcNcAOkdCuk2b87O1H1CFjl1B+siHj1doYFbd9EGWsAP7bM/M6eZiqr50
	 wkDgTNS2j/UeSg12AJ+eRqWnSAmZ+i0M3Jtn3WIQWrqFXj0pdDpuvl9/+Hx0tB0Srb
	 l2ZxaC5VP3cKRfK11R4lEQ4VlMsV1tBS4fbniN7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7485AF8060E;
	Mon, 28 Oct 2019 22:50:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF347F80600; Mon, 28 Oct 2019 22:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FREEMAIL_FROM, KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAB70F805FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB70F805FD
Received: from belgarion ([90.55.204.252]) by mwinf5d17 with ME
 id K9qk2100a5TFNlm039qlNT; Mon, 28 Oct 2019 22:50:45 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 28 Oct 2019 22:50:45 +0100
X-ME-IP: 90.55.204.252
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-32-arnd@arndb.de>
X-URL: http://belgarath.falguerolles.org/
Date: Mon, 28 Oct 2019 22:50:44 +0100
In-Reply-To: <20191018154201.1276638-32-arnd@arndb.de> (Arnd Bergmann's
 message of "Fri, 18 Oct 2019 17:41:47 +0200")
Message-ID: <87h83sk097.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 32/46] ASoC: pxa: i2s: use normal MMIO
	accessors
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

Arnd Bergmann <arnd@arndb.de> writes:

> To avoid dereferencing hardwired constant pointers from a global header
> file, change the driver to use devm_platform_ioremap_resource for getting
> an __iomem pointer, and then using readl/writel on that.
>
> Each pointer dereference gets changed by a search&replace, which leads
> to a few overlong lines, but seems less risky than trying to clean up
> the code at the same time.
>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

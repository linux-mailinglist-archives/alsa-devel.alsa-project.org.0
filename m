Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A70EA4DC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 21:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212B12176;
	Wed, 30 Oct 2019 21:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212B12176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572467733;
	bh=pZlasb8l//1cTnYhDRmrMGDMyVuqm42X/lqvD4DeymE=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m8q4E3xwwWPnwPE6jV+lGarYAfussJ/dv99dhiXuaDDiBHHB1953m/YOK5suVv53y
	 y4XG3FF+922erE3IPDD6CBDkcN8xTch3HVMXRRENCZnIuDoGKRgQuNr6dPiohuLudj
	 MKYaoIBQvqp1b54iLHiyMgZlHdmrUv4CpB2X6K30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33E92F802BD;
	Wed, 30 Oct 2019 21:33:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C589F80361; Wed, 30 Oct 2019 21:33:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FROM, KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3E35F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 21:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E35F8015A
Received: from belgarion ([90.55.204.252]) by mwinf5d15 with ME
 id KwZb210025TFNlm03wZhdS; Wed, 30 Oct 2019 21:33:43 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 30 Oct 2019 21:33:43 +0100
X-ME-IP: 90.55.204.252
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-29-arnd@arndb.de>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 30 Oct 2019 21:33:35 +0100
In-Reply-To: <20191018154201.1276638-29-arnd@arndb.de> (Arnd Bergmann's
 message of "Fri, 18 Oct 2019 17:41:44 +0200")
Message-ID: <87y2x2m0rk.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 29/46] Input: touchscreen: use wrapper for
	pxa2xx ac97 registers
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

> To avoid a dependency on the pxa platform header files with
> hardcoded registers, change the driver to call a wrapper
> in the pxa2xx-ac97-lib that encapsulates all the other
> ac97 stuff.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
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

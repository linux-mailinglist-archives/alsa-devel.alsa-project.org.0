Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D811B486E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 09:42:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D669166D;
	Tue, 17 Sep 2019 09:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D669166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568706177;
	bh=Y/ezt66/pnurMGeFbA6mw++hZCKX+8fy6BywZ+MHv+E=;
	h=Date:From:To:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qEvcw32B6Jd5u/0tgLHA0PfhOx47FJovi0OEMtUrBo2slPE58QSzE7ZPJ11Hc/uN5
	 OlWq0MpsIvVD6/6vOwGsolxIl5cNzVRUGOxb7MuP1YyjPaK2m7LZQsw5r5r0Xamx7+
	 Svcer17cGteMRkqlT4Hmh1C4O9gZXn84csD1P/So=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E16B6F803D6;
	Tue, 17 Sep 2019 09:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C50D7F80361; Tue, 17 Sep 2019 09:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=HTML_MESSAGE, MIME_BASE64_TEXT,
 RDNS_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail2.thundersoft.com (unknown [114.242.213.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEA1DF802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 09:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEA1DF802BD
Received: from shifu (unknown [124.89.2.42])
 by mail2.thundersoft.com (Postfix) with ESMTPSA id 0D0A7152074F;
 Tue, 17 Sep 2019 15:41:00 +0800 (CST)
Date: Tue, 17 Sep 2019 15:40:59 +0800
From: "shifu0704@thundersoft.com" <shifu0704@thundersoft.com>
To: shifu <shifu0704@thundersoft.com>, lgirdwood <lgirdwood@gmail.com>, 
 broonie <broonie@kernel.org>, perex <perex@perex.cz>, 
 tiwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 alsa-devel <alsa-devel@alsa-project.org>, robh+dt <robh+dt@kernel.org>
References: <1568705889-6224-1-git-send-email-shifu0704@thundersoft.com>, 
 <1568705889-6224-2-git-send-email-shifu0704@thundersoft.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.9.116[cn]
Mime-Version: 1.0
Message-ID: <201909171540576235182@thundersoft.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?us-ascii?B?RGFuP011cnBoeQ==?= <dmurphy@ti.com>,
 =?us-ascii?B?TmF2YWRhIEthbnlhbmEsIE11a3VuZA==?= <navada@ti.com>
Subject: Re: [alsa-devel] [PATCH v5] tas2770: add tas2770 smart PA kernel
	driver
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



> +reload:
> + /* hardware reset and reload */
> + tas2770_load_config(tas2770);

Sometimes devices need to be reset to return to normal, and this setting is necessary.

> +end:
> + return IRQ_HANDLED;
> +}

I see that the other drivers, the return values in irq_handler are IRQ_HANDLED.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F9766EF
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 15:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8756205B;
	Fri, 26 Jul 2019 15:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8756205B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564146478;
	bh=BthwUWhku6KIH2gm9ZsGfou0PRu4vQfWUoCoE19Hqgw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CdkPB7Qs31JtBZtY+Q9sQWmg4Mckc0G6tSPCMzJ50Yo2UWILtJXleQS22sI5zDW0Z
	 6AF1OMdZRGhsLhtxFSTntqYOVorNPv278VHrY0mV8p31pVLvgpZni2nP6nsg4z1pSX
	 lBt8iil9MaQfEEd1GAlDg+xj9Kvrzd7+6nX+7ZzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F00D5F80393;
	Fri, 26 Jul 2019 15:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE28BF80393; Fri, 26 Jul 2019 15:06:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C6B2F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 15:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C6B2F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="FGTl2rF5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v25fSyTOpn+HLVJ1/RYUYjo/p2HKkKXuypllJV6JuFU=; b=FGTl2rF5Ekw99U5eWA0qO4ViY
 ezxgPoNckrfd02rKeR5DfhI5n58vJTcEz7aQ3diHZkRmGndI5Rrlekc33Ay4TibbLOwpG1XKCSloG
 82pJRxtCcnQvPslNG7xO/8DHeER9qlTWSUhlaF/iNE0YUnkdxnIGvBgg9Brpdp4iVK9JkJjbm0TvY
 TcCvfrG3NaxcqzRwVsiX1+l5U3fjf1yQEEnGnZRs2iZazrP26MkKBj4gTVChmnzy3Hz3krFh/Kx2g
 S6dj3Qi5GKN2Rfpl0jR+wq9OXeL8jT6dpW75i/Mr7cpWYS51GnMWuFS7A6xMmFALsHG7f3ly85U0p
 sDY3Ty9HA==;
Received: from [179.95.31.157] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqzun-0004Yn-F9; Fri, 26 Jul 2019 13:05:42 +0000
Date: Fri, 26 Jul 2019 10:05:33 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20190726100521.5d379300@coco.lan>
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-i2c@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, devel@lists.orangefs.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, rcu@vger.kernel.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-rtc@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 00/26] ReST conversion of text files
 without .txt extension
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

Em Fri, 26 Jul 2019 09:51:10 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> This series converts the text files under Documentation with doesn't end
> neither .txt or .rst and are not part of ABI or features.
> 
> This series is at:
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=rst_for_5_4_v3
> 
> And it is based on yesterday's upstream tree.
> 
> After this series, we have ~320 files left to be converted to ReST.
> 
> v2:
>   - Added 3 files submitted for v5.3 that weren't merged yet;
>   - markdown patch broken into two, per Rob's request;
>   - rebased on the top of upstream master branch
> 
> Mauro Carvalho Chehab (26):

>   docs: ABI: remove extension from sysfs-class-mic.txt

    ^ In time: this one was already merged.

Thanks,
Mauro
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

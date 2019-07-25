Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD66674FF9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38BD81DF9;
	Thu, 25 Jul 2019 15:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38BD81DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564062414;
	bh=SW5oGjDwAMhTmWkXbsqZvWYLgOZVkiR31pVDUda7O0M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RNVk/U35YvooZ9F2agovr1eswDP09FP4YxYhwWXVf77QMYu1XpE4DHoug924KBZYe
	 YRCIQ6sdzXoukyhd00joDOwULEpwh+MyU/nY27UtRtme5rMQXbt51If2ozev4Zxt5n
	 UpysPmnnXfyvAF5B6xMrM0swbuEMr6NCPowEPACQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78FA4F80447;
	Thu, 25 Jul 2019 15:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5F7F803D0; Thu, 25 Jul 2019 15:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0235.hostedemail.com
 [216.40.44.235])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F31EF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F31EF800E8
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 3C0F7180AA0D2;
 Thu, 25 Jul 2019 13:44:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: scene00_2b47279991662
X-Filterd-Recvd-Size: 1719
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Thu, 25 Jul 2019 13:44:57 +0000 (UTC)
Message-ID: <8179fff75f82ac49aaa0c5feb17b53be55f9f2c5.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>
Date: Thu, 25 Jul 2019 06:44:55 -0700
In-Reply-To: <20190725131925.D36082742B5F@ypsilon.sirena.org.uk>
References: <20190725131925.D36082742B5F@ypsilon.sirena.org.uk>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, yang.jie@linux.intel.com, tiwai@suse.com,
 kernel-janitors@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com
Subject: Re: [alsa-devel] Applied "ASoC: Intel: Fix some acpi vs apci typo
 in somme comments" to the asoc tree
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

On Thu, 2019-07-25 at 14:19 +0100, Mark Brown wrote:
> The patch
> 
>    ASoC: Intel: Fix some acpi vs apci typo in somme comments
[]
> diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
[]
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * soc-apci-intel-bxt-match.c - tables and support for BXT ACPI enumeration.
> + * soc-acpi-intel-bxt-match.c - tables and support for BXT ACPI enumeration.

Generally, using the current filename in a comment has little value.

This might as well be

 * tables and support for BXT ACPI enumeration

etc...


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

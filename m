Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C35BE17
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 16:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE5D1698;
	Mon,  1 Jul 2019 16:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE5D1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561990975;
	bh=NfAx88jNsQEes2hmIpUTA6ghTFiJ8HxiDrUPkzi7N5I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jto+KMweH0rTbyxLbJLnQTS7+WPgnOlI2GrPToD0MQlx65Hip3VDTGYj6DJwLUK6I
	 tjOs8IiXOxol0iH2eZVJm5m5PoNyfukLiRsEAMuM+ghC1YSXV+UXj0jF+sfyqf+awq
	 NUyVdOh5YiViuatZiN3yNjmaXwaxzqU17FNQfPk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E57F800DE;
	Mon,  1 Jul 2019 16:21:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15816F89775; Mon,  1 Jul 2019 16:21:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BB1EF800DE
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 16:21:05 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8CA24A0040;
 Mon,  1 Jul 2019 16:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8CA24A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1561990864; bh=ByFbJD2rQWguwVYHswpW6rozHBA+6VhPKZwfEohjl8c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K0a+xbPEUiDNY7sBC+sXSIL6FxahXB9LtMNGl7/tzedco/1fz67f2DsairZrnMqxe
 UBaV2Q19yNcq5whbIM6QnRbTOM+3ziIMsfjCJmkwcp/DqwqWvpULADtRPRhmUFkken
 uXfr1WXMThbQPwRU0EQXEuc2MTo8Fx2RrobfesXE=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  1 Jul 2019 16:20:59 +0200 (CEST)
To: Daniel Baluta <daniel.baluta@nxp.com>
References: <f9918709be17e4289c0d667b15187f88985a145c.camel@nxp.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6fe0a77d-d9c3-ff8c-4a04-ac1adebed72e@perex.cz>
Date: Mon, 1 Jul 2019 16:20:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f9918709be17e4289c0d667b15187f88985a145c.camel@nxp.com>
Content-Language: en-US
Cc: Carol Zhu <carol.zhu@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Jun Zhu <junzhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] ALSA repos
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

Dne 01. 07. 19 v 15:31 Daniel Baluta napsal(a):
> Hi Jaroslav,
> 
> What are trying to understand where are the official ALSA project
> repos.
> 
> We found:
>  - Github: https://github.com/alsa-project
> and
>  - alsa-project.org: https://git.alsa-project.org/
> 
> Which one should we use for our daily builds?
> 
> For example we have been using alsa-project.org repo for tinycompress.
> But in the last few days git clone didn't work! Now it seems to be back
> 
> online.
> 
> Also, we are using Yocto poky recipes:
> 
> 
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb?h=warrior
> 
> which use pre-build archives from:
> 
> https://www.alsa-project.org/files/pub/
> 
> So, any clarifications on the release deliverables for ALSA project
> would be highly appreciated.

Hi all,

The alsa-project.org server is the official one. I am actually trying to
resolve the git server issues (seems that the stalled connections causes
this). The github is used as the development platform which may be switched to
another in the future.

Just ping me if you have any problem.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

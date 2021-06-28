Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7343B5C62
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 12:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A42381675;
	Mon, 28 Jun 2021 12:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A42381675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624875479;
	bh=KWcFklCrv4Ob1SOov1y7qddvatwUKyqcZqb+6P9h47E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBZhOOJ4cqQaQgPJ9r4bhQKRhR72F43PpPRFGNmSWa/kbSNhEygVf/gePT30jwEVR
	 qSGdRnCthguAKwBvi+wkKOY78ctTgy0/DnGq5AUHVcljhCpfBhJPBU38UbxsS/bD7L
	 5P0m9zWcj+qkL+ShSlllZZw1iNKrel8h+jbtXJRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E12F0F80257;
	Mon, 28 Jun 2021 12:16:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1AEF80229; Mon, 28 Jun 2021 12:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF3FF80137
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 12:16:21 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1423BA0040;
 Mon, 28 Jun 2021 12:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1423BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1624875381; bh=C/yb0/lAlQf+Yldyb11NIjWTROdjQzOSYBUTtru7+Jc=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=DNtW+3qQPLOdijuxDL0HpDyDJJzQP1olfrRWVH6jf0RV4uq1y/CBzY8cCsJOf4L/u
 dkkaW9u7LAKgml+0XB1X43uhfHbijzhtAvBdKP2k0JDJux3OkJb32xMWSs1FRIdpeD
 ZiyxcPYFEKJpOr1cBvHa0tGJ2OOwkpl34J+oiB4c=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 28 Jun 2021 12:16:19 +0200 (CEST)
Subject: Re: [PATCH alsa-lib] Fix build with --disable-ucm
To: ALSA development <alsa-devel@alsa-project.org>
References: <20210627223527.10725-1-mforney@mforney.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <131a1e50-cd25-34cd-6197-15ff75ace1c6@perex.cz>
Date: Mon, 28 Jun 2021 12:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210627223527.10725-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Michael Forney <mforney@mforney.org>
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

On 28. 06. 21 0:35, Michael Forney wrote:
> A recent change introduced a dependency on ucm to several of the
> other components, but this was not made conditional on whether
> BUILD_UCM is enabled.

Thank you for your patch. I fixed this using inline functions:

https://github.com/alsa-project/alsa-lib/commit
/f4f29d42be8b8ad60ea4c5697374adad4bfe6868

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

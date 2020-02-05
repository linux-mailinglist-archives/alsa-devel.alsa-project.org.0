Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1661534A2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 16:52:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF92F168E;
	Wed,  5 Feb 2020 16:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF92F168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580917964;
	bh=CvC3HNSp9uUjQ+DrMZVLQ5rXOo8eOGtDz+TeUxRieNc=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1zjpaUSPl46Ppkb563QfAXFeQxq7QQyCl0mxhpGu9g/lXryJ52Z1zW7HNJi6fb+t
	 a1ocxKrA9SKWpLruEEpt8fJXcz/Rxil+n8KfvfBi6UN9wNII/KzXIASN6weiUIVauC
	 u4os7XuPjI8y+i4siS+M7tJG0cxDc9ioIyLq1l9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9153FF80233;
	Wed,  5 Feb 2020 16:50:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84701F8019B; Wed,  5 Feb 2020 16:50:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [136.243.32.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA13AF8014C
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 16:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA13AF8014C
Received: from [10.1.2.4] (unknown [94.101.37.79])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 32F3A56277ED
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 16:50:44 +0100 (CET)
To: alsa-devel@alsa-project.org
References: <20200205081221.18665-1-mforney@mforney.org>
 <20200205081221.18665-2-mforney@mforney.org>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <cefeff1a-a35d-7d00-1f49-7c0dfa746ad1@ladisch.de>
Date: Wed, 5 Feb 2020 16:50:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205081221.18665-2-mforney@mforney.org>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.101.4 at webclient5
X-Virus-Status: Clean
Subject: Re: [alsa-devel] [PATCH alsa-utils 2/4] Avoid pointer arithmetic on
 `void *`
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

Michael Forney wrote:
> The pointer operand to the binary `+` operator must be to a complete
> object type.

Why are you making this change?  Are you trying to compile alsa-utils
with MSVC?


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

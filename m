Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7D110628
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 21:51:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 905F31673;
	Tue,  3 Dec 2019 21:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 905F31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575406281;
	bh=Xy0SBGUpPNS/1Sw4pmVVIfG4ol9PyygZwxuqdYhlM+U=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxWxZNbAU44985/oe90/rFjs97N9dpxEK0dok3Zij1CpwKHI/oF+kqBKNsnkZ6e3g
	 v7iztxplwsBT+0PcYJO6VVbc0DUaFZML0dJwGDxAq+Wa50SkD4Lir0CJ67xjcJORaH
	 oWjgkARhpd2bzEd0w8EjRhGJVLVgnBRqwUShBwkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41392F80228;
	Tue,  3 Dec 2019 21:49:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED346F8015A; Tue,  3 Dec 2019 21:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from anquietas.harting.hosting (anquietas.harting.hosting
 [IPv6:2a01:4f8:a0:61f7::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DB7BF800ED
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 21:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB7BF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=idlegandalf.com
 header.i=@idlegandalf.com header.b="Z/dsZPC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=idlegandalf.com;
 s=mail; t=1575406171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpxZMBlYbD2h77CrPr7Bi+AgeKS5HZlinm/md6xfVaI=;
 b=Z/dsZPC2QUGntJ3KXQQo1k7Z+yKo5ujO3hWf4/jdbRThDEKFhIcUcDxZlqpRpqA6SbIdCd
 ecWljenTLyABWabclgDoEg41bXKK2zJLFXNQJSs16vWMKtZXvF6Vb6cx9rpfVmUYLJUSVr
 HYpXcVVEiEldoUdFjm64peZ3vQrDznY=
To: alsa-devel@alsa-project.org
References: <822e0fa2-3075-7447-8c37-34dbe4e211b9@idlegandalf.com>
 <c1a88f61-7691-a947-0857-bf0a0cee4c50@perex.cz>
From: Giovanni Harting <539@idlegandalf.com>
Message-ID: <fe4aae44-398e-5d6f-3d2a-5d3e46eb72b0@idlegandalf.com>
Date: Tue, 3 Dec 2019 21:49:31 +0100
MIME-Version: 1.0
In-Reply-To: <c1a88f61-7691-a947-0857-bf0a0cee4c50@perex.cz>
Content-Language: en-GB
Subject: Re: [alsa-devel] a52 plugin + ffmpeg with libswresample
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/12/2019 21:38, Jaroslav Kysela wrote:
> Show us the code (for example via github or so) to look what you're 
> trying to do. It seems that the configuration parser in the plugin is 
> broken.

Sure thing. The libswresample port of rate-lav is here [1], while the 
workaround for alsa-lib is here [2].

Essentially, I'm just trying to get the same configuration that worked 
in 1.1.6 working. This config parsing problem seems unrelated to the 
libswresample patch to me, correct me if I'm wrong.

[1] 
https://git.harting.dev/IdleGandalf/alsa-plugins/commit/9cdbbb9874757b6f8fda7fb4ac2e3fc59da65946
[2] 
https://git.harting.dev/IdleGandalf/alsa-lib/commit/646bc80a63b0220300678a38e0c26a9a13af6fc0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E937279E
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 10:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257D41698;
	Tue,  4 May 2021 10:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257D41698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620118521;
	bh=AYM+aGIB0k8kjUu1wNxHszf2NKUdKW6Y5Aut64+jGag=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUS8boL/+vNEsHX6fQKD7KoU64RJBItbtKTxRk7im/VIBRadZJdh0lNB8x638W3sK
	 ifz4rZ/WXblRXNFe44CXjIqcq4Wg3TdXSUZIxGcGBwI8Jch0HBfjiDxcPh8m8aNVb0
	 ukvV0lv1yNltUhSFGq4NLVIvpjHNg/wLuzh3KmVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC1CF80234;
	Tue,  4 May 2021 10:53:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56E7F8021C; Tue,  4 May 2021 10:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA53DF80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 10:53:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B9C86A0042;
 Tue,  4 May 2021 10:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B9C86A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1620118418; bh=kGjmdwbXqTwkz83iGjdRI3BvWlWZ3uXBhDa+TbAxRW4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=2GXikLE6cRxMdAsJVpx+9Bo2B3qEMg0asoh+eCrV52a8t+bDOUrBeVD18Gk9E5vwh
 McRRUEu1rGA5TYCx75HzkbnEjmj0V2GGUpr4wN9do9O3FpC13MatpU8n+RUrDe9bHC
 WRVwV6VnEQFhIdItJUhDQCN/8ZyfEr6XJWuozBiU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  4 May 2021 10:53:36 +0200 (CEST)
Subject: Re: [PATCH alsa-lib 0/5] Add generic exception mechanism for
 non-standard control-names
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210503205231.167346-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
Date: Tue, 4 May 2021 10:53:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503205231.167346-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
> Hi All,
> 
> This series seems to have fallen through the cracks,
> so here is a resend of it.
> 
> Regards,

Thank you, Hans. The problem with this implementation is that it's really card
specific. Also, ASoC codec drivers have usually ID names based on registers so
the mapping for the user is problematic anyway (the functionality is different
from the name or not related to the name). I'm actually evaluating another
solution which is more flexible:

1) add control remap plugin to allow the control ID remapping in the
alsa-lib's control API, so we can mangle those identifiers there (already
implemented)

2) add local and global alsa-lib configurations per UCM card specified in the
UCM configuration files; the configurations may be for both control and PCM
devices (restrict or set specific parameters)

I will notify you when I finish my tests.

				Jaroslav

> 
> Hans
> 
> 
> Hans de Goede (5):
>   mixer: simple - Add generic exception mechanism for non-standard
>     control-names
>   mixer: simple - Move handling of 3D Control - Depth controls to the
>     exceptions list
>   mixer: simple - Add exceptions for non " Volume" suffixed capture
>     vol-ctls used in ASoC realtek codec drivers
>   mixer: simple - Add exceptions for some capture-vol-ctls which have a
>     " Volume" suffix
>   mixer: simple - Add exceptions for some Playback Switches with a "
>     Channel Switch" suffix
> 
>  src/mixer/simple_none.c | 74 +++++++++++++++++++++++++----------------
>  1 file changed, 46 insertions(+), 28 deletions(-)
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

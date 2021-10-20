Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06DB4352B6
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 20:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B8F168A;
	Wed, 20 Oct 2021 20:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B8F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634754801;
	bh=xyXqimobZVBgx7WHLpid0ldzn21nU/BZqLoOrICLzsY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFds2ntL2q+enqsI7140rHfSejHp+we+ij26lAH/FiUIkQ6NZRypbUcqKsrpw3fBy
	 e6VxzpH1clafE2GSNGOTlce0jzv8uJXjkwGUVYSta18yGTz7P872OviVx+ayE/tpNq
	 xpejVYXcaQxpLisyX1u2yBpGlCKcKDJOFRcFoh2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84988F800ED;
	Wed, 20 Oct 2021 20:32:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09F1F80229; Wed, 20 Oct 2021 20:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFDCFF80155
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 20:31:53 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4CE2AA003F;
 Wed, 20 Oct 2021 20:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4CE2AA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1634754708; bh=LfqNDma+DtOoRFsUJhEtbnN/Z1M2LY1L/0L3sJOozf0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=RCumH3YSDsVbeHCpOmlOTUKSb17XA7nnl3OWaYKO9q6wvAdeTWJJTVbF9rSjQ4B7W
 7K2NtfMRrke2mLHenBGt/HnEpXO3h9uIOMWHqO4xQmm6kdyHTifOlnhlmKI6ZG1lNg
 HFL6Kcs7NjDpd5UBdK6GNCUsdFLXe4+qXjroDiXQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Oct 2021 20:31:46 +0200 (CEST)
Message-ID: <3d0a2d87-0bd6-db7f-0bde-227e8221d85c@perex.cz>
Date: Wed, 20 Oct 2021 20:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ALSA: mixer: oss: Fix racy access to slots
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20211020164846.922-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211020164846.922-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 20. 10. 21 18:48, Takashi Iwai wrote:
> The OSS mixer can reassign the mapping slots dynamically via proc
> file.  Although the addition and deletion of those slots are protected
> by mixer->reg_mutex, the access to slots aren't, hence this may cause
> UAF when the slots in use are deleted concurrently.
> 
> This patch applies the mixer->reg_mutex in all appropriate code paths
> (i.e. the ioctl functions) that may access slots.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

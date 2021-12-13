Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1379647303E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 16:16:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8076C17DD;
	Mon, 13 Dec 2021 16:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8076C17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639408588;
	bh=b6NhLThE0ilnF9SAa2Gs2rSDMj/YGz+284q20swRUog=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyHkVJa00t9sT34ixEy8Ap/A5/3M6/AFLIdZiHtFhNUFLOCNyIPLGlOj2/UV3KJro
	 /CDMnq5ixNhq3SGWLpjIdmcdAboeYaOcs0caKuZMkysYWUcGpCql/ddLolwaaF3EZs
	 u9ZkWo+m1rQ9vY+OtW544XTYlQWEEalNHg2upMXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D79E9F8025F;
	Mon, 13 Dec 2021 16:15:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26390F8025D; Mon, 13 Dec 2021 16:15:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 532A5F80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 16:15:10 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 372A7A0040;
 Mon, 13 Dec 2021 16:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 372A7A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1639408510; bh=2GA3Z4UZ2QyfI1U+6y8FSDcjMN7rozbFlZt/EKZKQag=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0qXLRWtpD1IpgqUu9heD+nTGNNpmrQra7X+UdPg5cwkC6gbNB+QUKHdstOFsDakyD
 7an7ZzKL5SpX45yWlckTxSaxnu5/frQSrDAeIn9gVpEyVOZ3t5d24mK45/qzHyZlde
 TntJ0uOi+dLkas2EbkNrdfUvH6p1NGeW9yjpq7pY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 13 Dec 2021 16:15:07 +0100 (CET)
Message-ID: <0920ca0f-0d54-a56b-d77a-fa08c04c6c0e@perex.cz>
Date: Mon, 13 Dec 2021 16:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] ALSA: gus: Fix memory leaks at memory allocator error
 paths
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20211213141512.27359-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211213141512.27359-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>
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

On 13. 12. 21 15:15, Takashi Iwai wrote:
> When snd_gf1_mem_xalloc() returns NULL, the current code still leaves
> the formerly allocated block.name string but returns an error
> immediately.  This patch does code-refactoring to move the kstrdup()
> call itself into snd_gf1_mem_xalloc() and deals with the resource free
> in the helper code by itself for fixing those memory leaks.
> 
> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> Link: https://lore.kernel.org/r/20211213132444.22385-2-tiwai@suse.de
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

Thanks.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C268444FC6B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 00:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40281166E;
	Mon, 15 Nov 2021 00:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40281166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636931440;
	bh=vF7s8hO907oA/T04K9sIGV5GsjaNlamouoyH061j8WE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L06AGYQsWddOb39sD4TuACcgj8kwTFo376OvWjO+DbpQVA8v1m3C54PKqgXCjt2WP
	 p08dmRiDEpGoB8XPyLb+gFlpnP+2UDX6E7n6c1KfDGgyn6jrom+Rr7hjqw6KtTpIMV
	 oI2I/WQqVu+W6Zdo0AW+rx4wY21wxyqpXFUqkVCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEEBF800FD;
	Mon, 15 Nov 2021 00:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B99F80272; Mon, 15 Nov 2021 00:09:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8759F80259
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 00:09:13 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9CAC4A0040;
 Mon, 15 Nov 2021 00:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9CAC4A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1636931352; bh=8+6PdDvCJUiN/v4qNv8BNrPJlOUAxP63uAVjxQqd7HI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=g0nKO8eeamV3qv4TQ030trfJNpOzVQoC3OfrLOUHVYndDBJDTRz8bDcwfCYiSEjMC
 yJBzB0hO1bOOXlHBsw2qiz7MHLIPr/ZKfTAJ512UoSayGtO7UIPV8a714/I/YKa5/y
 xaQWOlP4XDqq6Jpeas9wp6RciCovrZisTV/gxFaI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 15 Nov 2021 00:09:10 +0100 (CET)
Message-ID: <f5f068ac-42dd-a496-b496-a4359114c634@perex.cz>
Date: Mon, 15 Nov 2021 00:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Token to create an account on the wiki
Content-Language: en-US
To: Lucas <jaffa225man@gmail.com>, alsa-devel@alsa-project.org
References: <CAOsVg8oASKrYST0CR_C5GAd4wcBjKcZkbBSrVdV51oPBTHqqdQ@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <CAOsVg8oASKrYST0CR_C5GAd4wcBjKcZkbBSrVdV51oPBTHqqdQ@mail.gmail.com>
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

On 14. 11. 21 21:56, Lucas wrote:
> I was hoping to add some Edirol/Roland devices to the wiki.  Signing
> up at https://alsa-project.org/main/index.php?title=Special:UserLogin&type=signup&returnto=Matrix:Vendor-Roland+Edirol
> says ask the mailing list for a token.

I sent the token to you in a separate e-mail message.

			Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

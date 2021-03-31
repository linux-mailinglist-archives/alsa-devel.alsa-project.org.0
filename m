Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF2350607
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 20:10:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57DD31669;
	Wed, 31 Mar 2021 20:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57DD31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617214257;
	bh=ARpih9knWOZ+mtWe+eCc5H1pBP1zHghWiGqNw17PlkQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2+sNVCd5IH5JN6YRfSpQLTxW0ccO035+IiJE2ESG+nF65Q/71cEsPuWLGqhAasFa
	 9FMvs3rAlEL9rseUhGG60PIAFQNaWr23GwyPTYnLSQux/pv1ByqKhTXjn/wa9vUAfa
	 Il28r+X5g6yMYKVV0TENwb+OxEyC8jACF2jFtEtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2B78F8013C;
	Wed, 31 Mar 2021 20:09:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D306F80166; Wed, 31 Mar 2021 20:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB8D1F8015A
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 20:09:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 50375A003F;
 Wed, 31 Mar 2021 20:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 50375A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617214165; bh=cVlBUFphs/dnp74K2p5kRDyfBDi3OUtOUvGdNmBLsP4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sBeAQc3JNSuqQS+Lcy4Gncbk+pJfATshMepPkXFUdX1HwkUhHIm1/haAjQb1Hfz1v
 06blgNKsS56DwNFOFLb6Xs5AJa9bKGph6vBV7HxOpgXnDXj9M5tPNyrbEXSi3W7iVs
 qtfeT3BowNx5VOWrz/mJ6T/G6Dr0NJa8tC8mCyKk=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 31 Mar 2021 20:09:19 +0200 (CEST)
Subject: Re: ALSA: control - add layer registration routines
To: Colin Ian King <colin.king@canonical.com>
References: <96e9bd5c-c8db-0db8-b393-fbf4a047dc80@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <51ba335d-45ac-b50d-2ec6-333afd1daebf@perex.cz>
Date: Wed, 31 Mar 2021 20:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <96e9bd5c-c8db-0db8-b393-fbf4a047dc80@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

Dne 31. 03. 21 v 17:17 Colin Ian King napsal(a):
> Hi,
> 
> Static analysis on linux-next with Coverity has detected a potential
> issue in the following commit:
> 
> commit 3f0638a0333bfdd0549985aa620f2ab69737af47
> Author: Jaroslav Kysela <perex@perex.cz>
> Date:   Wed Mar 17 18:29:41 2021 +0100
> 
>     ALSA: control - add layer registration routines
> 
> The static analysis is as follows:
> 
> 2072 void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops)
> 2073 {
> 2074        struct snd_ctl_layer_ops *lops2, *prev_lops2;
> 2075
> 2076        down_write(&snd_ctl_layer_rwsem);
> 
>     assignment: Assigning: prev_lops2 = NULL.
> 
> 2077        for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2
> = lops2->next)
> 2078                if (lops2 == lops) {
> 
>     null: At condition prev_lops2, the value of prev_lops2 must be NULL.
>     dead_error_condition: The condition !prev_lops2 must be true.
> 
> 2079                        if (!prev_lops2)
> 2080                                snd_ctl_layer = lops->next;
> 2081                        else
> 
>     'Constant' variable guards dead code (DEADCODE) dead_error_line:
>     Execution cannot reach this statement: prev_lops2->next = lops->next;.
>     Local variable prev_lops2 is assigned only once, to a constant
> value, making it effectively constant throughout its scope. If this is
> not the intent, examine the logic to see if there is a missing
> assignment that would make prev_lops2 not remain constant.
> 
> 2082                                prev_lops2->next = lops->next;
> 2083                        break;
> 2084                }
> 2085        up_write(&snd_ctl_layer_rwsem);
> 2086 }
> 
> I couldn't quite figure out the original intent of the prev_lops use, so
> I'd thought I'd report this issue as the code does look incorrect.

Thank you. I submitted the fix here:

https://lore.kernel.org/alsa-devel/20210331180702.663489-1-perex@perex.cz/

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

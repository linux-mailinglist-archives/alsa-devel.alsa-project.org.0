Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED04363730
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 20:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C841678;
	Sun, 18 Apr 2021 20:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C841678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618771430;
	bh=3v3WEOQUXZp/g4PreQn2xxbiJy+foPIvXFxwX7DLUE4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t0hLWzqL6m0hE3ImSpnvtWCnYgOE7tZBnDg+F9WGLyiPcV6jolhQ0in70wens9DN0
	 s4sGthI7r7u3rT8YV36J2moVfDv0yLy9y7jixkXIEOK7zgO+SkY/CQWdzz61wxDtJh
	 H4aV/CNiHZA7thOaTpq77PVupFUcNd52qEjrJpG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 955F1F800F2;
	Sun, 18 Apr 2021 20:42:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA934F80253; Sun, 18 Apr 2021 20:42:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 960CAF800F2
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 20:42:07 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2F67BA003F;
 Sun, 18 Apr 2021 20:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2F67BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618771327; bh=e8kopRtY9IQia49ur8uSvJeLtzri3+7tNax5j6Vl3TU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=l9HP1v5RHbEr0tV1M5AGErRvZa0/nXN4/lBfj8m6BNBD08ebjxIzKv0Ca/voUsoh5
 ytbepPT1BTa5dx7pVritONzxaRb+DzNMvuaTxG7o3vYaimARrdkUljmtIKEVTiDxYR
 tpIjofSBLRwwHO6hNwaBSfWVY+QkR1KfrIyvUFlQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 18 Apr 2021 20:42:03 +0200 (CEST)
Subject: Re: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
 <20210408105025.GB40407@workstation> <s5h1rbl80yy.wl-tiwai@suse.de>
 <20210409022735.GA3776@workstation> <s5h5z0v67wh.wl-tiwai@suse.de>
 <20210418142732.GB36507@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d33fa088-c3bf-eadd-07d4-d2c5e3df1b09@perex.cz>
Date: Sun, 18 Apr 2021 20:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210418142732.GB36507@workstation>
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

Dne 18. 04. 21 v 16:27 Takashi Sakamoto napsal(a):

> As you note, control component is not optional for card. However,
> control component is actually maintained as device component. As current
> card implementation maintains each component successfully, it's worth to
> investigate putting control-related members from card to unique
> structure behind private data of component. Additionally, when integrating
> control functionality, it's convenient to me that relevant stuffs are
> capsulated apart from card structure. In short, I'd like 'divide and
> conquer' method in code refactoring.

I guess, you may show us some code for comments (just a prototype - no full
implementation). As you noted, the separate allocations may save some space
depending on the slab implementation, but it should not be the main reason for
such changes.

The device objects were added to the ALSA control stack later (they simply
didn't exist when we designed it). Also, the low-level drivers communicate
with the control layer using the card structure pointer. The additional
translation is another challenge.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

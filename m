Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177A22E91C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E9171696;
	Mon, 27 Jul 2020 11:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E9171696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595842652;
	bh=XXt1VDQc1LQZYsBhYXG/MlOBx9d7LSQ0PeR6Ew1RCLs=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kihUywwKkTC1ZUlLW3Ka053nizxTQa2PZoACuXXJE+tgWTKSy/lkfawB3fTbD28Fx
	 q3z0Uv6RmoOpXjFgFweCIn+uPsMvmGVJG6zbWcmdftZ+yjQjpDC5vvIdpGLKVRc8wv
	 ZFB7XvRoExxzZYvzGPl10OiynB9o7UCCwPs4FJJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A1AF8013C;
	Mon, 27 Jul 2020 11:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A6B7F80171; Mon, 27 Jul 2020 11:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D51E7F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D51E7F8013C
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3172A206466D7;
 Mon, 27 Jul 2020 11:35:40 +0200 (CEST)
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Acer TravelMate 5735Z (Realtek ALC272X): Periodic crackling noises
Message-ID: <efe55d77-d38a-39d1-a4f6-3dd5cf77de2f@molgen.mpg.de>
Date: Mon, 27 Jul 2020 11:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Dear Linux folks,


On Acer TravelMate 5735Z with Debian Sid/unstable and Linux 5.7.6, there 
are recurring crackling noises on the internal speaker.

I ran `alsa-info` from the Debian package, and the logs are uploaded [1].

It’d be awesome, if you took a look, and told me, what I can try to 
solve this.


Kind regards,

Paul


[1]: https://alsa-project.org/db/?f=67bde144f2e2a4f06da89a8cc8abf93da8c91d5b

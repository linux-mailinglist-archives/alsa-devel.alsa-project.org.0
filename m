Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338F11FADB
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Dec 2019 20:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3FB3166C;
	Sun, 15 Dec 2019 20:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3FB3166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576439615;
	bh=dhvPA1iM0D1tOivnrH7JxH8LrHCsb2tynfHRaKf8DxE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EisFrrvXOoW/dr9PAQuOUmyuaL3en8vmwKrkMOq+PKbF30SQzSYE8XJ3pFMap1+9P
	 XwcElSAXVFinee4aSKuzfwwzv/UnVxB3X5jFu/b/9GaVnlP3U5BKZP+733IjuP/fAl
	 Urr+BL/GGIBoPZUeY0IpVhN+S8WpTjv/lHHe2f0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E14F8025F;
	Sun, 15 Dec 2019 20:51:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EC4F80234; Sun, 15 Dec 2019 17:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 515E9F8015A
 for <alsa-devel@alsa-project.org>; Sun, 15 Dec 2019 17:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 515E9F8015A
Received: from a89-182-230-81.net-htp.de ([89.182.230.81]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1igWt7-0006Hy-Ig; Sun, 15 Dec 2019 17:36:58 +0100
To: tiwai@suse.de
References: <20191202074947.1617-1-tiwai@suse.de>
From: Martin Regner <martin@larkos.de>
Message-ID: <e40aa8e5-f49d-15de-edef-22009d8109a9@larkos.de>
Date: Sun, 15 Dec 2019 17:36:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191202074947.1617-1-tiwai@suse.de>
Content-Language: de-DE
X-Mailman-Approved-At: Sun, 15 Dec 2019 20:51:50 +0100
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Modify stream stripe mask only
 when needed
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

Hi there,

since i upgraded my gentoo system to kernel 5.4.3 the sound over hdmi is
distorted, loud and seems to come only from one speaker. I checked the 
changes
between 5.4.2 and 5.4.3 and as a shot in the dark, i reverted the commit
e38e486d66e2a3b902768fd71c32dbf10f77e1cb, and the problem was gone.

I'll try to find out if the issue is on my system, but there is may 
something
wrong with the condition which enables the stripe mask.

It would be really great if you could take a look into this issue again.

Kind regards
Martin

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

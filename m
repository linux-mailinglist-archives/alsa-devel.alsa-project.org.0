Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8727AC7C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 13:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D3D91F0A;
	Mon, 28 Sep 2020 13:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D3D91F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601291722;
	bh=GGT5oTha9PpiDDVYW6f/0Puwd71qs/C+nk30x+BKMOk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kVk77vFkylB8VmuyF/cO9is0ia9Pq08fU21IARLWBX8PxoS/D3N0hGLK9cDDFoAEA
	 ooTzsS/iz3EsX5cIYZH9YgZZt2sDhL9zEhoWDvMfbWXHU2dLloyErWtChUz3ncWXsc
	 9rmVhxeJ/AcAhxHILJVMQWDJKS4zDc7mqwtwJRvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 152C6F800DF;
	Mon, 28 Sep 2020 13:13:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EDD8F801F9; Mon, 28 Sep 2020 13:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2034FF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 13:13:24 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D14B9A003F;
 Mon, 28 Sep 2020 13:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D14B9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1601291602; bh=Qn4dNsq5XD/5mythHRpwrU28p5Wvyr242LvxGTFfKmo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bsOh+e/YTeca0EGOBhphw3WUyGX3yQcGFFiD8qfJzwbi4Q6GtaOaE9oNE4rooilw4
 Zdhb6NMDDw8mJBcWvomcJ0w8j3s6STMwP9iXMnSolNReDg3QKQ/B1gq0WQJKPyle7T
 +gU/PWmy7tKzgKDD75Tx+v9K4xUP0+b3lwjl/fn8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 28 Sep 2020 13:13:11 +0200 (CEST)
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
To: Gyeongtaek Lee <gt82.lee@samsung.com>, vkoul@kernel.org
References: <CGME20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3@epcas2p4.samsung.com>
 <000c01d69585$228db6b0$67a92410$@samsung.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7ba714ce-8b33-1b64-7503-6b155bf43909@perex.cz>
Date: Mon, 28 Sep 2020 13:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <000c01d69585$228db6b0$67a92410$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com, s47.kang@samsung.com
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

Dne 28. 09. 20 v 12:50 Gyeongtaek Lee napsal(a):
> With a stream with low bitrate, user can't pause or resume the stream
> near the end of the stream because current ALSA doesn't allow it.
> If the stream has very low bitrate enough to store whole stream into
> the buffer, user can't do anything except stop the stream and then
> restart it from the first.
> If pause and resume is allowed during draining, user experience can be
> enhanced.

It seems that we need a new state to handle the pause + drain condition for
this case.

With this proposed change, the pause state in drain is invisible.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

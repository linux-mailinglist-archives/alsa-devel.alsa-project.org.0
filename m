Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EF73DCA76
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 09:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FCF518BA;
	Sun,  1 Aug 2021 09:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FCF518BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627801354;
	bh=AkxyhXzKn2viEC3ERpOBOIoscPQz9Wri9GYnnGFYNmU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/FAxupPYIRanZPCsCEbfPvjkcO6E1r96r5NwEVL6ujPXQDa96Ds+77OETyBb2z2b
	 /nnfGh0VydZfInCyebNMykpbBWHvB5PGzIw/5yvx5T1ivRDGilSUDEM3/162qttWZK
	 BEx/RUEcLcFghjyGVkA+xfioq/IOiK6LdR7JlbCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA266F8016D;
	Sun,  1 Aug 2021 09:01:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54764F802E8; Sun,  1 Aug 2021 09:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_60,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8008F8012E
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 09:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8008F8012E
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 3D2C540A2BA8;
 Sun,  1 Aug 2021 07:00:49 +0000 (UTC)
Date: Sun, 1 Aug 2021 10:00:48 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Nikos Liolios <liolios.nk@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: add mic quirk for Acer SF314-42
In-Reply-To: <d6f4a149-12f8-b0d6-477a-c16113511c4a@gmail.com>
Message-ID: <alpine.LNX.2.20.13.2108010950460.2011@monopod.intra.ispras.ru>
References: <20210721170141.24807-1-amonakov@ispras.ru>
 <d6f4a149-12f8-b0d6-477a-c16113511c4a@gmail.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On Sun, 1 Aug 2021, Nikos Liolios wrote:

> Other quirks for Acer Swift (for Acer SWIFT SF314-54/55/56) they describe the
> model using capital letters ("SWIFT" instead of "Swift").  I do think that
> "Swift" is better than (caps locked) "SWIFT". Thinking to create a patch for
> it since I helped to create this mess.  From my understanding it only affects
> the dmesg of which quirk was used, nothing important, but lets keep code
> clean.
> 
> What do you think? Rename "SWIFT"s to "Swift"s?
> If no disagreement or no reply I am doing it like tomorrow.

I agree "Swift" would be better: as far as I can tell, Acer mostly uses "Swift"
(both in marketing materials and DMI information). I would support the rename.

Thanks.
Alexander

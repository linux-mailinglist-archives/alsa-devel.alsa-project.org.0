Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4126A53FA91
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 11:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F7C1670;
	Tue,  7 Jun 2022 11:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F7C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654595837;
	bh=uS58Zt0wfeAVyjUEmsYxA4ELOGXZ3AuUhHqu3VCsyJQ=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b95oFwAYIvEdkvSToNJaIkOYdbpdY71TxIP1QG1sLdx4PXN26RuQ8rxhUn46LmxXX
	 nVUTLveYsPkgzH4V5aNrh3UIseZ00kfm0YPJyYQvbIqz1K7aLH354X+JKPxXe/fnjG
	 RU2UFopTG8FF6YrLTRDfGBN9zGUHjWzITo0MP5oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6B9F80248;
	Tue,  7 Jun 2022 11:56:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE105F80159; Tue,  7 Jun 2022 11:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E46F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 11:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E46F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="o/c4AKrp"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="ZsBcr2Wh"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id C1243A1A3D401
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 11:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1654595772; bh=uS58Zt0wfeAVyjUEmsYxA4ELOGXZ3AuUhHqu3VCsyJQ=;
 h=Date:From:Subject:To:From;
 b=o/c4AKrp95hAEU6EAm3T3CalNF0XFRHgNIrGFR6sJmUBpf0noGyn2GVGwCtzrf4XJ
 5dpRmy3iDlu1ZUvS79fuaziOGG9ESWG8KPX1MlotKOQDTdzgD3dVA3qFOWPN/mGsDB
 nJ06RnhDmPLXoT7KarUqon369ylHIHx7nqodvlUs=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtpWfYYjyP2m for <alsa-devel@alsa-project.org>;
 Tue,  7 Jun 2022 11:56:07 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id AD7BFA1A3D400
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 11:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1654595767; bh=uS58Zt0wfeAVyjUEmsYxA4ELOGXZ3AuUhHqu3VCsyJQ=;
 h=Date:From:Subject:To:From;
 b=ZsBcr2WhiqWNl8zctHUcAL7GLhxROtfGRtfRO7m91YKCMIY7iWdVuHC0gTLTEnNbZ
 pHXyHy4CrFvhpuR8XvFYrZ67UQdzJgv6bdHKg5IVhjuZ5KZKojrGlUkQx/oRs85FGE
 hyelkURBM5YPpxxgatReGbE2sPHhDaIMj091Bv90=
Message-ID: <54d620be-08a9-c67c-5eac-56cae79def96@ivitera.com>
Date: Tue, 7 Jun 2022 11:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Combined wait for pcm_wait and ctl_wait
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi,

Please is there any way to wait for nonblocking read/write at min_avail 
(like snd_pcm_wait) AND nonblocking subscribed ctl event (like 
snd_ctl_wait) in a single combined wait? The goal is to react as fast as 
possible to ctls in aloop and audio gadget devices which notify about 
stream stop and start (at new rate/format/channel count) on the other side.

I guess some wizardry with file descriptors and polling multiple fds 
could do.

Thanks a lot for any help or hints.

Best regards,

Pavel.


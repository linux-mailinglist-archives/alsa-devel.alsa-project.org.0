Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD93574E2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 21:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768C41669;
	Wed,  7 Apr 2021 21:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768C41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617823380;
	bh=p8tacxrHqWVzFqvN3aMHlzKa6duBYOdM1VZTPYCu0Fo=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=haLH8e6RpAr9B6eYyYHwYoIY+GcQKVZ/hdenXxC7eqPPuehFhImRbaCOW7WwbLgAV
	 FAx59BNZVNRO04KXh3tDCwd39s1xx99wot6ePKeXcB6ANLLJtNolFnLFR4i4FdXO4G
	 FMGLCo3d72gOtcHCEfEAhra5DrviwDtotwHX2gcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A751FF800BD;
	Wed,  7 Apr 2021 21:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31081F8016A; Wed,  7 Apr 2021 21:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 610CEF80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 21:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 610CEF80162
Received: from leela.cb.ettle ([87.115.72.109]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.163]) with ESMTPSA (Nemesis) id
 1MbRwP-1m1dol1OPZ-00boUr; Wed, 07 Apr 2021 21:21:26 +0200
From: James Ettle <james@ettle.org.uk>
Subject: [pull requests] No SPDIF for Plantronics 3220, Dell AE515
To: alsa-devel@alsa-project.org
Message-ID: <5ba6e576-4e1b-a653-7cde-cd3715c722f9@ettle.org.uk>
Date: Wed, 7 Apr 2021 20:21:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:njS4kRTUAtN6JDBrwS+8SlmWbyWr8oqXtqvkf2KmqN0f9roVvKL
 OmvaHGXSxrBAZ3Nx6cmgtYB7/39urEz0sf/xiU3zQlVAgWCSM6BPmRls2Owc20TFX4n/FF7
 IHOTL/SmTeYml2ov1JLv2+omhWK6zjUDY/0+Ay17/vy0zEnpJoEbXJ8SOdeH1rtaV/HsNO3
 VvMVP5Phn3diK8UQzkzhA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ButrzWVjKg=:r3dYybs/daH/FqhgE5oVwe
 4EcAuCPx046uAuOULHoME/kK/Ay4KnS7IojK4zhDyQJrYPyfnb8g2fqtviPNiGnEX/h8B52g4
 VPuMUdSY54rVwb7x+thf5JnlT/Zbdv0Bi3b3yVdJr7AoyJno4yE3MV68xdrMLxBNUwU7l7lUq
 4NRVuQD3Z9OxwBRIytt1OaQ+57cPApni2AWGhZLMW6gwGXGpAcnM+aY6qpMdRc0YNsomWCNHa
 vG/tEfO3dRf6nkj8SBrDJH0b6JdMRTZKUgerUxPzmGqknG6YYOHTz91apzk0zyKndCJz2ISO7
 8dYdiVo3kpU6ohtyI5LD7/k5PVx2LLU5wtMbmwwkCKeG7isHPdAZGcaqX4QxZQZahvA3jOtsf
 a7r8je+KFM7G3kLZrx8CPCeb+aOjNM/pcgMytcVr1GBV+0Ah2jS2vG6H4tIzQbFVsSHjGGoMS
 5PdmD+mKbyolW8txkqO5ny35qaWOizjBozhqLJhbFzM3JyzV1L1l
Cc: tiwai@suse.de
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

Hello,

The Plantronics Blackwire 3220 Series headset and the Dell Professional 
Sound Bar AE515 are both USB-audio devices that show up with a digital 
S/PDIF output that physically doesn't exist.

This can be fixed by adding them to the USB-Audio.pcm.iec958_device list 
in USB-Audio.conf, with the following names:

    "DELL PROFESSIONAL SOUND BAR AE5"
    "Plantronics Blackwire 3220 Seri"

Patches for the respective devices are in the following alsa-lib pull 
requests:

   https://github.com/alsa-project/alsa-lib/pull/124
   https://github.com/alsa-project/alsa-lib/pull/126

Many thanks,
James.


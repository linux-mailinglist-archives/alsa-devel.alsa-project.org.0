Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD482263021
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 17:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1F41712;
	Wed,  9 Sep 2020 17:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1F41712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599663842;
	bh=phyyMj5+T/ojFJoN4YLocJ8wg/GmztimypThMs+XGuU=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QoGkFQurDsgyNO0D4EvfxUgV+fAu/8ddA7iRVuf9IVEFZoodxzZgTh/0jiB3yrgIA
	 XGCzV/rlGsuRzTE5EJZjmT8ToYmapNW4XST13UjxS3Sn5ROMRHrj1++dR1jlk5wyj3
	 kTgy2gKfHbNDdAKDcqPgMSzzWYfl2NiGejbuaXFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33250F8021C;
	Wed,  9 Sep 2020 17:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5794CF800E9; Wed,  9 Sep 2020 17:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08DF8F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 17:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08DF8F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y81IBlfQ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089F1sVY098364;
 Wed, 9 Sep 2020 10:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599663715;
 bh=MwI22PibRFOWQwMQJkln6M8QN2qmj+Or25iJeEI4Q/Y=;
 h=To:CC:From:Subject:Date;
 b=Y81IBlfQilc6cV1c9BkiR4VIoe/1EjbNtN+ZfKRdB4BkqE3fwOWGf3S8y2RLr/ASc
 HqTEa4+S2TGAl8rtw87UuoFPVqNqg7Do7V6VvvzrtyQ2Jh3OiyVZtE+dXB17R1YY2k
 nDL1xnoW639rF+SRvWfoAKcWNTtwShyi5GrexR1E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 089F1sdk027270
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Sep 2020 10:01:54 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 10:01:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 10:01:54 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089F1pP5101317;
 Wed, 9 Sep 2020 10:01:52 -0500
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>
From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC] Device addition to the tlv320adcx140 and tas2562
Message-ID: <8c47c81f-5f83-2cf4-7bf1-62201b35bed3@ti.com>
Date: Wed, 9 Sep 2020 10:01:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hello

Looking for guidance on how to move forward with adding a device to 
existing drivers.

For the TLV320adcx140 driver I have another device which is register and 
bitmap compatible but it does not support Analog microphones or Line In 
like the x140.

Should I add a new driver specifically for this part or should I add the 
new audio maps, widgets and controls to the existing driver?  This would 
make this existing driver really big in terms of LoC and object size.

Similar question for the TAS2562.  I have a new device that is register 
and bitmap compatible but removes the I/V sense. Adding this new device 
to the existing driver wouldn't be as intrusive as the x140 as the audio 
map and controls are much simpler

Dan


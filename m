Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED32703D7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 20:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A8216B8;
	Fri, 18 Sep 2020 20:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A8216B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600453234;
	bh=5yZ1/VxRwzTVbQyNm3M6RyMdUW9POmedduQeUln+OBQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwelEoppsU7vv3Y0Do7JoXdlz9klKCiR/BrmJOM/+3XeZHdbIyZH3+cYhAfMM/0L0
	 E14tsQRfrg3QLJ0tSGLYRIhurkN7x6gnneguVZW23ZdsuGVPOyztqHtNPYS9xAjcQL
	 Q6AQEDktpPppcRUrL2azDUIva8Y30B8PNSGB+mf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C67F800E8;
	Fri, 18 Sep 2020 20:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3FD3F8015A; Fri, 18 Sep 2020 20:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A447CF800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 20:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A447CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PKCVUz27"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IIIjBs071479;
 Fri, 18 Sep 2020 13:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600453125;
 bh=cFGQg+1KZ4pDx/j/j43AbBotFhKCYoUkrHxGwcXbl9A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PKCVUz27D3PoAfNXE7rtm2L1nq7bPsZDlB4vsdff/DFAAwOR0iESG/7QDK7rCjFrT
 TOxxlctXXtWlgF5YKb7jRDTWtrqRQ++h+hKUynBv5Gqo4HKao6Pc2Rz/armkI7+Kbf
 KBut5vPJFiB6MCJE/EZW+6KArZ8XVujiJ0S6TK5o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IIIjvf110052
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 13:18:45 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 13:18:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 13:18:44 -0500
Received: from [10.250.35.164] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IIIice000609;
 Fri, 18 Sep 2020 13:18:44 -0500
Subject: Re: [PATCH 1/2] ASoC: tas2770: Fix calling reset in probe
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
References: <20200918161842.4451-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <8bf4ae51-6cf7-aa43-e00b-c875ea5a0548@ti.com>
Date: Fri, 18 Sep 2020 13:18:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918161842.4451-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

All

On 9/18/20 11:18 AM, Dan Murphy wrote:
> tas2770_reset is called during i2c probe. The reset calls the
> snd_soc_component_write which depends on the tas2770->component being
> available. The component pointer is not set until codec_probe so move
> the reset to the codec_probe after the pointer is set.

I have been updating the tas2770 to add another device to the driver and 
I have quite a few unexpected patches on top of these.

I am not even sure how this driver is even working at the moment.

I will re-submit the complete set of patches as Mark pointed out in 
another email chain.

So please ignore these patches for now plus the DT binding patch.

Dan


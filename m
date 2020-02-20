Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CF16672D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:30:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB8416E7;
	Thu, 20 Feb 2020 20:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB8416E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582227030;
	bh=ikfAmQKbuW54R3MiUK23xNvk0nuX8gWAC2nTPIGVCec=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CClKQqWU5QfJMPQO0hUnJwpVJ0UTBFNR7Dj9GYJa+V8NHZwL6iihcBIlp822M5FA8
	 SoEYhD1cXYQjzHPH909Puv4HsEyLkJxU7JHCSLrLTawygj99pHhjF+Zgy5m1aQ1qLT
	 VVXYI1VxjYrcGezip3OUbh6UnFZiqcwUBgaWgDMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CB2F80145;
	Thu, 20 Feb 2020 20:29:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24304F8014C; Thu, 20 Feb 2020 20:29:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D79E2F80145
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D79E2F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DApX65vZ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJTJ7k059691;
 Thu, 20 Feb 2020 13:29:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582226959;
 bh=7VYc8CJ2y2APcsIbYj7iN6/uBegeLD4mvzWH1dQDQa8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DApX65vZNJ/d9RG5qjp3W88p5qEPBfEW3+vakGKqMQ7Rg95D2WdiaIzJoDke+qBf/
 OwfGlJlU90vBDTsyxmfAL3/tWP76RSUQz81JHgqtqLrA0y06FGLdQFkUJLls4N55LS
 1gRh9F39eST9pH4TnaE/wa7Px0KKSPOIc6UE7imQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJTJRN003290;
 Thu, 20 Feb 2020 13:29:19 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 13:29:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 13:29:19 -0600
Received: from [128.247.59.107] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJTJPt053232;
 Thu, 20 Feb 2020 13:29:19 -0600
Subject: Re: [PATCH v3 0/2] Introduce the TLV320ADCx140 codec family
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
References: <20200219125942.22013-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1d2b79f5-a928-adc5-b6f8-e73e0c061f75@ti.com>
Date: Thu, 20 Feb 2020 13:24:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219125942.22013-1-dmurphy@ti.com>
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

Hello

On 2/19/20 6:59 AM, Dan Murphy wrote:
> Hello
>
> Introducing the Texas Instruments TLV320ADCx140 quad channel audio ADC.
> This device supports 4 analog inputs, 8 digital inputs or a combination of
> analog and digital microphones.
>
> TLV320ADC3140 - http://www.ti.com/lit/gpn/tlv320adc3140
> TLV320ADC5140 - http://www.ti.com/lit/gpn/tlv320adc5140
> TLV320ADC6140 - http://www.ti.com/lit/gpn/tlv320adc6140

Please let me know if there are any additional review comments on this 
code I have 2 more feature add patches on top of this patch that I 
developed a couple days ago and don't want to submit them for review 
until this driver is integrated.

Dan


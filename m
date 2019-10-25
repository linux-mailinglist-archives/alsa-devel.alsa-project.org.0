Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F0E5133
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 18:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF8C185D;
	Fri, 25 Oct 2019 18:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF8C185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572020927;
	bh=DTyNxDj5RmHCDdCk56kYetTl7m0Y33CSxGz0e0V6VoE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmlEMJELgFKTG7MWuuNxBHkItARmSO3/X9PABpL1ZYfC35TCwUrsTPwSjSIjUvlW4
	 wSAQEgBnFr/Er0oW8/ui3jfn49gGmajgH2JFcmAi9arA5fU5Ivt3/3/3UY1EK8n8C1
	 ib++Eml25aCrhb2VTkrm0zjM8uVU4M3mke73Xnlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B33F8036F;
	Fri, 25 Oct 2019 18:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA4EF8036F; Fri, 25 Oct 2019 18:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ACD0F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 18:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACD0F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FWGemHyr"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9PGQqhV032909;
 Fri, 25 Oct 2019 11:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1572020812;
 bh=9K2HvhGsswMMO+p8wreCLatouPe7VGreWo6/hSqWVCc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FWGemHyrColuN2BpSiZ19IkBaoowjyeKPwqiBU8WnoQ0K0SW7zN3pviE3akJsx24f
 QnejB3zbP0kPC0AFPG5/BYD5H/Yt+BjtLivsCh3z514ibEj0andjlgBqM9ZoZdOuWd
 oXGfMsIP/Hb9ElsYM3GrzxMrQ07xnAAiYMxc+IPQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9PGQq7a030313
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Oct 2019 11:26:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 25
 Oct 2019 11:26:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 25 Oct 2019 11:26:41 -0500
Received: from [192.168.2.10] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9PGQm0W054258;
 Fri, 25 Oct 2019 11:26:49 -0500
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>
References: <20191025123038.19728-1-perex@perex.cz>
 <alpine.DEB.2.21.1910251542360.16459@zeliteleevi>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <6f6bbd75-a371-812e-0901-3e263ab37f45@ti.com>
Date: Fri, 25 Oct 2019 19:27:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910251542360.16459@zeliteleevi>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Kai,

On 10/25/19 3:44 PM, Kai Vehmanen wrote:
> Hi,
> 
> On Fri, 25 Oct 2019, Jaroslav Kysela wrote:
> 
>> There is an inconsistency in the names for the HDMI/DP Jack control
>> names between some ASoC drivers and the HDA HDMI driver which
>> introduced this naming in 2011.
> 
> this will break a lot of existing devices that are using out-of-tree UCM
> files, so I'm not sure this is worth the effort.
> 
> When the common-hdmi patches go in (v7 sent earlier this week), SOF will 
> switch to common-hdmi and the also the naming will be aligned. 

Which is going to break existing users, if any ;)

> 
> Br, Kai
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 

- Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936618B4BC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 14:12:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C11EC176E;
	Thu, 19 Mar 2020 14:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C11EC176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584623545;
	bh=IOO9wc7fnGnL17B1Psk7sHYXmeibHcHMHDj/TCi9lK8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rPtdzLA6RySXHakzcpQhV19Y8cNozys/yJxbIYlSHHCyheFXyob1WkuINznDDgO4P
	 gyZ8YQA+G4sziUpGqU3/h8rfJLCElPc5gMxRpK02xwV0DtvWhDeqbA+TLAj68WAFrD
	 0fFy9Kcj/STJYpI+MkHFxhi03xNvTzOFK9ijKhfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A865F80232;
	Thu, 19 Mar 2020 14:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC3BF8022B; Thu, 19 Mar 2020 14:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51F8FF800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 14:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51F8FF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xW2TG56b"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JDAXXl033688;
 Thu, 19 Mar 2020 08:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584623433;
 bh=g5yQjD4hjCi9sV3OcRBqc5iLY+nt3JYJepQKuyZY4Ps=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xW2TG56b1NkNIkwkB2MgbUANSO+jmZozQGuqPh+RRcxJO8LX92ILSfUyv6x1BJTB1
 D1dkYyQXwxE503MPNpjEoOyp2qdFCYD3i+cX1SRYy4vpxwZ3SSKpk1lS6rvNFOKgF9
 S03lwEHP5sCB7uAb72x8RgtzLJbEf0TR4U4sW0Hw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JDAXaU059749
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Mar 2020 08:10:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 08:10:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 08:10:33 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JDAW2o071238;
 Thu, 19 Mar 2020 08:10:33 -0500
Subject: Re: [PATCH] ASoC: tas2562: Fixed incorrect amp_level setting.
To: jonghwan Choi <jhbird.choi@gmail.com>
References: <CAGZ6kuN_-45pmQKmBKyrT22bX+Mku5Uf2_Bcd249vTte04JMJQ@mail.gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0a464785-53d0-5a87-184a-85c6be605d8e@ti.com>
Date: Thu, 19 Mar 2020 08:04:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAGZ6kuN_-45pmQKmBKyrT22bX+Mku5Uf2_Bcd249vTte04JMJQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Jonghwan

On 3/19/20 1:16 AM, jonghwan Choi wrote:
>  From 9f837d75f16ab18342ac517d5b1e5259ab9b797e Mon Sep 17 00:00:00 2001
>
> From: Jonghwan Choi <charlie.jh@kakaocorp.com>
>
> Date: Thu, 19 Mar 2020 14:44:14 +0900
>
> Subject: [PATCH]  ASoC: tas2562: Fixed incorrect amp_level setting.

There does not seem to be a commit message here.

Also please add the Fixes tag.

The change is fine just needs commit message and you need to add all the 
proper reviewers.

You can get this by using the get_maintainers script

Dan


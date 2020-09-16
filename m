Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64026C34B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 15:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C798416B4;
	Wed, 16 Sep 2020 15:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C798416B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600263157;
	bh=w7XuHkweMYu5TotGlDL+IWoGFu3Ys6N3VsreCGyY0Hc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwnROd8+wX0AB3gcSrEV+sKwh7rYbHvN4/EI77QuVIVa3/aDgdQTni3BD6A9T/Qhe
	 8S8J5xECLEx0o6cYplsKH+PoibnI8obvguc8QnrMT6CZstPaX6a9RAV7/nf7orSiby
	 ARdVtugv3yK78LRqVgExUrxGywUSk0T7AsC3/0Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3381F80150;
	Wed, 16 Sep 2020 15:30:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C93D5F8015A; Wed, 16 Sep 2020 15:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D30FF800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 15:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D30FF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QXK9GTpN"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08GBkfEo058813;
 Wed, 16 Sep 2020 06:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600256801;
 bh=f39L0NtWeT8nBr11AnFqXf2qSwpEqyvlCAO4NHzHrU0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QXK9GTpNryajUTxJIsXPNZHPLqrQAG++6RL8xwA3V9ppbIcLLnB/lOtyNJULXStcr
 71TU6C9oESqozmPi6m/I/lr9VojL59oyE9CKQbphi4U/1AYCGmRqH6HvYSf8qgoKtJ
 XqPHG9p7MayDqEuA/U40mJJGTe/kr0o8ciEqgf6Q=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08GBkfmm116875
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Sep 2020 06:46:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Sep 2020 06:46:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Sep 2020 06:46:40 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08GBkekj049033;
 Wed, 16 Sep 2020 06:46:40 -0500
Subject: Re: [PATCH v2 3/3] ASoC: tlv320adcx140: Add proper support for master
 mode
To: Camel Guo <camelg@axis.com>, Camel Guo <Camel.Guo@axis.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>
References: <20200911080753.30342-1-camel.guo@axis.com>
 <20200911080753.30342-3-camel.guo@axis.com>
 <c2fb617e-fa61-e9d1-449f-7d8806168b9a@ti.com>
 <507f2f53-e236-f894-cb17-4fc84cf00326@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <7065684e-5e57-8c63-daef-89f4b2ab1605@ti.com>
Date: Wed, 16 Sep 2020 06:46:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <507f2f53-e236-f894-cb17-4fc84cf00326@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 kernel <kernel@axis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Camel

On 9/16/20 2:52 AM, Camel Guo wrote:
> Please forget about this patch since Dan will upload a similar one.
>
> @Dan, see my comment below.
>
I have cc'd you on my patchset and as you can see I did not add any of 
the master mode programming only setting of the master mode bits.

So this patch is still viable it's just the master mode bit programming 
that needs to be looked at.

Dan


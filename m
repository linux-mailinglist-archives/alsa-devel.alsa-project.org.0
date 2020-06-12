Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43F1F7BDE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0393A1675;
	Fri, 12 Jun 2020 18:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0393A1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591981126;
	bh=OU3pn1t5FYea3bFqCtFWnP4GmmnGVMj/bcuK7sNhq10=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sB0zBzVt2DcbBj2ksOOFxV/eX6S5mwjlxPZnQj3i2Qu3h5RVj8eCNmEFKgOp+7WFO
	 nqaTL2rUgZDLVlHRv+2amjTnfOducIWgmEX4UU49c7smcxirEKgMylMnh4mMo0zaL7
	 PHpg14By27/GqVKdtd0CT6xOo22oRrPFdk3nZP9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8A9F80058;
	Fri, 12 Jun 2020 18:57:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74260F8021C; Fri, 12 Jun 2020 18:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30FE7F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FE7F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vGI28vVX"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05CGuuJu030516;
 Fri, 12 Jun 2020 11:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591981016;
 bh=OU3pn1t5FYea3bFqCtFWnP4GmmnGVMj/bcuK7sNhq10=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vGI28vVXGx+yv1vsG9v42c/WH5sZlY170secgk19y4iOCb9VMs095BEw/Hq1ZmC8x
 YMpMZKxs1jDdFEJMazl1C2o/Ak7uiiCqa+LEs5dOcKXEuBkrJeZ+7CSiFm8JQCA6h0
 Zhr71oyZ/rnm3IcRffZFU+osSZZTxcHk0sshD/y8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CGutYk068326;
 Fri, 12 Jun 2020 11:56:56 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Jun 2020 11:56:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Jun 2020 11:56:55 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CGutnF006600;
 Fri, 12 Jun 2020 11:56:55 -0500
Subject: Re: [PATCH v3 2/2] ASoC: tas2562: Update shutdown GPIO property
To: Mark Brown <broonie@kernel.org>
References: <20200612160603.2456-1-dmurphy@ti.com>
 <20200612160603.2456-2-dmurphy@ti.com> <20200612160922.GL5396@sirena.org.uk>
 <0e482167-71c2-a128-b8b4-a054557d30e9@ti.com>
 <20200612162200.GM5396@sirena.org.uk>
 <432c41fe-8afa-2ccb-8917-fd64f4895144@ti.com>
 <20200612163009.GN5396@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <531b2af3-43b2-d753-ddd4-8dd68cae9a71@ti.com>
Date: Fri, 12 Jun 2020 11:56:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612163009.GN5396@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

Mark

On 6/12/20 11:30 AM, Mark Brown wrote:
> On Fri, Jun 12, 2020 at 11:27:04AM -0500, Dan Murphy wrote:
>
>> Well should we then just revert back to the non-standard name and just fix
>> up the code?
>> Or should we support both properties?
> Either option is fine for me, supporting both is a little nicer.

Sounds good I will mark the incorrect property as deprecated: true

Dan


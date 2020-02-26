Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9317041B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 17:17:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A6C167A;
	Wed, 26 Feb 2020 17:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A6C167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582733876;
	bh=ahyHPn26B2YfUXQi+9PLxbpEHIg2UMTzE6sS5ecrJzU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIkvXeN+sD//ytX5wt3yT57WNhFfiV+Zy1N/XiLy8rFc9nNh0g3NxCIIdUfuWRSMS
	 HvFm1vc6LB2cKekWlidwYjBxvALgpzL683eGjiTLjf37r9zbuUbUIUNBOdXfvCwJuj
	 UIFKYSMdYWSmEZ3aFfC8KP+dwtLSQoVg14O8KYZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ACE3F80089;
	Wed, 26 Feb 2020 17:16:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD1ECF8014E; Wed, 26 Feb 2020 17:16:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7284F80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 17:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7284F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="slqioptl"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QGG64N119983;
 Wed, 26 Feb 2020 10:16:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582733766;
 bh=0FcgBZD0FcGrWhEPucId1UBN/EwNU1wafv0wW/abf7g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=slqioptlPCKXxQMJ4eKOpsW4TDjTw29mNub/CYcPvjVCJBA2W14fTEEsngMqu4hjE
 g2nM+VK2fpirqfJNdGpCwBvI/tUp1CIApBlQHNKmppiKIUGlB4tFYwU51UfZUJblak
 HoJ3BxWCgTMKQvDjW0325vj44EVeEBhvL90QE44s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QGG6XW000712;
 Wed, 26 Feb 2020 10:16:06 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 10:16:05 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 10:16:05 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01QGG5B7079209;
 Wed, 26 Feb 2020 10:16:05 -0600
Subject: Re: [PATCH for-next 3/3] ASoC: tas2562: Fix sample rate error message
To: Mark Brown <broonie@kernel.org>
References: <20200226130305.12043-1-dmurphy@ti.com>
 <20200226130305.12043-3-dmurphy@ti.com> <20200226161204.GG4136@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <531e40a0-7433-66d9-7b77-fc4ccc3dabdb@ti.com>
Date: Wed, 26 Feb 2020 10:10:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226161204.GG4136@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

On 2/26/20 10:12 AM, Mark Brown wrote:
> On Wed, Feb 26, 2020 at 07:03:05AM -0600, Dan Murphy wrote:
>> Fix error message for setting the sample rate.  It says bitwidth but
>> should say sample rate.
> Fixes should always go at the start of a series so they can be applied
> as such without any dependency on any new features or cleanups.
OK I will rebase and put the fixes first.


Dan


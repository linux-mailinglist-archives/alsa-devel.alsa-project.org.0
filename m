Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F41F44D9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 20:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054E71663;
	Tue,  9 Jun 2020 20:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054E71663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591726170;
	bh=mxgKmqUETv8d6ijU1XMCso/RsJ2MsebjbNl9/8PiGEg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pS8w6WDXsM5TZFfaSuxKFN8PdmnBG4oRRkY2KkaIfdHJwNKd/XG8peBXG2asMGAww
	 WuJIsT3rPlDDFr9Cg27rKXl1BqfK/S3iCZpPCNg1O6haipM1/suChWC/ZQQ9St3DcX
	 zMM1Q3//2tpkeD5iK67gw+I+Zzsh0wBFZgdbTfcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EF86F80088;
	Tue,  9 Jun 2020 20:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D689F80291; Tue,  9 Jun 2020 20:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A77D9F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 20:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A77D9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f5XnrPJs"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059I7reh053985;
 Tue, 9 Jun 2020 13:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591726073;
 bh=cm2RuIQ71UrmMw+X34myMwl7z6ENm3bU422kS2bPHGA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=f5XnrPJs4w2Wo3RbXRbUSSWUchDqz65sZXYm8RgxcPxtSRoPugfzAsuRu1O3bXhb7
 naz1VTXM5GrtUAGtnVS6BcLUtTcSNlTQ2ItxFZwU0VG9rLz1yC262gDzxYArDGbNXn
 VZ1Y5gvtf/DrguwAwzXcBNO1YuSzLUkB7BAEQ1UY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059I7rHB096669
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 13:07:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 13:07:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 13:07:52 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059I7pnU088442;
 Tue, 9 Jun 2020 13:07:51 -0500
Subject: Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader
To: Mark Brown <broonie@kernel.org>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609175203.GP4583@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <6d6aaed3-dac8-e1ec-436c-9b04273df2b3@ti.com>
Date: Tue, 9 Jun 2020 13:07:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609175203.GP4583@sirena.org.uk>
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

On 6/9/20 12:52 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 12:28:39PM -0500, Dan Murphy wrote:
>
>> These programs and configurations are selectable via files under the I2C dev
>> node.  There may be a better way to select this through ALSA controls but I was
>> unable to find a good example of this.  This is why this is an RFC patchset.
> I think you can just use enums for most of this - what you want to do I
> think is parse the firmware, build templates for the controls and then
> add them with snd_soc_add_component_controls().  Userspace *should* cope
> with controls being hotplugged.

Yes this was my concern if userspace could cope with dynamic controls.

Dan


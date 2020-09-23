Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1BD275D07
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 18:12:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89941759;
	Wed, 23 Sep 2020 18:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89941759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600877576;
	bh=XDrp0Qcj8O6fNBPhrLguwsMDAK+BVbwwEkJsV7XbEgw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wf5ZG7ooBXos7ejbsvt8TxUzY8qP/qd9Ue4+nHHiyYdsuLWLCZA2iF6PxhZyieRUy
	 pCh5EjPhD1qpTO8egy4BGbn+NWjewW7ZTVtyPgFfl17eLuzLz0FywtjRUJFwb7YSWN
	 1fQmmLhg9fERjQAUXumOVoGE6M1YCvzhgH9IMBTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E23B1F801EB;
	Wed, 23 Sep 2020 18:11:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C54EF80171; Wed, 23 Sep 2020 18:11:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46E0EF800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 18:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E0EF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Eoh6ys5d"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NGB6qP051092;
 Wed, 23 Sep 2020 11:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600877466;
 bh=GonlYZbi6nuWCM6HFFiNjrh40RYQxuq7I3I6tTMPXms=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Eoh6ys5dXwvuJvbIN04O27uh7DZWwPb2H8oPjiRhmreX2i+4ABzWABg7rt3z/OGOR
 JJgEp2xIRmRXs53+AfleyyaJBhI3koLG2P1kKdC5VtBJMKwZC0j4wYOwjg9vbYHS99
 oEJgWPPioiUTIAIjCky8EZ+2r5wsmkfv/UFEHiww=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NGB6rE040430
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 11:11:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 11:11:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 11:11:06 -0500
Received: from [10.250.36.88] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NGB5ix061623;
 Wed, 23 Sep 2020 11:11:05 -0500
Subject: Re: [PATCH 4/6] dt-bindings: tas2770: Remove ti,asi-format property
To: Mark Brown <broonie@kernel.org>
References: <20200923132600.10652-1-dmurphy@ti.com>
 <20200923132600.10652-4-dmurphy@ti.com> <20200923155145.GD5707@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <39d966c4-2f56-c004-4e7c-24a99b07cc72@ti.com>
Date: Wed, 23 Sep 2020 11:11:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923155145.GD5707@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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

On 9/23/20 10:51 AM, Mark Brown wrote:
> On Wed, Sep 23, 2020 at 08:25:58AM -0500, Dan Murphy wrote:
>> Remove the property ti,asi-format as the driver only reads this property
>> and performs no action against it.
> We should probably leave the property as documented and move it to
> deprecated rather than delete the documentation entirely.

I mulled this over to just deprecate the property and I know removing 
these ABIs are not highly accepted.

But the support code for it was incomplete and if a user had it 
populated in the DT and we removed the support then there will be no 
functional change.

This property was supposed to set the RX edge SBCLK detection but this 
is done based on the dai format.

So removing the property will have no affect on the users.

Dan


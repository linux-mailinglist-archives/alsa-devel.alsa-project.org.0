Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54664205871
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 19:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A9B17B3;
	Tue, 23 Jun 2020 19:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A9B17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592932950;
	bh=8TrvbeSTkl6kHRLNV0PqArMH7en/U5q417hci9sJK9c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ThyLRDrYtOIrmIMhmGNjaoj3nhea8lbyEt9fKUj4qq4BbY9kFBOZUutNMYErOhz85
	 FaSuY7XHCIe1wb3UwwKngpprIVVjvdmJQ1KF5zk9gokAWnFKSY8EQbFhhxUkAO6RSu
	 oEgwR34ew9yufS4owaVbePDDwMLsLPVEd2sM0gBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 231EEF8023E;
	Tue, 23 Jun 2020 19:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7EC3F80234; Tue, 23 Jun 2020 19:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EF02F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 19:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EF02F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C9hSX+w9"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05NHKc0j066726;
 Tue, 23 Jun 2020 12:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592932838;
 bh=dFXTf2bV1PYWlUjmPKLKA4y17HgI+6Myl1rwDwUgsl4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=C9hSX+w98eQ/z/nwdUCWOZgWuDf/ArBLgoOEFlILif4KZmZ4PGWJeaLv/FM8+2vhJ
 bvbl8qQ+rSufQcoyz6+s0I3YbZQaopuLBAHnKDqRBfAvIrXOF/s29LgRmmiTkY75KI
 MzN+4bo0MPHxkAsuIqhYbdVTWKMzmNlQo1cfQbHA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05NHKcQ5077730
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jun 2020 12:20:38 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 12:20:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 12:20:38 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05NHKbvR014960;
 Tue, 23 Jun 2020 12:20:37 -0500
Subject: Re: [PATCH v4 2/2] ASoC: tas2562: Update shutdown GPIO property
To: Mark Brown <broonie@kernel.org>
References: <20200612171412.25423-1-dmurphy@ti.com>
 <20200612171412.25423-2-dmurphy@ti.com>
 <cfb043e3-77c5-2957-20b6-2814f1445cf0@ti.com>
 <20200623171842.GH5582@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <63eb06e7-451d-0e8f-36fb-5b5d93ccf803@ti.com>
Date: Tue, 23 Jun 2020 12:20:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623171842.GH5582@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/23/20 12:18 PM, Mark Brown wrote:
> On Tue, Jun 23, 2020 at 10:59:49AM -0500, Dan Murphy wrote:
>> On 6/12/20 12:14 PM, Dan Murphy wrote:
>>> Update the shutdown GPIO property to be shutdown from shut-down.
>> I have some other patches that go on top of this patchset I am wondering if
>> I should re-submit with those patches on top or indicate in a cover letter
>> the dependency
> If you decide to resubmit please make the YAML conversion the very last
> thing you do in your series, there is a considerable backlog on YAML
> conversion reviews which slows down any changes that depend on them.

Thanks for the advice.  I know the DT folks have a lot to review and the 
merge window did not help them.

I will re-factor these and re-submit as well as the TAS2770 patchset.

Dan


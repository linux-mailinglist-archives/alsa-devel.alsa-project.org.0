Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D182E12DF56
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jan 2020 16:59:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A0F16CA;
	Wed,  1 Jan 2020 16:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A0F16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577894398;
	bh=MdPNMtC3YEg/t61bwo0lXJ1pssRr8fHf111h+Wpa4uk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SqCxnshYVkVX35CRayGOAsssNEG/8jC2sS1gTAApoMazff2HG0VOVyuUtGxlq4HIv
	 ht/2CSPjHIpGxAaYKZLtznQWdAaNKPvrJ1OVdRcKCLaciGa7mVyGEjb54hiTXOPi9t
	 SS/UNqcYKgB/RU7MlUhyICX6mWhKGdHojB+e5+H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E95FF8015F;
	Wed,  1 Jan 2020 16:58:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F6FF8014F; Mon, 30 Dec 2019 01:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from neo.develer.net (neo.develer.net [IPv6:2001:b02:400:1::10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B75D9F800CC
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 01:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75D9F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codewiz.org header.i=@codewiz.org
 header.b="noGsX2o9"
Received: from [192.168.1.128] (unknown [151.40.164.50])
 (Authenticated sender: bernie)
 by neo.develer.net (Postfix) with ESMTPSA id 057255E4383;
 Mon, 30 Dec 2019 01:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codewiz.org; s=mail;
 t=1577664938; bh=zUjurhKy+ccxe41aeAWvwisMNy2LhlPP0FCwhmMqkqI=;
 h=From:Subject:To:Date:From;
 b=noGsX2o9Gyx6v3Yl10azRitOyKb0Ymc3CkhTJ6+9mD0p3iseZIwrL43fQl2Kbz0AS
 ljtEgnQdlBJbTq1Yrwlsp5kL/TBR1rOCVkzSawqnrE2B1xfLR4lJdmVjjxePP0GgLS
 1GycDYpZN/TAcBJvdC/tKnFMtd1tzBc6tc4IYkgk=
From: Bernie Innocenti <bernie@codewiz.org>
Organization: Codewiz - http://codewiz.org/
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Message-ID: <1ae8f294-a6c7-d104-8e57-a86cf5b9b07c@codewiz.org>
Date: Mon, 30 Dec 2019 01:15:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:72.0) Gecko/20100101
 Thunderbird/72.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 01 Jan 2020 16:58:14 +0100
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: Fix CFL and CML FW
 nocodec binary names.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Greetings Liam and Pierre,

 > @@ -149,7 +149,7 @@ static const struct sof_dev_desc cml_desc = {
 > 	.chip_info = &cnl_chip_info,
 > 	.default_fw_path = "intel/sof",
 > 	.default_tplg_path = "intel/sof-tplg",
 >-	.nocodec_fw_filename = "sof-cnl.ri",
 >+	.nocodec_fw_filename = "sof-cml.ri",

Where is this new firmware file? This patch has flown into Fedora 
kernels 5.4.5-301.fc31 and 5.5.0-0.rc3.git0.1.fc32, and now I'm getting 
this error when the module loads on a Thinkpad X1 Gen 7:

   sof-audio-pci 0000:00:1f.3: Direct firmware load for 
intel/sof/sof-cml.ri failed with error -2

The other .ri files come with alsa-firmware, but sof-cml.ri is absent in 
the latest upstream release (alsa-firmware-1.2.1).

The only reference I could find is this symlink, but it's not clear to 
me how and when it will get into distributions:

 
https://github.com/thesofproject/linux-firmware/commit/beff732e6642bd77dac5dd08514264f055fc4d10#diff-76c141712563cc9d4730eb63acb36ad5R3807-R3808

-- 
_ // Bernie Innocenti
\X/  https://codewiz.org/
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

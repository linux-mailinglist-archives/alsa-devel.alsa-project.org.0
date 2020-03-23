Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF318F923
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 17:01:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAEB21616;
	Mon, 23 Mar 2020 17:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAEB21616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584979302;
	bh=1gJQ0ZUvQqJ967eZf5Fa4CLT29X1V2PXKFfc6ITnGEQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrIpaeL8BzWF5Ek71nmjnIu7EOk8KROmZrEs+5ZgL2QhD8IpSRC9HBSBdGyysly4k
	 jnwDtT1OvJSaMiCJaKpmaHT5lVn0k9cQ2cNJMVlusYCPNGGZM996brkisSiY8Dyad9
	 /GR+P9TmRL5rnkdF9kpnbq1lMM/0ty5aWvdfq910=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E23CF800B9;
	Mon, 23 Mar 2020 17:00:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1A5AF80158; Mon, 23 Mar 2020 16:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04F2CF800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 16:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F2CF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qeJM2oCY"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e78dcc30000>; Mon, 23 Mar 2020 08:58:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 23 Mar 2020 08:59:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 23 Mar 2020 08:59:43 -0700
Received: from [10.26.73.76] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Mar
 2020 15:59:41 +0000
Subject: Re: [PATCH v1 0/2] Support built-in Mic on Tegra boards that use
 WM8903
To: Stephen Warren <swarren@wwwdotorg.org>, Dmitry Osipenko <digetx@gmail.com>
References: <20200320205504.30466-1-digetx@gmail.com>
 <c27c2087-14cf-614d-a8c0-05072a54f24b@wwwdotorg.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <da88ddff-e665-8cee-6f03-1a396602b076@nvidia.com>
Date: Mon, 23 Mar 2020 15:59:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c27c2087-14cf-614d-a8c0-05072a54f24b@wwwdotorg.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584979139; bh=b6ALMa2hKrIs0XbyLi35X2cWmMd8kYGLuEPCzNi1WWw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qeJM2oCYmyTdv+5PKAJvYMTxoKTABCkjwRlWYo1L/hJ+ZjVMCUCoNkpWljEu+UXEi
 X9jtz/nigahYl9DIIc0Dmwv/DrUu9QaIyMPH7YB7lVEwftRVsOE7OYA3DYBenxfwO2
 BhXhVR4/uaBV53jjEdrafrkxGTtBO1C4uEwSZnqdBDuECOp3Y7Iu/IH+qqIluXu4zC
 fMIvd8R3zW5YT86pKzp2fH+prd9E3y2gcKZjdzRHSdjhnqT+NVTLAnO4x8SOZ4BqWw
 TxjzK8CFwYrhwvGtEcLNHmDVbtbdKBIvgTwfDGABeddiF/i+7wmoJ2PNJDnZJ6V1QH
 TjGm39gokcADQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
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



On 20/03/2020 22:30, Stephen Warren wrote:
> On 3/20/20 2:55 PM, Dmitry Osipenko wrote:
>> Hello,
>>
>> This small series adds audio route for built-in microphone on NVIDIA Tegra
>> boards that use WM8903 CODEC. In particular this is needed in order to unmute
>> internal microphone on Acer A500 tablet device. I'm planning to send out the
>> device tree for the A500 for 5.8, so will be nice to get the microphone
>> sorted out. Please review and apply, thanks in advance.
> 
> It's been a long time since I looked at this code, but the series looks
> plausible,
> Acked-by: Stephen Warren <swarren@nvidia.com>
> 
> (I wonder why machine->gpio_int_mic_en was already parse but never used!)

Looking at the ventana schematics, it appears that the internal-mic
signals was connected to a header and not an actual mic, so maybe we
never had a proper internal-mic on any board but allowed one to be
connected.

Anyway, looks good to me as well.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

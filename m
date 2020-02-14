Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0B15D901
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 15:06:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A59D166C;
	Fri, 14 Feb 2020 15:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A59D166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581689217;
	bh=7Ihbjb5ZL8bDz6KB2uaaypLFb43ouV3t74RIeicoNno=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WlmDOTVqiFdOJPdQIVLzgL037yHgZGNNIRFAPwIynmAN3Zr6AvhKsNYb2bMwRAl/e
	 S6Raml0/L8G2/5zy/DVfmsWcC/4OFl5/RtYzAcUk48jmAJ5eOMUjm65GpHeF8qjagk
	 saaimdtxpa0/4jHRgyx2+C5T2l5mCQ8GGpGKicgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99302F800F0;
	Fri, 14 Feb 2020 15:05:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4FBBF8014F; Fri, 14 Feb 2020 15:05:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8BEF800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 15:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8BEF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="QI6Ew9ps"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e46a9050000>; Fri, 14 Feb 2020 06:04:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 14 Feb 2020 06:05:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 14 Feb 2020 06:05:07 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 14:05:04 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
 <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
 <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
 <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
 <3b42c858-733b-0d17-f457-8043d97f5058@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <62b8ffbc-aa32-ae44-6cb4-b176b8ba9b0e@nvidia.com>
Date: Fri, 14 Feb 2020 14:05:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3b42c858-733b-0d17-f457-8043d97f5058@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581689093; bh=FOw4bWZEh/AbWKd98TO0Ip7GRAKPee6mZCFYh4kd40w=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QI6Ew9ps6koVrDmIS4lwL+Pl6aXPVaJAaivfgwoF8faY4OsNX+S91a24nV6/HZcH0
 x4z16S42vrq91k5KA4wW6nxUmq1PH9BQso2+95cd3aVczvqbIHKD3RiZ6YjI6L0xez
 tS2AvbiMQSRsUHdLtb9rKZjfE/aiRO6q0MXMwHw5u09kdx76ScVdRz8sG3lS6NS7yX
 j1oMBmq1rDwScwRul3uDTm2Dhl9Z+uiPksmBfnrsb5GKcyJOzPD1fH2HgP/4mxkNQk
 sl66OawXc9aDMOAWMkGseZWc03IyOsKWBrt/Rr0BPoZjVIV3L24MmqxqU+7wlBeVNc
 X4TdHMw1quYBA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, atalambedu@nvidia.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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


On 29/01/2020 03:41, Dmitry Osipenko wrote:

...

> The !RPM case isn't supported by Tegra anymore in upstream kernel. I'm
> trying to help to make yours driver better and gave you reasons to
> remove the unneeded code, while you're keep saying that "there is no
> harm to retain it", which is not a reason to clutter up the code. I
> don't feel that it's worthwhile to continue arguing here.

On further review, it does look like a reasonable argument to get rid of
this now completely. Like you see less clutter and the soc-core should
ensure that the card is shutdown before unloading. OK, so fine with me.

Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

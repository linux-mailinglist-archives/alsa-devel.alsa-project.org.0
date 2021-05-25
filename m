Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4938FE02
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD5A1729;
	Tue, 25 May 2021 11:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD5A1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621935680;
	bh=Py64nSBDSt7BC618RGzXyiTAhIty62vsCVFUnRaZEV8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXfCRBGb9aFvN01JoGO/LMlY67+9pDgLTquCUVLRZdSXaJ9i+agU4YjHoDeA82TMJ
	 PQBvonUZqr3WwGfJiAT2/SaFHxZTPgETChLNkrvulOSSth8p2tpq1PJSqLWJSZBPj7
	 3sRYAhcKAjx4hh2thtfMpI8Tj7TntOGV0dR3LkK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D8AF8011B;
	Tue, 25 May 2021 11:39:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70094F801EB; Tue, 25 May 2021 11:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE48F8011B
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE48F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PWPdKYhs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P9SaKq008627; Tue, 25 May 2021 04:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=S4LBE+cK2/3DyOr83rBZxfFQxR2lw4WfocQTuOKqwxU=;
 b=PWPdKYhsji7jBR5xvmrcJbJbPoGJwGFTVW5pZYmQmXFdAu5HwMVv9rYt6pleS0okWw/F
 Qq/kU7x72wj1A0oJA5pN/hVCgvaumS4lWnOmsznMCyZSp2NvuY5kBc4+BTFcm4JalX1a
 pC3T2PogwOsHJcQlbqIRyIGSXpRUDvO4SPurBBYw1ufWwIqYqC0GAoY6z4Inrt2/p8lN
 a94Ym/c331vT0OkQbF4ffsLVSYzJO1W3E6TujAW7JZbYSzwBP1kgW99UuT82p+nh1aF3
 u8FZrolLbyjaUPCHT4QUHGxPT4WnB86vNYF0CSYJpi81bq/81Vzw8O/7M3bBAPs62MPF RQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38r28v1mfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 May 2021 04:39:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 25 May
 2021 10:39:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 25 May 2021 10:39:44 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 940C311CD;
 Tue, 25 May 2021 09:39:43 +0000 (UTC)
Subject: Re: [PATCH] ASoC: Intel: boards: Select SND_SOC_HDAC_HDMI for
 Soundwire machine driver
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20210520163324.19046-1-rf@opensource.cirrus.com>
 <9ed54875-fe77-f70f-9085-0f3b4c9d576e@linux.intel.com>
 <alpine.DEB.2.22.394.2105251158580.3922722@eliteleevi.tm.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <d7d3b76a-ad3a-85ac-092b-8bc2bab90430@opensource.cirrus.com>
Date: Tue, 25 May 2021 10:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2105251158580.3922722@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AnmxL3aOzJasMdIr4AhYj2C4iGrC2uhE
X-Proofpoint-GUID: AnmxL3aOzJasMdIr4AhYj2C4iGrC2uhE
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250063
Cc: cezary.rojewski@intel.com, patches@opensource.cirrus.com,
 yang.jie@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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



On 25/05/2021 10:28, Kai Vehmanen wrote:
> Hi,
> 
> On Mon, 24 May 2021, Pierre-Louis Bossart wrote:
> 
>> On 5/20/21 11:33 AM, Richard Fitzgerald wrote:
>>> Add select of SND_SOC_HDAC_HDMI for SND_SOC_INTEL_SOUNDWIRE_SOF_MACH.
>>> Without this the build results in missing references to
>>> hdac_hdmi_jack_port_init and hdac_hdmi_jack_init.
>> Kai, can you comment on this one? There is nothing specific to HDMI in this
>> driver.
> 
> usage of hdac-hdmi is removed in newer mach drivers (like
> sof_da7219_max98373, sof-pcm512 and ehl_rt5660 -> and there's no select
> for SND_SOC_HDAC_HDMI for these). For older ones, we've kept hdac-hdmi in
> to keep compatibility.
> 
> For sof_sdw, there are still calls to hdac_hdmi_jack_init() and friends
> in sof_sdw_hdmi.c, so this is a real problem.
> 
> I'd say a better fix is that we remove the hdac-hdmi support from sof_sdw.
> I can do a patch for that.
> 

Ok with me. I'm not using the hdmi.

>> Something's inconsistent here, it's not limited to SoundWire I am afraid
> 
> I checked all the related mach drivers and the Kconfig definitions are
> correct for others. So select is done to HDAC_HDMI whenever the mach
> driver uses hdac_hdmi_jack_*().
> 
> Br, Kai
> 

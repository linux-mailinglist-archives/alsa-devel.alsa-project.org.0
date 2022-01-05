Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058BF485084
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 10:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B721759;
	Wed,  5 Jan 2022 10:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B721759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641376792;
	bh=QD/ShsKMMwqAMuRjkzxBlhWZEVjwwvOk67EVgctybq8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOMGMi4RKjYlz/fUSuojwaYFwOXGf0hd4WIJ0jz896FbUxRX/WCqYU8eOZC6nd4TA
	 z2hz9sOKbUfmsXBNQEPgOiZJTmFCMr6ZEqWkdK+73RnL4OM/JBZzCQQd4gQjWwMi6O
	 4JxmaK33rnp3gPz3jAOZx8i4ClXenIpTSe/ZY79E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7F3F8020C;
	Wed,  5 Jan 2022 10:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5DE9F801D8; Wed,  5 Jan 2022 10:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8C99F80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 10:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C99F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hqSwsX9B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2058aLLs003317;
 Wed, 5 Jan 2022 03:58:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=MO2PSHj23wq8N+iVx3WZD17yLglCV3U38GihkcUa5JM=;
 b=hqSwsX9BwItRgwBU2nN+Ky5xxicAB+9sdIKfnsVe6wSEgUbaQEZaINAQZo+AlyRzKLxm
 Hdx8hRyS9uBv3NuiFssQ9vxMfgztWxRI/ZqlFbMNst7xUeb5JVBiE1m+Gj6mYTLGsufT
 zAlfysFSYqcY/JqHxLQAoGg8Rny2sRmqbChHW9r1te1+acwutJVtk4BGmfGg6m6sCGa2
 xukKQTS4C+7lWz1wPwWFbNfpVnui64B3pap/bpzlUoa30LVaQiXswxQSFJORFNpx0ZsI
 4AoGxsIdPTIxnbDdg3nw5Zob7tB1hFSg2EsgbeuKOqPbPCglYynK/7sfYsKMRFgglDBf Dg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dd7y3g262-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 03:58:35 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 09:58:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 09:58:34 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 33897B0E;
 Wed,  5 Jan 2022 09:58:34 +0000 (UTC)
Date: Wed, 5 Jan 2022 09:58:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v6 07/10] hda: cs35l41: Add support for CS35L41 in HDA
 systems
Message-ID: <20220105095834.GD18506@ediswmail.ad.cirrus.com>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-8-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211217115708.882525-8-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: mQd4XZ9zG4wN_6-fzPf2Ov9s2DYnPmTR
X-Proofpoint-ORIG-GUID: mQd4XZ9zG4wN_6-fzPf2Ov9s2DYnPmTR
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, linux-acpi@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>
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

On Fri, Dec 17, 2021 at 11:57:05AM +0000, Lucas Tanure wrote:
> Add support for CS35L41 using a new separated driver
> that can be used in all upcoming designs
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
> +	mtl_revid = reg_revid & CS35L41_MTLREVID_MASK;
> +
> +	chipid = (mtl_revid % 2) ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
> +	if (regid != chipid) {
> +		dev_err(cs35l41->dev, "CS35L41 Device ID (%X). Expected ID %X\n", regid, chipid);
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	ret = cs35l41_register_errata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
> +	if (ret)
> +		goto err;
> +
> +	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
> +	if (ret) {
> +		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
> +	if (ret)
> +		goto err;
> +	kfree(acpi_hw_cfg);
> +
> +	if (cs35l41->reg_seq->probe) {
> +		ret = regmap_register_patch(cs35l41->regmap, cs35l41->reg_seq->probe,
> +					    cs35l41->reg_seq->num_probe);
> +		if (ret) {
> +			dev_err(cs35l41->dev, "Fail to apply probe reg patch: %d\n", ret);
> +			goto err;
> +		}
> +	}

Probably shouldn't use regmap_register_patch here,
cs35l41_register_errata_patch has already registered a patch to
the regmap, and this will then overwrite that patch. Probably
better to do this stuff as a multi-write.

Thanks,
Charles

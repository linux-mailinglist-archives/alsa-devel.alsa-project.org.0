Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75DD9193
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 14:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00551666;
	Wed, 16 Oct 2019 14:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00551666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571230315;
	bh=gAt3ZaAn1qF6ftt/O8TaeBn1xQcyXo10HbMB205gNWU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEPdg9EmJvvI/4HDWPLlLtZ+kxf2avLSqGfKN4uMOYe/8V9oKNxFIzdhBjZVSjJel
	 5kMBoNP3TUBXMZ5QjbGlbBoTtQKeNs1z/+bk5mKHjudN+K6CHyibE8mEvr/xVhFaTX
	 chDIMPr/FAuKVUhBS71Q0VgCBdAEAj2ksWFapqvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01277F8036C;
	Wed, 16 Oct 2019 14:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74888F80362; Wed, 16 Oct 2019 14:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BC6CF80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 14:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC6CF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GxVYz38B"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9GCnx9o021096; Wed, 16 Oct 2019 07:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=i4lndDz9nR/81JFIjDeU0LCA2LiFe2WLcVAB4eh2X38=;
 b=GxVYz38BEqcsjod0HlJBshnM/lFBfTPbIPP/8PTFcl5JBLujNZJRhoMhBn1QmaoiUrZX
 N3MVel3r0o3dsakL/kFkYkTd06WRFymt41FNeXYbRhnS4dbc6zBRA12ejqH/HYkgFcNe
 eaJUzdw6zrqozWLk/fksCJEmvqu9P3Qll6dHmKG4XxUodpdKgvaC+rheZfo4gh3M/h3a
 McqEV/FHiDEMQnHxhwkrJHisBeFaLLnmad++G6HWLwFreOC4W359aoGqxpEMg3/mzwuG
 p2LDYECJXIhYjICANdCjMtmaH3l34qkavOQwcSixteC+FYi/1XVmGUFyzcSlQ82Cyo+r bQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2vkc83dhmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Oct 2019 07:50:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 16 Oct
 2019 13:49:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 16 Oct 2019 13:49:57 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 92F682C1;
 Wed, 16 Oct 2019 12:49:57 +0000 (UTC)
Date: Wed, 16 Oct 2019 12:49:57 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Message-ID: <20191016124957.GD31391@ediswmail.ad.cirrus.com>
References: <20191016120149.5860-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016120149.5860-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=709 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1910160116
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8958: use <asm/unaligned.h> to
	simplify code
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

On Wed, Oct 16, 2019 at 01:01:49PM +0100, Ben Dooks (Codethink) wrote:
> Simplify the memcpy/be32_to_cpu() code by simply using
> get_unaligned_be32() throughout and makes the code nicer
> to look at.
> 
> This fixes the following warnings from sparse:
> 
> sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:62:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:69:15: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:72:18: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:91:17: warning: cast to restricted __be64
> sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:108:29: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
> sound/soc/codecs/wm8958-dsp2.c:120:26: warning: cast to restricted __be32
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

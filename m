Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC31B069D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 12:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FF41677;
	Mon, 20 Apr 2020 12:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FF41677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587378592;
	bh=3U61gaqHER8UY27HDHSPazW1h1k17FKDM9r9Y9R+Ouo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5+0Sy7tFpDr1g+0qDlx+oEiqb1cvO2envkLK8tP0MosHBvseG2/GKOc0xMo32Jjk
	 da3n1H9WVOwElDBLGK8NCXr4qk9MDsI+DA+VBgSrHgysRAnHpCT4wo3sp28S3vlnUv
	 qiRF2NFEPc7ccfIR73oGmBDCiCBKhRvGfYnbid/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8347CF8020C;
	Mon, 20 Apr 2020 12:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3108F801D9; Mon, 20 Apr 2020 12:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 937F5F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 12:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 937F5F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SjzHA46n"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KAR8nZ027670; Mon, 20 Apr 2020 05:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=XMZJ4++bf6kK1/gYDj2WIPoTv3BH10ggIzYMTgvPcsU=;
 b=SjzHA46nlJ+SvDR3LFzPbsVKjU/j/UuqCvXmCqr81Kyf6aeiG6cjEaLvZZsdbpO2b68p
 Ywn0UqHP4+8dTx2si2E16xCGzCR83Hclsd0ELbidToy+JUZpQSw2bhZNTbBqOu2yqDfk
 OaG0aI10jXg5TFD+yXhOvzAZj68/lG6SFU2zyJlbkKYz0pgRg6vVGhfZiynQ4G89PkiH
 ko78nkNhBZaX0OcTKh4OS9+caezFMQ8Tikvr0DHd1Zoj371Z7IAtkpTFFv0taYm6Y1ts
 KbM7pkqvpTzz3mh7IZCs9n1jaCGgLelym7befgGiJ3sg0suMCloMbvgt1ECHWJnn2C8H Og== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 30fwyqjv3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 20 Apr 2020 05:27:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 20 Apr
 2020 11:27:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 20 Apr 2020 11:27:01 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 023252AB;
 Mon, 20 Apr 2020 10:27:01 +0000 (UTC)
Date: Mon, 20 Apr 2020 10:27:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] ASoC: wm89xx: Fix build error without CONFIG_I2C
Message-ID: <20200420102701.GB44490@ediswmail.ad.cirrus.com>
References: <20200418090853.30340-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200418090853.30340-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=776
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004200094
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, geert@linux-m68k.org
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

On Sat, Apr 18, 2020 at 05:08:53PM +0800, YueHaibing wrote:
> sound/soc/codecs/wm8900.o: In function `wm8900_i2c_probe':
> wm8900.c:(.text+0xa36): undefined reference to `__devm_regmap_init_i2c'
> sound/soc/codecs/wm8900.o: In function `wm8900_modinit':
> wm8900.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> sound/soc/codecs/wm8900.o: In function `wm8900_exit':
> wm8900.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
> sound/soc/codecs/wm8988.o: In function `wm8988_i2c_probe':
> wm8988.c:(.text+0x857): undefined reference to `__devm_regmap_init_i2c'
> sound/soc/codecs/wm8988.o: In function `wm8988_modinit':
> wm8988.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> sound/soc/codecs/wm8988.o: In function `wm8988_exit':
> wm8988.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
> sound/soc/codecs/wm8995.o: In function `wm8995_i2c_probe':
> wm8995.c:(.text+0x1c4f): undefined reference to `__devm_regmap_init_i2c'
> sound/soc/codecs/wm8995.o: In function `wm8995_modinit':
> wm8995.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> sound/soc/codecs/wm8995.o: In function `wm8995_exit':
> wm8995.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
> 
> Add missing I2C dependency to fix this.
> 

This doesn't look like the right fix there, all these parts can
be used on SPI so should be usable without I2C build in.

Thanks,
Charles

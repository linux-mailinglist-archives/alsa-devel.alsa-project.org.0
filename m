Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31937A334
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91F01749;
	Tue, 11 May 2021 11:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91F01749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724430;
	bh=OrzYCfpbarmZlCSq/2130wH3NunqIaJSEmZxaZI4BKs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hyaaf/ILnj1vS0Wh32gPTWJMguprgvXeNvrMi8Qnt0mNSQUZfqXLS4xqwKSGOoHPF
	 mp727DH5EY+xeS8DihO4rG44cIkARQ+tePjyfV2Jd/QUFpFrPTUj1LyUsrbVObgJQo
	 zyAhusXcBm62zPOR4ewBQYdWpbhVZJJB1dhUmlgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6332EF8028D;
	Tue, 11 May 2021 11:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E7F4F80245; Tue, 11 May 2021 11:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43DCFF800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 11:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DCFF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WRsmE865"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14B9CCwt026598; Tue, 11 May 2021 04:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=uo6QQ4TbE1dso7Rd+PoYrMJ0FmacbmL57UKpZAs6xSw=;
 b=WRsmE865T/m0UbXneoPP9GHYRPsL5S9SFXvBwR1XqtYqkd9AKeP76tGXHZXW/gn7AoJj
 2y4z4Rh/GTFmoSGmvEHi2okfD8r4H7bv5Oq3DFG8dreCLdPJSpK8368AYj6iKm5nicJJ
 SBhbvOje/4saAviJURFDlyR2xnflZM57XFEXKm0kGjWsfmvOEqMYRlsULzS5GckH56xn
 px3ZLWevwuhpgkygX0rb0xRdBqFVa+RN0of7Y4356ttV6Z1KUVTywHyR8EYrN8oycIg1
 WdYcSuJb5GA5Omo3U/Ja7yKtrz4isDx047baZ7KgKXaBBRGgWpDXfmecQpqjUM5HjKSG og== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4s9h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 04:12:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 10:12:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 10:12:44 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3119A11CF;
 Tue, 11 May 2021 09:12:44 +0000 (UTC)
Date: Tue, 11 May 2021 09:12:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/10] Tidy up device ID reading on legacy Cirrus parts
Message-ID: <20210511091244.GD64205@ediswmail.ad.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
 <dbcede97-4f62-2422-55a8-bccf9f8a4c09@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dbcede97-4f62-2422-55a8-bccf9f8a4c09@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: WguORwjYYs8tVggIy1gToG51UwGikBfF
X-Proofpoint-ORIG-GUID: WguORwjYYs8tVggIy1gToG51UwGikBfF
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110071
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, broonie@kernel.org,
 james.schulman@cirrus.com
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

On Mon, May 10, 2021 at 09:59:55AM -0500, Pierre-Louis Bossart wrote:
> On 5/10/21 8:13 AM, Charles Keepax wrote:
> Sounds all good to me, just wondering if while you're at it you can
> fix the remaining minor issues? Thanks!
> 
> cppcheck --platform=unix64 --force --max-configs=1024 --inconclusive
> --enable=all --suppress=variableScope
> --suppress=shiftTooManyBitsSigned
> --suppress=arithOperationsOnVoidPointer --suppress=bitwiseOnBoolean
> sound/soc/codecs/cs*.c
> 
> sound/soc/codecs/cs35l36.c:1159:10: style: Variable 'ret' is
> assigned a value that is never used. [unreadVariable]
>  int ret = 0;
>          ^
> sound/soc/codecs/cs4265.c:619:6: style: Variable 'ret' is reassigned
> a value before the old one has been used. [redundantAssignment]
>  ret = devm_snd_soc_register_component(&i2c_client->dev,
>      ^
> sound/soc/codecs/cs4265.c:604:6: note: ret is assigned
>  ret = regmap_read(cs4265->regmap, CS4265_CHIP_ID, &reg);
>      ^
> sound/soc/codecs/cs4265.c:619:6: note: ret is overwritten
>  ret = devm_snd_soc_register_component(&i2c_client->dev,
>      ^
> sound/soc/codecs/cs42l52.c:1202:6: style: Variable 'ret' is
> reassigned a value before the old one has been used.
> [redundantAssignment]
>  ret =  devm_snd_soc_register_component(&i2c_client->dev,
>      ^
> sound/soc/codecs/cs42l52.c:1165:6: note: ret is assigned
>  ret = regmap_read(cs42l52->regmap, CS42L52_CHIP, &reg);
>      ^
> sound/soc/codecs/cs42l52.c:1202:6: note: ret is overwritten
>  ret =  devm_snd_soc_register_component(&i2c_client->dev,

Apologies my cppcheck doesn't seem to generate these, I guess that
is what I get for using the one that comes from using the one in
the package manager rather than building an up to date one.

I will have a look at these extra warnings as well.

Thanks,
Charles

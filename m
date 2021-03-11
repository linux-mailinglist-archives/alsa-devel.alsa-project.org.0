Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51698336EF0
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243F417D4;
	Thu, 11 Mar 2021 10:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243F417D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615455193;
	bh=C6QMjCNhi1lig5jX1NfNUHtlDYc378SNZHVlIuLglAE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YgVWy1glVtSbW27dvNkOMrubDMd9EX9ZkqZo205K/NPU+F2nAZgcIc666+KyhcI2L
	 7q1oAELzAJiN2QuS3CNw3TIiqwU8vC6SmZedpVTeemhFFhTzSE0VfA4qpf3zvk/4aw
	 zF6kYU4oe+Rc+KDNDkgNJsctWSSeWmp/V+W6Q1/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E15F8010D;
	Thu, 11 Mar 2021 10:32:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51765F8019B; Thu, 11 Mar 2021 10:32:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21174F80227
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21174F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ny8Hb+98"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B9VOas009606; Thu, 11 Mar 2021 03:32:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=08KmB4hwxblM58orKNrrUCvmh7WYp+JNDJhwFUvEoJI=;
 b=ny8Hb+98u06ELN2z0bs7DDENBIz/tBBJ+HPbKhv2/ECHyPZYR4BQ0U1Ta3v8RIltcN7a
 K+PFkO7mx9tx5guPFTZeEcmJKmMmO8rBKTbVi7fpiW54IBErZkjIheGh4sOon2OxzJ2z
 yHGrv5ZtcK1F+JpdQPTgWhtGnMmYlA7u4nwIwv8zWhP32oRT3KWEOgMaKixOlWMVgHZ1
 cTBv+lC0Q7mj32q1nfAylK1LND/Rh3xxZofZ/DJRpIeppA5tJDKpqpi++Hb9J78wZJxa
 avGbelxHgB9doYL4ZUEeaMCOnlpRbU34hoA7QFgKim1EN2zOz7k5OOIstyOr7ziQBPsh kg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vx1ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 03:32:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Mar
 2021 09:32:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:32:01 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5D9B411CF;
 Thu, 11 Mar 2021 09:32:01 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:32:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 09/10] ASoC: wm_adsp: simplify return value
Message-ID: <20210311093201.GQ106851@ediswmail.ad.cirrus.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
 <20210311004332.120901-10-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210311004332.120901-10-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=871 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110051
Cc: tiwai@suse.de, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Wed, Mar 10, 2021 at 06:43:31PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/codecs/wm_adsp.c:2092:9: warning: Identical condition and
> return expression 'ret', return value is always 0
> [identicalConditionAfterEarlyExit]
>  return ret;
>         ^
> sound/soc/codecs/wm_adsp.c:2070:6: note: If condition 'ret' is true,
> the function will return/exit
>  if (ret)
>      ^
> sound/soc/codecs/wm_adsp.c:2092:9: note: Returning identical
> expression 'ret'
>  return ret;
>         ^
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

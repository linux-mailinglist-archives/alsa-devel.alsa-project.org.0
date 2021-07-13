Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732BB3C7060
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 14:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6D716CA;
	Tue, 13 Jul 2021 14:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6D716CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626179720;
	bh=RuajR1QbaKqwqZFaxsg9eJJDnPGNaiP7WTAeEwcpGno=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZOYrrXKVe1J7xAPrdkz4G/Iyx6BdfZYyBmYPr4vUEAXZvh1C78y5sKDBirvOap+L
	 xfbK+gt+N6SvXtNfbNGOd4zkt9Cy09vrMOY3FNz1qGtbb1Bqpee0QEQlTldsbnBVrN
	 zV/cnBgOv4jUcHUX6av0B975dYSQ2xaN0iAx3+78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E46CF800ED;
	Tue, 13 Jul 2021 14:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82E9CF80217; Tue, 13 Jul 2021 14:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E675F800ED
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E675F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pPmDUU+F"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DCW04W013936; Tue, 13 Jul 2021 07:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=39Lrw0fMg611l8BSiNPaxV04L1jFmV2o4lE6fTsCa1o=;
 b=pPmDUU+Fa0HVPvfgLxDAFvz6rei0ymJoZQ2oO/5ujQ1qh6MdhcdEjfkm5hqA19Jfq6L9
 kRmxLViWYQcTmmqBLB9rDNu66/3TzRw5AQaex/1pmXcQRpa9kg0QBdTvu41z5yqNXjds
 UtMOOBQXYWqsM40Y50Ed8e+OMQpX/18gpMI8pwQYeUbQXNggPv2A9qCoHbDAqCYvDHWo
 WLERt2Fgv0YcKDhvJX3Bb2UJNj+2M1DC0y9ccws2UfAs4DTIR2abNXEeGf3jqZaQKlkO
 PuY3kDx3sHLT5K+qxWuCtxa9WwA4uaTIWtVwC1fLhO5cOXWm41Q6p5Jve8dmChGNv2+D wA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39rgp71mm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jul 2021 07:33:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 13 Jul
 2021 13:33:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 13 Jul 2021 13:33:39 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F0CC545D;
 Tue, 13 Jul 2021 12:33:38 +0000 (UTC)
Date: Tue, 13 Jul 2021 12:33:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ASoC: wm_adsp: Remove pointless string comparison
Message-ID: <20210713123338.GH9223@ediswmail.ad.cirrus.com>
References: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
 <20210626155941.12251-3-ckeepax@opensource.cirrus.com>
 <20210628165837.GE4492@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210628165837.GE4492@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: fwAuXKcY4WGUvOOsaZrY2p-WjMaYPevU
X-Proofpoint-ORIG-GUID: fwAuXKcY4WGUvOOsaZrY2p-WjMaYPevU
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=718
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130080
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Mon, Jun 28, 2021 at 05:58:37PM +0100, Mark Brown wrote:
> On Sat, Jun 26, 2021 at 04:59:41PM +0100, Charles Keepax wrote:
> 
> > The control fw_name is always directly assigned from the wm_adsp_fw_text
> > array, so it isn't necessary to compare the actual strings just the
> > pointer values.
> 
> This feels like it's asking for trouble in the future...

Thanks for applying anyway, apologies for my slow reply been off work.
We already have the same optimisation in other places so at least this
way its all broken in the same way if we hit an issue in the
future :-)

Thanks,
Charles

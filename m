Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47512DE098
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 10:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 492D71759;
	Fri, 18 Dec 2020 10:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 492D71759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608285111;
	bh=8Gf7qu+YN5ANsG5370uxkzxcrp258w7Kka+Z6dCemO0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQe/k25zjpQGkd3m/ToQLC6IxepCALlCPNtGEWvuODDvfZSnD5FUczGdaj9iGub1m
	 bkC8CKN4jHQjrmn009dmmcuiKwCjzrQ+PHyuEdGNOPkyZFRGKHKkFoLlzrrR8mho5P
	 GYtBYsF05vwhwjM8gI4Kcav/5wki0AZ3UNXP/rJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C6BF80103;
	Fri, 18 Dec 2020 10:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6322BF8014B; Fri, 18 Dec 2020 10:50:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C265F8014B
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 10:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C265F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="N7Js67CA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BI9l2Cm002296; Fri, 18 Dec 2020 03:50:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+DbrQ5Y3H2OWg91wM1nYGA5xHFRnNWJLC9gVxMqCU70=;
 b=N7Js67CAOucvCreWgbF/qAg+ik8I0kux7RC4G7mtn+OxX+s8EZHviirgi7CIAO3GZYnb
 aXgYhiOxs8MOqIo9/T+Y2J4pN8KrI2nPyBa6QZ8mQPMPBaLAqqYg/aFXOKwtBt0CK2kZ
 3vlchgCw5zJBiXSDQQjqaMM/6uB15VW0v62BCVLA8ak4dW+Y/zafRbdZYBtjBmX00fC6
 ASTkF6ACIw2oyEga9UpqwPEMufBWj3vIavPZi0M0NnqhR7fnCXf8uL1nxbUVO/6rbYs9
 GJ0r6lKxsuPC9cILnVdkWI+aG/dGwxipeUCXo+0VqRcwGiy7BSk2aXOQ3BZncJGZP+R2 EQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35cu5ryxh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Dec 2020 03:50:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 18 Dec
 2020 09:50:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 18 Dec 2020 09:50:01 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6BCC711CA;
 Fri, 18 Dec 2020 09:50:01 +0000 (UTC)
Date: Fri, 18 Dec 2020 09:50:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-interface: fix loopback
Message-ID: <20201218095001.GF9673@ediswmail.ad.cirrus.com>
References: <20201217150812.3247405-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201217150812.3247405-1-jbrunet@baylibre.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=968 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180071
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
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

On Thu, Dec 17, 2020 at 04:08:12PM +0100, Jerome Brunet wrote:
> When the axg-tdm-interface was introduced, the backend DAI was marked as an
> endpoint when DPCM was walking the DAPM graph to find a its BE.
> 
> It is no longer the case since this
> commit 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
> Because of this, when DPCM finds a BE it does everything it needs on the
> DAIs but it won't power up the widgets between the FE and the BE if there
> is no actual endpoint after the BE.
> 
> On meson-axg HWs, the loopback is a special DAI of the tdm-interface BE.
> It is only linked to the dummy codec since there no actual HW after it.
> >From the DAPM perspective, the DAI has no endpoint. Because of this, the TDM
> decoder, which is a widget between the FE and BE is not powered up.
> 
> >From the user perspective, everything seems fine but no data is produced.
> 
> Connecting the Loopback DAI to a dummy DAPM endpoint solves the problem.
> 
> Fixes: 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

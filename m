Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628D63971D1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 12:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE38D16B9;
	Tue,  1 Jun 2021 12:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE38D16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622544663;
	bh=cfywSEw5mbyIq27PGiwEKaSWC0yrJQi8AcyhU1H1kw8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utl8m9wKZzAIYVQK8e5Vchir0O11E+hEk4TZOyFajFba+OK10DfDlXq30I5BGKBNZ
	 TgyEXhDbVOMC00mwULPQmm5oVEttauYjLLUlK+X/JxNlf/O5uSt7fBgt7C6XHjZ8KZ
	 AN48z83KcS63EboR0Uddfoh3SI2yK9vNiP69QRWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAF46F80269;
	Tue,  1 Jun 2021 12:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BA94F80269; Tue,  1 Jun 2021 12:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A2BF80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 12:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A2BF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZCUGXC1q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151AfwZm031077; Tue, 1 Jun 2021 05:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qthOxQHI8yFTzUfX2WvK0D8ggxBm5bZaIsMlzUhbQpI=;
 b=ZCUGXC1q/MYiCWwhvoqCfA6jj3S8Kx5MxZbF51qji6CL/kd53OeoeCvaQcNJmbkquAWH
 /txa/sItOcRUHGZjX6266LPn4hf8/7RwleDynMv853gDVTrUFrpLVtZMu8QmfXAdsSpK
 p07/JI7EYjdlMcXV/x0PRuuz9bmQE3vm/OZQ5KO/GfdP+SLWhuDbXo0HBQ/mTxjBkY1H
 100btxA5DRbfhd3hCHCxSd5PLVQoV1OSzVOZtrT4Sqwsn3hCS8JgCiInXF+prjEWZeHO
 BGHTHKUmE5bJIPThV4LSI3asGjp/nB7s8LIjycJSM6PZnje/F6r1Bez2GBD3ZMvd0NZC tQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38vv1ns4qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Jun 2021 05:50:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 1 Jun 2021
 11:50:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 1 Jun 2021 11:50:01 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E1B342B2;
 Tue,  1 Jun 2021 10:50:01 +0000 (UTC)
Date: Tue, 1 Jun 2021 10:50:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] ASoC: cs35l41: Add bindings for CS35L41
Message-ID: <20210601105001.GC9223@ediswmail.ad.cirrus.com>
References: <20210601013731.2744163-1-drhodes@opensource.cirrus.com>
 <20210601013731.2744163-3-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210601013731.2744163-3-drhodes@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: fs-1eb7IyVUic_YKsDg3rqbL0C_VPTb7
X-Proofpoint-GUID: fs-1eb7IyVUic_YKsDg3rqbL0C_VPTb7
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=833 impostorscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010072
Cc: patches@opensource.cirrus.com, brian.austin@cirrus.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com
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

On Mon, May 31, 2021 at 08:37:31PM -0500, David Rhodes wrote:
> Devicetree binding documentation for CS35L41 driver
> 
> CS35L41 is a 11-V Boosted Mono Class D Amplifier with
> DSP Speaker Protection and Equalization
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---

Should really CC the DT maintainers on this patch too, Rob
Herring and the DT list.

Thanks,
Charles

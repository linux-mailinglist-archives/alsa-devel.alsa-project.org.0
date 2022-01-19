Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76DB493917
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 11:59:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820BE327D;
	Wed, 19 Jan 2022 11:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820BE327D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642589955;
	bh=fOd222qY8xZt0sg7OGdoy04bGSodL6nFPzOgMbRa1G4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NYiIer+mqJR6WlM/77id5D863v9aACz+iP1aCkV/nnMuNQlJQ854LcK0xE+2c/4WZ
	 TREK7SunK9US7fMqsilpOjpTR8pIB6I/HkfHMZfBxrAWUVOoVOUpKqFdbJHYRYoFfS
	 LZ3pBsdmW/slAF0sZaO8VZfAxcN7rwjg+O/EIQKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1040F8025B;
	Wed, 19 Jan 2022 11:57:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A349CF80245; Wed, 19 Jan 2022 11:57:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1200FF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 11:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1200FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iJypDQ4r"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20J6NBrK017491;
 Wed, 19 Jan 2022 04:57:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fOd222qY8xZt0sg7OGdoy04bGSodL6nFPzOgMbRa1G4=;
 b=iJypDQ4rcSbFTEMf4Kl1ljABSmZ/tvIyRJ6/kSQ0OcOOxyhvteEpXAtZuRTTBgDvPHJX
 tdU/SjaheiT08h7J/A5ey6BMeKgInf1xj9TCYL7/atalTnJoosmCsA1N1mOulJd9ygKM
 TS+U1wPR/ZdUby4zsdj/5zDXibkJbLfWzpZSmf65dzY3VaEAAWpmQym7nHbCKEfO8paL
 aMoOMjVVXFTwxRCgNFFP+hufxLOf0qrOw+/UoDM15UJYxuCwpWFy9P+0yUQOZy8b4wJo
 GxRuwdq/Dl537kXz+sGZVN87qVhrTyArxoLAQ/oYxl4sP6Llz6Ida6J9j9IDyFv98KN4 1A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhtd5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 19 Jan 2022 04:57:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 10:57:38 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 19 Jan 2022 10:57:38 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F3B63B0E;
 Wed, 19 Jan 2022 10:57:37 +0000 (UTC)
Date: Wed, 19 Jan 2022 10:57:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: cirrus,madera: Fix 'interrupts' in
 example
Message-ID: <20220119105737.GR18506@ediswmail.ad.cirrus.com>
References: <20220119015611.2442819-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220119015611.2442819-1-robh@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Mig959vrEYaqbN-En9rsDQkWcnIQfM7B
X-Proofpoint-ORIG-GUID: Mig959vrEYaqbN-En9rsDQkWcnIQfM7B
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>
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

On Tue, Jan 18, 2022 at 07:56:11PM -0600, Rob Herring wrote:
> The 'interrupts' properties takes an irq number, not a phandle, and
> 'interrupt-parent' isn't needed in examples.
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
